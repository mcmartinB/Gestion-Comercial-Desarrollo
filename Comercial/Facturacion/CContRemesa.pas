unit CContRemesa;

interface
uses Windows, Forms, DB, dbtables, kbmMemTable, BonnyQuery, classes, bMath, SysUtils, CVariables;

const
  kExtension= '.TXT';

var
  mtGrupoP, mtGrupoD: TkbmMemTable;
  QGrupoP, QGrupoD, QDatosCliente, QFormaPago, QMinEmpresa, QActRemesa, QBanco: TBonnyQuery;
  slFicheroConta, slErrores, slFicGenerados, slErrGenerados: TStringList;
  iRemesas, iErrores, iRemConta: integer;
  sFichero, sErrores: string;
  bVerificar: Boolean;
  iNumLinea: Integer;

procedure NombresFicheros(ADirectorio: String; AEmpresa: String);
procedure GrabarFichero(ARuta: String);

procedure ContabilizarRemesas(DBBaseDatos: TDataBase);
procedure CrearTablaTemporal;
procedure CerrarTablas;
procedure BorrarListas;
function ObtenerRuta: String;
procedure CloseQuery(AQuery: TDataSet);
procedure CloseQuerys(AQuerys: array of TDataSet);
procedure CrearBuffers;
procedure LimpiarBuffers;
procedure Crearconsultas;
procedure CreaQGrupoD;
function EjecutaQGrupoD: boolean;
procedure CreaQDatosCliente;
function EjecutaQDatosCliente:boolean;
procedure CreaQFormaPago;
function EjecutaQFormaPago:Boolean;
procedure CreaQBanco;
function EjecutaQBanco: boolean;
procedure CreaQMinEmpresa;
function EjecutaQMinEmpresa: boolean;
procedure CreaQActRemesa;
procedure GrabarDatos;
procedure GrabarGrupoP;
procedure GrabarGrupoD;
function GetTransaccion(const AFormaPago:string):String;
function GetCtaCliente(const APais:string):String;
procedure RemSinErrores(AValor: integer);
procedure VerificarDatos;
procedure CrearFichero;
procedure AddLineaP;
procedure AddLineaD;
procedure ActualizarRemesa;

function AbrirTransaccion(DB: TDataBase): boolean;
procedure AceptarTransaccion(DB: TDataBase);
procedure CancelarTransaccion(DB: TDataBase);

implementation

procedure ContabilizarRemesas(DBBaseDatos: TDatabase);
var sAux: String;
begin

  CrearTablaTemporal;                      //Crear Tabla temporal

  QGrupoP.First;
  while not QGrupoP.Eof do           // Recorrer Remesas a contabilizar
  begin
    Inc(iRemesas);
    EjecutaQGrupoD;                  // Facturas de Venta por Remesa
    EjecutaQDatosCliente;            // Datos Cliente
    EjecutaQFormaPago;               // Datos Forma de Pago
    EjecutaQBanco;
    EjecutaQMinEmpresa;              // Obtener Minima empresa de las facturas que existen en la remesa (Para BAG --> F17, F18, etc)
//    bInterPlanta:= ( QGrupoD.FieldByName('tipo_cliente_c').AsString = gsInterPlanta ) and
//         ( ( QGrupoT.FieldByName('cod_empresa_fac_fc').AsString = '050' ) or ( QGrupoT.FieldByName('cod_empresa_fac_fc').AsString = '080' ) or ( QGrupoT.FieldByName('cod_empresa_fac_fc').AsString = 'F17') );
    try

      bVerificar := false;
      VerificarDatos;

      GrabarDatos;

      RemSinErrores(1);

    except
      on e: Exception do
      begin
        if DBBaseDatos.InTransaction then
          CancelarTransaccion(DBBaseDatos);
        sAux := QGrupoP.FieldByName('empresa_remesa_rc').AsString + ' ' +
                'Error al contabilizar la remesa ' + QGrupoP.FieldBYName('n_remesa_rc').AsString + ' del ' +
                QGrupoP.FieldByName('fecha_remesa_rc').AsString + '.';
        slErrores.Add( sAux + #13 + #10 + e.Message);
        if not bVerificar then RemSinErrores(0);
        Inc(iErrores);
      end;
    end;

    QGrupoP.Next;
  end;

  //Grabamos fichero
  //Seleccionamos Remesas Correctas
  mtGrupoP.Filter := 'RemSinErrores = 1';
  mtGrupoP.Filtered := true;
  mtGrupoP.First;
  iRemConta := 0;
  while not mtGrupoP.Eof do
  begin
    try
      if not AbrirTransaccion(DBBaseDatos) then
        raise Exception.Create('Error al abrir transaccion en BD.');

      CrearFichero;                              // Añadir Lineas (P, D) al fichero generado
      ActualizarRemesa;                         // Marcar Remesa como contabilizada

      AceptarTransaccion(DBBaseDatos);
      inc(iRemConta);
    except
      on e: Exception do
      begin
        if DBBaseDatos.InTransaction then
          CancelarTransaccion(DBBaseDatos);
        sAux := mtGrupoP.FieldByName('CodEmpresaFac').AsString + ' ' +
                mtGrupoP.FieldByName('NumRemesa').AsString + ' ' +
                mtGrupoP.FieldByName('FechaRemesa').AsString + ' ' +
                'Error al contabilizar la remesa ' + mtGrupoP.FieldBYName('CodRemesa').AsString + ' del ' +
                mtGrupoP.FieldByName('FechaRemesa').AsString + '.';
        slErrores.Add( sAux + #13 + #10 + e.Message);
      end;
    end;

    mtGrupoP.Next;
  end;
  mtGrupoP.Filter := '';
  mtGrupoP.Filtered := False;

  mtGrupoP.Close;
  mtGrupoD.Close;
end;

function AbrirTransaccion(DB: TDataBase): Boolean;
var
  T, Tiempo: Cardinal;
  cont: integer;
  flag: boolean;
begin
  cont := 0;
  flag := true;
  while flag do
  begin
        //Abrimos transaccion si podemos
    if DB.InTransaction then
    begin
           //Ya hay una transaccion abierta
      inc(cont);
      if cont = 3 then
      begin
        AbrirTransaccion := false;
        Exit;
      end;
           //Esperar entre 1 y (1+cont) segundos
      T := GetTickCount;
      Tiempo := cont * 1000 + Random(1000);
      while GetTickCount - T < Tiempo do Application.ProcessMessages;
    end
    else
    begin
      DB.StartTransaction;
      flag := false;
    end;
  end;
  AbrirTransaccion := true;
end;

procedure AceptarTransaccion(DB: TDataBase);
begin
  if DB.InTransaction then
  begin
    DB.Commit;
  end;
end;

procedure CancelarTransaccion(DB: TDataBase);
begin
  if DB.InTransaction then
  begin
    DB.Rollback;
  end;
end;

procedure CrearTablaTemporal;
begin
  mtGrupoP := TkbmMemTable.Create(Nil);
  with mtGrupoP do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Transaccion', ftString, 3, False);
    FieldDefs.Add('TerceroX3', ftString, 10, False);
    FieldDefs.Add('CtaCliente', ftString, 8, False);
    FieldDefs.Add('FormaPagoX3', ftString, 2, False);
    FieldDefs.Add('CodEmpresaFac', ftString, 3, False);
    FieldDefs.Add('CodEmpresaRemesa', ftString, 3, False);
    FieldDefs.Add('NumRemesa', ftInteger, 0, False);
    FieldDefs.Add('FechaRemesa', ftString, 8, False);
    FieldDefs.Add('BancoX3', ftString, 5, False);
    FieldDefs.Add('Divisa', ftString, 3, False);
    FieldDefs.Add('ImporteRemesa', ftFloat, 0, False);
    FieldDefs.Add('RemSinErrores', ftInteger, 0, False);

    CreateTable;
  end;
  mtGrupoP.Open;

  mtGrupoD := TkbmMemTable.Create(Nil);
  with mtGrupoD do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('CodEmpresaRemesa', ftString, 3, False);
    FieldDefs.Add('NumRemesa', ftInteger, 0, False);
    FieldDefs.Add('FechaRemesa', ftString, 8, False);
    FieldDefs.Add('CodFactura', ftString, 15, False);
    FieldDefs.Add('CtaCliente', ftString, 8, False);
    FieldDefs.Add('TerceroX3', ftString, 10, False);
    FieldDefs.Add('Divisa', ftString, 3, False);
    FieldDefs.Add('ImporteFactura', ftFloat, 0, False);

    CreateTable;
  end;
  mtGrupoD.Open;
end;

procedure CerrarTablas;
begin
  CloseQuerys([QGrupoD, QDatosCliente, QFormaPago, QBanco, QMinEmpresa]);
end;

procedure CloseQuerys(AQuerys: array of TDataSet);
var
  i: integer;
begin
  for i := 0 to Length(AQuerys) - 1 do
  begin
    CloseQuery(AQuerys[i]);
  end;
end;

procedure CloseQuery(AQuery: TDataSet);
begin
  if AQuery.Active then
    AQuery.Close;
end;

procedure BorrarListas;
begin
  FreeAndNil(slFicheroConta);
  FreeAndNil(slErrores);
  FreeAndNil(slFicGenerados);
  FreeAndNil(slErrGenerados);
end;

function ObtenerRuta: String;
var QDirectorio: TBonnyQuery;
    sDir: String;
begin
  QDirectorio := TBonnyQuery.Create(nil);

  with QDirectorio do
  try
    SQL.Add(' select directorio_cd from cnf_directorios ');
    SQL.Add('  where usuario_cd = ''all'' ');
    SQL.Add('    and codigo_cd = ''conta_remesas'' ');

    Open;
    sDir:= fieldbyname('directorio_cd').AsString;
  finally
    free;
  end;

  if Copy( sDir, Length( sDir ), 1 ) <> '\' then
    sDir := sDir + '\';
//  sDir := 'C:\Users\Propietario\Documents\Contabilidad\Datos\';
  result := sDir;
end;

procedure CrearBuffers;
begin
  slFicheroConta := TStringList.Create;
  slErrores := TStringList.Create;
  slFicGenerados := TStringList.Create;
  slErrGenerados := TStringList.Create;
end;

procedure LimpiarBuffers;
begin
  slFicheroConta.Clear;
  slErrores.Clear;
end;

procedure Crearconsultas;
begin
  CreaQGrupoD;
  CreaQDatosCliente;
  CreaQFormaPago;
  CreaQBanco;
  CreaQMinEmpresa;
  CreaQActRemesa;
end;

procedure CreaQGrupoD;
begin
  QGrupoD := TBonnyQuery.Create(Nil);
  with QGrupoD do
  begin
    SQL.Add(' select *                                 ');
    SQL.Add(' from tremesas_fac                        ');
    SQL.Add(' where empresa_remesa_rf = :empresaremesa ');
    SQL.Add('   and n_remesa_rf = :numeroremesa        ');
    SQL.Add('   and fecha_remesa_rf = :fecharemesa      ');

    SQL.Add(' order by empresa_remesa_rf, n_remesa_rf, fecha_remesa_rf ');

    Prepare;
  end;
end;

function EjecutaQGrupoD: boolean;
begin
  with QGrupoD do
  begin
    if Active then
      Close;

    ParamByName('empresaremesa').AsString := QGrupoP.FieldByName('empresa_remesa_rc').AsString;
    ParamByName('numeroremesa').AsInteger := QGrupoP.FieldByName('n_remesa_rc').AsInteger;
    ParamByName('fecharemesa').AsString := QGrupoP.FieldByName('fecha_remesa_rc').AsString;

    Open;
    Result := not IsEmpty;
  end;
end;

procedure CreaQDatosCliente;
begin
  QDatosCliente := TBonnyQuery.Create(nil);
  with QDatosCliente do
  begin
    SQL.Add(' select cliente_c, nombre_c, pais_c, cta_cliente_c, banco_ct, forma_pago_ct   ');
    SQL.Add(' from frf_clientes                                                            ');
    SQL.Add(' left join frf_clientes_tes on cliente_c = cliente_ct                         ');
    SQL.Add(' where cliente_c = :cliente                                                   ');
    SQL.Add('   and empresa_ct = ''F17''                                                   ');    //TODO - Agrupar forma pago en cliente y quitar empresa

    Prepare;
  end;
end;

function EjecutaQDatosCliente: boolean;
begin
  with QDatosCliente do
  begin
    if Active then
      Close;

    ParamByName('cliente').AsString := QGrupoP.FieldByName('cod_cliente_rc').AsString;

    Open;
    Result := not IsEmpty;
  end;
end;

procedure CreaQFormaPago;
begin
  QFormaPago := TBonnyQuery.Create(nil);
  with QFormaPago do
  begin
    SQL.Add(' select * from frf_forma_pago ');
    SQL.Add('  where codigo_fp = :formapago ');

    Prepare;
  end;
end;

function EjecutaQFormaPago: boolean;
begin
  with QFormaPago do
  begin
    if Active then
      Close;

    ParamByName('formapago').AsString := QDatosCliente.FieldByName('forma_pago_ct').AsString;

    Open;
    Result := not IsEmpty;
  end;
end;

procedure CreaQBanco;
begin
  QBanco := TBonnyQuery.Create(nil);
  with QBanco do
  begin
    SQL.Add(' select * from frf_bancos ');
    SQL.Add('  where banco_b = :banco ');

    Prepare;
  end;
end;

function EjecutaQBanco: boolean;
begin
  with QBanco do
  begin
    if Active then
      Close;

    ParamByName('banco').AsString := QGrupoP.FieldByName('cod_banco_rc').AsString;

    Open;
    Result := not IsEmpty;
  end;
end;

procedure CreaQMinEmpresa;
begin
  QMinEmpresa := TBonnyQuery.Create(nil);
  with QMinEmpresa do
  begin
    SQL.Add(' select cod_factura_rf[5,7] empresa_fac                                    ');
    SQL.Add('   from tremesas_fac rem1                                                  ');
    SQL.Add(' where empresa_remesa_rf = :empresa                                        ');
    SQL.Add('  and  fecha_remesa_rf = :fecharemesa                                      ');
    SQL.Add('   and n_remesa_rf = :numeroremesa                                         ');
    SQL.Add('   and rowid = (select min(rowid) from tremesas_fac rem2                   ');
    SQL.Add(' 		where rem1.fecha_remesa_rf = rem2.fecha_remesa_rf                     ');
    SQL.Add('                   and rem1.empresa_remesa_rf = rem2.empresa_remesa_rf     ');
    SQL.Add('                   and rem1.n_remesa_rf = rem2.n_remesa_rf)                ');

    Prepare;
  end;
end;

function EjecutaQMinEmpresa: boolean;
begin
  with QMinEmpresa do
  begin
    if Active then
      Close;

    ParamByName('empresa').AsString := QGrupoP.FieldByName('empresa_remesa_rc').AsString;
    ParamByName('fecharemesa').AsString := QGrupoP.FieldByName('fecha_remesa_rc').AsString;
    ParamByName('numeroremesa').AsString := QGrupoP.FieldByName('n_remesa_rc').AsString;

    Open;
    Result := not IsEmpty;
  end;
end;

procedure CreaQActRemesa;
begin
  QActRemesa := TBonnyQuery.Create(nil);
  with QActRemesa do
  begin
    SQL.Add(' update tremesas_cab set situacion_rc = 40, ');
    SQl.Add('                          fecha_situacion_rc = :fechaconta, ');
    SQL.Add('                          usuario_situacion_rc = :usuario ');
    SQL.Add('  where empresa_remesa_rc = :empresa ');
    SQL.Add('    and n_remesa_rc = :remesa ');
    SQL.Add('    and fecha_remesa_rc = :fecha ');

    Prepare;
  end;
end;

procedure GrabarDatos;
var sAux, sAux2: string;
    bDiferencia: Boolean;
    rImpNetoSeccionDif, rDiferencia: real;
begin

  GrabarGrupoP;                                // Grabar Datos Grupo P en mtGrupoP

    QGrupoD.First;
  while not QGrupoD.Eof do
  begin

    GrabarGrupoD;

    QGrupoD.Next;
  end;

{
   if bRoundTo(rImpTotalSeccion,2) <> bRoundTo(rImpNetoGrupo, 2) then
   if bRoundTo(QGrupoT.FieldByName('importe_neto_fc').AsFloat, 2) <> bRoundTo(rImpNeto, 2) then
    raise Exception.Create('Error: no coincide el Importe Neto de la Factura ' + QGrupoT.FieldByName('importe_neto_fc').AsString +
                           ' con el sumatorio de las lineas (D) ' + FloattoStr(bRoundTo(rImpNeto,2)));

  if bRoundTo(QGrupoT.FieldByName('importe_total_fc').AsFloat,2) <> bRoundTo(rImpTotal,2) then
  begin
    sAux := QGrupoT.FieldByName('cod_empresa_fac_fc').AsString + ' ' +
            QGrupoT.FieldByName('n_factura_fc').AsString + ' ' +
            QGrupoT.FieldByName('fecha_factura_fc').AsString + ' ' +
            'Error al contabilizar la factura ' + QGrupoT.FieldBYName('cod_factura_fc').AsString + ' del ' +
            QGrupoT.FieldByName('fecha_factura_fc').AsString + '.';

    sAux2 := 'No coincide el Importe Total de la Factura ' + QGrupoT.FieldByName('importe_total_fc').AsString +
                           ' con el sumatorio de las lineas (E) ' + FloattoStr(bRoundTo(rImpTotal, 2));
    slErrores.Add(sAux + #13 + #10 + sAux2);
  end;
}
end;

procedure GrabarGrupoP;
begin
  mtGrupoP.Append;

  mtGrupoP.FieldByName('Transaccion').AsString := GetTransaccion(QFormaPago.FieldByName('forma_pago_adonix_fp').AsString);
  mtGrupoP.FieldByName('TerceroX3').AsString := QDatosCliente.FieldByName('cta_cliente_c').AsString;
  mtGrupoP.FieldByName('CtaCliente').AsString := GetCtaCliente(QDatosCliente.FieldByName('pais_c').AsString);
  mtGrupoP.FieldByName('FormaPagoX3').AsString := QFormaPago.FieldByName('forma_pago_adonix_fp').AsString;
  mtGrupoP.FieldByName('CodEmpresaFac').AsString := QMinEmpresa.FieldByName('empresa_fac').AsString;
  mtGrupoP.FieldByName('CodEmpresaRemesa').AsString := QGrupoP.FieldByName('empresa_remesa_rc').AsString;
  mtGrupoP.FieldByName('NumRemesa').AsString := QGrupoP.FieldByName('n_remesa_rc').AsString;
  mtGrupoP.FieldByName('FechaRemesa').AsString := QGrupoP.FieldByName('fecha_remesa_rc').AsString;
  mtGrupoP.FieldByName('BancoX3').AsString := QBanco.FieldByName('bancoX3_b').AsString;
  mtGrupoP.FieldByName('Divisa').AsString := QGrupoP.FieldByName('moneda_cobro_rc').AsString;
  mtGrupoP.FieldByName('ImporteRemesa').AsString := QGrupoP.FieldByName('importe_cobro_rc').AsString;

  mtGrupoP.Post;
end;

procedure GrabarGrupoD;
begin
  mtGrupoD.Append;

  mtGrupoD.FieldByName('CodEmpresaRemesa').AsString := QGrupoP.FieldByName('empresa_remesa_rc').AsString;
  mtGrupoD.FieldByName('NumRemesa').AsString := QGrupoP.FieldByName('n_remesa_rc').AsString;
  mtGrupoD.FieldByName('FechaRemesa').AsString := QGrupoP.FieldByName('fecha_remesa_rc').AsString;
  mtGrupoD.FieldByName('CodFactura').AsString := QGrupoD.FieldByName('cod_factura_rf').AsString;
  mtGrupoD.FieldByName('CtaCliente').AsString := GetCtaCliente(QDatosCliente.FieldByName('pais_c').AsString);
  mtGrupoD.FieldByName('TerceroX3').AsString := QDatosCliente.FieldByName('cta_cliente_c').AsString;
  mtGrupoD.FieldByName('Divisa').AsString := QGrupoP.FieldByName('moneda_cobro_rc').AsString;
  mtGrupoD.FieldByName('ImporteFactura').AsString := QGrupoD.FieldByName('importe_cobrado_rf').AsString;

  mtGrupoD.Post;
end;

function GetTransaccion(const AFormaPago: String):string;
begin

  if AFormaPago = 'EF' then result := 'CEF'
  else if AFormaPago = 'TF' then result := 'CTF'
  else if AFormaPago = 'PG' then result := 'CPG'
  else result := '';

end;

function GetCtaCliente(const APais: string): String;
begin
  if APais = '' then result := ''
  else if APais = 'ES' then  result := '43000001'
  else Result := '43060001';
end;

procedure NombresFicheros(ADirectorio: string; AEmpresa: String);
var
  i: integer;
  sAux: string;
begin
  sAux:= AEmpresa + '_' + FormatDateTime( 'yyyymmddhhnnsszzz', Now );
  sFichero := 'PAY_' + sAux;
  sErrores := 'ERR_' + Copy(sFichero, 5, Length(sFichero));

  i:= 0;
  if FileExists( ADirectorio + sFichero + kExtension ) then
  begin
    i:= 1;
    while FileExists( ADirectorio + sFichero + '_' + IntToStr( i ) + kExtension ) do
    begin
      Inc( i );
    end;
  end;
  if i = 0 then
  begin
    sFichero:= sFichero + kExtension;
    sErrores:= sErrores + kExtension;
  end
  else
  begin
    sFichero:= sFichero + '_' + IntToStr( i ) + kExtension;
    sErrores:= sErrores + '_' + IntToStr( i ) + kExtension;
  end;

end;

procedure GrabarFichero(ARuta: String);
var sAux: String;
begin
  if slFicheroConta.Count > 0 then
  begin
    slFicheroConta.SaveToFile(ARuta + sFichero);
    slFicGenerados.Add(sFichero);
  end;
  if slErrores.Count > 0 then
  begin
    slErrores.SaveToFile(ARuta + sErrores);
    slErrGenerados.Add(sErrores);
  end;
end;

procedure RemSinErrores(AValor: integer);
begin
  mtGrupoP.Edit;
  mtGrupoP.FieldByName('RemSinErrores').AsInteger := AValor;
  mtGrupoP.Post;
end;

procedure VerificarDatos;
begin
  if QDatosCliente.FieldByName('cta_cliente_c').AsString = '' then
  begin
    bVerificar := true;
    raise Exception.Create('Falta grabar el código X3 para el cliente ' + QGrupoP.FieldByName('cod_cliente_rc').AsString + '.' );
  end;

  if QDatosCliente.FieldByName('pais_c').AsString = '' then
  begin
    bVerificar := true;
    raise Exception.Create('Falta grabar el Pais para el cliente ' + QGrupoP.FieldByName('cod_cliente_rc').AsString + '.' );
  end;

  if QFormaPago.FieldByName('forma_pago_adonix_fp').AsString = '' then
  begin
    bVerificar := true;
    raise Exception.Create('Falta grabar la forma de pago para X3 ' + QFormaPago.FieldByName('codigo_fp').AsString + '.' );
  end;

  if QBanco.FieldByName('bancoX3_b').AsString = '' then
  begin
    bVerificar := true;
    raise Exception.Create('Falta grabar el banco en X3 para: ' + QBanco.FieldByName('banco_b').AsString  + ' - ' + QBanco.Fieldbyname('descripcion_b').AsString );
  end;

end;

procedure CrearFichero;
begin

  AddLineaP;                                  // Añadir Linea tipo P

  iNumLinea := 1;
  mtGrupoD.Filter := ' CodEmpresaRemesa = ' + QuotedStr(mtGrupoP.FieldByName('CodEmpresaRemesa').AsString) + ' AND ' +
                     ' NumRemesa = ' +  QuotedStr(mtGrupoP.FieldByName('NumRemesa').AsString) + ' AND ' +
                     ' FechaRemesa = ' + QuotedStr(mtGrupoP.FieldByName('FechaRemesa').AsString);
  mtGrupoD.Filtered := true;

  mtGrupoD.First;
  while not mtGrupoD.Eof do
  begin

    AddLineaD;                                // Añadir Linea tipo D
    Inc(iNumLinea);

    mtGrupoD.Next;
  end;

  mtGrupoD.Filter := '';
  mtGrupoD.Filtered := false;
end;

procedure AddLineaP;
var sCadena: string;
begin
  sCadena := '"P' + '";"';
  sCadena := sCadena + '";"';
  sCadena := sCadena + mtGrupoP.FieldByName('Transaccion').AsString + '";"';
  sCadena := sCadena + mtGrupoP.FieldByName('TerceroX3').AsString + '";"';
  sCadena := sCadena + 'SPA";"';
  sCadena := sCadena + mtGrupoP.FieldByName('CtaCliente').AsString + '";"';
  sCadena := sCadena + mtGrupoP.FieldByName('FormaPagoX3').AsString + '";"';
  sCadena := sCadena + mtGrupoP.FieldByName('CodEmpresaFac').AsString + '";"';
  sCadena := sCadena + mtGrupoP.FieldbyName('BancoX3').AsString + '";"';
  sCadena := sCadena + '2";"';
  sCadena := sCadena + mtGrupoP.FieldbyName('Divisa').AsString + '";"';
  sCadena := sCadena + mtGrupoP.FieldbyName('ImporteRemesa').AsString + '";"';
  sCadena := sCadena + FormatDateTime('ddmmyyyy', mtGrupoP.FieldbyName('FechaRemesa').AsDatetime ) + '"';

  slFicheroConta.Add( sCadena );
end;

procedure AddLineaD;
var sCadena: string;
begin
  sCadena := '"D' + '";"';
  sCadena := sCadena + 'SPA' + '";"';
  sCadena := sCadena + mtGrupoD.FieldByName('CtaCliente').AsString + '";"';
  sCadena := sCadena + mtGrupoD.FieldByName('CodFactura').AsString + '";"';
  sCadena := sCadena + mtGrupoD.FieldByName('TerceroX3').AsString + '";"';
  sCadena := sCadena + mtGrupoD.FieldByName('Divisa').AsString + '";"';
  sCadena := sCadena + mtGrupoD.FieldByName('ImporteFactura').AsString + '"';

  slFicheroConta.Add( sCadena );
end;

procedure ActualizarRemesa;
begin
  with QActRemesa do
  begin
    if Active then
      Close;

    ParamByName('fechaconta').AsDateTime := Now;
    ParamByName('usuario').AsString := gsCodigo;
    ParamByName('empresa').AsString := mtGrupoP.FieldByName('CodEmpresaRemesa').AsString;
    ParamByName('remesa').AsString := mtGrupoP.FieldByName('NumRemesa').AsString;
    ParamByName('fecha').AsString := mtGrupoP.FieldByName('FechaRemesa').AsString;

    ExecSQL;
  end;

end;


end.
