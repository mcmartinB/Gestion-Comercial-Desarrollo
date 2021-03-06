unit UQRAlbaranExportacion;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  jpeg, grimgctrl, usalidaUtils;

type
  TQRAlbaranExportacion = class(TQuickRep)
    BonnyBand: TQRBand;
    BandaDatos: TQRBand;
    CabeceraTabla: TQRBand;
    marca: TQRDBText;
    categoria: TQRDBText;
    calibre: TQRDBText;
    cajas: TQRLabel;
    neto: TQRDBText;
    lin1: TQRShape;
    lin2: TQRShape;
    lin3: TQRShape;
    lin4: TQRShape;
    lin5: TQRShape;
    lin6: TQRShape;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    ChildBand2: TQRChildBand;
    LObservaciones: TQRLabel;
    mmoObservaciones: TQRMemo;
    ChildBand1: TQRChildBand;
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
    PsQRShape23: TQRShape;
    PsQRShape24: TQRShape;
    PsQRShape25: TQRShape;
    PsQRShape26: TQRShape;
    PsQRShape27: TQRShape;
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
    LTransporteDir1: TQRLabel;
    qrlNAlbaran: TQRLabel;
    LFecha: TQRLabel;
    LDescarga: TQRLabel;
    LPedido: TQRLabel;
    LVehiculo: TQRLabel;
    PsEmpresa: TQRLabel;
    PsNif: TQRLabel;
    PsDireccion: TQRLabel;
    QRImageCab: TQRImage;
    qrmDireccion: TQRMemo;
    qrlNAlbaran2: TQRLabel;
    qrimgLogoBargosa: TQRImage;
    qrxpr1: TQRExpr;
    qrlbl1: TQRLabel;
    unidades: TQRLabel;
    qrshp1: TQRShape;
    qrshp2: TQRShape;
    qrxpr2: TQRExpr;
    qrpdfshp1: TQRPDFShape;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl5: TQRLabel;
    unidad_caja: TQRLabel;
    qrshp3: TQRShape;
    bruto: TQRDBText;
    qrshp4: TQRShape;
    qrgrp1: TQRGroup;
    palets: TQRLabel;
    qrlbl8: TQRLabel;
    qrlbl9: TQRLabel;
    qrshp5: TQRShape;
    qrshp6: TQRShape;
    qrshp7: TQRShape;
    qrshp8: TQRShape;
    qrshp9: TQRShape;
    qrshp10: TQRShape;
    qrshp11: TQRShape;
    qrshp12: TQRShape;
    qrshp13: TQRShape;
    qrshp14: TQRShape;
    qrlbl10: TQRLabel;
    qrxpr3: TQRExpr;
    qrchldbndChildBand4: TQRChildBand;
    qrshp15: TQRShape;
    qrshp16: TQRShape;
    PsQRShape10: TQRShape;
    PsQRShape9: TQRShape;
    qrmGarantia: TQRMemo;
    PsQRLabel1: TQRLabel;
    PsQRLabel2: TQRLabel;
    QRImgFirma: TQRImage;
    PsQRLabel19: TQRLabel;
    PsQRSysData1: TQRSysData;
    psEtiqueta: TQRLabel;
    qrmReponsabilidadEnvase: TQRMemo;
    qrdbtxtdescripcion_m: TQRDBText;
    qrdbtxtdescripcion_p1: TQRDBText;
    qrdbtxtenvase_sl: TQRDBText;
    qrshp17: TQRShape;
    qrshp18: TQRShape;
    LPalets: TQRLabel;
    MemoPalets: TQRMemo;
    LCajas: TQRLabel;
    MemoCajas: TQRMemo;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BandaDatosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PsQRLabel19Print(sender: TObject; var Value: string);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrdbtxtenvase_slPrint(sender: TObject; var Value: string);
    procedure cajasPrint(sender: TObject; var Value: String);
    procedure unidadesPrint(sender: TObject; var Value: String);
    procedure categoriaPrint(sender: TObject; var Value: String);
    procedure qrlbl3Print(sender: TObject; var Value: String);
    procedure unidad_cajaPrint(sender: TObject; var Value: String);
    procedure qrdbtxtdescripcion_pPrint(sender: TObject; var Value: String);
    procedure brutoPrint(sender: TObject; var Value: String);
    procedure qrlbl10Print(sender: TObject; var Value: String);
    procedure paletsPrint(sender: TObject; var Value: String);
    procedure qrgrp1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrchldbndChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrdbtxtdescripcion_p1Print(sender: TObject; var Value: string);
  private
    bTransito: Boolean;

    rIvaFlag: Real;
    bFlag: Boolean;
    iUnidades: Integer;
    rBruto: Real;

    procedure FontLinea( const ATipo: Integer );
  public
   rGGN : TGGN;

    resumenList: TStringList;
    bOriginal: boolean;
    sFirma: string;
    sEmpresa, cliente: string;
    codProveedor: string;
    bEnEspanyol: Boolean;
    bHayGranada: Boolean;

    bMultiproductoInf, bMultiproductoLin: Boolean;


    procedure Configurar(const AEmpresa: string);
    
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses UDMAuxDB, CVariables, StrUtils, bTextUtils, bSQLUtils,
     Dialogs, UDMConfig, bMath, UDQAlbaranSalida, CGlobal;

{$R *.DFM}
                       
constructor TQRAlbaranExportacion.Create(AOwner: TComponent);
begin
  inherited;

  resumenList := TStringList.Create;
  bOriginal:= True;
end;

destructor TQRAlbaranExportacion.Destroy;
begin
  resumenList.Free;

  inherited;
end;


procedure TQRAlbaranExportacion.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  bHayGranada:= False;
  bEnEspanyol:= true;
  //Si el albaran es no valorado no imprimir precios
  bTransito := false;
  rIvaFlag:= DataSet.FieldByName('porc_iva_sl').AsFloat;
  bFlag:= true;
  iUnidades:= 0;
  rBruto:= 0;

  bMultiproductoInf:= False;
  bMultiproductoLin:= False;
end;

procedure TQRAlbaranExportacion.BandaDatosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bFlag and ( DataSet.FieldByName('porc_iva_sl').AsFloat <> rIvaFlag ) then
  begin
    bFlag:= False;
  end;

  bMultiproductoLin:= DataSet.FieldByName('tipo_e').Asinteger > 0;
  bMultiproductoInf:= bMultiproductoInf or bMultiproductoLin;
  FontLinea( DataSet.FieldByName('tipo_e').Asinteger );
end;

procedure TQRAlbaranExportacion.Configurar(const AEmpresa: string);
var
  bAux: Boolean;
  sAux: string;
  ssEmpresa: string;
begin
  if Copy( AEmpresa, 1, 1 ) = 'F' then
    ssEmpresa:= 'BAG'
  else
  if ( AEmpresa = '050' ) or ( AEmpresa = '080' ) then
    ssEmpresa:= 'SAT'
  else
  if AEmpresa  = '510' then
    ssEmpresa:= '505'    
  else
    ssEmpresa:= AEmpresa;

  bAux:= FileExists( gsDirActual + '\recursos\' + ssEmpresa + 'Page.wmf');
  if bAux then
  begin
    QRImageCab.Top:= -18; //-20
    QRImageCab.Left:= -37; //-20
    QRImageCab.Width:= 763; //-30
    QRImageCab.Height:= 1102; //-20
    QRImageCab.Stretch:= True;
    QRImageCab.Enabled:= True;
    QRImageCab.Picture.LoadFromFile( gsDirActual + '\recursos\' + ssEmpresa + 'Page.wmf');
    if ( ( ssEmpresa = '505' ) or ( ssEmpresa = '510' ) ) and FileExists( gsDirActual + '\recursos\LogoBargosa.bmp') then
    begin
      //BARGOSA
      qrimgLogoBargosa.Stretch:= True;
      qrimgLogoBargosa.Enabled:= True;
      qrimgLogoBargosa.Picture.LoadFromFile( gsDirActual + '\recursos\LogoBargosa.bmp');
    end;
  end
  else
  begin
    qrimgLogoBargosa.Enabled:= False;
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

procedure TQRAlbaranExportacion.PsQRLabel19Print(sender: TObject;
  var Value: string);
begin
  if codProveedor <> '' then
  begin
    Value := 'COD. PROVEEDOR: ' + codProveedor;
  end
  else
  begin
    Value := '';
  end;
end;

procedure TQRAlbaranExportacion.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := mmoObservaciones.Lines.Count <> 0;
end;

procedure TQRAlbaranExportacion.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bEnEspanyol then
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
  begin
    qrmReponsabilidadEnvase.Lines.Clear;
    qrmReponsabilidadEnvase.Lines.Add('"In accordance with which it is established in law 11/1997 dated April 24th about packaging and packaging waste, according to article 18.1 of Royal decree 782/1998 dated April');
    qrmReponsabilidadEnvase.Lines.Add('30th that develops law 11/1997; the responsible for the delivery of packaging and packaging waste used for proper enviroment management  from those packaging non identified by');
    if bHayGranada then
      qrmReponsabilidadEnvase.Lines.Add('the green point (inegrated management system Ecoembes), will be the final holder".                                                        ENTIDAD DE CONTROL ES-ECO-020-CV.  POMEGRANATE ECO.')
    else
      qrmReponsabilidadEnvase.Lines.Add('the green point (inegrated management system Ecoembes), will be the final holder".                                                        ');
  end;

    qrmGarantia.Enabled:= True;
    qrmGarantia.Lines.Clear;
    if not bEnEspanyol then
    begin
      qrmGarantia.Lines.Add( 'Partial or complete rejections should be communicated and quantified no later than 48 hours after the reception of the goods by email or fax.' );
    end
    else
    begin
      qrmGarantia.Lines.Add( 'Las incidencias deben ser comunicadas y cuantificadas  por escrito dentro del plazo de 48 horas posteriores a la descarga de la mercanc?a.' );
    end;

    if rGGN.imprimir_garantia = true then
    begin
        if bEnEspanyol then qrmGarantia.Lines.add(rggn.descri_esp+rggn.ggn_code)
          else qrmGarantia.lines.add(rggn.descri_eng+rggn.ggn_code);
    end;

    if (CGlobal.gProgramVersion = CGlobal.pvSAT) or (rGGN.imprimir_garantia = true) then
      qrmReponsabilidadEnvase.Top:= 25
    else
      qrmReponsabilidadEnvase.Top:= 15;

    PsQRLabel1.Top:= 62;
    PsQRLabel2.Top:= 62;
    psEtiqueta.Top:= 114;
    PsQRLabel19.Top:= 114;
    PsQRSysData1.Top:= 114;
    PsQRShape9.Top:= 61;
    PsQRShape10.Top:= 61;
    QRImgFirma.Top:= 63;
    ChildBand1.Height:= 130;
  (*
  else
  begin
    qrmGarantia.Enabled:= False;
    qrmReponsabilidadEnvase.Top:= 0;
    PsQRLabel1.Top:= 37;
    PsQRLabel2.Top:= 37;
    psEtiqueta.Top:= 89;
    PsQRLabel19.Top:= 89;
    PsQRSysData1.Top:= 89;
    PsQRShape9.Top:= 36;
    PsQRShape10.Top:= 36;
    QRImgFirma.Top:= 38;
    ChildBand1.Height:= 105;
  end;
  *)

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
      else psEtiqueta.Caption := 'COPIA ' + IntToStr(Tag - 1) + '/' + IntToStr(Tag - 1) + 'TH COPY';
    end;
  end;


  //Carga firma si la tiene
  try
    If FileExists( sFirma ) then
    begin
      QRImgFirma.Enabled:= True;
      QRImgFirma.Stretch:= True;
      QRImgFirma.Picture.LoadFromFile( sFirma );
    end;
  except
    ShowMessage('Fichero de firma incorrecto: ' + sFirma );
  end;
end;

procedure TQRAlbaranExportacion.cajasPrint(sender: TObject; var Value: String);
begin
  value := FormatFloat('#,##0', DataSet.FieldByName('cajas_sl').AsInteger);
end;

procedure TQRAlbaranExportacion.unidadesPrint(sender: TObject;
  var Value: String);
begin
  if DataSet.FieldByName('unidades_sl').AsInteger <>
     DataSet.FieldByName('cajas_sl').AsInteger then
  begin
    value := FormatFloat('#,##0', DataSet.FieldByName('unidades_sl').AsInteger);
    if DataSet.FieldByName('tipo_e').AsInteger <> 2 then
      iUnidades:= iUnidades + DataSet.FieldByName('unidades_sl').AsInteger;
  end
  else
  begin
    value := '';
  end;
end;

procedure TQRAlbaranExportacion.unidad_cajaPrint(sender: TObject;
  var Value: String);
begin
  if DataSet.FieldByName('unidades_sl').AsInteger <>
     DataSet.FieldByName('cajas_sl').AsInteger then
  begin
    value := FormatFloat('#', DataSet.FieldByName('unidades_caja_sl').AsInteger);
  end
  else
  begin
    value := '';
  end;
end;


procedure TQRAlbaranExportacion.qrlbl3Print(sender: TObject;
  var Value: String);
begin
  if iUnidades <> 0 then
  begin
    value := FormatFloat('#,##0', iUnidades );
    iUnidades:= 0;
  end
  else
  begin
    value := '';
  end;
end;

procedure TQRAlbaranExportacion.categoriaPrint(sender: TObject;
  var Value: String);
begin
  Value:= desCategoria( sempresa, DataSet.FieldByName('producto_sl').AsString, Value  )
end;

procedure TQRAlbaranExportacion.qrdbtxtdescripcion_p1Print(sender: TObject; var Value: string);
begin
  if bMultiproductoLin then
  begin
    if DataSet.FieldByName('tipo_e').Asinteger = 1 then
      Value:= Value + ' ' + DataSet.FieldByName('envase_sl').AsString + ''
    else
      Value:= ' *  ' + DataSet.FieldByName('envase_sl').AsString + ' - ' + Value ;
  end;

   value := ArreglaProductoGGN(rggn, sEmpresa, dataset.FieldByName('producto_sl').AsString, value); 
end;

procedure TQRAlbaranExportacion.qrdbtxtdescripcion_pPrint(sender: TObject;
  var Value: String);
begin
  if bMultiproductoLin then
  begin
    if DataSet.FieldByName('tipo_e').Asinteger = 1 then
      Value:= Value + ' ' + DataSet.FieldByName('envase_sl').AsString + ''
    else
      Value:= ' *  ' + DataSet.FieldByName('envase_sl').AsString + ' - ' + Value ;
  end;
end;

procedure TQRAlbaranExportacion.qrdbtxtenvase_slPrint(sender: TObject;
  var Value: string);

begin
  if bMultiproductoLin then
  begin
    if DataSet.FieldByName('tipo_e').Asinteger = 1 then
      Value := desEnvaseCliente(
        sempresa,
        DataSet.FieldByName('producto_p').AsString,
        Value,
        cliente,
        -1)
    else
      Value:= '' ;
  end
  else
  begin
    Value := desEnvaseCliente(
      sempresa,
      DataSet.FieldByName('producto_p').AsString,
      Value,
      cliente,
      -1);
  end;
end;

procedure TQRAlbaranExportacion.FontLinea( const ATipo: Integer );
begin
  case ATipo of
    0:
    begin
      //Normal
      //producto.Font.Style:= producto.Font.Style - [fsItalic] - [fsBold];
      marca.Font.Style:= marca.Font.Style - [fsItalic] - [fsBold];
      calibre.Font.Style:= calibre.Font.Style - [fsItalic] - [fsBold];
      categoria.Font.Style:= categoria.Font.Style - [fsItalic] - [fsBold];
      palets.Font.Style:= palets.Font.Style - [fsItalic] - [fsBold];
      unidad_caja.Font.Style:= unidad_caja.Font.Style - [fsItalic] - [fsBold];
      cajas.Font.Style:= cajas.Font.Style - [fsItalic] - [fsBold];
      unidades.Font.Style:= unidades.Font.Style - [fsItalic] - [fsBold];
      neto.Font.Style:= neto.Font.Style - [fsItalic] - [fsBold];
      bruto.Font.Style:= bruto.Font.Style - [fsItalic] - [fsBold];

      marca.Enabled:= True;
      categoria.Enabled:= True;
      calibre.Enabled:= True;
      cajas.Enabled:= True;
      palets.Enabled:= True;

      //producto.Font.Size:= 8;
      (*
      descripcion2_e.Font.Size:= 8;
      marca.Font.Size:= 8;
      categoria_sl.Font.Size:= 8;
      PsQRDBText28.Font.Size:= 8;
      cajas.Font.Size:= 8;
      psKilos.Font.Size:= 8;
      qrlbl2.Font.Size:= 8;
      *)
    end;
    1:
    begin
      //cabecera
      //producto.Font.Style:= producto.Font.Style - [fsItalic] + [fsBold];
      marca.Font.Style:= marca.Font.Style - [fsItalic] + [fsBold];
      calibre.Font.Style:= calibre.Font.Style - [fsItalic] + [fsBold];
      categoria.Font.Style:= categoria.Font.Style - [fsItalic] + [fsBold];
      palets.Font.Style:= palets.Font.Style - [fsItalic] + [fsBold];
      unidad_caja.Font.Style:= unidad_caja.Font.Style - [fsItalic] + [fsBold];
      cajas.Font.Style:= cajas.Font.Style - [fsItalic] + [fsBold];
      unidades.Font.Style:= unidades.Font.Style - [fsItalic] + [fsBold];
      neto.Font.Style:= neto.Font.Style - [fsItalic] + [fsBold];
      bruto.Font.Style:= bruto.Font.Style - [fsItalic] + [fsBold];

      marca.Enabled:= False;
      categoria.Enabled:= False;
      calibre.Enabled:= False;
      cajas.Enabled:= True;
      palets.Enabled:= True;

      (*
      //producto.Font.Size:= 8;
      descripcion2_e.Font.Size:= 8;
      marca.Font.Size:= 8;
      categoria_sl.Font.Size:= 8;
      PsQRDBText28.Font.Size:= 8;
      cajas.Font.Size:= 8;
      psKilos.Font.Size:= 8;
      qrlbl2.Font.Size:= 8;
      *)
    end;
    2:
    begin
      //Detalle
      //producto.Font.Style:= producto.Font.Style + [fsItalic] - [fsBold];
      //envase.Font.Style:= producto.Font.Style + [fsItalic] - [fsBold];
      marca.Font.Style:= marca.Font.Style + [fsItalic] - [fsBold];
      calibre.Font.Style:= calibre.Font.Style + [fsItalic] - [fsBold];
      categoria.Font.Style:= categoria.Font.Style + [fsItalic] - [fsBold];
      palets.Font.Style:= palets.Font.Style + [fsItalic] - [fsBold];
      unidad_caja.Font.Style:= unidad_caja.Font.Style + [fsItalic] - [fsBold];
      cajas.Font.Style:= cajas.Font.Style + [fsItalic] - [fsBold];
      unidades.Font.Style:= unidades.Font.Style + [fsItalic] - [fsBold];
      neto.Font.Style:= neto.Font.Style + [fsItalic] - [fsBold];
      bruto.Font.Style:= bruto.Font.Style + [fsItalic] - [fsBold];

      marca.Enabled:= True;
      categoria.Enabled:= True;
      calibre.Enabled:= True;
      cajas.Enabled:= false;
      palets.Enabled:= false;

      (*
      //producto.Font.Size:= 7;
      descripcion2_e.Font.Size:= 7;
      marca.Font.Size:= 7;
      categoria_sl.Font.Size:= 7;
      PsQRDBText28.Font.Size:= 7;
      cajas.Font.Size:= 7;
      psKilos.Font.Size:= 7;
      qrlbl2.Font.Size:= 7;
      *)
    end;
  end;
end;

procedure TQRAlbaranExportacion.brutoPrint(sender: TObject;
  var Value: String);
var
  rAux: Real;
begin
  rAux:= DataSet.FieldByName('peso_palets').AsFloat + DataSet.FieldByName('peso_cajas').AsFloat + DataSet.FieldByName('kilos_sl').AsFloat;
  //rAux:= DataSet.FieldByName('peso_cajas').AsFloat + DataSet.FieldByName('kilos_sl').AsFloat;
  Value:= FormatFloat( '#,##0.00',  rAux );
  if DataSet.FieldByName('tipo_e').AsInteger <> 2 then
    rBruto:= rBruto + rAux;
end;

procedure TQRAlbaranExportacion.qrlbl10Print(sender: TObject;
  var Value: String);
begin
  value := FormatFloat('#,##0.00', rBruto );
  rBruto:= 0;
end;

procedure TQRAlbaranExportacion.paletsPrint(sender: TObject;
  var Value: String);
begin
  value := FormatFloat('#,##0', DataSet.FieldByName('palets_sl').AsInteger );
end;

procedure TQRAlbaranExportacion.qrgrp1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not bHayGranada then
    bHayGranada:= DataSet.FieldByName('producto_sl').AsString = 'W';
end;

procedure TQRAlbaranExportacion.qrchldbndChildBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand:= Trim( qrdbtxtdescripcion_m.DataSet.FieldByName('notas_sl').AsString ) <> '';
end;

end.
