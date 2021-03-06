unit QLAlbaranTransito2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, dbtables, db, jpeg;

type
  TQRLAlbaranTransito2 = class(TQuickRep)
    bandaFinal: TQRBand;
    CabeceraAlbaran: TQRChildBand;
    BandaCentro: TQRChildBand;
    PsQRLabel6: TQRLabel;
    PsQRLabel7: TQRLabel;
    PsQRLabel8: TQRLabel;
    qfecha_tc: TQRDBText;
    qreferencia_tc: TQRDBText;
    PsQRLabel11: TQRLabel;
    PsQRLabel12: TQRLabel;
    qvehiculo_tc: TQRDBText;
    PsQRShape23: TQRShape;
    PsQRShape24: TQRShape;
    PsQRShape22: TQRShape;
    PsQRShape21: TQRShape;
    PsQRShape27: TQRShape;
    PsQRShape19: TQRShape;
    PsQRSysData1: TQRSysData;
    PsQRLabel2: TQRLabel;
    qtransporte_tc: TQRDBText;
    qcentro_tc: TQRDBText;
    LTrans: TQRLabel;
    LCentro: TQRLabel;
    PsQRShape2: TQRShape;
    qbuque_tc: TQRDBText;
    qdestino_tc: TQRDBText;
    PsQRShape7: TQRShape;
    PsQRLabel16: TQRLabel;
    PsQRShape8: TQRShape;
    PsQRShape1: TQRShape;
    PsQRShape9: TQRShape;
    PsQRShape11: TQRShape;
    PsQRShape12: TQRShape;
    PsQRShape13: TQRShape;
    qcentro_destino_tc: TQRDBText;
    LCentroDestino: TQRLabel;
    PsQRShape14: TQRShape;
    PsQRShape15: TQRShape;
    PsQRShape18: TQRShape;
    BandaObservaciones: TQRBand;
    PsQRLabel4: TQRLabel;
    PsQRShape4: TQRShape;
    LCajas: TQRLabel;
    LKilos: TQRLabel;
    PsQRShape3: TQRShape;
    bndPalets: TQRChildBand;
    bandaDetalle: TQRBand;
    kilos_tl: TQRDBText;
    envase_tl: TQRDBText;
    descripcion_m: TQRDBText;
    color_tl: TQRDBText;
    calibre_tl: TQRDBText;
    descripcion_p: TQRDBText;
    lin1: TQRShape;
    lin2: TQRShape;
    lin3: TQRShape;
    lin4: TQRShape;
    lin5: TQRShape;
    lin6: TQRShape;
    cajas_tl: TQRDBText;
    QRBand1: TQRBand;
    PsQRLabel22: TQRLabel;
    PsQRLabel23: TQRLabel;
    PsQRLabel24: TQRLabel;
    PsQRLabel25: TQRLabel;
    PsQRLabel26: TQRLabel;
    PsQRLabel27: TQRLabel;
    PsQRLabel28: TQRLabel;
    PsQRShape29: TQRShape;
    PsQRShape30: TQRShape;
    PsQRShape31: TQRShape;
    PsQRShape32: TQRShape;
    PsQRShape33: TQRShape;
    PsQRShape34: TQRShape;
    ChildBand2: TQRChildBand;
    LObservaciones: TQRLabel;
    Observaciones: TQRMemo;
    qrmPalets: TQRMemo;
    qrlPalets: TQRLabel;
    BonnyBand: TQRBand;
    QRImageCab: TQRImage;
    PsEmpresa: TQRLabel;
    PsDireccion: TQRLabel;
    PsNif: TQRLabel;
    qrmCajas: TQRMemo;
    qrlCajas: TQRLabel;
    unidades_caja_tl: TQRDBText;
    qrshp1: TQRShape;
    QRShape1: TQRShape;
    qrlbl1: TQRLabel;
    qrshpBruto: TQRShape;
    qrshpBrutoLin: TQRShape;
    qrlblBruto: TQRLabel;
    LBruto: TQRLabel;
    procedure QRLAlbaranTransitoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BandaObservacionesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure bandaDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure envase_tlPrint(sender: TObject; var Value: String);
//    procedure nota_tnPrint(sender: TObject; var Value: String);
  private
    totalCajas: Integer;
    totalKilos: Real;

    sEmpresa, sCentroDestino: String;

    procedure PutObservaciones( var AMemo: TQRMemo );
    function  CargaPaletsYCajas( const AEmpresa, ACentro: string; const ATransito: integer;
                          const AFecha: TDateTime ): boolean;
  public
    QListado, QNota: TQuery;
    subdetalles: integer;

    procedure Configurar(const AEmpresa: string);

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure ALbaran(const AEmpresa, ACentro, AReferencia, AFecha,
  ADestino, ATransporte, ACMR: string; const ADataSet: TDataSet);
var
  QRLAlbaranTransito2: TQRLAlbaranTransito2;

implementation

uses UDMAuxDB, CVariables, DError, UDMBaseDatos, DPreview, bTextUtils,
  UDMConfig, bMath, UDMTransitos;

{$R *.DFM}

constructor TQRLAlbaranTransito2.Create(AOwner: TComponent);
begin
  inherited;

  tag := 1;

  QListado := TQuery.Create(nil);
  QListado.DatabaseName := 'BDProyecto';
  QListado.RequestLive := False;
  //QListado.UniDirectional := True;
  DataSet := QListado;

  QNota := TQuery.Create(nil);
  QNota.DatabaseName := 'BDProyecto';
  QNota.RequestLive := False;
  //QGeneral.UniDirectional := True;

  with bandaDetalle do
  begin
    envase_tl.DataSet := QListado;
    descripcion_p.DataSet := QListado;
    descripcion_m.DataSet := QListado;
    color_tl.DataSet := QListado;
    calibre_tl.DataSet := QListado;
    cajas_tl.DataSet := QListado;
    kilos_tl.DataSet := QListado;
    unidades_caja_tl.DataSet := QListado;
  end;
end;

destructor TQRLAlbaranTransito2.Destroy;
begin
  QListado.close;
  QNota.Close;

  QLIstado.Free;
  QNota.Free;

  inherited;
end;

procedure TQRLAlbaranTransito2.Configurar(const AEmpresa: string);
var
  bAux: Boolean;
  sAux, ssEmpresa: string;
begin
  sEmpresa:= AEmpresa;
    if ( AEmpresa = '050' ) or ( AEmpresa = '080' ) then
      ssEmpresa:= 'SAT'
    else
      ssEmpresa:= AEmpresa;

  bAux:= FileExists( gsDirActual + '\recursos\' + ssEmpresa + 'Page.wmf');

  if bAux then
  begin
    QRImageCab.Top:= -18; //-20
    QRImageCab.Left:= -37; //-20
    QRImageCab.Width:= 763; //-30
    QRImageCab.Height:= 1102; //-20
    QRImageCab.Picture.LoadFromFile( gsDirActual + '\recursos\' + ssEmpresa + 'Page.wmf');
    QRImageCab.Stretch:= True;
    QRImageCab.Enabled:= True;
  end
  else
  begin
    QRImageCab.Enabled:= False;
    ConsultaOpen(DMAuxDB.QAux,
      ' select nombre_e,nif_e,tipo_via_e,domicilio_e,cod_postal_e, ' +
      '        poblacion_e,nombre_p ' +
      ' from frf_empresas,frf_provincias ' +
      ' where empresa_e=' + QuotedStr(Trim(AEmpresa)) +
      '   and cod_postal_e[1,2]=codigo_p');

    with DMAuxDB.QAux do
    begin
      PsEmpresa.Caption := FieldByName('nombre_e').AsString;
      PsNif.Caption := 'NIF: ' + FieldByName('nif_e').AsString;

      sAux := '';
      if Trim(FieldByName('tipo_via_e').AsString) <> '' then
        sAux := sAux + Trim(FieldByName('tipo_via_e').AsString) + '. ';
      if Trim(FieldByName('domicilio_e').AsString) <> '' then
        sAux := sAux + Trim(FieldByName('domicilio_e').AsString) + '      ';
      if Trim(FieldByName('cod_postal_e').AsString) <> '' then
        sAux := sAux + Trim(FieldByName('cod_postal_e').AsString) + '  ';
      if Trim(FieldByName('poblacion_e').AsString) <> '' then
        sAux := sAux + Trim(FieldByName('poblacion_e').AsString) + '      ';
      if Trim(FieldByName('cod_postal_e').AsString) <> '' then
       sAux := sAux + '(' + Trim(FieldByName('nombre_p').AsString) + ')  ';

      PsDireccion.Caption := sAux;

      Close;
    end;
  end;

  PsDireccion.Enabled:= not bAux;
  PsEmpresa.Enabled:= not bAux;
  PsNif.Enabled:= not bAux;
end;
procedure TQRLAlbaranTransito2.QRLAlbaranTransitoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  totalCajas := 0;
  totalKilos := 0;

  subdetalles := 0;
end;

function TQRLAlbaranTransito2.CargaPaletsYCajas( const AEmpresa, ACentro: string;
                                           const ATransito: integer;
                                           const AFecha: TDateTime ): boolean;
begin
  result:= True;
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select tipo_palet_tl, descripcion_tp, sum( palets_tl ) palets, sum(NVL(palets_tl, 0) * nvl(kilos_tp, 0) ) kilos_palets   ');
    SQL.Add(' from frf_transitos_l, frf_tipo_palets  ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and centro_tl = :centro ');
    SQL.Add(' and referencia_tl = :referencia ');
    SQL.Add(' and fecha_tl = :fecha ');
    SQL.Add(' and codigo_tp = tipo_palet_tl ');
    SQL.Add(' group by tipo_palet_tl, descripcion_tp ');
    SQL.Add(' order by tipo_palet_tl ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= ATransito;
    ParamByName('fecha').AsDateTime:= AFecha;
    Open;

    qrmPalets.Lines.Clear;
    while not Eof do
    begin
      qrmPalets.Lines.Add( FieldByName('descripcion_tp').AsString + ' : ' + FieldByName('palets').AsString + ' Palets ' + FieldByName('kilos_palets').AsString + ' kgs.');
      Next;
    end;
    Close;

    SQL.Clear;
    (*LOGI*)
    SQL.Add(' SELECT env_comer_producto_e codigo_caja_e, ');
    SQL.Add('        ( Select des_producto_ecp From frf_env_comer_productos ');
    SQL.Add('           Where cod_operador_ecp = env_comer_operador_e ');
    SQL.Add('             and cod_producto_ecp = env_comer_producto_e ) texto_caja_e, ');
    SQL.Add('        sum(cajas_tl) cajas ');

    SQL.Add(' from frf_transitos_l, frf_envases ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and centro_tl = :centro ');
    SQL.Add(' and referencia_tl = :referencia ');
    SQL.Add(' and fecha_tl = :fecha ');
    SQL.Add(' and envase_e = envase_tl ');
    (*LOGI*)
    SQL.Add(' and nvl(env_comer_producto_e,'''') <> '''' ');
    SQL.Add(' group by 1, 2 ');
    SQL.Add(' order by 2 ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= ATransito;
    ParamByName('fecha').AsDateTime:= AFecha;
    Open;

    qrmCajas.Lines.Clear;
    while not Eof do
    begin
      qrmCajas.Lines.Add( FieldByName('texto_caja_e').AsString + ' : ' + FieldByName('cajas').AsString );
      Next;
    end;
    Close;
  end;
end;

procedure TQRLAlbaranTransito2.BandaObservacionesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  LCajas.Caption := FormatFloat('#,##0', totalCajas);
  LKilos.Caption := FormatFloat('#,##0.00', totalKilos);

  qrlPalets.Enabled:= qrmPalets.Lines.Count > 0;
  qrlCajas.Enabled:= qrmCajas.Lines.Count > 0;
  bndPalets.Enabled:= qrlPalets.Enabled or qrlCajas.Enabled;
end;

procedure TQRLAlbaranTransito2.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := not QNota.IsEmpty;
end;

procedure TQRLAlbaranTransito2.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := subdetalles < 2;
end;

procedure TQRLAlbaranTransito2.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Inc(subdetalles);
end;

procedure TQRLAlbaranTransito2.bandaDetalleBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  totalCajas := totalCajas + QListado.FieldByName('cajas_tl').AsInteger;
  totalKilos := totalKilos + QListado.FieldByName('kilos_tl').AsFloat;
end;

procedure ALbaran(const AEmpresa, ACentro, AReferencia, AFecha,
  ADestino, ATransporte, ACMR: string; const ADataSet: TDataSet);
var
  rAux, rTotalBruto: real;
begin
  //Imprimir albaran
  try
  try
    QRLAlbaranTransito2 := TQRLAlbaranTransito2.Create(Application);
    UDMTransitos.CreateDMTransitos( Application );
    with QRLAlbaranTransito2 do
    begin
      //Maset-Bonnysa
      Configurar(AEmpresa);
      //Centro
      LCentro.Caption := desCentro(AEmpresa, ACentro);
      LCentroDestino.Caption := desCentro(AEmpresa, ADestino);
      sEmpresa:= AEmpresa;
      sCentroDestino:= ADestino;
      //Transporte
      LTrans.Caption := desTransporte(Aempresa, ATransporte);
      //Palets
      CargaPaletsYCajas( AEmpresa, ACentro, StrToIntDef(AReferencia, 0), StrToDateDef( AFecha, Date ) );

      DMTransitos.PesosTransitoDeposito( AEmpresa, ACentro, StrToIntDef(AReferencia, 0), StrToDateDef( AFecha, Date ),  rAux, rTotalBruto );
      LBruto.Caption := FormatFloat('#,##0.00', rTotalBruto);


      //Datos
      QListado.SQL.Add(' select empresa_tl,centro_tl,referencia_tl,fecha_tl, ' +
        '        producto_tl,descripcion_p, envase_tl,descripcion_e, tipo_palet_tl, ' +
        '        marca_tl,descripcion_m, categoria_tl,color_tl,calibre_tl, unidades_caja_tl,' +
        '        sum(cajas_tl) cajas_tl, sum(kilos_tl) kilos_tl, sum( palets_tl ) palets ' +
        ' from frf_transitos_l,frf_productos,frf_envases,frf_marcas ' +
        ' where empresa_tl=:empresa ' +
        '  and centro_tl=:centro ' +
        '  and referencia_tl=:referencia ' +
        '  and fecha_tl=:fecha ' +
        '  and producto_tl=producto_p ' +
        '  and marca_tl=codigo_m ' +
        '  and envase_tl=envase_e  ' +
        ' group by empresa_tl,centro_tl,referencia_tl,fecha_tl, ' +
        '        producto_tl,descripcion_p, tipo_palet_tl, ' +
        '        envase_tl,descripcion_e, marca_tl,descripcion_m, ' +
        '        categoria_tl,color_tl,calibre_tl, unidades_caja_tl ');
      QListado.ParamByName('empresa').AsString := AEmpresa;
      QListado.ParamByName('centro').AsString := ACentro;
      QListado.ParamByName('referencia').AsString := AReferencia;
      QListado.ParamByName('fecha').AsdateTime := StrTodate(AFecha);
      try
        QListado.Open;
      except
        ShowError('Problemas al conseguir datos para imprimir el albar?n.');
        Exit;
      end;

      QNota.SQL.Add(' SELECT nota_tc, higiene_tc ' +
        ' FROM frf_transitos_c ' +
        ' WHERE   (empresa_tc = :empresa) ' +
        '   AND  (centro_tc = :centro) ' +
        '   AND  (referencia_tc = :referencia) ' +
        '   AND  (fecha_tc = :fecha) ');
      QNota.ParamByName('empresa').AsString := AEmpresa;
      QNota.ParamByName('centro').AsString := ACentro;
      QNota.ParamByName('referencia').AsString := AReferencia;
      QNota.ParamByName('fecha').AsdateTime := StrTodate(AFecha);
      try
        QNota.Open;
        Observaciones.Lines.Clear;
        if ACMR <> '' then
        begin
          Observaciones.Lines.Add( 'N?mero de CMR: ' + ACMR );
        end;
        if QNota.FieldByName('higiene_tc').Asinteger = 1  then
        begin
          Observaciones.Lines.Add('CONDICIONES HIGIENICAS: OK');
        end
        else
        begin
          Observaciones.Lines.Add('CONDICIONES HIGIENICAS: INCORRECTAS');
        end;
        Observaciones.Lines.Add( QNota.FieldByName('nota_tc').AsString );
        PutObservaciones( Observaciones );

      except
        ShowError('Problemas al conseguir datos para imprimir el albar?n.');
        Exit;
      end;

      qreferencia_tc.DataSet := ADataSet;
      qcentro_tc.DataSet := ADataSet;
      qcentro_destino_tc.DataSet := ADataSet;
      qfecha_tc.DataSet := ADataSet;
      qtransporte_tc.DataSet := ADataSet;
      qbuque_tc.DataSet := ADataSet;
      qvehiculo_tc.DataSet := ADataSet;
      qdestino_tc.DataSet := ADataSet;

      //Imprimir
      DPreview.bCanSend := (DMConfig.EsLaFont);
      DPreview.Preview(QRLAlbaranTransito2, 1, False, True);
    end;
  except
    FreeAndNil( QRLAlbaranTransito2 );
    ShowError('Problemas al crear el albar?n.');
  end;

  finally
    UDMTransitos.DestroyDMTransitos;
  end;
end;

procedure TQRLAlbaranTransito2.PutObservaciones( var AMemo: TQRMemo );
var
 Query: Tquery;
begin
  Query:= Tquery.Create( self );
  Query.DatabaseName:= QListado.DatabaseName;
  Query.SQL.Add(' select cosechero_tl, plantacion_tl, anyo_semana_tl, ');
  Query.SQL.Add('        descripcion_p, sum(cajas_tl) cajas, sum(kilos_tl) kilos');
  Query.SQL.Add(' from frf_transitos_l, frf_plantaciones ');
  Query.SQL.Add(' where empresa_tl = :empresa ');
  Query.SQL.Add(' and centro_tl = :centro ');
  Query.SQL.Add(' and referencia_tl = :referencia ');
  Query.SQL.Add(' and fecha_tl = :fecha ');
  Query.SQL.Add(' and cosechero_tl is not null ');
  Query.SQL.Add(' and empresa_p = :empresa ');
  Query.SQL.Add(' and producto_p = producto_tl ');
  Query.SQL.Add(' and cosechero_p = cosechero_tl ');
  Query.SQL.Add(' and plantacion_p = plantacion_tl ');
  Query.SQL.Add(' and ano_semana_p = anyo_semana_tl ');
  Query.SQL.Add(' group by cosechero_tl, plantacion_tl, anyo_semana_tl, descripcion_p ');
  Query.ParamByName('empresa').AsString:= QListado.FieldByName('empresa_tl').AsString;
  Query.ParamByName('centro').AsString:= QListado.FieldByName('centro_tl').AsString;
  Query.ParamByName('referencia').AsInteger:= QListado.FieldByName('referencia_tl').AsInteger;
  Query.ParamByName('fecha').AsDateTime:= QListado.FieldByName('fecha_tl').AsDateTime;
  Query.Open;

  while not Query.Eof do
  begin
    AMemo.Lines.Add( #13 + #10 + '[' +
      RellenaDer( Query.FieldBYName('anyo_semana_tl').AsString + ']' +
        Query.FieldBYName('cosechero_tl').AsString + '-' +
        Query.FieldBYName('plantacion_tl').AsString, 20 ) + ' ' +
      RellenaDer( Query.FieldBYName('descripcion_p').AsString, 60) + ' ' +
      RellenaIzq( Query.FieldBYName('cajas').AsString + ' Cajas ', 20 ) +
      RellenaIzq( Query.FieldBYName('kilos').AsString + ' Kilos' , 20 ) );
    Query.Next;
  end;
  Query.Close;
end;

procedure TQRLAlbaranTransito2.envase_tlPrint(sender: TObject;
  var Value: String);
begin
  Value := desEnvase( sEmpresa, Value );
end;

end.
