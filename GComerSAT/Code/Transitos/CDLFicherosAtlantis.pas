unit CDLFicherosAtlantis;

interface

uses
  SysUtils, Classes, DB, DBTables, kbmMemTable;

type
  TDLFicherosAtlantis = class(TDataModule)
    QTransitos: TQuery;
    mtTransitos: TkbmMemTable;
    QDestinos: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function AbrirQuery( const AEmpresa, ACentro, AProducto, APuertoSalida, AAgrupacion: string;
                         const AFechainicio, AFechafin: TDateTime;
                         const ACarpeta, ATransito: integer;
                         const ADatos: integer;
                         const ACheckDestino:Boolean ): boolean;
    procedure CerrarQuery;
    procedure FiltrarDestino( const APuertoSalida, ADestino: string );
    procedure LimpiarFiltros;
  end;

var
  DLFicherosAtlantis: TDLFicherosAtlantis;

implementation

{$R *.dfm}

uses
  UDMAuxDB, bMath, {CFDResultadoBDDeposito,} Dialogs, UDMTransitos;

procedure TDLFicherosAtlantis.DataModuleCreate(Sender: TObject);
begin
  UDMTransitos.CreateDMTransitos( self );
    with mtTransitos do
    begin
      FieldDefs.Add('carpeta', ftInteger, 0, False);
      FieldDefs.Add('fecha_transito', ftDateTime, 0, False);
      FieldDefs.Add('matricula', ftString, 30, False);
      FieldDefs.Add('conocimiento_embarque', ftString, 20, False);
      FieldDefs.Add('naviera', ftString, 30, False);
      FieldDefs.Add('transporte', ftString, 30, False);
      FieldDefs.Add('puerto_salida', ftString, 30,  False);
      FieldDefs.Add('destino', ftString, 30, False);

      FieldDefs.Add('teus_45', ftInteger, 0, False);
      FieldDefs.Add('teus_40', ftInteger, 0, False);
      FieldDefs.Add('teus_20', ftInteger, 0, False);
      FieldDefs.Add('metros_lineales', ftFloat, 0, False);
      FieldDefs.Add('n_palets', ftInteger, 0, False);
      FieldDefs.Add('peso_neto', ftFloat, 0, False);
      FieldDefs.Add('peso_bruto', ftFloat, 0, False);

      FieldDefs.Add('flete', ftFloat, 0, False);
      FieldDefs.Add('dto_rappel', ftFloat, 0, False);
      FieldDefs.Add('coste_manipulacion_thc', ftFloat, 0, False);
      FieldDefs.Add('tasa_mercancia_t3', ftFloat, 0, False);
      FieldDefs.Add('rec_combustible_baf', ftFloat, 0, False);
      FieldDefs.Add('tasas_seguridad', ftFloat, 0, False);
      FieldDefs.Add('porcentaje_canario', ftFloat, 0, False);
      FieldDefs.Add('alquiler_frigorifico', ftFloat, 0, False);
      FieldDefs.Add('alquiler_frigorifico_dda_ue', ftFloat, 0, False);
      FieldDefs.Add('total', ftFloat, 0, False);

      CreateTable;
    end;
end;

procedure TDLFicherosAtlantis.DataModuleDestroy(Sender: TObject);
begin
  UDMTransitos.DestroyDMTransitos;
end;


function TDLFicherosAtlantis.AbrirQuery( const AEmpresa, ACentro, AProducto, APuertoSalida, AAgrupacion: string;
                                         const AFechainicio, AFechafin: TDateTime;
                                         const ACarpeta, ATransito: integer;
                                         const ADatos: integer;
                                         const ACheckDestino:boolean ): boolean;
var
  iPesoNeto, iPesoBruto: real;
begin
  result:= false;
  with QDestinos do
  begin
    SQL.Clear;
    if ( ADatos = 0 ) or ( ADatos = 1 ) then
    begin
      SQL.Add(' select ');

      SQL.Add('          ( select descripcion_a from frf_aduanas where puerto_salida_dac = codigo_a ) puerto_salida, ');

      if ACheckDestino then
        SQL.Add('        ( select descripcion_a from frf_aduanas where puerto_tc = codigo_a ) destino ')
      else
        SQl.Add('         ''PENINSULA'' destino          ');

      SQL.Add(' from frf_depositos_aduana_c, frf_transitos_c ');
      SQL.Add(' where empresa_dac= :empresa ');
      SQL.Add(' and centro_dac = :centro ');
      SQL.Add(' and fecha_dac between :fechaini and :fechafin ');

      if ACarpeta > -1 then
        SQL.Add(' and carpeta_deposito_tc = :carpeta ');
      if ATransito > -1 then
        SQL.Add(' and referencia_dac = :transito ');

      SQL.Add(' and empresa_dac = empresa_tc ');
      SQL.Add(' and centro_dac = centro_tc ');
      SQL.Add(' and referencia_dac = referencia_tc ');
      SQL.Add(' and fecha_dac = fecha_tc ');

      if AProducto <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_transitos_l ');
        SQL.Add('  where  empresa_tl = empresa_tc ');
        SQL.Add('  and centro_tl = centro_tc ');
        SQL.Add('  and referencia_tl = referencia_tc ');
        SQL.Add('  and fecha_tl = fecha_tc ');
        SQL.Add('  and producto_tl = :producto ');
        SQL.Add(' ) ');
      end;

      if AAgrupacion <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_transitos_l ');
        SQL.Add('  where  empresa_tl = empresa_tc ');
        SQL.Add('  and centro_tl = centro_tc ');
        SQL.Add('  and referencia_tl = referencia_tc ');
        SQL.Add('  and fecha_tl = fecha_tc ');
        SQL.Add('  and producto_tl in (select producto_a from frf_agrupacion where codigo_a = :agrupacion) ');
        SQL.Add(' ) ');
      end;

      if APuertoSalida <> '' then
        SQL.Add(' and puerto_salida_dac = :puerto_salida ');
      SQL.Add(' group by 1,2 ');
    end;

    if ( ADatos = 0 )  then
    begin
      SQL.Add(' union ');
    end;

    if ( ADatos = 0 ) or ( ADatos = 2 ) then
    begin

      SQL.Add('  select ( select descripcion_a from frf_aduanas where puerto_salida_dac = codigo_a ) puerto_salida, ');

      if ACheckDestino then
        SQL.Add('         ( select descripcion_a from frf_aduanas where puerto_destino_dac = codigo_a ) destino')
      else
        SQl.Add('         ''PENINSULA'' destino          ');

      SQL.Add('  from frf_depositos_aduana_c, frf_salidas_c ');
      SQL.Add('  where empresa_dac= :empresa ');
      SQL.Add('  and centro_dac = :centro ');
      SQL.Add('  and fecha_dac between :fechaini and :fechafin ');

      if ACarpeta > -1 then
        SQL.Add(' and carpeta_deposito_sc = :carpeta ');
      if ATransito > -1 then
        SQL.Add('    and referencia_dac = :transito ');

      SQL.Add('  and empresa_dac = empresa_sc ');
      SQL.Add('  and centro_dac = centro_salida_sc ');
      SQL.Add('  and referencia_dac = n_albaran_sc ');
      SQL.Add('  and fecha_dac = fecha_sc ');

      if AProducto <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_salidas_l ');
        SQL.Add('  where empresa_sl = empresa_sc ');
        SQL.Add('  and centro_salida_sl = centro_salida_sc ');
        SQL.Add('  and n_albaran_sl = n_albaran_sc ');
        SQL.Add('  and fecha_sl = fecha_sc ');
        SQL.Add('  and producto_sl = :producto ');
        SQL.Add(' ) ');
      end;

      if AAgrupacion <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_salidas_l ');
        SQL.Add('  where empresa_sl = empresa_sc ');
        SQL.Add('  and centro_salida_sl = centro_salida_sc ');
        SQL.Add('  and n_albaran_sl = n_albaran_sc ');
        SQL.Add('  and fecha_sl = fecha_sc ');
        SQL.Add('  and producto_sl in (select producto_a from frf_agrupacion where codigo_a = :agrupacion) ');
        SQL.Add(' ) ');
      end;

      if APuertoSalida <> '' then
        SQL.Add('  and puerto_salida_dac = :puerto_salida ');
      SQL.Add('  group by 1,2 ');
    end;

    SQL.Add(' order by 1,2 ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    if AProducto <> '' then
      ParamByName('producto').AsString:= AProducto;
    if AAgrupacion <> '' then
      ParamByName('agrupacion').AsString:= AAgrupacion;
    if APuertoSalida <> '' then
      ParamByName('puerto_salida').AsString:= APuertoSalida;
    ParamByName('fechaini').AsDate:= AFechaInicio;
    ParamByName('fechafin').AsDate:= AFechaFin;
    if ACarpeta > -1 then
      ParamByName('carpeta').AsInteger:= ACarpeta;
    if ATransito > -1 then
      ParamByName('transito').AsInteger:= ATransito;
    Open;
  end;

  if not QDestinos.IsEmpty then
  with QTransitos do
  begin

    SQL.Clear;
    if ( ADatos = 0 ) or ( ADatos = 1 ) then
    begin
      SQL.Add(' select ''S'' es_transito, empresa_tc, centro_tc, referencia_tc, fecha_tc, ');
      SQL.Add('           ( select descripcion_a from frf_aduanas where puerto_salida_dac = codigo_a ) puerto_salida, ');

      if ACheckDestino then
        SQL.Add('           ( select descripcion_a from frf_aduanas where puerto_tc = codigo_a ) destino, ')
      else
        SQl.Add('         ''PENINSULA'' destino,           ');

      SQL.Add('          nvl(carpeta_deposito_tc, -1) carpeta_deposito, fecha_tc fecha_transito, embarque_dac conocimiento_embarque, naviera_tc naviera, transporte_tc transporte, vehiculo_tc matricula, ');
      SQL.Add('          teus45_dac teus_45, teus40_dac teus_40, 0 teus_20, metros_lineales_dac metros_lineales, ');

      SQL.Add('           flete_dac flete, ');
      SQL.Add('           rappel_dac dto_rappel, ');
      SQL.Add('           manipulacion_dac coste_manipulacion_thc, ');
      SQL.Add('           mercancia_dac tasa_mercancia_t3, ');
      SQL.Add('           combustible_dac rec_combustible_baf, ');
      SQL.Add('           seguridad_dac tasas_seguridad, ');
      SQL.Add('           frigorifico_dac alquiler_frigorifico ');

      SQL.Add('  from frf_transitos_c, frf_depositos_aduana_c ');
      SQL.Add('  where empresa_tc= :empresa ');
      SQL.Add('  and centro_tc = :centro');
      SQL.Add('  and fecha_tc between :fechaini and :fechafin ');
      if ACarpeta > -1 then
        SQL.Add(' and carpeta_deposito_tc = :carpeta ');
      if ATransito > -1 then
        SQL.Add(' and referencia_tc = :transito ');
      SQL.Add('  and empresa_dac = empresa_tc ');
      SQL.Add('  and centro_dac = centro_tc ');
      SQL.Add('  and referencia_dac = referencia_tc ');
      SQL.Add('  and fecha_dac = fecha_tc ');

      if AProducto <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_transitos_l ');
        SQL.Add('  where  empresa_tl = empresa_tc ');
        SQL.Add('  and centro_tl = centro_tc ');
        SQL.Add('  and referencia_tl = referencia_tc ');
        SQL.Add('  and fecha_tl = fecha_tc ');
        SQL.Add('  and producto_tl = :producto ');
        SQL.Add(' ) ');
      end;

      if AAgrupacion <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_transitos_l ');
        SQL.Add('  where  empresa_tl = empresa_tc ');
        SQL.Add('  and centro_tl = centro_tc ');
        SQL.Add('  and referencia_tl = referencia_tc ');
        SQL.Add('  and fecha_tl = fecha_tc ');
        SQL.Add('  and producto_tl in (select producto_a from frf_agrupacion where codigo_a = :agrupacion) ');
        SQL.Add(' ) ');
      end;

      if APuertoSalida <> '' then
        SQL.Add(' and puerto_salida_dac = :puerto_salida ');

    end;

    if ( ADatos = 0 )  then
    begin
      SQL.Add(' union ');
    end;

    if ( ADatos = 0 ) or ( ADatos = 2 ) then
    begin
      SQL.Add('   select ''N'' es_transito, empresa_dac empresa_tc, centro_dac centro_tc, referencia_dac referencia_tc, fecha_dac fecha_tc, ');
      SQL.Add('             ( select descripcion_a from frf_aduanas where puerto_salida_dac = codigo_a ) puerto_salida, ');

      if ACheckDestino then
        SQL.Add('             ( select descripcion_a from frf_aduanas where puerto_destino_dac = codigo_a ) destino, ')
      else
        SQl.Add('         ''PENINSULA'' destino,           ');

      SQL.Add('            nvl(carpeta_deposito_sc, -1) carpeta_deposito, fecha_sc fecha_transito, embarque_dac conocimiento_embarque, naviera_dac naviera, transporte_sc transporte, vehiculo_sc matricula, ');
      SQL.Add('            teus45_dac teus_45, teus40_dac teus_40, 0 teus_20, metros_lineales_dac metros_lineales, ');

      SQL.Add('             flete_dac flete, ');
      SQL.Add('             rappel_dac dto_rappel, ');
      SQL.Add('             manipulacion_dac coste_manipulacion_thc, ');
      SQL.Add('             mercancia_dac tasa_mercancia_t3, ');
      SQL.Add('             combustible_dac rec_combustible_baf, ');
      SQL.Add('             seguridad_dac tasas_seguridad, ');
      SQL.Add('             frigorifico_dac alquiler_frigorifico ');

      SQL.Add('  from frf_depositos_aduana_c, frf_salidas_c ');
      SQL.Add('  where empresa_dac= :empresa ');
      SQL.Add('  and centro_dac = :centro ');
      SQL.Add('  and fecha_dac between :fechaini and :fechafin ');

      if ACarpeta > -1 then
        SQL.Add(' and carpeta_deposito_sc = :carpeta ');
      if ATransito > -1 then
        SQL.Add('    and referencia_dac = :transito ');

      SQL.Add('  and empresa_dac = empresa_sc ');
      SQL.Add('  and centro_dac = centro_salida_sc ');
      SQL.Add('  and referencia_dac = n_albaran_sc ');
      SQL.Add('  and fecha_dac = fecha_sc ');

      if AProducto <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_salidas_l ');
        SQL.Add('  where empresa_sl = empresa_sc ');
        SQL.Add('  and centro_salida_sl = centro_salida_sc ');
        SQL.Add('  and n_albaran_sl = n_albaran_sc ');
        SQL.Add('  and fecha_sl = fecha_sc ');
        SQL.Add('  and producto_sl = :producto ');
        SQL.Add(' ) ');
      end;

      if AAgrupacion <> '' then
      begin
        SQL.Add(' and exists ');
        SQL.Add(' ( ');
        SQL.Add('  select * ');
        SQL.Add('  from frf_salidas_l ');
        SQL.Add('  where empresa_sl = empresa_sc ');
        SQL.Add('  and centro_salida_sl = centro_salida_sc ');
        SQL.Add('  and n_albaran_sl = n_albaran_sc ');
        SQL.Add('  and fecha_sl = fecha_sc ');
        SQL.Add('  and producto_sl in (select producto_a from frf_agrupacion where codigo_a = :agrupacion) ');
        SQL.Add(' ) ');
      end;

      if APuertoSalida <> '' then
        SQL.Add('  and puerto_salida_dac = :puerto_salida ');
    end;

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    if AProducto <> '' then
      ParamByName('producto').AsString:= AProducto;
    if AAgrupacion <> '' then
      ParamByName('agrupacion').AsString:= AAgrupacion;
    if APuertoSalida <> '' then
      ParamByName('puerto_salida').AsString:= APuertoSalida;
    ParamByName('fechaini').AsDate:= AFechaInicio;
    ParamByName('fechafin').AsDate:= AFechaFin;
    if ACarpeta > -1 then
      ParamByName('carpeta').AsInteger:= ACarpeta;
    if ATransito > -1 then
      ParamByName('transito').AsInteger:= ATransito;
    Open;

    mtTransitos.Close;
    mtTransitos.Open;
    while not Eof do
    begin
      mtTransitos.Insert;

      // --> Descripcion
      // ***************************************************************************************************
      mtTransitos.FieldByName('puerto_salida').AsString:= FieldByName('puerto_salida').AsString;
      mtTransitos.FieldByName('destino').AsString:= FieldByName('destino').AsString;
      mtTransitos.FieldByName('fecha_transito').AsDateTime:= FieldByName('fecha_transito').AsDateTime;
      mtTransitos.FieldByName('conocimiento_embarque').AsString:= FieldByName('conocimiento_embarque').AsString;
      mtTransitos.FieldByName('naviera').AsString:= FieldByName('naviera').AsString;
      mtTransitos.FieldByName('transporte').AsString:= desTransporte(AEmpresa, FieldByName('transporte').AsString);
      mtTransitos.FieldByName('carpeta').AsString:= FieldByName('carpeta_deposito').AsString;
      mtTransitos.FieldByName('matricula').AsString:= FieldByName('matricula').AsString;

      mtTransitos.FieldByName('teus_45').AsInteger:= FieldByName('teus_45').AsInteger;
      mtTransitos.FieldByName('teus_40').AsInteger:= FieldByName('teus_40').AsInteger;
      mtTransitos.FieldByName('teus_20').AsInteger:= FieldByName('teus_20').AsInteger;
      mtTransitos.FieldByName('metros_lineales').AsFloat:= FieldByName('metros_lineales').AsFloat;
      mtTransitos.FieldByName('n_palets').AsInteger:= 0;

      if FieldByName('es_transito').AsString = 'S' then
        DMTRansitos.PesosTransitoDeposito( FieldByName('empresa_tc').AsString,
                     FieldByName('centro_tc').AsString,
                     FieldByName('referencia_tc').AsInteger,
                     FieldByName('fecha_tc').AsDateTime,
                     iPesoNeto, iPesoBruto )
      else
        DMTRansitos.PesosVentaDeposito(FieldByName('empresa_tc').AsString,
                     FieldByName('centro_tc').AsString,
                     FieldByName('referencia_tc').AsInteger,
                     FieldByName('fecha_tc').AsDateTime,
                     iPesoNeto, iPesoBruto );

      mtTransitos.FieldByName('peso_neto').AsFloat:= iPesoNeto;
      mtTransitos.FieldByName('peso_bruto').AsFloat:= iPesoBruto;

      // --> Importe
      // ***************************************************************************************************
      mtTransitos.FieldByName('flete').AsFloat:= FieldByName('flete').AsFloat ;
      mtTransitos.FieldByName('dto_rappel').AsFloat:= FieldByName('dto_rappel').AsFloat;
      mtTransitos.FieldByName('coste_manipulacion_thc').AsFloat:= FieldByName('coste_manipulacion_thc').AsFloat ;
      mtTransitos.FieldByName('tasa_mercancia_t3').AsFloat:= FieldByName('tasa_mercancia_t3').AsFloat;
      mtTransitos.FieldByName('rec_combustible_baf').AsFloat:= FieldByName('rec_combustible_baf').AsFloat;
      mtTransitos.FieldByName('tasas_seguridad').AsFloat:= FieldByName('tasas_seguridad').AsFloat;
      mtTransitos.FieldByName('porcentaje_canario').AsFloat:= 100;
      mtTransitos.FieldByName('alquiler_frigorifico').AsFloat:= FieldByName('alquiler_frigorifico').AsFloat;
      mtTransitos.FieldByName('alquiler_frigorifico_dda_ue').AsFloat:= 0;
      mtTransitos.FieldByName('total').AsFloat:= mtTransitos.FieldByName('flete').AsFloat -
                                                 mtTransitos.FieldByName('dto_rappel').AsFloat +
                                                 mtTransitos.FieldByName('coste_manipulacion_thc').AsFloat +
                                                 mtTransitos.FieldByName('tasa_mercancia_t3').AsFloat +
                                                 mtTransitos.FieldByName('rec_combustible_baf').AsFloat +
                                                 mtTransitos.FieldByName('tasas_seguridad').AsFloat +
                                                 mtTransitos.FieldByName('alquiler_frigorifico').AsFloat;
      mtTransitos.Post;
      Next;
    end;
    Close;

    //result:= ComprobarTotalesExec( self, mtTransitos, AEmpresa, ACentro, APuertoSalida, AFechainicio, AFechafin, ACarpeta, ATransito, False, False );
    result:= not mtTransitos.isempty;
    mtTransitos.SortFields:= 'puerto_salida;destino;carpeta;fecha_transito;matricula;conocimiento_embarque';
    mtTransitos.Sort([]);
    mtTransitos.First;

  end
  else
    QDestinos.Close;
end;

procedure TDLFicherosAtlantis.CerrarQuery;
begin
  mtTransitos.Close;
end;

procedure TDLFicherosAtlantis.FiltrarDestino( const APuertoSalida, ADestino: string );
begin
  mtTransitos.Filtered:=False;
  if ADestino <> '' then
  begin
    mtTransitos.Filter:= 'Destino=' + QuotedStr( ADestino ) + ' and puerto_salida=' + QuotedStr( APuertoSalida );
    mtTransitos.Filtered:=True;
  end;
  mtTransitos.First;
end;

procedure TDLFicherosAtlantis.LimpiarFiltros;
begin
  mtTransitos.Filtered:=False;
  mtTransitos.Filter:= '';
  mtTransitos.First;
end;


end.


