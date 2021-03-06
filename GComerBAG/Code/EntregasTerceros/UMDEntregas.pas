unit UMDEntregas;

interface

uses
  SysUtils, Classes, DBTables, DB, EntregasCB;

type
  TMDEntregas = class(TDataModule)
    QEntregasC: TQuery;
    DSMaestro: TDataSource;
    TEntregasL: TTable;
    QListEntregasC: TQuery;
    DSListMaestro: TDataSource;
    TListEntregasL: TTable;
    QTotalLineas: TQuery;
    QGastosEntregas: TQuery;
    TListGastosEntregas: TTable;
    TListPackingList: TQuery;
    TListStatusPacking: TQuery;
    TListCalibrePacking: TQuery;
    TListFechasPacking: TQuery;
    QAux: TQuery;
    QFacturaPlatano: TQuery;
    qryCategoriaPacking: TQuery;
    QTotalFacturaCompra: TQuery;
    TEntregasRel: TTable;
    QCalidad: TQuery;
    QCalidadcodigo_eca: TStringField;
    QCalidadempresa_eca: TStringField;
    QCalidadcliente_eca: TStringField;
    QCalidadproducto_eca: TStringField;
    QCalidadenvase_eca: TStringField;
    QCalidadfecha_eca: TDateField;
    QCalidadporcentaje_eca: TFloatField;
    QCalidaddesCliente: TStringField;
    QCalidaddesEnvase: TStringField;
    QMaterial: TQuery;
    QDestrioCalidad: TQuery;
    TListEntregasRel: TTable;
    procedure TEntregasLAfterDelete(DataSet: TDataSet);
    procedure TEntregasLAfterPost(DataSet: TDataSet);
    procedure QEntregasCAfterOpen(DataSet: TDataSet);
    procedure QEntregasCBeforeClose(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TEntregasLBeforePost(DataSet: TDataSet);
    procedure QGastosEntregasBeforePost(DataSet: TDataSet);
    procedure QEntregasCAfterDelete(DataSet: TDataSet);
    procedure QEntregasCBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    sEntrega: string;
  public
    { Public declarations }
    procedure ObtenerDatos( const AParametros: REntregasQL; const AVerResumen, AVerBorrados: Boolean );
    procedure QueryPacking( const AVerBorrados: boolean );
    procedure PutSQL( const AWhere: String );
    procedure DestrioCalidad( const AEntrega: string );
    function  GetDestrioCalidad( const AEntrega: string ): real;
  end;

procedure LoadModule( APadre: TComponent );
procedure UnloadModule;
function  OpenData( const APadre: TComponent; const AParametros: REntregasQL; const AVerResumen, AVerBorrados: Boolean ): integer;

var
  MDEntregas: TMDEntregas;

implementation

{$R *.dfm}

uses Dialogs, UDMConfig, Variants, CVariables;

var
  iContadorUso: integer = 0;


function GetTextoSQL( AParametros: REntregasQL ): String;
begin
    result:= ' SELECT empresa_ec, proveedor_ec, codigo_ec, fecha_origen_ec, albaran_ec, fecha_llegada_ec, ';
    result:= result + '    vehiculo_ec, ';
    result:= result + '    observaciones_ec,  count( distinct almacen_el ) almacenes, max( almacen_el ) almacen ';
    result:= result + ' FROM frf_entregas_c, frf_entregas_l ';
    if AParametros.sEmpresa <> 'BAG' then
      result:= result + ' Where empresa_ec = ' + QuotedStr( AParametros.sEmpresa )
    else
      result:= result + ' Where substr(empresa_ec,1,1) = ''F'' ';
    result:= result + ' and fecha_llegada_ec between :fechaini and :fechafin ';
    result:= result + ' and codigo_ec = codigo_el ';

    if AParametros.sProducto <> '' then
    begin
      result:= result + ' and producto_ec = ' + QuotedStr( AParametros.sProducto );
    end;
    if AParametros.sCentro <> '' then
    begin
      result:= result + ' and centro_llegada_ec = ' + QuotedStr( AParametros.sCentro );
    end;
    if AParametros.sProveedor <> '' then
    begin
      result:= result + ' and TRIM(proveedor_ec) = ' + QuotedStr( AParametros.sProveedor );
      //if AParametros.sAlmacen <> '' then
      //begin
      //  result:= result + ' and almacen_el = ' + QuotedStr( AParametros.sAlmacen );
      //end;
    end;

    if AParametros.sEntrega <> '' then
    begin
      result:= result + ' and codigo_ec = ' + QuotedStr( AParametros.sEntrega );
    end;
    if AParametros.sAlbaran <> '' then
    begin
      result:= result + ' and albaran_ec = ' + QuotedStr( AParametros.sAlbaran );
    end;
    if AParametros.sAdjudicacion <> '' then
    begin
      result:= result + ' and adjudicacion_ec = ' + QuotedStr( AParametros.sAdjudicacion );
    end;

    if AParametros.iStatus > -1 then
      result:= result + ' and status_ec = ' + IntToStr( AParametros.iStatus );

      case AParametros.iMercado of
        0,1: result:= result + ' and mercado_local_ec = ' + IntToStr( AParametros.iMercado );
      end;
    //end;

    result:= result + ' group by empresa_ec, proveedor_ec, codigo_ec, fecha_origen_ec, albaran_ec, fecha_llegada_ec, vehiculo_ec, observaciones_ec ';

    if AParametros.bAgrupar then
      result:= result + ' ORDER BY empresa_ec, proveedor_ec, fecha_llegada_ec DESC, codigo_ec '
    else
      result:= result + ' ORDER BY empresa_ec, proveedor_ec, fecha_llegada_ec DESC, codigo_ec ';
end;

procedure LoadModule( APadre: TComponent );
begin
  Inc( iContadorUso );
  if iContadorUso = 1 then
  begin
    try
      MDEntregas:= TMDEntregas.Create( APadre );
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
      if MDEntregas <> nil then
      begin
        FreeAndNil( MDEntregas );
      end;
    end;
  end;
end;

procedure TMDEntregas.PutSQL( const AWhere: String );
begin
  with QListEntregasC do
  begin
    SQL.Clear;
    SQL.Add( ' SELECT empresa_ec, proveedor_ec, codigo_ec, fecha_origen_ec, fecha_carga_ec, adjudicacion_ec, albaran_ec, fecha_llegada_ec, vehiculo_ec, barco_ec, aduana_ec,');
    SQL.Add( '      observaciones_ec, count( distinct almacen_el ) almacenes, max( almacen_el ) almacen  ');
    SQL.Add( ' FROM frf_entregas_c, frf_entregas_l ');
    if Trim( AWhere ) = '' then
      SQL.Add( ' where codigo_ec = codigo_el ' )
    else
      SQL.Add( AWhere + ' and codigo_ec = codigo_el ');
    SQL.Add( ' GROUP BY empresa_ec, proveedor_ec, codigo_ec, fecha_origen_ec, fecha_carga_ec, adjudicacion_ec, albaran_ec, fecha_llegada_ec, vehiculo_ec, barco_ec, aduana_ec, observaciones_ec  ');
    SQL.Add( 'ORDER BY empresa_ec, proveedor_ec, fecha_llegada_ec DESC, codigo_ec ');
  end;
end;

procedure TMDEntregas.ObtenerDatos( const AParametros: REntregasQL; const AVerResumen, AVerBorrados: Boolean );
begin
  TListEntregasL.Close;
  TListEntregasRel.Close;
  TListPackingList.Close;
  TListFechasPacking.Close;
  TListStatusPacking.Close;
  TListCalibrePacking.Close;
  qryCategoriaPacking.Close;
  QListEntregasC.Close;
  QListEntregasC.SQL.Clear;
  QListEntregasC.SQL.Text:= GetTextoSQL( AParametros );
  QListEntregasC.ParamByName('fechaini').AsDate:= AParametros.dFechaDesde;
  QListEntregasC.ParamByName('fechafin').AsDate:= AParametros.dFechaHasta;
  QListEntregasC.Open;

  if AParametros.bPrintDetalle then
  begin
    TListEntregasL.Open;
  end;
  if not ( DMConfig.EsLaFont ) then
  begin
    if AParametros.bPrintPacking then
    begin
      QueryPacking( AVerBorrados );
      TListPackingList.Open;
      TListFechasPacking.Open;
      if AVerResumen then
      begin
        TListStatusPacking.Open;
        TListCalibrePacking.Open;
        qryCategoriaPacking.Open;
      end;
    end;
  end;
end;

function  OpenData( const APadre: TComponent; const AParametros: REntregasQL; const AVerResumen, AVerBorrados: Boolean ): integer;
begin
  //LoadModule( APadre );
  MDEntregas.ObtenerDatos( AParametros, AVerResumen, AVerBorrados );
  result:= MDEntregas.QListEntregasC.RecordCount;
  //UnLoadModule;
end;
procedure TMDEntregas.TEntregasLAfterDelete(DataSet: TDataSet);
begin
  QTotalLineas.Close;
  QTotalLineas.Open;
end;

procedure TMDEntregas.TEntregasLAfterPost(DataSet: TDataSet);
begin
  QTotalLineas.Close;
  QTotalLineas.Open;
end;

procedure TMDEntregas.TEntregasLBeforePost(DataSet: TDataSet);
var
  rAux: Real;
begin
  if DataSet.FieldByName('precio_el').Value = null then
    DataSet.FieldByName('precio_el').AsFloat:= 0;
  if DataSet.FieldByName('unidades_el').Value = null then
    DataSet.FieldByName('unidades_el').AsInteger:= 0;

  rAux:= DataSet.FieldByName('precio_el').AsFloat;
  DataSet.FieldByName('precio_kg_el').AsFloat:= 0;

  case DataSet.FieldByName('unidad_precio_el').AsInteger of
    0: begin
         rAux:= DataSet.FieldByName('kilos_el').AsFloat * rAux;
         DataSet.FieldByName('precio_kg_el').AsFloat:= DataSet.FieldByName('precio_el').AsFloat;
       end;
    1: begin
         rAux:= DataSet.FieldByName('cajas_el').AsFloat * rAux;
         if DataSet.FieldByName('kilos_el').AsFloat <> 0 then
         begin
           DataSet.FieldByName('precio_kg_el').AsFloat:= rAux / DataSet.FieldByName('kilos_el').AsFloat;
         end;
       end;
    2: begin
         rAux:= DataSet.FieldByName('unidades_el').AsFloat * rAux;
         if DataSet.FieldByName('kilos_el').AsFloat <> 0 then
         begin
           DataSet.FieldByName('precio_kg_el').AsFloat:= rAux / DataSet.FieldByName('kilos_el').AsFloat;
         end;
       end;
  end;
end;

procedure TMDEntregas.QEntregasCAfterOpen(DataSet: TDataSet);
begin
  TEntregasL.Open;
  TEntregasRel.Open;
  QTotalLineas.Open;
  QTotalFacturaCompra.Open;
  QGastosEntregas.Open;
  if DMConfig.EsLaFont then
    QFacturaPlatano.Open;
  QCalidad.Open;
  QMaterial.Open;
end;

procedure TMDEntregas.QEntregasCBeforeClose(DataSet: TDataSet);
begin
  QCalidad.Close;
  QMaterial.Close;
  QTotalFacturaCompra.Close;
  QTotalLineas.Close;
  TEntregasL.Close;
  TEntregasRel.Close;
  QGastosEntregas.Close;
  if DMConfig.EsLaFont then
    QFacturaPlatano.Close;
end;


procedure TMDEntregas.DataModuleCreate(Sender: TObject);
begin
  with QTotalLineas do
  begin
    SQL.Clear;
    SQL.Add(' select sum(palets_el) palets, sum(cajas_el) cajas, sum(kilos_el) kilos, ');
    SQL.Add('        sum( case ');
    SQL.Add('                when unidad_precio_el = 0 then round(kilos_el * precio_el,2) ');
    SQL.Add('                when unidad_precio_el = 1 then round(cajas_el * precio_el,2) ');
    SQL.Add('                else round(unidades_el * precio_el,2) ');
    SQL.Add('             end ) importe ');
    SQL.Add(' from frf_entregas_l ');
    SQL.Add(' where codigo_el = :codigo_ec ');
    Prepare;
  end;
  with QTotalFacturaCompra do
  begin
    SQL.Clear;
    SQL.Add(' select sum(importe_ge) importe, max(fecha_fac_ge ) fecha_factura ');
    SQL.Add(' from frf_gastos_entregas ');
    SQL.Add(' where codigo_ge = :codigo_ec ');
//    SQL.Add(' and tipo_ge = ''010''  ');
    SQL.Add(' and tipo_ge = ''054''  ');
    Prepare;
  end;

  with QGastosEntregas do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_gastos_entregas ');
    SQL.Add(' where codigo_ge = :codigo_ec ');
    SQL.Add(' order by linea_ge ');
    Prepare;
  end;
  if DMConfig.EsLaFont then
    with QFacturaPlatano do
    begin
      SQL.Clear;
      SQL.Add(' select empresa_fpl, n_factura_fpl ');
      SQL.Add(' from frf_facturas_platano_l ');
      SQL.Add(' where entrega_fpl = :codigo_ec ');
      Prepare;
    end;
  with TListPackingList do
  begin
    SQL.Clear;
    SQL.Add(' select lote, sscc, categoria, calibre, status,  calidad, tipo_palet, ');
    SQL.Add('        ( select descripcion_breve_pp from frf_productos_proveedor ');
    SQL.Add('        where proveedor_pp = proveedor ');
    SQL.Add('        and producto_pp = producto and variedad_pp = variedad ) descripcion, ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by lote, sscc, categoria, calibre, status, calidad, tipo_palet, 8 ');
    SQL.Add(' order by lote, sscc ');
  end;
  with TListFechasPacking do
  begin
    SQL.Clear;
    SQL.Add(' select min(fecha_alta) min_fecha, max(fecha_alta) max_fecha ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    SQL.Add(' and status <> ''B''  ');
  end;
  with TListStatusPacking do
  begin
    SQL.Clear;
    SQL.Add(' select status,  ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by status ');
    SQL.Add(' order by status ');
  end;
  with TListCalibrePacking do
  begin
    SQL.Clear;
    SQL.Add(' select calibre,  ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by calibre ');
    SQL.Add(' order by calibre ');
  end;
  with qryCategoriaPacking do
  begin
    SQL.Clear;
    SQL.Add(' select categoria,  ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by categoria ');
    SQL.Add(' order by categoria ');
  end;
end;

procedure TMDEntregas.QueryPacking( const AVerBorrados: boolean );
begin
  with TListPackingList do
  begin
    SQL.Clear;
    SQL.Add(' select lote, sscc, categoria, calibre, status, calidad, tipo_palet,  ');
    SQL.Add('        ( select descripcion_breve_pp from frf_productos_proveedor ');
    SQL.Add('        where proveedor_pp = proveedor ');
    SQL.Add('        and producto_pp = producto and variedad_pp = variedad ) descripcion, ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    if not AVerBorrados then
      SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by lote, sscc, categoria, calibre, status, calidad, tipo_palet, 8 ');
    SQL.Add(' order by lote, sscc ');
  end;
  with TListFechasPacking do
  begin
    SQL.Clear;
    SQL.Add(' select min(fecha_alta) min_fecha, max(fecha_alta) max_fecha ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    if not AVerBorrados then
      SQL.Add(' and status <> ''B'' ');  //Borrados
  end;  
  with TListStatusPacking do
  begin
    SQL.Clear;
    SQL.Add(' select status,  ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    if not AVerBorrados then
      SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by status ');
    SQL.Add(' order by status ');
  end;
  with TListCalibrePacking do
  begin
    SQL.Clear;
    SQL.Add(' select calibre,  ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    if not AVerBorrados then
      SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by calibre ');
    SQL.Add(' order by calibre ');
  end;
  with qryCategoriaPacking do
  begin
    SQL.Clear;
    SQL.Add(' select categoria,  ');
    SQL.Add('           sum(cajas) cajas, ');
    SQL.Add('           sum(peso_bruto) peso_bruto, ');
    SQL.Add('           sum(peso) peso ');
    SQL.Add(' from rf_palet_pb ');
    SQL.Add(' where entrega = :codigo_ec ');
    SQL.Add(' and status <> ''B'' ');  //Borrados
    SQL.Add(' group by categoria ');
    SQL.Add(' order by categoria ');
  end;
end;

procedure TMDEntregas.DataModuleDestroy(Sender: TObject);
begin
  if QTotalLineas.Prepared then
  begin
    QTotalLineas.Close;
    QTotalLineas.UnPrepare;
  end;
  if QTotalFacturaCompra.Prepared then
  begin
    QTotalFacturaCompra.Close;
    QTotalFacturaCompra.UnPrepare;
  end;
  if QGastosEntregas.Prepared then
  begin
    QGastosEntregas.Close;
    QGastosEntregas.UnPrepare;
  end;
  if DMConfig.EsLaFont then
    if QFacturaPlatano.Prepared then
    begin
      QFacturaPlatano.Close;
      QFacturaPlatano.UnPrepare;
    end;
  if TListPackingList.Prepared then
  begin
    TListPackingList.Close;
    TListPackingList.UnPrepare;
  end;
  if TListFechasPacking.Prepared then
  begin
    TListFechasPacking.Close;
    TListFechasPacking.UnPrepare;
  end;
  if TListStatusPacking.Prepared then
  begin
    TListStatusPacking.Close;
    TListStatusPacking.UnPrepare;
  end;
  if TListCalibrePacking.Prepared then
  begin
    TListCalibrePacking.Close;
    TListCalibrePacking.UnPrepare;
  end;
  if qryCategoriaPacking.Prepared then
  begin
    qryCategoriaPacking.Close;
    qryCategoriaPacking.UnPrepare;
  end;
end;

procedure TMDEntregas.QGastosEntregasBeforePost(DataSet: TDataSet);
begin
  QGastosEntregas.FieldByName('envio_ge').AsInteger:= 0;
end;

procedure TMDEntregas.QEntregasCAfterDelete(DataSet: TDataSet);
begin
(*
  //Vamos a guardar quien ha borrado una entrega
  //Vamos a guardar quien ha borrado una entrega
  with QAux do
  begin
    SQL.Clear;
    SQL.Add('select * from aud_entregas');
    RequestLive:= True;
    Open;
    Insert;
    FieldByname('usuario_ae').AsString:= gsCodigo;
    FieldByname('marca_ae').AsDateTime:= Now;
    FieldByname('codigo_ae').AsString:= sEntrega;
    FieldByname('accion_ae').AsString:= 'B';
    FieldByname('nota_ae').AsString:= 'Borrar entrega';
    try
      Post;
    except
      Cancel;
    end;
  end;
*)
(*
  CREATE TABLE aud_entregas (
  usuario_ae CHAR(16),
  marca_ae DATETIME YEAR TO MINUTE,
  codigo_ae CHAR(12),
  accion_ae CHAR(1), --A:ALTA M:MODIFICACION B:BORRADO
  nota_ae CHAR(32)
)
*)
end;

procedure TMDEntregas.QEntregasCBeforeDelete(DataSet: TDataSet);
begin
  sEntrega:= DataSet.FieldByname('codigo_ec').AsString;
end;

procedure TMDEntregas.DestrioCalidad( const AEntrega: string );
var
  rAux: real;
begin
  with QDestrioCalidad do
  begin
    SQL.Clear;
    SQL.Add(' select ');
    SQL.Add('        100 - ( nvl(tomate_verde_ec,0) + ');
    SQL.Add('        (select nvl(sum(nvl(porcentaje_eca,0)),0) from frf_entregas_calidad where codigo_eca = :codigo ) ) destrio_ec ');
    SQL.Add(' from frf_entregas_c ');
    SQL.Add(' where codigo_ec = :codigo ');
    ParamByName('codigo').AsString:= AEntrega;
    Open;
    rAux:= FieldByName('destrio_ec').AsFloat;
    Close;
    SQL.Clear;
    SQL.Add(' update frf_entregas_c ');
    SQL.Add(' set destrio_ec = :valor ');
    SQL.Add(' where codigo_ec = :codigo ');
    ParamByName('codigo').AsString:= AEntrega;
    ParamByName('valor').AsFloat:= rAux;
    ExecSQL;
  end;
end;

function TMDEntregas.GetDestrioCalidad( const AEntrega: string ): real;
begin
  with QDestrioCalidad do
  begin
    SQL.Clear;
    SQL.Add(' select destrio_ec ');
    SQL.Add(' from frf_entregas_c ');
    SQL.Add(' where codigo_ec = :codigo ');
    ParamByName('codigo').AsString:= AEntrega;
    Open;
    result:= FieldByName('destrio_ec').AsFloat;
    Close;
  end;
end;

end.
