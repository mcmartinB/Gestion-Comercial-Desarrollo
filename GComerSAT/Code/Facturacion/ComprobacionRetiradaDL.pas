unit ComprobacionRetiradaDL;

interface

uses
  SysUtils, Classes, FacturacionCB, DB, DBTables, kbmMemTable;

type
  TDLComprobacionRetirada = class(TDataModule)
    QAlbaranFactura: TQuery;
    mtAlbaranFactura: TkbmMemTable;
    mtAlbaranFacturafactura: TIntegerField;
    mtAlbaranFacturafecha: TDateField;
    mtAlbaranFacturacliente: TStringField;
    mtAlbaranFacturaimporte: TFloatField;
    mtAlbaranFacturaimpuesto: TFloatField;
    mtAlbaranFacturakilos: TFloatField;
    mtAlbaranFacturanombre: TStringField;
    mtAlbaranFacturaempresa: TStringField;
    mtAlbaranFacturaserie: TStringField;
    mtAlbaranFacturacod_factura: TStringField;
    QGastoAlbaran: TQuery;                                                                                
    QAlbaranAgrupado: TQuery;
    mtAlbaranFacturaimporte_st: TFloatField;
    mtAlbaranFacturaimpuesto_st: TFloatField;
    mtAlbaranFacturakilos_st: TFloatField;
  private
    { Private declarations }
    //function Gastos: real;

    function ExisteFactura: Boolean;
    procedure AltaFactura ( const AParametros: RClienteQL );
    procedure ModificarFactura ( const AParametros: RClienteQL );
    procedure AddGastos( const AParametros: RClienteQL; var AGastoFactAlb: Real );
    procedure AddGastoTotal( const AParametros: RClienteQL; var AGastoFac: Real );
    procedure AddGastoProducto( const AParametros: RClienteQL; var AGastoFac: Real );
    function EsProductoConGasto (const AProducto: string): Boolean;
    function PutGasto( const AUnidades: Real;  const AUnd: Real; var AFac: Real ): Boolean;
    procedure CrearQGastoAlbaran;
    procedure CrearQAlbaranAgrupado;
    function EjecutaQGastoAlbaran (const AEmpresa, ACentro, AAlbaran, AFecha: String): Boolean;
    function EjecutaQAlbaranAgrupado (const AEmpresa, ACentro, AAlbaran, AFecha, AProducto: String): boolean;

  public
    { Public declarations }
    procedure ObtenerDatos( AParametros: RClienteQL );
  end;

procedure LoadModule( APadre: TComponent );
procedure UnloadModule;
function  OpenData( APadre: TComponent; AParametros: RClienteQL ): integer;


implementation

{$R *.dfm}

uses UDMAuxDB, bMath, Variants;

var
  DLComprobacionRetirada: TDLComprobacionRetirada;
  iContadorUso: integer = 0;

function GetAbonosSQL( AParametros: RClienteQL ): String;
var
  slAux: TStringList;
  sAux: string;
begin
  slAux:= TStringList.Create;
  slAux.Add(' ( select  cod_cliente_fc cliente_fac_sc,  cod_empresa_fac_fc empresa_f, cod_serie_fac_fc serie_f, fecha_factura_fc fecha_factura_sc, n_factura_fc n_factura_sc, cod_factura_fc,');
  slAux.Add('           case when importe_total_fc = 0 then 1 else round( importe_total_euros_fc / importe_total_fc, 7 ) end cambio, ');

  slAux.Add('           cod_empresa_albaran_fd empresa_sc, cod_centro_albaran_fd centro_salida_sc, ');
  slAux.Add('           fecha_albaran_fd fecha_sc, n_albaran_fd n_albaran_sc, cod_producto_fd producto_sl, ');
  slAux.Add('           0 n_palets_sl, ');
  slAux.Add('           0 cajas_sl, ');
  slAux.Add('           0 kilos_sl, ');
  slAux.Add('           sum( importe_linea_fd ) importe_neto_sl, ');
  slAux.Add('           sum( importe_neto_fd ) importe_con_descuento, ');
  slAux.Add('           sum( case when importe_neto_fc = 0 then 0 else round( importe_impuesto_fc * importe_neto_fd / importe_neto_fc, 2 ) end ) impuestos_producto, ');
  slAux.Add('           0 cajas_st, ');
  slAux.Add('           0 kilos_st, ');
  slAux.Add('           0 importe_neto_st, ');
  slAux.Add('           0 importe_con_descuento_st, ');
  slAux.Add('           0 impuestos_producto_st ');
//  slAux.Add('           sum( importe_linea_fd ) importe_neto_st, ');
//  slAux.Add('           sum( importe_neto_fd ) importe_con_descuento_st, ');
//  slAux.Add('           sum( case when importe_neto_fc = 0 then 0 else round( importe_impuesto_fc * importe_neto_fd / importe_neto_fc, 2 ) end ) impuestos_producto_st ');

  slAux.Add(' from tfacturas_det ');
  slAux.Add('     join tfacturas_cab on cod_factura_fc = cod_factura_fd  ');
  slAux.Add('   where automatica_fc = 0 ');                                   // Facturas / Abonos Manuales

// -->> empresa
  slAux.Add('  and cod_empresa_fac_fc = :empresa  ');
  if AParametros.sSerie <> '' then
    slAux.Add(' and cod_serie_fac_fc = :serie         ');
// -->> fechas
   if AParametros.bFechaFactura then
     slAux.Add('  and fecha_factura_fc between :fechaini and :fechafin ')
   else
     slAux.Add('  and fecha_albaran_fd between :fechaini and :fechafin  ');
// -->> tipo producto
  if AParametros.iTipo = 0 then
    slAux.Add('  and ( select estomate_p from frf_productos where producto_p = cod_producto_fd )  = ''S''  ')
  else
  if AParametros.iTipo = 1 then
    slAux.Add('  and ( select estomate_p from frf_productos where producto_p = cod_producto_fd )  <> ''S'' ')
  else
  if AParametros.iTipo = 2 then
//    slAux.Add('  and ( producto_fal = ''C'' or producto_fal = ''B'' or producto_fal = ''J'' )  ')
    slAux.Add('  and ( cod_producto_fd = ''BBL'' or cod_producto_fd = ''BNE'' or cod_producto_fd = ''BRA'' )  ')
  else
  if AParametros.iTipo = 3 then
  begin
//    slAux.Add('  and ( producto_fal = ''A'' or producto_fal = ''R'' or producto_fal = ''P'' or producto_fal = ''V'' )  ');
    slAux.Add('  and ( cod_producto_fd = ''PAM'' or cod_producto_fd = ''PMA'' or cod_producto_fd = ''PMN'' or cod_producto_fd = ''PMR'' ');
    slAux.Add('     or cod_producto_fd = ''PNA'' or cod_producto_fd = ''PRO'' or cod_producto_fd = ''PVE'' )  ');
  end;
// -->> producto
  if AParametros.sProducto <> '' then
    slAux.Add(' and cod_producto_fd = :producto  ');
// -->> cliente
  if AParametros.sCliente <> '' then
    slAux.Add(' and cod_cliente_fc = :cliente  ');
// -->> centro de origen
  if AParametros.sCentroOrigen <> '' then
    slAux.Add('  and centro_origen_fd = :centroorigen ');
// -->> centro de salida
  if AParametros.sCentroSalida <> '' then
    slAux.Add(' and centro_salida_fd = :centroSalida  ');
// -->> categoria
  if AParametros.sCategoria <> '' then
    slAux.Add('  and categoria_fd = :categoria ');
  if AParametros.sAgrupacion <> '' then
    slAux.Add(' and cod_producto_fd in (select producto_a from frf_agrupacion where codigo_a = :agrupacion) ');


  slAux.Add(' ');
//  slAux.Add(' group by 1,2,3,4,5,6,7,8,9,10,11,15,16 ) ');
  slAux.Add(' group by empresa_f, serie_f, fecha_factura_sc, n_factura_sc, cod_factura_fc, cliente_fac_sc, cambio,  ');
  slAux.Add('          empresa_sc, centro_salida_sc, fecha_sc, n_albaran_sc, producto_sl)                           ');

  result:= slAux.Text;
  FreeAndNil( slAux );
end;


function GetFacturasSQL( AParametros: RClienteQL ): String;
var
  slAux: TStringList;
  sAux: string;
begin
  slAux:= TStringList.Create;
  slAux.Add(' ( select cliente_fac_sc, cod_empresa_fac_fc empresa_f, cod_serie_fac_fc serie_f, fecha_factura_sc, n_factura_sc, cod_factura_fc,');
  slAux.Add('        case when importe_total_fc = 0 then 1 else round( importe_total_euros_fc / importe_total_fc, 7 ) end cambio, ');
  slAux.Add(' ');
  slAux.Add('        empresa_sc, ');
  slAux.Add('        centro_salida_sc, ');
  slAux.Add('        fecha_sc, ');
  slAux.Add('        n_albaran_sc, producto_sl, ');
  slAux.Add(' ');
  slAux.Add('        sum( case es_transito_sc when 2 then 0 else n_palets_sl end ) n_palets_sl, ');                  //Tipo Salida: Devolucion
  slAux.Add('        sum( case es_transito_sc when 2 then 0 else cajas_sl end ) cajas_sl, ');                  //Tipo Salida: Devolucion
  slAux.Add('        sum( case es_transito_sc when 2 then 0 else kilos_sl end ) kilos_sl, ');                  //Tipo Salida: Devolucion
  slAux.Add('        sum(importe_neto_sl) importe_neto_sl,                                ');
  slAux.Add('        sum( round( importe_neto_sl *( 1 - ( ( GetDescuentoCliente( empresa_sc, cliente_fac_sc, fecha_sc, 1) + ');
  slAux.Add('                                               GetComisionCliente( empresa_sc, cliente_fac_sc, fecha_sc) ) / 100 ) ), 2 ) ) importe_con_descuento, ');
  slAux.Add('        sum( round( importe_neto_sl *( 1 - ( ( GetDescuentoCliente( empresa_sc, cliente_fac_sc, fecha_sc, 1) + ');
  slAux.Add('                                              GetComisionCliente( empresa_sc, cliente_fac_sc, fecha_sc) ) / 100 ) ) * ( porc_iva_sl / 100) , 2 ) ');
  slAux.Add('            ) impuestos_producto, ');
  slAux.Add('               sum( (select NVL(sum(cajas_st), 0) from frf_salidas_terceros where empresa_st = empresa_sl  and centro_salida_st = centro_salida_sl          ');
  slAux.Add('                                        and fecha_st = fecha_sl and n_albaran_st = n_albaran_sl and id_linea_albaran_st = id_linea_albaran_sl)) cajas_st,   ');
  slAux.Add('               sum( (select NVL(sum(kilos_st), 0) from frf_salidas_terceros where empresa_st = empresa_sl  and centro_salida_st = centro_salida_sl          ');
  slAux.Add('                                        and fecha_st = fecha_sl and n_albaran_st = n_albaran_sl and id_linea_albaran_st = id_linea_albaran_sl)) kilos_st,   ');
  slAux.Add('               sum( (select NVL(sum(importe_neto_st), 0) from frf_salidas_terceros where empresa_st = empresa_sl  and centro_salida_st = centro_salida_sl   ');
  slAux.Add('                                        and fecha_st = fecha_sl and n_albaran_st = n_albaran_sl and id_linea_albaran_st = id_linea_albaran_sl)) importe_neto_st, ');
  slAux.Add('       	sum( round((select NVL(sum(importe_neto_st), 0) from frf_salidas_terceros where empresa_st = empresa_sl  and centro_salida_st = centro_salida_sl        ');
  slAux.Add('                                        and fecha_st = fecha_sl and n_albaran_st = n_albaran_sl and id_linea_albaran_st = id_linea_albaran_sl) *                 ');
  slAux.Add('       										( 1 - ( ( GetDescuentoCliente( empresa_sc, cliente_fac_sc, fecha_sc, 1) +                                                             ');
  slAux.Add('       						                                          GetComisionCliente( empresa_sc, cliente_fac_sc, fecha_sc) ) / 100 ) ), 2 ) ) importe_con_descuento_st, ');
  slAux.Add('       	sum( round((select NVL(sum(importe_neto_st), 0) from frf_salidas_terceros where empresa_st = empresa_sl  and centro_salida_st = centro_salida_sl           ');
  slAux.Add('                                        and fecha_st = fecha_sl and n_albaran_st = n_albaran_sl and id_linea_albaran_st = id_linea_albaran_sl) *                    ');
  slAux.Add('       										( 1 - ( ( GetDescuentoCliente( empresa_sc, cliente_fac_sc, fecha_sc, 1) +                                                                ');
  slAux.Add('       						                                          GetComisionCliente( empresa_sc, cliente_fac_sc, fecha_sc) ) / 100 ) ) * ( porc_iva_sl / 100) , 2 ) ) impuestos_producto_st  ');
  slAux.Add(' ');
  slAux.Add(' from frf_salidas_c sc ');
  slAux.Add('      join tfacturas_cab    on ( cod_empresa_fac_fc = empresa_fac_sc  and  cod_serie_fac_fc = serie_fac_sc');
  slAux.Add('                                 and n_factura_fc = n_factura_sc and fecha_factura_fc = fecha_factura_sc) ');
  slAux.Add('      join frf_salidas_l sl on ( empresa_sl = empresa_sc  and centro_salida_sl = centro_salida_sc ');
  slAux.Add('                                 and fecha_sl = fecha_sc and n_albaran_sl = n_albaran_sc ) ');
  slAux.Add(' ');
// -->> empresa
  slAux.Add('  where empresa_sc = :empresa  ');
  if AParametros.sSerie <> '' then
    slAux.Add(' and serie_fac_sc = :serie   ');
// -->> fechas
   if AParametros.bFechaFactura then
     slAux.Add('  and fecha_factura_sc between :fechaini and :fechafin ')
   else
     slAux.Add('  and fecha_sc between :fechaini and :fechafin  ');
// -->> tipo producto
  if AParametros.iTipo = 0 then
    slAux.Add('  and ( select estomate_p from frf_productos where producto_p = producto_sl )  = ''S''  ')
  else
  if AParametros.iTipo = 1 then
    slAux.Add('  and ( select estomate_p from frf_productos where producto_p = producto_sl )  <> ''S'' ')
  else
  if AParametros.iTipo = 2 then
//    slAux.Add('  and ( producto_sl = ''C'' or producto_sl = ''B'' or producto_sl = ''J'' )  ')
    slAux.Add('  and ( producto_sl = ''BBL'' or producto_sl = ''BNE'' or producto_sl = ''BRA'' )  ')
  else
  if AParametros.iTipo = 3 then
  begin
//    slAux.Add('  and ( producto_sl = ''A'' or producto_sl = ''R'' or producto_sl = ''P'' or producto_sl = ''V'' )  ');
    slAux.Add('  and ( producto_sl = ''PAM'' or producto_sl = ''PMA'' or producto_sl = ''PMN'' or producto_sl = ''PMR'' ');
    slAux.Add('   or producto_sl = ''PNA'' or producto_sl = ''PRO'' or producto_sl = ''PVE'' )  ');
  end;
// -->> producto
  if AParametros.sProducto <> '' then
    slAux.Add(' and producto_sl = :producto  ');
// -->> cliente
  if AParametros.sCliente <> '' then
    slAux.Add(' and cliente_fac_sc = :cliente  ');
// -->> centro de origen
  if AParametros.sCentroOrigen <> '' then
    slAux.Add('  and centro_origen_sl = :centroorigen ');
// -->> centro de salida
  if AParametros.sCentroSalida <> '' then
    slAux.Add(' and centro_salida_sc = :centroSalida  ');
// -->> categoria
  if AParametros.sCategoria <> '' then
    slAux.Add('  and categoria_sl = :categoria ');
  if AParametros.sAgrupacion <> '' then
    slAux.Add(' and producto_sl in (select producto_a from frf_agrupacion where codigo_a = :agrupacion) ');


// -->> procedencia de la fruta
//  if AParametros.iProcedencia = 1 then
//    slAux.Add('  and NVL(emp_procedencia_sl, empresa_sl ) = empresa_sl ')
//  else
//  if AParametros.iProcedencia = 2 then
//    slAux.Add('  and NVL(emp_procedencia_sl, empresa_sl ) <> empresa_sl ');
  slAux.Add(' ');
  slAux.Add(' group by empresa_f, serie_f, fecha_factura_sc, n_factura_sc, cod_factura_fc, cliente_fac_sc, cambio,');
  slAux.Add('          empresa_sc, centro_salida_sc, fecha_sc, n_albaran_sc, producto_sl ) ');
  result:= slAux.Text;
  FreeAndNil( slAux );
end;


function GetTextoSQL( AParametros: RClienteQL ): String;
begin
  result:= '';
  if ( AParametros.iAbonos = 0 ) or ( AParametros.iAbonos = 1 ) then
  begin
    result:= GetFacturasSQL( AParametros );
  end;

  if AParametros.iProcedencia <> 2 then
  begin
    //abonos y facturas manuales solo para producto propio
    if ( AParametros.iAbonos = 0 ) then
    begin
      result:= result + #13 + #10 + ' UNION ';
    end;

    if ( AParametros.iAbonos = 0 ) or ( AParametros.iAbonos = 2 ) then
    begin
      result:= result + #13 + #10 + GetAbonosSQL( AParametros );
    end;
  end;
  if result <> '' then
    result:= result + #13 + #10 + ' order by cliente_fac_sc, fecha_factura_sc, n_factura_sc '
  else
    raise Exception.Create('Los abonos solo pueden ser de fruta propia.');
end;


procedure LoadModule( APadre: TComponent );
begin
  Inc( iContadorUso );
  if iContadorUso = 1 then
  begin
    try
      DLComprobacionRetirada:= TDLComprobacionRetirada.Create( APadre );
    except
      iContadorUso:= 0;
      raise;
    end;
  end;
end;

procedure UnloadModule;
begin
  if iContadorUso > 0  then
  begin
    Dec( iContadorUso );
    if iContadorUso = 0 then
    begin
      if DLComprobacionRetirada <> nil then
      begin
        DLComprobacionRetirada.QAlbaranFactura.Close;
        FreeAndNil( DLComprobacionRetirada );
      end;
    end;
  end;
end;

procedure TDLComprobacionRetirada.ObtenerDatos( AParametros: RClienteQL );
begin
  CrearQAlbaranAgrupado;
  CrearQGastoAlbaran;

  QAlbaranFactura.Close;
  DLComprobacionRetirada.QAlbaranFactura.SQL.Text:= GetTextoSQL( AParametros );

  QAlbaranFactura.ParamByName('empresa').AsString:= AParametros.sEmpresa;
  if AParametros.sSerie <> '' then
    QAlbaranFactura.ParamByName('serie').AsString:= AParametros.sSerie;
  QAlbaranFactura.ParamByName('fechaini').AsDate:= AParametros.dFechaDesde;
  QAlbaranFactura.ParamByName('fechafin').AsDate:= AParametros.dFechaHasta;
  if AParametros.sProducto <> '' then
    QAlbaranFactura.ParamByName('producto').AsString:= AParametros.sProducto;
  if AParametros.sCategoria <> '' then
    QAlbaranFactura.ParamByName('categoria').AsString:= AParametros.sCategoria;
  if AParametros.sCliente <> '' then
    QAlbaranFactura.ParamByName('cliente').AsString:= AParametros.sCliente;
  if AParametros.sCentroOrigen <> '' then
    QAlbaranFactura.ParamByName('centroOrigen').AsString:= AParametros.sCentroOrigen;
  if AParametros.sCentroSalida <> '' then
    QAlbaranFactura.ParamByName('centroSalida').AsString:= AParametros.sCentroSalida;
  if AParametros.sAgrupacion <> '' then
    QAlbaranFactura.ParamByName('agrupacion').AsString:= AParametros.sAgrupacion;

  QAlbaranFactura.Open;

  mtAlbaranFactura.Close;
  mtAlbaranFactura.Open;

  QAlbaranFactura.First;
  while not QAlbaranFactura.Eof do
  begin
    if QAlbaranFactura.FieldByName('importe_neto_sl').AsFloat <> 0 then
    begin
      if ExisteFactura then
        ModificarFactura ( AParametros )
      else
        AltaFactura ( AParametros );
    end;
    QAlbaranFactura.Next;
  end;
  QAlbaranFactura.Close;
  if AParametros.bAgruparCliente then
    mtAlbaranFactura.SortFields:= 'empresa;serie;cliente;fecha;factura'
  else
    mtAlbaranFactura.SortFields:= 'empresa;serie;fecha;factura;cliente';
  mtAlbaranFactura.Sort([]);
end;

function TDLComprobacionRetirada.PutGasto(const AUnidades: Real; const AUnd: Real; var AFac: Real): Boolean;
var
  rAux, rUnidadesTotal: Real;
begin
//  rUnidadesTotal :=  QAlbaranFactura.FieldByName( AUnidadesTotal ).AsFloat;

  if ( AUnidades > 0 ) and ( AUnd  > 0 )then
  begin
    rAux:= AUnd / AUnidades;
    AFac:= AFac +  QGastoAlbaran.fieldByName('gasto_fac').AsFloat * rAux;
    result:= True;
  end
  else
  begin
    result:= False;
  end;
end;

procedure TDLComprobacionRetirada.CrearQAlbaranAgrupado;
begin
  with QAlbaranAgrupado do
  begin
    SQL.Clear;
    SQL.Add(' select sum(kilos_sl) total_kilos, ');
    SQL.Add('        sum(case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                    then kilos_sl else 0 end) transito_kilos, ');
    SQL.Add('        sum(case when producto_sl = :producto then kilos_sl else 0 end ) total_prod_kilos, ');
    SQL.Add('        sum(case when producto_sl = :producto then ');
    SQL.Add('                     ( case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                            then kilos_sl else 0 end ) ');
    SQL.Add('                 else 0 end ) transito_prod_kilos,  ');

    SQL.Add('        sum(cajas_sl) total_cajas, ');
    SQL.Add('        sum(case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                    then cajas_sl else 0 end) transito_cajas, ');
    SQL.Add('        sum(case when producto_sl = :producto then cajas_sl else 0 end ) total_prod_cajas, ');
    SQL.Add('        sum(case when producto_sl = :producto then ');
    SQL.Add('                     ( case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                            then cajas_sl else 0 end ) ');
    SQL.Add('                 else 0 end ) transito_prod_cajas,  ');

    SQL.Add('        sum(n_palets_sl) total_palets, ');
    SQL.Add('        sum(case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                    then n_palets_sl else 0 end) transito_palets, ');
    SQL.Add('        sum(case when producto_sl = :producto then n_palets_sl else 0 end ) total_prod_palets, ');
    SQL.Add('        sum(case when producto_sl = :producto then ');
    SQL.Add('                     ( case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                            then n_palets_sl else 0 end ) ');
    SQL.Add('                 else 0 end ) transito_prod_palets,  ');

    SQL.Add('        sum(importe_neto_sl) total_importe, ');
    SQL.Add('        sum(importe_total_sl) importe_con_iva, ');
    SQL.Add('        sum(case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                    then importe_neto_sl else 0 end) transito_importe, ');
    SQL.Add('        sum(case when producto_sl = :producto then importe_neto_sl else 0 end ) total_prod_importe, ');
    SQL.Add('        sum(case when producto_sl = :producto then ');
    SQL.Add('                     ( case when ( ref_transitos_sl is not NULL ) or ( nvl(es_transito_sc,0) =  1 ) ');
    SQL.Add('                            then importe_neto_sl else 0 end ) ');
    SQL.Add('                 else 0 end ) transito_prod_importe  ');

    SQL.Add(' from frf_salidas_c, frf_salidas_l ');
    SQL.Add(' where empresa_sc = :empresa ');
    SQL.Add(' and centro_salida_sc = :centro ');
    SQL.Add(' and n_albaran_sc = :albaran ');
    SQL.Add(' and fecha_sc = :fecha ');
    SQL.Add(' and empresa_sl = empresa_sc ');
    SQL.Add(' and centro_salida_sl = centro_salida_sc ');
    SQL.Add(' and n_albaran_sl = n_albaran_sc ');
    SQL.Add(' and fecha_sl = fecha_sc ');

    Prepare;
  end;
end;

procedure TDLComprobacionRetirada.CrearQGastoAlbaran;
begin
  with QGastoAlbaran do
  begin
    if Active then Close;

    SQL.Clear;
    SQL.Add(' select producto_g producto, unidad_dist_tg unidad, gasto_transito_tg transito,  ');
    SQL.Add('         sum( case when facturable_tg = ''S''                                    ');
    SQL.Add('                   then importe_g * -1                                           ');
    SQL.Add('                   else 0 end ) gasto_fac,                                       ');
    SQL.Add('         sum( case when facturable_tg <> ''S''                                   ');
    SQL.Add('                  then importe_g                                                 ');
    SQL.Add('                  else 0 end ) gasto_nofac                                       ');
    SQL.Add('  from frf_gastos, frf_tipo_gastos                                               ');
    SQL.Add('  where empresa_g = :empresa                                                     ');
    SQL.Add('  and centro_salida_g = :centro                                                  ');
    SQL.Add('  and n_albaran_g = :albaran                                                     ');
    SQL.Add('  and fecha_g = :fecha                                                           ');
    SQL.Add('  and tipo_tg = tipo_g                                                           ');
    SQL.Add(' group by producto, unidad, transito                                             ');

    Prepare;
  end;
end;

function TDLComprobacionRetirada.EjecutaQAlbaranAgrupado(const AEmpresa, ACentro, AAlbaran, AFecha, AProducto: String): boolean;
begin
  with QAlbaranAgrupado do
  begin
    if Active then
      Close;

    ParamByName('empresa').AsString := AEmpresa;
    ParamByName('centro').AsString := ACentro;
    ParamByName('albaran').AsString := AAlbaran;
    ParamByName('fecha').AsString := AFecha;
    ParamByName('producto').AsString := AProducto;

    Open;
    Result := not IsEmpty;
  end;
end;

function TDLComprobacionRetirada.EjecutaQGastoAlbaran(const AEmpresa, ACentro, AAlbaran, AFecha: String): Boolean;
begin
  with QGastoAlbaran do
  begin
    if Active then
      Close;

    ParamByName('empresa').AsString := AEmpresa;
    ParamByName('centro').AsString := ACentro;
    ParamByName('albaran').AsString := AAlbaran;
    ParamByName('fecha').AsString := AFecha;

    Open;
    Result := not IsEmpty;
  end;
end;

function TDLComprobacionRetirada.EsProductoConGasto( const AProducto: string ): Boolean;
begin
  if QGastoAlbaran.fieldByName('producto').AsString = '' then
  begin
    result:= True;
  end
  else
  if AProducto = QGastoAlbaran.fieldByName('producto').AsString then
  begin
    result:= True;
  end
  else
  begin
    result:= False;
  end;
end;

function TDLComprobacionRetirada.ExisteFactura: Boolean;
begin
  Result:= mtAlbaranFactura.Locate('empresa;serie;factura;fecha', varArrayOf([QAlbaranFactura.FieldByName('empresa_f').AsString,
                                                                              QAlbaranFactura.FieldByName('serie_f').AsString,
                                                                              QAlbaranFactura.FieldByName('n_factura_sc').AsInteger,
                                                                              QAlbaranFactura.FieldByName('fecha_factura_sc').AsDateTime ]),[]);

end;

procedure TDLComprobacionRetirada.AddGastoProducto(const AParametros: RClienteQL; var AGastoFac: Real);
var sKilos, sCajas, sPalets, sImporte: string;
    rKilos, rCajas, rPalets, rImporte: Real;
begin
  if AParametros.iProcedencia = 2 then        //Terceros
  begin
    rPalets := QAlbaranFactura.FieldByName('n_palets_sl').AsFloat;
    rCajas := QAlbaranFactura.FieldByName('cajas_st').AsFloat;
    rKilos := QAlbaranFactura.FieldByName('kilos_st').AsFloat;
    rImporte := QAlbaranFactura.FieldByName('importe_neto_st').AsFloat;
  end
  else
  if AParametros.iProcedencia = 1 then        //Empresa
  begin
    rPalets := QAlbaranFactura.FieldByName('n_palets_sl').AsFloat;
    rCajas := QAlbaranFactura.FieldByName('cajas_sl').AsFloat - QAlbaranFactura.FieldByName('cajas_st').AsFloat;
    rKilos := QAlbaranFactura.FieldByName('kilos_sl').AsFloat - QAlbaranFactura.FieldByName('kilos_st').AsFloat;
    rImporte := QAlbaranFactura.FieldByName('importe_neto_sl').AsFloat - QAlbaranFactura.FieldByName('importe_neto_st').AsFloat;
  end
  else
  begin                                      //Indistinta
    rPalets := QAlbaranFactura.FieldByName('n_palets_sl').AsFloat;
    rCajas := QAlbaranFactura.FieldByName('cajas_sl').AsFloat;
    rKilos := QAlbaranFactura.FieldByName('kilos_sl').AsFloat;
    rImporte := QAlbaranFactura.FieldByName('importe_neto_sl').AsFloat;
  end;

  //KILOGRAMOS
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'K' then
  begin
    PutGasto( QAlbaranAgrupado.FieldByName('total_prod_kilos').AsFloat, rKilos, AGastoFac );
  end
  else
  //CAJAS
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'C' then
  begin
    if not PutGasto( QAlbaranAgrupado.FieldByName('total_prod_cajas').AsFloat, rCajas,  AGastoFac ) then
    begin
      PutGasto( QAlbaranAgrupado.FieldByName('total_prod_kilos').AsFloat, rKilos, AGastoFac );
    end;
  end
  else
  //PALETS
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'P' then
  begin
    if not PutGasto( QAlbaranAgrupado.FieldByName('total_prod_palets').AsFloat, rPalets, AGastoFac ) then
    begin
      if not PutGasto( QAlbaranAgrupado.FieldByName('total_prod_cajas').AsFloat, rCajas, AGastoFac ) then
      begin
        PutGasto( QAlbaranAgrupado.FieldByName('total_prod_kilos').AsFloat, rKilos, AGastoFac );
      end;
    end;
  end
  else
  //IMPORTE
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'I' then
  begin
    if not PutGasto( QAlbaranAgrupado.FieldByName('total_prod_importe').AsFloat, rImporte, AGastoFac ) then
    begin
      PutGasto( QAlbaranAgrupado.FieldByName('total_prod_kilos').AsFloat, rKilos, AGastoFac );
    end;
  end;
end;

procedure TDLComprobacionRetirada.AddGastos(const AParametros: RClienteQL; var AGastoFactAlb: Real);
begin
  AGastoFactAlb := 0;

  QGastoAlbaran.First;
  while not QGastoAlbaran.Eof do
  begin
    if EsProductoConGasto (QAlbaranFactura.FieldByName('producto_sl').AsString) then
    begin
      if QGastoAlbaran.fieldByName('producto').AsString = '' then
        AddGastoTotal( AParametros, AGastoFactAlb)
      else
        AddGastoProducto( AParametros, AGastoFactAlb );
    end;

    QGastoAlbaran.Next;
  end;
end;

procedure TDLComprobacionRetirada.AddGastoTotal(const AParametros: RClienteQL; var AGastoFac: Real);
var sKilos, sCajas, sPalets, sImporte: string;
    rPalets, rCajas, rKilos, rImporte: Real;
begin
  if AParametros.iProcedencia = 2 then        //Terceros
  begin
    rPalets := QAlbaranFactura.FieldByName('n_palets_sl').AsFloat;
    rCajas := QAlbaranFactura.FieldByName('cajas_st').AsFloat;
    rKilos := QAlbaranFactura.FieldByName('kilos_st').AsFloat;
    rImporte := QAlbaranFactura.FieldByName('importe_neto_st').AsFloat;
  end
  else
  if AParametros.iProcedencia = 1 then        //Empresa
  begin
    rPalets := QAlbaranFactura.FieldByName('n_palets_sl').AsFloat;
    rCajas := QAlbaranFactura.FieldByName('cajas_sl').AsFloat - QAlbaranFactura.FieldByName('cajas_st').AsFloat;
    rKilos := QAlbaranFactura.FieldByName('kilos_sl').AsFloat - QAlbaranFactura.FieldByName('kilos_st').AsFloat;
    rImporte := QAlbaranFactura.FieldByName('importe_neto_sl').AsFloat - QAlbaranFactura.FieldByName('importe_neto_st').AsFloat;
  end
  else
  begin                                      //Indistinta
    rPalets := QAlbaranFactura.FieldByName('n_palets_sl').AsFloat;
    rCajas := QAlbaranFactura.FieldByName('cajas_sl').AsFloat;
    rKilos := QAlbaranFactura.FieldByName('kilos_sl').AsFloat;
    rImporte := QAlbaranFactura.FieldByName('importe_neto_sl').AsFloat;
  end;

  //KILOGRAMOS
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'K' then
  begin
    PutGasto( QAlbaranAgrupado.FieldByName('total_kilos').AsFloat, rKilos, AGastoFac );
  end
  else
  //CAJAS
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'C' then
  begin
    if not PutGasto( QAlbaranAgrupado.FieldByName('total_cajas').AsFloat, rCajas,  AGastoFac ) then
    begin
      PutGasto( QAlbaranAgrupado.FieldByName('total_kilos').AsFloat, rKilos,  AGastoFac );
    end;
  end
  else
  //PALETS
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'P' then
  begin
    if not PutGasto( QAlbaranAgrupado.FieldByName('total_palets').AsFloat, rPalets,  AGastoFac ) then
    begin
      if not PutGasto( QAlbaranAgrupado.FieldByName('total_cajas').AsFloat, rCajas,  AGastoFac ) then
      begin
        PutGasto( QAlbaranAgrupado.FieldByName('total_kilos').AsFloat, rKilos,  AGastoFac );
      end;
    end;
  end
  else
  //IMPORTE
  if Copy( QGastoAlbaran.fieldByName('unidad').AsString, 1, 1 ) = 'I' then
  begin
    if not PutGasto( QAlbaranAgrupado.FieldByName('total_importe').AsFloat, rImporte,  AGastoFac ) then
    begin
      PutGasto( QAlbaranAgrupado.FieldByName('total_kilos').AsFloat, rKilos,  AGastoFac );
    end;
  end;
end;

procedure TDLComprobacionRetirada.AltaFactura ( const AParametros: RClienteQL ) ;
var
  rAux, rGastoFactAlb: real;
begin
  mtAlbaranFactura.Insert;
  try
    mtAlbaranFacturaempresa.AsString:= QAlbaranFactura.FieldByName('empresa_f').AsString;
    mtAlbaranFacturaserie.AsString:= QAlbaranFactura.FieldByName('serie_f').AsString;
    mtAlbaranFacturafactura.AsInteger:= QAlbaranFactura.FieldByName('n_factura_sc').AsInteger;
    mtAlbaranFacturafecha.AsDateTime:= QAlbaranFactura.FieldByName('fecha_factura_sc').AsDateTime;
    mtAlbaranFacturacod_factura.AsString:= QAlbaranFactura.FieldByName('cod_factura_fc').AsString;
    mtAlbaranFacturacliente.AsString:= QAlbaranFactura.FieldByName('cliente_fac_sc').AsString;
    mtAlbaranFacturanombre.AsString:= DesCliente( QAlbaranFactura.FieldByName('cliente_fac_sc').AsString );


    if EjecutaQGastoAlbaran (QAlbaranFactura.FieldByName('empresa_sc').AsString, QAlbaranFactura.FieldByName('centro_salida_sc').AsString,
                             QAlbaranFactura.FieldByName('n_albaran_sc').AsString, QAlbaranFactura.FieldByName('fecha_sc').AsString) then
    begin
      EjecutaQAlbaranAgrupado (QAlbaranFactura.FieldByName('empresa_sc').AsString, QAlbaranFactura.FieldByName('centro_salida_sc').AsString,
                             QAlbaranFactura.FieldByName('n_albaran_sc').AsString, QAlbaranFactura.FieldByName('fecha_sc').AsString, QAlbaranFactura.FieldByName('producto_sl').AsString);
      AddGastos ( AParametros, rGastoFactAlb);
    end
    else
    begin
      rGastoFactAlb := 0;
    end;
    {
    (*TODO impuetos de los gastos*)
    if QAlbaranFactura.FieldByName('gastos_albaran').AsFloat <> 0 then
    begin
      //PALETS
      if (QAlbaranFactura.FieldByName('unidad_gasto').AsString = 'PALETS') and (QAlbaranFactura.FieldByName('palets_albaran').AsFloat <> 0) then
        rAux:= ( QAlbaranFactura.FieldByName('palets_producto').AsFloat / QAlbaranFactura.FieldByName('palets_albaran').AsFloat )
      //CAJAS
      else if (QAlbaranFactura.FieldByName('unidad_gasto').AsString = 'CAJAS') and (QAlbaranFactura.FieldByName('cajas_albaran').AsFloat <> 0) then
        rAux:= ( QAlbaranFactura.FieldByName('cajas_producto').AsFloat / QAlbaranFactura.FieldByName('cajas_albaran').AsFloat )
      //KILOS
      else if (QAlbaranFactura.FieldByName('unidad_gasto').AsString = 'KILOS') and (QAlbaranFactura.FieldByName('kilos_albaran').AsFloat <> 0) then
        rAux:= ( QAlbaranFactura.FieldByName('kilos_producto').AsFloat / QAlbaranFactura.FieldByName('kilos_albaran').AsFloat )
      //IMPORTE
      else if (QAlbaranFactura.FieldByName('unidad_gasto').AsString = 'IMPORTE') and (QAlbaranFactura.FieldByName('importe_albaran').AsFloat <> 0) then
        rAux:= ( QAlbaranFactura.FieldByName('importe_producto').AsFloat / QAlbaranFactura.FieldByName('importe_albaran').AsFloat )
      else
        rAux:= 0;

      rAux:= bRoundTo( rAux * QAlbaranFactura.FieldByName('gastos_albaran').AsFloat , 2 );
    end
    else
    begin
      rAux:= 0;
    end;
    mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rAux;
    }

    if AParametros.iProcedencia = 2 then
    begin
      // Terceros
      mtAlbaranFacturaimpuesto.AsFloat:= bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('impuestos_producto_st').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('importe_con_descuento_st').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rGastoFactAlb;
      mtAlbaranFacturakilos.AsFloat:= QAlbaranFactura.FieldByName('kilos_st').AsFloat;
    end
    else
    if AParametros.iProcedencia = 1 then
    begin
    //Propio
      mtAlbaranFacturaimpuesto.AsFloat:= bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * (QAlbaranFactura.FieldByName('impuestos_producto').AsFloat - QAlbaranFactura.FieldByName('impuestos_producto_st').AsFloat), 2 );
      mtAlbaranFacturaimporte.AsFloat:= bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * (QAlbaranFactura.FieldByName('importe_con_descuento').AsFloat - QAlbaranFactura.FieldByName('importe_con_descuento_st').AsFloat), 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rGastoFactAlb;
      mtAlbaranFacturakilos.AsFloat:= (QAlbaranFactura.FieldByName('kilos_sl').AsFloat - QAlbaranFactura.FieldByName('kilos_st').AsFloat);
    end
    else
    begin
      //Indistinto
      mtAlbaranFacturaimpuesto.AsFloat:= bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('impuestos_producto').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('importe_con_descuento').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rGastoFactAlb;
      mtAlbaranFacturakilos.AsFloat:= QAlbaranFactura.FieldByName('kilos_sl').AsFloat;
    end;
    if (( AParametros.iProcedencia = 2 ) and (QAlbaranFactura.FieldByName('kilos_st').AsFloat = 0 )) or (mtAlbaranFacturaimporte.AsFloat = 0)  then
      mtAlbaranFactura.Cancel
    else
      mtAlbaranFactura.Post;

  except
    mtAlbaranFactura.Cancel;
    raise;
  end;
end;

procedure TDLComprobacionRetirada.ModificarFactura ( const AParametros: RClienteQL ) ;
var
  rAux, rGastoFactAlb: real;
begin
  mtAlbaranFactura.Edit;
  try

    if EjecutaQGastoAlbaran (QAlbaranFactura.FieldByName('empresa_sc').AsString, QAlbaranFactura.FieldByName('centro_salida_sc').AsString,
                             QAlbaranFactura.FieldByName('n_albaran_sc').AsString, QAlbaranFactura.FieldByName('fecha_sc').AsString) then
    begin
      EjecutaQAlbaranAgrupado (QAlbaranFactura.FieldByName('empresa_sc').AsString, QAlbaranFactura.FieldByName('centro_salida_sc').AsString,
                             QAlbaranFactura.FieldByName('n_albaran_sc').AsString, QAlbaranFactura.FieldByName('fecha_sc').AsString, QAlbaranFactura.FieldByName('producto_sl').AsString);
      AddGastos (AParametros, rGastoFactAlb);
    end
    else
    begin
      rGastoFactAlb := 0;
    end;

{
    (*TODO impuetos de los gastos*)
    if QAlbaranFactura.FieldByName('gastos_albaran').AsFloat <> 0 then
    begin
      if QAlbaranFactura.FieldByName('kilos_albaran').AsFloat <> 0 then
        rAux:= ( QAlbaranFactura.FieldByName('kilos_producto').AsFloat / QAlbaranFactura.FieldByName('kilos_albaran').AsFloat )
      else
        rAux:= 0;
      rAux:= bRoundTo( rAux * QAlbaranFactura.FieldByName('gastos_albaran').AsFloat , 2 );
    end
    else
    begin
      rAux:= 0;
    end;
    mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rAux;
}
    if AParametros.iProcedencia = 2 then
    begin
      mtAlbaranFacturaimpuesto.AsFloat:= mtAlbaranFacturaimpuesto.AsFloat +
                                         bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('impuestos_producto_st').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat +
                                        bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('importe_con_descuento_st').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rGastoFactAlb;
      mtAlbaranFacturakilos.AsFloat:=   mtAlbaranFacturakilos.AsFloat +
                                        QAlbaranFactura.FieldByName('kilos_st').AsFloat;
    end
    else
    if AParametros.iProcedencia = 1 then
    begin
      mtAlbaranFacturaimpuesto.AsFloat:= mtAlbaranFacturaimpuesto.AsFloat +
                                         bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * (QAlbaranFactura.FieldByName('impuestos_producto').AsFloat - QAlbaranFactura.FieldByName('impuestos_producto_st').AsFloat), 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat +
                                        bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * (QAlbaranFactura.FieldByName('importe_con_descuento').AsFloat - QAlbaranFactura.FieldByName('importe_con_descuento_st').AsFloat ), 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rGastoFactAlb;
      mtAlbaranFacturakilos.AsFloat:= mtAlbaranFacturakilos.AsFloat +
                                      (QAlbaranFactura.FieldByName('kilos_sl').AsFloat - QAlbaranFactura.FieldByName('kilos_st').AsFloat);
    end
    else
    begin
      mtAlbaranFacturaimpuesto.AsFloat:= mtAlbaranFacturaimpuesto.AsFloat +
                                         bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('impuestos_producto').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat +
                                        bRoundTo( QAlbaranFactura.FieldByName('cambio').AsFloat * QAlbaranFactura.FieldByName('importe_con_descuento').AsFloat, 2 );
      mtAlbaranFacturaimporte.AsFloat:= mtAlbaranFacturaimporte.AsFloat - rGastoFactAlb;
      mtAlbaranFacturakilos.AsFloat:= mtAlbaranFacturakilos.AsFloat +
                                      QAlbaranFactura.FieldByName('kilos_sl').AsFloat;
    end;

    if (( AParametros.iProcedencia = 2 ) and ( mtAlbaranFacturakilos.AsFloat = 0 ) ) or (mtAlbaranFacturaimporte.AsFloat = 0 ) then
      mtAlbaranFactura.Cancel
    else
      mtAlbaranFactura.Post;
      
  except
    mtAlbaranFactura.Cancel;
    raise;
  end;
end;

function OpenData( APadre: TComponent; AParametros: RClienteQL ): integer;
begin
  LoadModule( APadre );
  DLComprobacionRetirada.ObtenerDatos( AParametros );
  result:= DLComprobacionRetirada.mtAlbaranFactura.RecordCount;
  UnLoadModule;
end;


end.
