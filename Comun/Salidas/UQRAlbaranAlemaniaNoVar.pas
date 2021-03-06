unit UQRAlbaranAlemaniaNoVar;

interface               

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  jpeg, uSalidaUtils;

type
  TQRAlbaranAlemaniaNoVar = class(TQuickRep)
    BonnyBand: TQRBand;
    bandaFinal: TQRBand;
    BandaDatos: TQRBand;
    CabeceraTabla: TQRBand;
    marca: TQRDBText;
    PsQRDBText28: TQRDBText;
    psKilos: TQRDBText;
    lin2: TQRShape;
    lin3: TQRShape;
    lin4: TQRShape;
    lin5: TQRShape;
    lin6: TQRShape;
    memoGarantia: TQRMemo;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    ChildBand2: TQRChildBand;
    QRBand2: TQRBand;
    PsQRShape16: TQRShape;
    PsQRShape17: TQRShape;
    PsQRLabel6: TQRLabel;
    PsQRLabel7: TQRLabel;
    PsQRLabel8: TQRLabel;
    PsQRLabel9: TQRLabel;
    PsQRLabel10: TQRLabel;
    LCentro: TQRLabel;
    PsQRLabel11: TQRLabel;
    PsQRLabel12: TQRLabel;
    LTransporte: TQRLabel;
    PsQRShape20: TQRShape;
    PsQRShape23: TQRShape;
    PsQRShape24: TQRShape;
    PsQRShape25: TQRShape;
    PsQRShape26: TQRShape;
    PsQRShape22: TQRShape;
    PsQRShape21: TQRShape;
    PsQRShape27: TQRShape;
    PsQRShape19: TQRShape;
    PsQRLabel23: TQRLabel;
    PsQRLabel24: TQRLabel;
    PsQRLabel26: TQRLabel;
    PsQRLabel27: TQRLabel;
    PsQRLabel28: TQRLabel;
    PsQRShape30: TQRShape;
    PsQRShape31: TQRShape;
    PsQRShape32: TQRShape;
    PsQRShape33: TQRShape;
    PsQRShape34: TQRShape;
    LTransporteDir1: TQRLabel;
    descripcion2_e: TQRDBText;
    PsQRLabel18: TQRLabel;
    LAlbaran: TQRLabel;
    LFecha: TQRLabel;
    LHora: TQRLabel;
    LPedido: TQRLabel;
    LVehiculo: TQRLabel;
    PsEmpresa: TQRLabel;
    PsNif: TQRLabel;
    PsDireccion: TQRLabel;
    QRImageCab: TQRImage;
    ChildBand3: TQRChildBand;
    PsQRShape9: TQRShape;
    PsQRShape10: TQRShape;
    psEtiqueta: TQRLabel;
    PsQRSysData1: TQRSysData;
    PsQRLabel1: TQRLabel;
    PsQRLabel2: TQRLabel;
    qrmDireccion: TQRMemo;
    QRImgFirma: TQRImage;
    qrmReponsabilidadEnvase: TQRMemo;
    PsQRShape18: TQRShape;
    qrlbl1: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrlbl7: TQRLabel;
    qrlbl8: TQRLabel;
    qrdbtxtcalibre_sl: TQRDBText;
    qrdbtxtcajas_sl: TQRDBText;
    qrdbtxtunidades: TQRDBText;
    qrchldbndChildBand1: TQRChildBand;
    LObservaciones: TQRLabel;
    mmoObservaciones: TQRMemo;
    LPalets: TQRLabel;
    MemoPalets: TQRMemo;
    LCajas: TQRLabel;
    MemoCajas: TQRMemo;
    qrxpr1: TQRExpr;
    qrxpr2: TQRExpr;
    qrxpr3: TQRExpr;
    qrshp1: TQRShape;
    qrshp3: TQRShape;
    qrshp4: TQRShape;
    qrlblAlbaran2: TQRLabel;
    procedure bandaFinalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CabeceraTablaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LPaletsPrint(sender: TObject; var Value: string);
    procedure LCajasPrint(sender: TObject; var Value: string);
    procedure descripcion2_ePrint(sender: TObject; var Value: string);
    procedure psKilosPrint(sender: TObject; var Value: String);
    procedure UnidadCobroPrint(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrchldbndChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
    rGGN : TGGN;

    bOriginal: boolean;
    sFirma: string;
    empresa, cliente: string;
    bHayGranada: Boolean;

    procedure Configurar( const AEmpresa: string );

    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;
  end;

var
  QRAlbaranAlemaniaNoVar: TQRAlbaranAlemaniaNoVar;

  function PreAlbaranAleman( const AEmpresa, ACentro, ACliente: String; const AAlbaran: Integer;
                             const AFecha: TDateTime; const APedirFirma, AOriginal: boolean; GGN : TGGN; const APrevisualizar: boolean = True ): boolean;

implementation

uses UDMAuxDB, CVariables, StrUtils, UDMBaseDatos, bTextUtils, bSQLUtils,
     Dialogs, UDMConfig, bMath, DPreview, CAuxiliarDB, UCAlbaran, CGlobal,
     SignatureForm;

{$R *.DFM}

constructor TQRAlbaranAlemaniaNoVar.Create(AOwner: TComponent);
begin
  inherited;

  bOriginal:= True;
end;

destructor TQRAlbaranAlemaniaNoVar.Destroy;
begin
  inherited;
end;

procedure TQRAlbaranAlemaniaNoVar.Configurar(const AEmpresa: string);
var
  bAux: Boolean;
  sAux, sEmpresa: string;
begin
  if Copy( AEmpresa, 1, 1 ) = 'F' then
    sEmpresa:= 'BAG'
  else
  if ( AEmpresa = '050' ) or ( AEmpresa = '080' ) then
    sEmpresa:= 'SAT'
  else
    sEmpresa:= AEmpresa;

  bAux:= FileExists( gsDirActual + '\recursos\' + sEmpresa + 'Page.wmf');
  if bAux then
  begin
    QRImageCab.Top:= -18; //-20
    QRImageCab.Left:= -37; //-20
    QRImageCab.Width:= 763; //-30
    QRImageCab.Height:= 1102; //-20
    QRImageCab.Stretch:= True;
    QRImageCab.Enabled:= True;

    QRImageCab.Picture.LoadFromFile( gsDirActual + '\recursos\' + sEmpresa + 'Page.wmf');
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

procedure TQRAlbaranAlemaniaNoVar.bandaFinalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  (*Vuelto a poner a peticion de Esther Cuerda, si alguien vuelve a pedir que se quite que hable con ella*)
  memoGarantia.Lines.Clear;
  //if not bEnEspanyol then
  begin
    memoGarantia.Lines.Add( 'Partial or complete rejections should be communicated and quantified no later than 48 hours after the reception of the goods by email or fax.' );
    if ( CGlobal.gProgramVersion = CGlobal.pvSAT) or (rGGN.imprimir_garantia = true) then
    begin
      memoGarantia.Height:= 25;
      bandaFinal.Height:= 25;
    end
    else
    begin
      memoGarantia.Height:= 15;
      bandaFinal.Height:= 15;
    end;

    if rGGN.imprimir_garantia = true then
    begin
          memoGarantia.lines.add(rggn.descri_eng+rggn.ggn_code);
    end;

  end;
  (*
  else
  begin
    memoGarantia.Lines.Add( 'Las incidencias deben ser comunicadas y cuantificadas  por escrito dentro del plazo de 48 horas posteriores a la descarga de la mercanc?a.' );
    if CGlobal.gProgramVersion = CGlobal.pvSAT then
        memoGarantia.Lines.Add( 'Toda la producci?n hortofrut?cola comercializada por S.A.T. N?9359 BONNYSA est? certificada conforme a la norma GLOBALGAP (EUREPGAP) IFA V5.3.    GGN='+self.ggn_code);
  end;
  *)
end;

procedure TQRAlbaranAlemaniaNoVar.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bOriginal then
  begin
    case Tag of
      0: psEtiqueta.Caption := '';
      1: psEtiqueta.Caption := 'ORIGINAL EMPRESA';
      2: psEtiqueta.Caption := 'ORIGINAL CLIENTE';
      3: psEtiqueta.Caption := 'COPIA 1/1ST COPY';
      4: psEtiqueta.Caption := 'COPIA 2/2ND COPY';
      5: psEtiqueta.Caption := 'COPIA 3/1RD COPY';
      else psEtiqueta.Caption := 'COPIA ' + IntToStr(Tag - 2) + '/' + IntToStr(Tag - 2) + 'TH COPY';
    end;
  end
  else
  begin
    case Tag of
      0: psEtiqueta.Caption := '';
      1: psEtiqueta.Caption := 'ORIGINAL CLIENTE';
      2: psEtiqueta.Caption := 'COPIA 1/1ST COPY';
      3: psEtiqueta.Caption := 'COPIA 2/2ND COPY';
      4: psEtiqueta.Caption := 'COPIA 3/1RD COPY';
      else psEtiqueta.Caption := 'COPIA ' + IntToStr(Tag - 2) + '/' + IntToStr(Tag - 2) + 'TH COPY';
    end;
  end;


  //Carga firma si la tiene
  If FileExists( sFirma ) then
  begin
    QRImgFirma.Enabled:= True;
    QRImgFirma.Stretch:= True;
    QRImgFirma.Picture.LoadFromFile( sFirma );
  end;

  (*if bEnEspanyol then
  begin
    qrmReponsabilidadEnvase.Lines.Clear;
    qrmReponsabilidadEnvase.Lines.Add('"De conformidad con lo establecido en la ley 11/1997, de 24 de abril, de envases y residuos de envases y, el art?culo 18.1 del  Real Decreto 782/1998,  de 30 de Abril que desarrolla');
    qrmReponsabilidadEnvase.Lines.Add('la Ley 11/1997; el responsable de la entrega  del residuo de envase o envase usado para su correcta  gesti?n ambiental de aquellos envases no identificados mediante el Punto Verde');
    if bHayGranada then
      qrmReponsabilidadEnvase.Lines.Add('(sistema integrado de gesti?n  de Ecoembes), ser? el poseedor final del mismo".                                                                          ENTIDAD DE CONTROL ES-ECO-020-CV.  GRANADA ECO.')
    else
      qrmReponsabilidadEnvase.Lines.Add('(sistema integrado de gesti?n  de Ecoembes), ser? el poseedor final del mismo".                                                                          ');
  end
  else
  *)
  begin
    qrmReponsabilidadEnvase.Lines.Clear;
    qrmReponsabilidadEnvase.Lines.Add('"In accordance with which it is established in law 11/1997 dated April 24th about packaging and packaging waste, according to article 18.1 of Royal decree 782/1998 dated April');
    qrmReponsabilidadEnvase.Lines.Add('30th that develops law 11/1997; the responsible for the delivery of packaging and packaging waste used for proper enviroment management  from those packaging non identified by');
    if bHayGranada then
      qrmReponsabilidadEnvase.Lines.Add('the green point (inegrated management system Ecoembes), will be the final holder".                                                        ENTIDAD DE CONTROL ES-ECO-020-CV.  POMEGRANATE ECO.')
    else
      qrmReponsabilidadEnvase.Lines.Add('the green point (inegrated management system Ecoembes), will be the final holder".                                                        ');
  end;
end;


procedure TQRAlbaranAlemaniaNoVar.CabeceraTablaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (MemoPalets.Lines.Count <> 0) or (MemoCajas.Lines.Count <> 0);
end;

procedure TQRAlbaranAlemaniaNoVar.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := mmoObservaciones.Lines.Count <> 0;
end;

procedure TQRAlbaranAlemaniaNoVar.LPaletsPrint(sender: TObject; var Value: string);
begin
  if MemoPalets.Lines.Count = 0 then Value := '';
end;

procedure TQRAlbaranAlemaniaNoVar.LCajasPrint(sender: TObject; var Value: string);
begin
  if MemoCajas.Lines.Count = 0 then Value := '';
end;

procedure TQRAlbaranAlemaniaNoVar.descripcion2_ePrint(sender: TObject;
  var Value: string);

begin


  Value := desEnvaseCliente(
    empresa,
    DMBaseDatos.QListado.FieldByName('producto_p').AsString,
    Value,
    cliente,
    -1);
    //,  DMBaseDatos.QListado.FieldByName('unidades_caja_sl').AsInteger);

   value := ArreglaProductoGGN(rggn, empresa, DMBaseDatos.QListado.FieldByName('producto_sl').AsString, value); 
end;

procedure TQRAlbaranAlemaniaNoVar.psKilosPrint(sender: TObject;
  var Value: String);
begin
  value := FormatFloat('#,##0.00', DMBaseDatos.QListado.FieldByName('kilos_sl').AsFloat);
end;

procedure TQRAlbaranAlemaniaNoVar.UnidadCobroPrint(sender: TObject;
  var Value: String);
begin
  Value:= Copy( Value, 1, 1 );
end;

function PreAlbaranAleman( const AEmpresa, ACentro, ACliente: String; const AAlbaran: Integer;
                           const AFecha: TDateTime; const APedirFirma, AOriginal: boolean; GGN : TGGN; const APrevisualizar: boolean = True ): boolean;
var
  sCliente, sSuministro, SFileName, sMsg: string;
  aux: TStringList;
  sAux, sDir: string;
  //bEsEspanya: boolean;
  iCopias: integer;
begin
  Result:= False;


  SFileName:= GetFirmaFileName( AEmpresa, ACentro, sCliente, AAlbaran, AFecha );
  sMsg:= '';
  if APedirFirma then
  begin
    if sFileName = '' then
    begin
      ShowMessage('Falta inicializar la ruta para guardar las firmas.');
    end
    else
    begin
      if not SignatureForm.SignSave( nil, sFilename, sMsg ) then
      begin
        ShowMessage( sMsg );
      end;
      //GetFirma( self, sFilename );//OLDTablet
    end;
  end;

  try
    QRAlbaranAlemaniaNoVar := TQRAlbaranAlemaniaNoVar.Create(Application);
    QRAlbaranAlemaniaNoVar.rGGN := GGN;
    QRAlbaranAlemaniaNoVar.empresa := AEmpresa;
    QRAlbaranAlemaniaNoVar.cliente := ACliente;
    QRAlbaranAlemaniaNoVar.bHayGranada:= TieneGranada( AEmpresa, ACentro, AFecha, AAlbaran );

    aux := TStringList.Create;
    PutPalets( AEmpresa, ACentro, AAlbaran, AFecha, TStrings(aux) );
    QRAlbaranAlemaniaNoVar.MemoPalets.Lines.Clear;
    QRAlbaranAlemaniaNoVar.MemoPalets.Lines.AddStrings(aux);

    aux.Clear;
    PutLogifruit( AEmpresa, ACentro, AAlbaran, AFecha, TStrings(aux) );
    QRAlbaranAlemaniaNoVar.MemoCajas.Lines.Clear;
    QRAlbaranAlemaniaNoVar.MemoCajas.Lines.AddStrings(aux);
    aux.Free;

    with DMBaseDatos.QListado do
    begin
      SQL.Clear;
      SQL.Add(' SELECT ');
      SQL.Add('      cliente_sal_sc, dir_sum_sc, moneda_sc, nif_c, hora_sc,  ');
      SQL.Add('      tipo_via_c, domicilio_c, poblacion_c, cod_postal_c, telefono_c, pais_c, ');
      SQL.Add('      tipo_via_ds, domicilio_ds, cod_postal_ds, poblacion_ds, telefono_ds, provincia_ds,pais_ds, ');
      SQL.Add('      n_pedido_sc, vehiculo_sc, transporte_sc, n_orden_sc, higiene_sc, nota_sc ');

      SQL.Add(' FROM frf_salidas_c ');
      SQL.Add('      join frf_clientes on cliente_sal_sc = cliente_C ');
      SQL.Add('      join frf_dir_sum on cliente_sal_sc = cliente_ds and dir_sum_sc = dir_sum_ds ');

      SQL.Add(' WHERE empresa_sc = :empresa ');
      SQL.Add(' and centro_salida_sc = :centro ');
      SQL.Add(' and n_albaran_sc = :albaran ');
      SQL.Add(' and fecha_sc = :fecha ');

      ParamByName('empresa').AsString := AEmpresa;
      ParamByName('centro').AsString := ACentro;
      ParamByName('albaran').AsInteger := AAlbaran;
      ParamByName('fecha').AsDateTime := AFecha;

      try
        Open;
      except
        MessageDlg('Error : No se puede recuperar los datos del cliente.', mtWarning, [mbOK], 0);
        raise;
      end;

      sCliente:= FieldByName('cliente_sal_sc').AsString;
      sSuministro:= FieldByName('dir_sum_sc').AsString;

      if ( sSuministro = sCliente ) then
      begin
        //Rellenamos datos
        with QRAlbaranAlemaniaNoVar do
        begin
          QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Clear;
          QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( DesCliente( sCliente ) );
          //bEsEspanya:= Trim(FieldByName('pais_c').AsString) = 'ES';

          sAux:= Trim(FieldByName('nif_c').AsString);
          if sAux <> '' then
          begin
            (*if bEsEspanya then
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( 'CIF: ' + sAux )
            else
            *)
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( 'VAT: ' + sAux )
          end;
          sAux:= Trim( FieldByName('tipo_via_c').AsString  + ' ' +  FieldByName('domicilio_c').AsString );
          if sAux <> '' then
            QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
          sAux:= Trim( FieldByName('poblacion_c').AsString );
          if sAux <> '' then
            QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );

          (*if bEsEspanya then
          begin
            sAux:= Trim( FieldByName('cod_postal_c').AsString + ' ' + desProvincia(FieldByName('cod_postal_c').AsString) );
            if sAux <> '' then
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
          end
          else
          *)
          begin
            sAux:= Trim( FieldByName('cod_postal_c').AsString + ' ' + DesPais( FieldByName('pais_c').AsString, True ) );
            if sAux <> '' then
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
          end;
        end;
      end
      else
      begin
        //Rellenamos datos
        with QRAlbaranAlemaniaNoVar do
        begin
          QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Clear;
          QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( DesCliente( sCliente ) );

          //bEsEspanya:= Trim(FieldByName('pais_ds').AsString) = 'ES';
          sAux:= Trim(FieldByName('nif_c').AsString);
          if sAux <> '' then
          begin
            (*if bEsEspanya then
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( 'CIF: ' + sAux )
            else
            *)
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( 'VAT: ' + sAux )
          end;

          QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( DesSuministro( AEmpresa, sCliente, sSuministro ) );

          sAux:= Trim( FieldByName('tipo_via_ds').AsString  + ' ' +  FieldByName('domicilio_ds').AsString );
          if sAux <> '' then
            QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
          sAux:= Trim( FieldByName('poblacion_ds').AsString );
          if sAux <> '' then
            QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );

          (*if bEsEspanya then
          begin
            sAux:= desProvincia(FieldByName('cod_postal_ds').AsString);
            if sAux <> '' then
            begin
              sAux:= Trim( FieldByName('cod_postal_ds').AsString + ' ' + sAux );
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
            end
            else
            begin
              sAux:= Trim( FieldByName('cod_postal_ds').AsString + ' ' + FieldByName('provincia_ds').AsString );
              if sAux <> '' then
                QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
            end;
          end
          else
          *)
          begin
            sAux:= Trim( FieldByName('provincia_ds').AsString );
            if sAux <> '' then
            begin
              QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( Trim( FieldByName('cod_postal_ds').AsString + ' ' + sAux ) );
              sAux:= Trim( DesPais( FieldByName('pais_ds').AsString ) );
              if sAux <> '' then
                QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
            end
            else
            begin
              sAux:= Trim( FieldByName('cod_postal_ds').AsString + ' ' + DesPais( FieldByName('pais_ds').AsString, True ) );
              if sAux <> '' then
                QRAlbaranAlemaniaNoVar.qrmDireccion.Lines.Add( sAux );
            end;
          end;
        end;
      end;
    end;

    QRAlbaranAlemaniaNoVar.sFirma:= SFileName;
    QRAlbaranAlemaniaNoVar.Configurar(AEmpresa);
    DPreview.bCanSend := DMConfig.EsLaFont;
    //QRAlbaranAlemaniaNoVar.bEnEspanyol:= bEsEspanya;


    QRAlbaranAlemaniaNoVar.mmoObservaciones.Lines.Clear;
    if DMBaseDatos.QListado.FieldByName('n_orden_sc').AsString <> '' then
    begin
      QRAlbaranAlemaniaNoVar.mmoObservaciones.Lines.Add('N? ORDEN CARGA:' + DMBaseDatos.QListado.FieldByName('n_orden_sc').AsString );
    end;
    if DMBaseDatos.QListado.FieldByName('higiene_sc').AsInteger <> 0  then
    begin
      QRAlbaranAlemaniaNoVar.mmoObservaciones.Lines.Add('CONDICIONES HIGIENICAS: OK');
    end
    else
    begin
      QRAlbaranAlemaniaNoVar.mmoObservaciones.Lines.Add('CONDICIONES HIGIENICAS: INCORRECTAS');
    end;
    if Trim( DMBaseDatos.QListado.FieldByName('nota_sc').AsString ) <> '' then
      QRAlbaranAlemaniaNoVar.mmoObservaciones.Lines.Add( Trim(DMBaseDatos.QListado.FieldByName('nota_sc').AsString) );

    QRAlbaranAlemaniaNoVar.bOriginal:= AOriginal;
    iCopias:= NumeroCopias( AEmpresa, sCliente );
    if not AOriginal then
      iCopias:= iCopias - 1;

    QRAlbaranAlemaniaNoVar.ReportTitle:= sCliente + 'A' + IntToStr( AAlbaran );

    //Datos almacen
    if ( Copy( AEmpresa, 1, 1) = 'F' ) and ( ACliente <> 'ECI' )then
    begin
      QRAlbaranAlemaniaNoVar.LAlbaran.Caption := AEmpresa + ACentro + Rellena( IntToStr( AAlbaran ), 5, '0', taLeftJustify );
      QRAlbaranAlemaniaNoVar.LAlbaran.Alignment := taRightJustify;
      QRAlbaranAlemaniaNoVar.LAlbaran.Width:= 73;
      QRAlbaranAlemaniaNoVar.LAlbaran.Left:= 43;

      QRAlbaranAlemaniaNoVar.qrlblAlbaran2.Caption := Coletilla( AEmpresa );
      QRAlbaranAlemaniaNoVar.qrlblAlbaran2.Enabled := True;
    end
    else
    //Bargosa
    if Trim( AEmpresa ) = '505' then
    begin
      QRAlbaranAlemaniaNoVar.LAlbaran.Caption := 'BON.' + Rellena( IntToStr( AAlbaran ), 5, '0', taLeftJustify );
      QRAlbaranAlemaniaNoVar.LAlbaran.Alignment := taRightJustify;
      QRAlbaranAlemaniaNoVar.LAlbaran.Width:= 73;
      QRAlbaranAlemaniaNoVar.LAlbaran.Left:= 43;

      QRAlbaranAlemaniaNoVar.qrlblAlbaran2.Caption := '';
      QRAlbaranAlemaniaNoVar.qrlblAlbaran2.Enabled := False;
    end
    else
    begin
      QRAlbaranAlemaniaNoVar.LAlbaran.Caption:= IntToStr( AAlbaran );
      QRAlbaranAlemaniaNoVar.LAlbaran.Alignment := taCenter;
      QRAlbaranAlemaniaNoVar.LAlbaran.Width:= 84;
      QRAlbaranAlemaniaNoVar.LAlbaran.Left:= 43;

      QRAlbaranAlemaniaNoVar.qrlblAlbaran2.Caption := '';
      QRAlbaranAlemaniaNoVar.qrlblAlbaran2.Enabled := False;
    end;


    QRAlbaranAlemaniaNoVar.LFecha.Caption := DateToStr( AFecha );
    QRAlbaranAlemaniaNoVar.LHora.Caption := DMBaseDatos.QListado.FieldByName('hora_sc').AsString;
    QRAlbaranAlemaniaNoVar.LPedido.Caption := DMBaseDatos.QListado.FieldByName('n_pedido_sc').AsString;
    QRAlbaranAlemaniaNoVar.LVehiculo.Caption := DMBaseDatos.QListado.FieldByName('vehiculo_sc').AsString;

    QRAlbaranAlemaniaNoVar.LCentro.Caption := DesCentro( AEmpresa, ACEntro );
    QRAlbaranAlemaniaNoVar.LTransporte.Caption := desTransporte( AEmpresa, DMBaseDatos.QListado.FieldByName('Transporte_sc').AsString ) +
                                             DNITransporte(AEmpresa, DMBaseDatos.QListado.FieldByName('Transporte_sc').AsString );
    sDir := Dir2Transporte(AEmpresa, DMBaseDatos.QListado.FieldByName('Transporte_sc').AsString);
    if Trim( sDir ) <> '' then
      QRAlbaranAlemaniaNoVar.LTransporteDir1.Caption := Dir1Transporte(AEmpresa, DMBaseDatos.QListado.FieldByName('Transporte_sc').AsString) + ', ' + sDir
    else
      QRAlbaranAlemaniaNoVar.LTransporteDir1.Caption := Dir1Transporte(AEmpresa, DMBaseDatos.QListado.FieldByName('Transporte_sc').AsString);

        //Buscar cuerpo del formulario
    with DMBaseDatos.QListado do
    begin
      if Active then
      begin
        Cancel;
        Close;
      end;
      with SQL do
      begin
        Clear;
        Add(' SELECT producto_p, case when nvl(des_aleman_p,'''') = '''' then descripcion_p else des_aleman_p end desProducto, envase_sl,');
        Add('     envase_e, descripcion_m, color_sl, calibre_sl,  unidades_caja_sl, producto_sl, ');
        Add('    SUM(kilos_sl) as kilos_sl, ');
        Add('    SUM(cajas_sl) as cajas_sl, ');
        Add('    SUM((cajas_sl*unidades_caja_sl)) as unidades ');
        Add(' FROM frf_salidas_l , frf_productos , frf_envases , frf_marcas  ');
        Add(' WHERE   (empresa_sl = :empresa) ');
        Add('    AND  (centro_salida_sl = :centro) ');
        Add('    AND  (n_albaran_sl = :albaran) ');
        Add('    AND  (fecha_sl = :fecha) ');
        Add('    AND  (producto_p = producto_sl) ');
        Add('    AND  (envase_e = envase_sl ) '); //ENVASE
        Add('    AND  (codigo_m = marca_sl) '); //MARCA
        Add(' GROUP BY  producto_p, desProducto, envase_sl,  ');
        Add('           envase_e, descripcion_m, color_sl, calibre_sl, unidades_caja_sl, producto_sl ');
        Add(' ORDER BY producto_p, envase_e, color_sl, calibre_sl');
      end;
      ParamByName('empresa').AsString := AEmpresa;
      ParamByName('centro').AsString := ACentro;
      ParamByName('albaran').AsInteger := AAlbaran;
      ParamByName('fecha').AsDateTime := AFecha;
      try
        Open;
      except
        DMBaseDatos.QListado.Cancel;
        DMBaseDatos.QListado.Close;
        MessageDlg('Error : No se puede recuperar los datos del albar?n.', mtWarning, [mbOK], 0);
        raise;
      end;
    end;

    if APrevisualizar then
    begin
      result:= DPreview.Preview(QRAlbaranAlemaniaNoVar, iCopias, False, True, ForzarEnvioAlbaran( AEmpresa, sCliente, AAlbaran, AFecha )  );
    end
    else
    begin
      try
        QRAlbaranAlemaniaNoVar.Print;
        result:= True;
      finally
        FreeAndNil( QRAlbaranAlemaniaNoVar );
      end;
    end;

    DMBaseDatos.QListado.Cancel;
    DMBaseDatos.QListado.Close;

  except
    DMBaseDatos.QListado.Cancel;
    DMBaseDatos.QListado.Close;
    QRAlbaranAlemaniaNoVar.Free;
  end;
end;

procedure TQRAlbaranAlemaniaNoVar.qrchldbndChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := mmoObservaciones.Lines.Count <> 0;
end;

end.
