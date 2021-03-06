unit SincroTransitosUNT;

(*CODIGO*)
(*Indica donde insertar codigo*)
(*REVISAR*)
(*Codigo que funciona pero deberias cambiar*)
interface

uses SysUtils, DB, DBTables, SincroVarUNT;

function  SincronizarTransitos( const AEmpresa, ACentro, ACodigo: string;
                                const AInicio, AFin: TDateTime ): RSincroResumen;
procedure CrearQuerys;
procedure DestruirQuerys;
procedure PreparaQuerysTransitos( const AEmpresa, ACentro, ACodigo: string );
procedure ParametrosQuerys( const AEmpresa, ACentro, ACodigo: string; const AInicio, AFin: TDateTime );
procedure AbrirQuerys;
procedure CerrarQuerys;
function  PasarMDetalles: RSincroResumen;
procedure PasaMDetalle;


implementation

uses
  UDMBaseDatos, UDMConfig, UDMAuxDB, CVariables;

var
  QSourceCab: TQuery;
  QSourceCount: TQuery;
  DSCab: TDataSource;
  QSourceLinDetalle: TQuery;
  QSourceLinPaletCab: TQuery;
  QSourceLinPaletDet: TQuery;
  QInsertarPaletLog: TQuery;
  QSourceLinPaletPB: TQuery;
  QSourceDepositoAduana: TQuery;
  QTargetCab: TQuery;
  QTargetLinDetalle: TQuery;
  QTargetLinPaletCab: TQuery;
  QTargetLinPaletDet: TQuery;
  QTargetLinPaletPB: TQuery;
  QUpadatePaletCab: TQuery;
  QTargetDepositoAduana: TQuery;
  QOrdenCarga: TQuery;
  iOrden: integer;

procedure CrearQuerys;
begin
  QSourceCab:= TQuery.Create( nil );
  QSourceCab.DatabaseName:= 'BDProyecto';
  QSourceCab.RequestLive:= True;
  QSourceCount:= TQuery.Create( nil );
  QSourceCount.DatabaseName:= 'BDProyecto';
  DSCab:= TDataSource.Create( nil );
  DSCab.DataSet:= QSourceCab;
  QSourceLinDetalle:= TQuery.Create( nil );
  QSourceLinDetalle.DatabaseName:= 'BDProyecto';
  QSourceLinDetalle.DataSource:= DSCab;
  QSourceDepositoAduana:= TQuery.Create( nil );
  QSourceDepositoAduana.DatabaseName:= 'BDProyecto';
  QSourceDepositoAduana.DataSource:= DSCab;

  QSourceLinPaletCab:= TQuery.Create( nil );
  QSourceLinPaletDet:= TQuery.Create( nil );
  QInsertarPaletLog:= TQuery.Create( nil );

  QTargetCab:= TQuery.Create( nil );
  QTargetCab.DatabaseName:= 'BDCentral';
  QTargetCab.RequestLive:= True;
  QTargetLinDetalle:= TQuery.Create( nil );
  QTargetLinDetalle.DatabaseName:= 'BDCentral';
  QTargetLinDetalle.RequestLive:= True;
  QTargetDepositoAduana:= TQuery.Create( nil );
  QTargetDepositoAduana.DatabaseName:= 'BDCentral';
  QTargetDepositoAduana.RequestLive:= True;

  QTargetLinPaletCab:= TQuery.Create( nil );
  QTargetLinPaletCab.DatabaseName:= 'BDCentral';
  QTargetLinPaletCab.RequestLive:= True;
  QTargetLinPaletDet:= TQuery.Create( nil );
  QTargetLinPaletDet.DatabaseName:= 'BDCentral';
  QTargetLinPaletDet.RequestLive:= True;

  QUpadatePaletCab:= TQuery.Create( nil );
  QUpadatePaletCab.DataSource:= DSCab;
  QOrdenCarga:= TQuery.Create( nil );
  QOrdenCarga.DatabaseName:= 'BDProyecto';
  QOrdenCarga.DataSource:= DSCab;

  with DMBaseDatos do
  begin
    if DMConfig.EsLosLLanos then
    begin
      DBSGP.Connected:= true;
      QSourceLinPaletDet.DatabaseName:= 'DBSGP';
      QSourceLinPaletCab.DatabaseName:= 'DBSGP';
      QUpadatePaletCab.DatabaseName:= 'DBSGP';
//      QSourceLinPaletDet.DatabaseName:= 'BDProyecto';
//      QSourceLinPaletCab.DatabaseName:= 'BDProyecto';
//      QUpadatePaletCab.DatabaseName:= 'BDProyecto';
      QInsertarPaletLog.DataBaseName:= 'BDProyecto';
    end
    else
    begin
      QSourceLinPaletDet.DatabaseName:= 'BDProyecto';
      QInsertarPaletLog.DataBaseName:= 'BDProyecto';
      QSourceLinPaletCab.DatabaseName:= 'BDProyecto';
      QUpadatePaletCab.DatabaseName:= 'BDProyecto';
    end;
  end;

  QSourceLinPaletPB:= TQuery.Create( nil );
  QSourceLinPaletPB.DatabaseName:= 'BDProyecto';
  QSourceLinPaletPB.SQL.Clear;

  QTargetLinPaletPB:= TQuery.Create( nil );
  QTargetLinPaletPB.DatabaseName:= 'BDCentral';
  QTargetLinPaletPB.RequestLive:= True;
  QTargetLinPaletPB.SQL.Clear;
end;

procedure DestruirQuerys;
begin
  if DMBaseDatos.DBSGP.Connected then
    DMBaseDatos.DBSGP.Connected:= False;

  FreeAndNil( QSourceLinDetalle );
  FreeAndNil( QSourceDepositoAduana );
  if QSourceLinPaletDet.Prepared then
    QSourceLinPaletDet.UnPrepare;
  FreeAndNil( QSourceLinPaletDet );
  if QInsertarPaletLog.Prepared then
    QInsertarPaletLog.UnPrepare;
  FreeAndNil( QInsertarPaletLog );
  if QSourceLinPaletCab.Prepared then
    QSourceLinPaletCab.UnPrepare;
  FreeAndNil( QSourceLinPaletCab );
  FreeAndNil( DSCab );
  FreeAndNil( QSourceCab );
  FreeAndNil( QSourceCount );
  FreeAndNil( QTargetLinDetalle );
  FreeAndNil( QTargetDepositoAduana );
  FreeAndNil( QTargetLinPaletDet );
  FreeAndNil( QTargetLinPaletCab );
  FreeAndNil( QTargetCab );
  FreeAndNil( QUpadatePaletCab );
  FreeAndNil( QOrdenCarga );

  FreeAndNil( QSourceLinPaletPB );
  FreeAndNil( QTargetLinPaletPB );
end;

procedure PreparaQuerysTransitos( const AEmpresa, ACentro, ACodigo: string );
begin
  QUpadatePaletCab.SQL.Clear;
  QUpadatePaletCab.SQL.Add(' update rf_Palet_Pc_Cab set ');
  QUpadatePaletCab.SQL.Add('   empresa_cab = :empresa, ');
  QUpadatePaletCab.SQL.Add('   centro_cab = :centro, ');
  QUpadatePaletCab.SQL.Add('   ref_transito = :referencia, ');
  QUpadatePaletCab.SQL.Add('   fecha_transito = :fecha ');
  QUpadatePaletCab.SQL.Add(' where orden_carga_cab = :orden ');

  QOrdenCarga.SQL.Add(' select distinct orden_occ ');
  QOrdenCarga.SQL.Add(' from frf_orden_carga_c ');
  QOrdenCarga.SQL.Add(' where empresa_occ = :empresa ');
  QOrdenCarga.SQL.Add(' and centro_salida_occ = :centro ');
  QOrdenCarga.SQL.Add(' and fecha_occ = :fecha ');
  QOrdenCarga.SQL.Add(' and n_albaran_occ = :referencia ');

  QTargetCab.SQL.Clear;
  QTargetCab.SQL.Add('select * ');
  QTargetCab.SQL.Add('from frf_transitos_c');
  QTargetCab.SQL.Add('where empresa_tc = ''###'' ');

  QTargetLinDetalle.SQL.Clear;
  QTargetLinDetalle.SQL.Add('select * ');
  QTargetLinDetalle.SQL.Add('from frf_transitos_l');
  QTargetLinDetalle.SQL.Add('where empresa_tl = ''###'' ');

  QTargetDepositoAduana.SQL.Clear;
  QTargetDepositoAduana.SQL.Add('select * ');
  QTargetDepositoAduana.SQL.Add('from frf_depositos_aduana_c');
  QTargetDepositoAduana.SQL.Add('where empresa_dac = ''###'' ');

  QTargetLinPaletCab.SQL.Clear;
  QTargetLinPaletCab.SQL.Add('select * ');
  QTargetLinPaletCab.SQL.Add('from rf_Palet_Pc_Cab');
  QTargetLinPaletCab.SQL.Add('where ean128_cab = ''###'' ');

  QTargetLinPaletDet.SQL.Clear;
  QTargetLinPaletDet.SQL.Add('select * ');
  QTargetLinPaletDet.SQL.Add('from rf_Palet_Pc_Det');
  QTargetLinPaletDet.SQL.Add('where ean128_det = ''###'' ');

  QTargetLinPaletPB.SQL.Clear;
  QTargetLinPaletPB.SQL.Add('select * ');
  QTargetLinPaletPB.SQL.Add('from rf_palet_pb');
  QTargetLinPaletPB.SQL.Add('where sscc = ''###'' ');

  QSourceCab.SQL.Clear;
  QSourceCab.SQL.Add('select * ');
  QSourceCab.SQL.Add('from frf_transitos_c');
  if AEmpresa <> '' then
  begin
    QSourceCab.SQL.Add('where empresa_tc = :empresa');
    QSourceCab.SQL.Add('  and fecha_tc between :ini and :fin');
  end
  else
  begin
    QSourceCab.SQL.Add('where fecha_tc between :ini and :fin');
  end;

  if ACentro <> '' then
  begin
    QSourceCab.SQL.Add('  and centro_tc = :centro');
  end;
  if ACodigo <> '' then
  begin
    QSourceCab.SQL.Add('  and referencia_tc = :codigo');
  end;

  QSourceCount.SQL.Clear;
  QSourceCount.SQL.Add('select count(*) ');
  QSourceCount.SQL.Add('from frf_transitos_c');
  if AEmpresa <> '' then
  begin
    QSourceCount.SQL.Add('where empresa_tc = :empresa');
    QSourceCount.SQL.Add('  and fecha_tc between :ini and :fin');
  end
  else
  begin
    QSourceCount.SQL.Add('where fecha_tc between :ini and :fin');
  end;
  if ACentro <> '' then
  begin
    QSourceCount.SQL.Add('  and centro_tc = :centro');
  end;
  if ACodigo <> '' then
  begin
    QSourceCount.SQL.Add('  and referencia_tc = :codigo');
  end;

  QSourceLinDetalle.SQL.Clear;
  QSourceLinDetalle.SQL.Add('select * ');
  QSourceLinDetalle.SQL.Add('from frf_transitos_l');
  QSourceLinDetalle.SQL.Add('where empresa_tl = :empresa_tc ');
  QSourceLinDetalle.SQL.Add('  and centro_tl = :centro_tc ');
  QSourceLinDetalle.SQL.Add('  and fecha_tl = :fecha_tc ');
  QSourceLinDetalle.SQL.Add('  and referencia_tl = :referencia_tc ');

  QSourceDepositoAduana.SQL.Clear;
  QSourceDepositoAduana.SQL.Add('select * ');
  QSourceDepositoAduana.SQL.Add('from frf_depositos_aduana_c');
  QSourceDepositoAduana.SQL.Add('where empresa_dac = :empresa_tc ');
  QSourceDepositoAduana.SQL.Add('  and centro_dac = :centro_tc ');
  QSourceDepositoAduana.SQL.Add('  and fecha_dac = :fecha_tc ');
  QSourceDepositoAduana.SQL.Add('  and referencia_dac = :referencia_tc ');

  QSourceLinPaletCab.SQL.Clear;
  QSourceLinPaletCab.SQL.Add(' select *  ');
  QSourceLinPaletCab.SQL.Add(' from rf_Palet_Pc_Cab ');
  QSourceLinPaletCab.SQL.Add(' where orden_carga_cab = :orden ');
  QSourceLinPaletCab.Prepare;

  QSourceLinPaletDet.SQL.Clear;
  QSourceLinPaletDet.SQL.Add(' select rf_palet_pc_det.* ');
  QSourceLinPaletDet.SQL.Add(' from rf_Palet_Pc_Cab, rf_Palet_Pc_Det ');
  QSourceLinPaletDet.SQL.Add(' where orden_carga_cab = :orden ');
  QSourceLinPaletDet.SQL.Add(' and ean128_det = ean128_cab ');
  QSourceLinPaletDet.Prepare;

  QInsertarPaletLog.SQL.Clear;
  QInsertarPaletLog.SQL.Add(' select * ');
  QInsertarPaletLog.SQL.Add(' from rf_palet_pc_cab, rf_palet_pc_det ');
  QInsertarPaletLog.SQL.Add(' where orden_carga_cab = :orden ');
  QInsertarPaletLog.SQL.Add(' and ean128_cab = ean128_det ');

  QSourceLinPaletPB.SQL.Clear;
  QSourceLinPaletPB.SQL.Add(' select * ');
  QSourceLinPaletPB.SQL.Add(' from rf_palet_pb ');
  QSourceLinPaletPB.SQL.Add(' where orden_carga  = :orden');
  QSourceLinPaletPB.Prepare;

end;

procedure ParametrosQuerys( const AEmpresa, ACentro, ACodigo: string; const AInicio, AFin: TDateTime );
begin
  if Trim( AEmpresa ) <> '' then
  begin
    QSourceCab.ParamByName('empresa').AsString:= AEmpresa;
    QSourceCount.ParamByName('empresa').AsString:= AEmpresa;
  end;
  if Trim( ACentro ) <> '' then
  begin
    QSourceCab.ParamByName('centro').AsString:= ACentro;
    QSourceCount.ParamByName('centro').AsString:= ACentro;
  end;
  if Trim( ACodigo ) <> '' then
  begin
    QSourceCab.ParamByName('codigo').AsString:= ACodigo;
    QSourceCount.ParamByName('codigo').AsString:= ACodigo;
  end;
  QSourceCab.ParamByName('ini').AsDateTime:= AInicio;
  QSourceCab.ParamByName('fin').AsDateTime:= AFin;
  QSourceCount.ParamByName('ini').AsDateTime:= AInicio;
  QSourceCount.ParamByName('fin').AsDateTime:= AFin;
end;

procedure AbrirQuerys;
begin
  DMBaseDatos.BDCentral.Open;
  QSourceCab.Open;
  if QSourceLinDetalle.SQL.Text <> '' then
    QSourceLinDetalle.Open;
  if QSourceDepositoAduana.SQL.Text <> '' then
    QSourceDepositoAduana.Open;
  QTargetCab.Open;
  if QTargetLinDetalle.SQL.Text <> '' then
    QTargetLinDetalle.Open;
  if QTargetDepositoAduana.SQL.Text <> '' then
    QTargetDepositoAduana.Open;
  if QTargetLinPaletCab.SQL.Text <> '' then
    QTargetLinPaletCab.Open;
  if QTargetLinPaletDet.SQL.Text <> '' then
    QTargetLinPaletDet.Open;
  if QTargetLinPaletPB.SQL.Text <> '' then
    QTargetLinPaletPB.Open;
end;

procedure CerrarQuerys;
begin
  QSourceLinDetalle.Close;
  QSourceDepositoAduana.Close;
  QSourceCab.Close;
  QTargetLinDetalle.Close;
  QTargetDepositoAduana.Close;
  QTargetLinPaletPB.Close;
  QTargetLinPaletDet.Close;
  QTargetLinPaletCab.Close;
  QTargetCab.Close;
  DMBaseDatos.BDCentral.Close;
end;

procedure UpdatePaletCab;
begin
  QUpadatePaletCab.ParamByName('empresa').AsString:= QSourceCab.FieldByName('empresa_tc').AsString;
  QUpadatePaletCab.ParamByName('centro').AsString:= QSourceCab.FieldByName('centro_tc').AsString;
  QUpadatePaletCab.ParamByName('referencia').AsInteger:= QSourceCab.FieldByName('referencia_tc').AsInteger;
  QUpadatePaletCab.ParamByName('fecha').AsDateTime:= QSourceCab.FieldByName('fecha_tc').AsDateTime;
  QUpadatePaletCab.ParamByName('orden').AsInteger:= iOrden;
  QUpadatePaletCab.ExecSQL;
end;

procedure PasaPaletCab;
var
  i: integer;
  //sAux: string;
  campo: TField;
begin
  //Ahora mover datos
  QTargetLinPaletCab.Insert;
  i:= 0;
  while i < QTargetLinPaletCab.Fields.Count do
  begin
    campo:= QSourceLinPaletCab.FindField(QTargetLinPaletCab.Fields[i].FieldName);
    if campo <> nil then
    begin
      QTargetLinPaletCab.Fields[i].Value:= campo.Value;
    end;
    inc( i );
  end;
  QTargetLinPaletCab.FieldByName('empresa_cab').AsString:= QSourceCab.FieldByName('empresa_tc').AsString;
  QTargetLinPaletCab.FieldByName('centro_cab').AsString:= QSourceCab.FieldByName('centro_tc').AsString;
  QTargetLinPaletCab.FieldByName('ref_transito').AsInteger:= QSourceCab.FieldByName('referencia_tc').AsInteger;
  QTargetLinPaletCab.FieldByName('fecha_transito').AsDateTime:= QSourceCab.FieldByName('fecha_tc').AsDateTime;
  try
    QTargetLinPaletCab.Post;
  except
    QTargetLinPaletCab.Cancel;
    Raise;
  end;
end;

function OrdenCarga: integer;
begin
  QOrdenCarga.ParamByName('empresa').AsString:= QSourceCab.FieldByName('empresa_tc').AsString;
  QOrdenCarga.ParamByName('centro').AsString:= QSourceCab.FieldByName('centro_tc').AsString;
  QOrdenCarga.ParamByName('referencia').AsInteger:= QSourceCab.FieldByName('referencia_tc').AsInteger;
  QOrdenCarga.ParamByName('fecha').AsDateTime:= QSourceCab.FieldByName('fecha_tc').AsDateTime;
  QOrdenCarga.Open;
  result:= QOrdenCarga.Fields[0].AsInteger;
  QOrdenCarga.Close;
end;

procedure PasarPaletsCab;
begin
  if QSourceLinPaletCab.Active then
  begin
    QSourceLinPaletCab.First;
    //Rellenar campos que faltan
    UpdatePaletCab;
    while not QSourceLinPaletCab.Eof do
    begin
      PasaPaletCab;
      QSourceLinPaletCab.Next;
    end;
  end;
end;

procedure PasarPCLog;
begin
  if not QInsertarPaletLog.IsEmpty then
  begin
    QInsertarPaletLog.First;
    while not QInsertarPaletLog.Eof do
    begin
      //Borrar movimiento 15, por si ya se hubiera transmitido antes.
      BorrarPCLog(QInsertarPaletLog.FieldByName('orden_carga_cab').AsString, QInsertarPaletLog.FieldByName('ean128_cab').AsString, 15);
      //Insertamos movimiento 15
      InsertarPCLog(QInsertarPaletLog.FieldByName('empresa_cab').AsString,
                    QInsertarPaletLog.FieldByName('centro_cab').AsString,
                    QInsertarPaletLog.FieldByName('ean128_cab').AsString,
                    CVariables.gsCodigo,
                    QInsertarPaletLog.FieldByName('orden_carga_cab').AsString,
                    QInsertarPaletLog.FieldByName('peso_det').AsFloat,
                    QInsertarPaletLog.FieldByName('unidades_det').AsFloat,
                    15);
      QInsertarPaletLog.Next;
    end;
  end;
end;

procedure PasarPBLog;
begin
  if not QSourceLinPaletPB.IsEmpty then
  begin
    QSourceLinPaletPB.First;
    while not QSourceLinPaletPB.eof do
    begin
      //Borrar movimiento 15, por si ya se hubiera transmitido antes.
      BorrarPBLog(QSourceLinPaletPB.FieldByName('orden_carga').AsString, QSourceLinPaletPB.FieldByName('sscc').AsString, 15);
      //Insertamos movimiento 15
      InsertarPBLog(QSourceLinPaletPB.FieldByName('empresa').AsString,
                    QSourceLinPaletPB.FieldByName('centro').AsString,
                    QSourceLinPaletPB.FieldByName('sscc').AsString,
                    CVariables.gsCodigo,
                    QSourceLinPaletPB.FieldByName('orden_carga').AsString,
                    QSourceLinPaletPB.FieldByName('peso').AsFloat,
                    QSourceLinPaletPB.FieldByName('cajas').AsFloat,
                    15);
      QSourceLinPaletPB.Next;
    end;
  end;
end;

procedure PasaMDetalle;
var QAux: TQuery;
begin
   QAux := TQuery.Create(nil);
  (*REVISAR*)
  if not DMBaseDatos.BDCentral.InTransaction then
  begin
    DMBaseDatos.BDCentral.StartTransaction;
    if not DMBaseDatos.DBBaseDatos.InTransaction then
      DMBaseDatos.DBBaseDatos.StartTransaction;

    try
      //PASAR MAESTRO
      if QSourceCab.FieldByName('hora_tc').AsString = '' then
        raise Exception.Create('Falta la hora de carga.');
      PasaRegistro( QSourceCab, QTargetCab );
      //PASAR DETALLES
      PasarRegistros( QSourceLinDetalle, QTargetLinDetalle, QAux, QAux);
      //PALETS CONFECCIONADOS
      PasarPaletsCab;
      PasarRegistros( QSourceLinPaletDet, QTargetLinPaletDet, QAux, QAux);
      //Insertamos en el LOG - rf_palet_pc_log
      PasarPCLog;
      //PALETS PROVEEDOR
      PasarRegistros( QSourceLinPaletPB, QTargetLinPaletPB, QAux, QAux);
      //Insertamos en el LOG - rf_palet_pb_log
      PasarPBLog;
      //PALETS DEPOSITOS ADUANA
      PasarRegistros( QSourceDepositoAduana, QTargetDepositoAduana, QAux, QAux);

      DMBaseDatos.BDCentral.Commit;
      DMBaseDatos.DBBaseDatos.Commit;
    except
      DMBaseDatos.BDCentral.Rollback;
      DMBaseDatos.DBBaseDatos.Rollback;
      raise;
    end;
  end;
  FreeAndNil( QAux );
end;

procedure CerrarPalets;
begin
  QSourceLinPaletCab.Close;
  QSourceLinPaletDet.Close;
  QInsertarPaletLog.Close;
  QSourceLinPaletPB.Close;
end;

procedure AbrirPalets;
begin
  QSourceLinPaletCab.ParamByName('orden').AsInteger:= iOrden;
  QSourceLinPaletCab.Open;

  QSourceLinPaletDet.ParamByName('orden').AsInteger:= iOrden;
  QSourceLinPaletDet.Open;

  QInsertarPaletLog.ParamByName('orden').AsInteger:= iOrden;
  QInsertarPaletLog.Open;

  if not DMConfig.EsLaFont  then
  begin
    QSourceLinPaletPB.ParamByName('orden').AsInteger:= iOrden;
    QSourceLinPaletPB.Open;
  end;

end;

function PasarMDetalles: RSincroResumen;
var
  sMsg: String;
begin
  QSourceCab.First;
  InicializarBarraProgreso( QSourceCount );

  while not QSourceCab.Eof do
  begin
    iOrden:= OrdenCarga;
    if (QSourceCab.FieldByName('n_orden_tc').AsString = '' ) and( iOrden <> 0 ) then
    begin
      QSourceCab.Edit;
      QSourceCab.FieldByName('n_orden_tc').AsInteger:= iOrden;
      QSourceCab.Post;
    end;

    CerrarPalets;
    AbrirPalets;
    try
      result.registros:= result.registros + 1;
      sMsg:= DescripcionRegistro( QSourceCab, 6 );
      try
        PasaMDetalle;
      finally
        IncBarraProgreso;
      end;
      result.pasados:= result.pasados + 1;
      sMsg:= ' ---> ' + IntToStr( result.pasados ) + ') ' + #13 + #10 + sMsg;
      result.msgPasados.Add( sMsg );
    except
      on e: edbengineerror do
      begin
        if e.Errors[0].ErrorCode = 13059 then
        begin
          sMsg:= ' ---> ' + IntToStr( result.duplicados ) + ') ' + #13 + #10 + sMsg;
          result.msgDuplicados.Add( sMsg );
          result.duplicados:= result.duplicados + 1;
        end
        else
        begin
          sMsg:= sMsg + #13 + #10 + '[' + IntToStr( e.Errors[0].ErrorCode ) + '] ' + e.Message;
          sMsg:= ' ---> ' + IntToStr( result.erroneos ) + ') ' + #13 + #10 + sMsg;
          result.msgErrores.Add( sMsg );
          result.erroneos:= result.erroneos + 1;
        end;
      end;
      on e: exception do
      begin
        sMsg:= sMsg + #13 + #10 + e.Message;
        sMsg:= ' ---> ' + IntToStr( result.erroneos ) + ') ' + #13 + #10 + sMsg;
        result.msgErrores.Add( sMsg );
        result.erroneos:= result.erroneos + 1;
      end;
    end;
    QSourceCab.Next;
  end;
  CerrarPalets;
end;

function  SincronizarTransitos( const AEmpresa, ACentro, ACodigo: string;
                                const AInicio, AFin: TDateTime ): RSincroResumen;
begin
  CrearQuerys;
  try
    PreparaQuerysTransitos( AEmpresa, ACentro, ACodigo );
    ParametrosQuerys( AEmpresa, ACentro, ACodigo, AInicio, AFin );
    AbrirQuerys;
    result:= PasarMDetalles;
  finally
    CerrarQuerys;
    DestruirQuerys;
  end;
end;

end.


