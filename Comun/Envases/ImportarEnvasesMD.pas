unit ImportarEnvasesMD;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDMImportarEnvases = class(TDataModule)
    qryCabRemoto: TQuery;
    qryCabLocal: TQuery;
    qryAuxLocal: TQuery;
    qryDetRemoto: TQuery;
    qryDetLocal: TQuery;
  private
    { Private declarations }
    sMessage: string;
    sProducto, sEnvase: string;
    bPidoAlta, bEsAlta: Boolean;

    procedure ConfigurarBD( const ABDRemota: string );
    procedure LoadQuerysEnvases;
    procedure LoadQuerysClientes;
    procedure LoadQuerysEan13;
    procedure LoadQuerysArtDesglose;
    function  OpenQuerys: Boolean;
    procedure CloseQuerys;


    procedure SincDependenciaAgrupaCostes( var VLog: string );
    procedure SincDependenciaAgrupaComer( var VLog: string );
    procedure SincDependenciaOperadores( var VLog: string );
    procedure SincDependenciaEnvRetornable( var VLog: string );
    procedure SincDependenciaTipoCaja( var VLog: string );
    procedure SincDependenciaLineaProducto( var VLog: string );
    procedure SincDependenciaUndConsumo( var VLog: string );
    (*TODO EAN unidad de consumo*)

    function  SincronizaEnvase: Boolean;

    procedure SincronizarClientes( var VLog: string );
    procedure SincronizaClientes( var VLog: string );
    procedure SincronizarEan( var VLog: string );
    procedure SincronizaEan( var VLog: string );
    procedure SincronizarArtDesglose ( var VLog: string );
    procedure SincronizaArtDesglose ( var VLog: string );
    procedure LoadQueryLocalEan;
    procedure LoadQueryLocalArtDesglose;


    procedure SincronizarDetalles( const ATitle, AField: string; var VLog: string );
    procedure SincronizaDetalle( const ATitle, AField, AValue: string; var VLog: string );

    procedure BorrarProductosDesglosados();
    procedure BorrarInfoClientes();

    function  ExisteCliente: Boolean;
    function  GetMessage: string;

  public
    { Public declarations }
    function SincronizarEnvase( const AProducto, AEnvase: string; const AAlta: Boolean ): Boolean;
  end;


  function SincronizarEnvase( const AOwner: TComponent; const ABDRemota, AProducto, AEnvase: string; const AAlta: Boolean; var VMsg: string ): Boolean;



implementation

{$R *.dfm}

uses
  Variants, USincronizarTablas, MostrarLogFD;

var
  DMImportarEnvases: TDMImportarEnvases;

function SincronizarEnvase( const AOwner: TComponent; const ABDRemota, AProducto, AEnvase: string; const AAlta: Boolean; var VMsg: string ): Boolean;
begin
  DMImportarEnvases:= TDMImportarEnvases.Create( AOwner );
  try
    DMImportarEnvases.ConfigurarBD( ABDRemota );
    Result:= DMImportarEnvases.SincronizarEnvase( AProducto, AEnvase, AALta );
    VMsg:=  DMImportarEnvases.GetMessage;
  finally
    FreeAndNil( DMImportarEnvases );
  end;
end;

function  TDMImportarEnvases.GetMessage: string;
begin
  Result:= sMessage;
end;

procedure TDMImportarEnvases.ConfigurarBD( const ABDRemota: string );
begin
  qryCabRemoto.DatabaseName:= ABDRemota;
  qryDetRemoto.DatabaseName:= ABDRemota;
end;

function TDMImportarEnvases.SincronizarEnvase( const AProducto, AEnvase: string; const AAlta: Boolean ): Boolean;
begin
  sMessage:= '';
  sProducto:= AProducto;
  sEnvase:= AEnvase;
  bPidoAlta:= AALta;
  if OpenQuerys then
  begin
    Result:= SincronizaEnvase;
  end
  else
  begin
    sMessage:= 'No se ha encontrado el art?culo ' + AProducto  + ' - ' +  AEnvase  + ' en la base de datos origen.';
    result:= False;
  end;
  CloseQuerys;
end;


procedure TDMImportarEnvases.LoadQuerysEnvases;
begin
  with qryCabRemoto do
  begin
    SQL.Clear;
    SQL.Add('select * from frf_envases');
    SQL.Add('where envase_e = :envase ');
    if sProducto <> '' then
      SQL.Add('and producto_e = :producto ');
  end;
  with qryCabLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryCabRemoto.SQL );
  end;
end;

procedure TDMImportarEnvases.LoadQuerysClientes;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_clientes_env');
    SQL.Add('where envase_ce = :envase ');
    if sProducto <> '' then
      SQL.Add('and producto_ce = :producto ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
    if sProducto = '' then  //Si lo lo he a?adido antes lo a?ado ahora
      SQL.Add(' and producto_ce = :producto ');
    SQL.Add(' and cliente_ce = :cliente ');
    SQL.Add(' and empresa_ce = :empresa ');
  end;

  with qryAuxLocal do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_clientes');
    SQL.Add('where cliente_c = :cliente ');
  end;
end;

procedure TDMImportarEnvases.LoadQuerysEan13;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_ean13');
    SQL.Add('where envase_e = :envase ');
    if sProducto <> '' then
      SQL.Add('and ( productop_e =  :producto or productop_e is null ) ');
  end;
end;

function TDMImportarEnvases.ExisteCliente: Boolean;
begin
  qryAuxLocal.ParamByName('cliente').AsString:= qryDetRemoto.FieldByname('cliente_ce').AsString;
  qryAuxLocal.Open;
  result:= not qryAuxLocal.IsEmpty;
  qryAuxLocal.Close;
end;

function TDMImportarEnvases.OpenQuerys: Boolean;
begin
  LoadQuerysEnvases;

  //Abrir origen
  qryCabRemoto.ParamByName('envase').AsString:= sEnvase;
  if sProducto <> '' then
    qryCabRemoto.ParamByName('producto').AsString:= sProducto;
  qryCabRemoto.Open;
  if qryCabRemoto.IsEmpty then
  begin
    Result:= False;
  end
  else
  begin
    Result:= True;
  end;

  //Abrir destino
  if Result then
  begin
    qryCabLocal.ParamByName('envase').AsString:= sEnvase;
    if sProducto <> '' then
      qryCabLocal.ParamByName('producto').AsString:= sProducto;
    qryCabLocal.Open;
    bEsAlta:= qryCabLocal.IsEmpty;
  end;
end;

procedure TDMImportarEnvases.CloseQuerys;
begin
  qryCabRemoto.Close;
  qryCabLocal.Close;
end;

function TDMImportarEnvases.SincronizaEnvase: Boolean;
var
  iResult: Integer;
  sLog: string;
begin
  if bPidoAlta = bEsAlta then
  begin
    sLog:= 'RESULTADO SINCRONIZACION';
    sLog:= sLog + #13 + #10 + '------------------------';

    //DEPENDENCIAS
    SincDependenciaAgrupaCostes( sLog );
    SincDependenciaAgrupaComer( sLog );
    SincDependenciaOperadores( sLog );
    SincDependenciaEnvRetornable( sLog );
    SincDependenciaTipoCaja( sLog );
    SincDependenciaLineaProducto( sLog );
    SincDependenciaUndConsumo( sLog );

    Result:= SincronizarRegistro( qryCabRemoto, qryCabLocal, sLog, 'ART?CULO' ) > -1;
    if Result then
    begin
      LoadQuerysClientes;
      SincronizarClientes( sLog );
      LoadQuerysEan13;
      SincronizarEan( sLog );
      LoadQuerysArtDesglose;
      SincronizarArtDesglose( sLog );
    end;
    MostrarLogFD.MostrarLog( Self, sLog );
  end
  else
  begin
    Result:= False;
    if bPidoAlta then
    begin
      sMessage:= 'Se quiere dar de alta en Art?culo, pero en el origen ya existe.';
    end
    else
    begin
      sMessage:= 'Se quiere modificar un Art?culo, pero en el origen no existe.';
    end;
  end;
end;

procedure TDMImportarEnvases.SincronizarDetalles( const ATitle, AField: string; var VLog: string );
begin
  qryDetRemoto.ParamByName('envase').AsString:= sEnvase;
  if sProducto <> '' then
    qryDetRemoto.ParamByName('producto').AsString:= sProducto;
  qryDetRemoto.Open;
  if not qryDetRemoto.IsEmpty then
  begin
    while not qryDetRemoto.Eof do
    begin
      SincronizaDetalle( ATitle, AField, qryDetRemoto.FieldByname( AField ).AsString,  VLog );
      qryDetRemoto.Next;
    end;
    qryDetRemoto.Close;
  end;
end;

procedure TDMImportarEnvases.SincronizaDetalle( const ATitle, AField, AValue: string; var Vlog: string );
var
  sLog: string;
begin
  qryDetLocal.ParamByName('envase').AsString:= sEnvase;
  if sProducto <> '' then
    qryDetLocal.ParamByName('producto').AsString:= sProducto;
  qryDetLocal.ParamByName(AField).AsString:= AValue;
  qryDetLocal.Open;
  SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, ATitle );
    VLog:= VLog + sLog;
  qryDetLocal.Close;
end;

procedure TDMImportarEnvases.SincronizarArtDesglose(var VLog: string);
begin
  qryDetRemoto.ParamByName('envase').AsString:= sEnvase;
  qryDetRemoto.Open;
  if not qryDetRemoto.IsEmpty then
  begin
    BorrarProductosDesglosados;
    while not qryDetRemoto.Eof do
    begin
      SincronizaArtDesglose( VLog );
      qryDetRemoto.Next;
    end;
    qryDetRemoto.Close;
  end;
end;

procedure TDMImportarEnvases.BorrarProductosDesglosados();
var
  TConsulta : TQuery;
begin
  TConsulta := TQuery.Create(nil);
  TConsulta.DatabaseName := 'BDProyecto';
  TConsulta.SQL.Clear;
  TConsulta.SQL.Add(' delete from frf_articulos_desglose ');
  TConsulta.SQL.Add(' where articulo_ad = :envase ');
  TConsulta.ParamByName('envase').AsString := sEnvase;
  TConsulta.ExecSQL;
end;

procedure TDMImportarEnvases.BorrarInfoClientes();
var
  TConsulta : TQuery;
begin
  TConsulta := TQuery.Create(nil);
  TConsulta.DatabaseName := 'BDProyecto';
  TConsulta.SQL.Clear;
  TConsulta.SQL.Add(' delete from frf_clientes_env where envase_ce = :envase ');
  TConsulta.ParamByName('envase').AsString := sEnvase;
  TConsulta.ExecSQL;
end;


procedure TDMImportarEnvases.SincronizarClientes( var VLog: string );
begin
  qryDetRemoto.ParamByName('envase').AsString:= sEnvase;
  if sProducto <> '' then
    qryDetRemoto.ParamByName('producto').AsString:= sProducto;
  qryDetRemoto.Open;
  if not qryDetRemoto.IsEmpty then
  begin
    BorrarInfoClientes();
    while not qryDetRemoto.Eof do
    begin
      SincronizaClientes( VLog );
      qryDetRemoto.Next;
    end;
    qryDetRemoto.Close;
  end;
end;

procedure TDMImportarEnvases.SincronizaArtDesglose(var VLog: string);
var
  sLog: string;
  i : integer;
begin
  //Abrir destino solo si existe el producto, si no dara error al grabar
  LoadQueryLocalArtDesglose;
  qryDetLocal.ParamByName('envase').AsString:= sEnvase;

  if qryDetRemoto.FieldByname('producto_desglose_ad').Value <> Null then
    qryDetLocal.ParamByName('producto_des').AsString:= qryDetRemoto.FieldByname('producto_desglose_ad').AsString;

  qryDetLocal.Open;
  SincronizarRegistroArtDesglosados( qryDetRemoto, qryDetLocal, sLog, 'ART. DESGLOSE' );
  VLog:= VLog + sLog;
  qryDetLocal.Close;
end;

procedure TDMImportarEnvases.SincronizaClientes( var Vlog: string );
var
  sLog: string;
begin
  if ExisteCliente then
  begin
    //Abrir destino solo si existe el cliente, si no dara error al grabar
    qryDetLocal.ParamByName('empresa').AsString:= qryDetRemoto.FieldByname('empresa_ce').AsString;
    qryDetLocal.ParamByName('envase').AsString:= sEnvase;
    //if sProducto <> '' then
    qryDetLocal.ParamByName('producto').AsString:= qryDetRemoto.FieldByname('producto_ce').AsString;//sProducto;
    qryDetLocal.ParamByName('cliente').AsString:= qryDetRemoto.FieldByname('cliente_ce').AsString;
    qryDetLocal.Open;
    SincronizarRegistroArtDesglosados( qryDetRemoto, qryDetLocal, sLog, 'ART?CULO CLIENTE' );
    VLog:= VLog + sLog;
    qryDetLocal.Close;
  end;
end;

procedure TDMImportarEnvases.SincronizarEan( var VLog: string );
begin
  qryDetRemoto.ParamByName('envase').AsString:= sEnvase;
  if sProducto <> '' then
    qryDetRemoto.ParamByName('producto').AsString:= sProducto;
  qryDetRemoto.Open;
  if not qryDetRemoto.IsEmpty then
  begin
    while not qryDetRemoto.Eof do
    begin
      SincronizaEan( VLog );
      qryDetRemoto.Next;
    end;
    qryDetRemoto.Close;
  end;
end;

procedure TDMImportarEnvases.LoadQuerysArtDesglose;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_articulos_desglose');
    SQL.Add('where articulo_ad = :envase ');
  end;
end;


procedure TDMImportarEnvases.LoadQueryLocalEan;
begin
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_ean13');
    SQL.Add('where envase_e = :envase ');

    if qryDetRemoto.FieldByname('producto_e').Value <> Null then
      SQL.Add('and producto_e =  :producto_e ');
    if qryDetRemoto.FieldByname('productop_e').Value <> Null then
      SQL.Add('and productop_e =  :productop_e ');
    if qryDetRemoto.FieldByname('codigo_e').Value <> Null then
      SQL.Add('and codigo_e = :codigo_e ');
    if qryDetRemoto.FieldByname('marca_e').Value  <> Null then
      SQL.Add('and marca_e = :marca_e ');
    if qryDetRemoto.FieldByname('categoria_e').Value  <> Null then
      SQL.Add('and categoria_e = :categoria_e ');
    if qryDetRemoto.FieldByname('calibre_e').Value  <> Null then
      SQL.Add('and calibre_e = :calibre_e ');
    if qryDetRemoto.FieldByname('agrupacion_e').Value  <> Null then
      SQL.Add('and agrupacion_e = :agrupacion_e ');
  end;
end;

procedure TDMImportarEnvases.LoadQueryLocalArtDesglose;
begin
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_articulos_desglose');
    SQL.Add('where articulo_ad = :envase ');
    SQL.Add('  and producto_desglose_ad = :producto_des ');
  end;
end;

procedure TDMImportarEnvases.SincronizaEan( var Vlog: string );
var
  sLog: string;
begin
  //Abrir destino solo si existe el cliente, si no dara error al grabar
  LoadQueryLocalEan;
  qryDetLocal.ParamByName('envase').AsString:= sEnvase;

  if qryDetRemoto.FieldByname('producto_e').Value <> Null then
    qryDetLocal.ParamByName('producto_e').AsString:= qryDetRemoto.FieldByname('producto_e').AsString;;
  if qryDetRemoto.FieldByname('productop_e').Value <> Null then
    qryDetLocal.ParamByName('productop_e').AsString:= qryDetRemoto.FieldByname('productop_e').AsString;;
  if qryDetRemoto.FieldByname('codigo_e').Value <> Null then
    qryDetLocal.ParamByName('codigo_e').AsString:= qryDetRemoto.FieldByname('codigo_e').AsString;
  if qryDetRemoto.FieldByname('marca_e').Value  <> Null then
    qryDetLocal.ParamByName('marca_e').AsString:= qryDetRemoto.FieldByname('marca_e').AsString;
  if qryDetRemoto.FieldByname('categoria_e').Value  <> Null then
    qryDetLocal.ParamByName('categoria_e').AsString:= qryDetRemoto.FieldByname('categoria_e').AsString;
  if qryDetRemoto.FieldByname('calibre_e').Value  <> Null then
    qryDetLocal.ParamByName('calibre_e').AsString:= qryDetRemoto.FieldByname('calibre_e').AsString;
  if qryDetRemoto.FieldByname('agrupacion_e').Value  <> Null then
    qryDetLocal.ParamByName('agrupacion_e').AsString:= qryDetRemoto.FieldByname('agrupacion_e').AsString;

  qryDetLocal.Open;
  SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'EAN13' );
   VLog:= VLog + sLog;
  qryDetLocal.Close;
end;

//----------------------------------------------------------------------------
//DEPENDENCIAS
//----------------------------------------------------------------------------
procedure TDMImportarEnvases.SincDependenciaAgrupaCostes( var VLog: string );
var
  sLog: string;
begin
  //agrupacion_e
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_agrupaciones_envase');
    SQL.Add('where agrupacion_ae = :agrupacion_e ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
  end;

  qryDetLocal.ParamByName('agrupacion_e').AsString:= qryCabRemoto.FieldByName('agrupacion_e').AsString;
  qryDetLocal.Open;
  try
    if qryDetLocal.IsEmpty then
    begin
      qryDetRemoto.ParamByName('agrupacion_e').AsString:= qryCabRemoto.FieldByName('agrupacion_e').AsString;
      qryDetRemoto.Open;

      while not qryDetRemoto.IsEmpty do
      begin
        try
          SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'AGRUPACION COSTES' );
            VLog:= VLog + sLog;
        finally
          qryDetRemoto.Close;
        end;
      end;
    end;
  finally
    qryDetLocal.Close;
  end;
end;

procedure TDMImportarEnvases.SincDependenciaAgrupaComer( var VLog: string );
var
  sLog: string;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_agrupa_comerciales');
    SQL.Add('where agrupacion_ac = :agrupa_comercial_e ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
  end;

  qryDetLocal.ParamByName('agrupa_comercial_e').AsString:= qryCabRemoto.FieldByName('agrupa_comercial_e').AsString;
  qryDetLocal.Open;
  try
    if qryDetLocal.IsEmpty then
    begin
      qryDetRemoto.ParamByName('agrupa_comercial_e').AsString:= qryCabRemoto.FieldByName('agrupa_comercial_e').AsString;
      qryDetRemoto.Open;

      while not qryDetRemoto.IsEmpty do
      begin
        try
          SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'AGRUPACION COMERCIAL' );
            VLog:= VLog + sLog;
        finally
          qryDetRemoto.Close;
        end;
      end;
    end;
  finally
    qryDetLocal.Close;
  end;
end;

procedure TDMImportarEnvases.SincDependenciaOperadores( var VLog: string );
var
  sLog: string;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_env_comer_operadores');
    SQL.Add('where cod_operador_eco = :env_comer_operador_e ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
  end;

  qryDetLocal.ParamByName('env_comer_operador_e').AsString:= qryCabRemoto.FieldByName('env_comer_operador_e').AsString;
  qryDetLocal.Open;
  try
    if qryDetLocal.IsEmpty then
    begin
      qryDetRemoto.ParamByName('env_comer_operador_e').AsString:= qryCabRemoto.FieldByName('env_comer_operador_e').AsString;
      qryDetRemoto.Open;

      while not qryDetRemoto.IsEmpty do
      begin
        try
          SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'OPERADOR ENVASE RETORNABLE' );
            VLog:= VLog + sLog;
        finally
          qryDetRemoto.Close;
        end;
      end;
    end;
  finally
    qryDetLocal.Close;
  end;
end;

procedure TDMImportarEnvases.SincDependenciaEnvRetornable( var VLog: string );
var
  sLog: string;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_env_comer_productos');
    SQL.Add('where cod_operador_ecp = :env_comer_operador_e ');
    SQL.Add('and cod_producto_ecp = :env_comer_producto_e ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
  end;

  qryDetLocal.ParamByName('env_comer_operador_e').AsString:= qryCabRemoto.FieldByName('env_comer_operador_e').AsString;
  qryDetLocal.ParamByName('env_comer_producto_e').AsString:= qryCabRemoto.FieldByName('env_comer_producto_e').AsString;
  qryDetLocal.Open;
  try
    if qryDetLocal.IsEmpty then
    begin
      qryDetRemoto.ParamByName('env_comer_operador_e').AsString:= qryCabRemoto.FieldByName('env_comer_operador_e').AsString;
      qryDetRemoto.ParamByName('env_comer_producto_e').AsString:= qryCabRemoto.FieldByName('env_comer_producto_e').AsString;
      qryDetRemoto.Open;

      while not qryDetRemoto.IsEmpty do
      begin
        try
          SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'ENVASE RETORNABLE' );
            VLog:= VLog + sLog;
        finally
          qryDetRemoto.Close;
        end;
      end;
    end;
  finally
    qryDetLocal.Close;
  end;
end;

procedure TDMImportarEnvases.SincDependenciaTipoCaja( var VLog: string );
var
  sLog: string;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_tipos_caja');
    SQL.Add('where codigo_tc = :tipo_caja_e ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
  end;

  qryDetLocal.ParamByName('tipo_caja_e').AsString:= qryCabRemoto.FieldByName('tipo_caja_e').AsString;
  qryDetLocal.Open;
  try
    if qryDetLocal.IsEmpty then
    begin
      qryDetRemoto.ParamByName('tipo_caja_e').AsString:= qryCabRemoto.FieldByName('tipo_caja_e').AsString;
      qryDetRemoto.Open;

      while not qryDetRemoto.IsEmpty do
      begin
        try
          SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'TIPO CAJA' );
            VLog:= VLog + sLog;
        finally
          qryDetRemoto.Close;
        end;
      end;
    end;
  finally
    qryDetLocal.Close;
  end;
end;

procedure TDMImportarEnvases.SincDependenciaLineaProducto( var VLog: string );
var
  sLog: string;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_linea_productos');
    SQL.Add('where linea_producto_lp = :linea_producto_e ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
  end;

  qryDetLocal.ParamByName('linea_producto_e').AsString:= qryCabRemoto.FieldByName('linea_producto_e').AsString;
  qryDetLocal.Open;
  try
    if qryDetLocal.IsEmpty then
    begin
      qryDetRemoto.ParamByName('linea_producto_e').AsString:= qryCabRemoto.FieldByName('linea_producto_e').AsString;
      qryDetRemoto.Open;

      while not qryDetRemoto.IsEmpty do
      begin
        try
          SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'LINEA PRODUCTO' );
            VLog:= VLog + sLog;
        finally
          qryDetRemoto.Close;
        end;
      end;
    end;
  finally
    qryDetLocal.Close;
  end;
end;

procedure TDMImportarEnvases.SincDependenciaUndConsumo( var VLog: string );
var
  sLog: string;
begin
  with qryDetRemoto do
  begin
    SQL.Clear;
    SQL.Add('select *  from frf_und_consumo');
    SQL.Add('where codigo_uc = :tipo_unidad_e ');
  end;
  with qryDetLocal do
  begin
    SQL.Clear;
    SQL.AddStrings( qryDetRemoto.SQL );
  end;

  qryDetLocal.ParamByName('tipo_unidad_e').AsString:= qryCabRemoto.FieldByName('tipo_unidad_e').AsString;
  qryDetLocal.Open;
  try
    if qryDetLocal.IsEmpty then
    begin
      qryDetRemoto.ParamByName('tipo_unidad_e').AsString:= qryCabRemoto.FieldByName('tipo_unidad_e').AsString;
      qryDetRemoto.Open;

      while not qryDetRemoto.IsEmpty do
      begin
        try
          SincronizarRegistro( qryDetRemoto, qryDetLocal, sLog, 'UNIDAD CONSUMO' );
            VLog:= VLog + sLog;
        finally
          qryDetRemoto.Close;
        end;
      end;
    end;
  finally
    qryDetLocal.Close;
  end;
end;

end.


