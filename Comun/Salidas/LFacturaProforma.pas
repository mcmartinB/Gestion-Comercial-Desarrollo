unit LFacturaProforma;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, jpeg, Grids, BonnyQuery, uSalidaUtils;

type
  TQRLFacturaProforma = class(TQuickRep)
    qrbndPesosBrutos: TQRBand;
    CabeceraTabla: TQRChildBand;
    PsQRShape29: TQRShape;
    PsQRShape33: TQRShape;
    PsQRShape34: TQRShape;
    PsQRShape35: TQRShape;
    PsQRShape36: TQRShape;
    PsQRLabel22: TQRLabel;
    PsQRLabel23: TQRLabel;
    PsQRLabel27: TQRLabel;
    PsQRLabel28: TQRLabel;
    PsQRLabel29: TQRLabel;
    PsQRLabel30: TQRLabel;
    QRChildBand1: TQRChildBand;
    CabeceraFactura: TQRGroup;
    PsQRShape1: TQRShape;
    BandaLinea: TQRSubDetail;
    qrlblcajas: TQRLabel;
    lin2: TQRShape;
    lin5: TQRShape;
    lin6: TQRShape;
    lin7: TQRShape;
    lin8: TQRShape;
    PsQRLabel12: TQRLabel;
    PsQRLabel15: TQRLabel;
    PsQRLabel17: TQRLabel;
    PsQRLabel18: TQRLabel;
    PsQRLabel19: TQRLabel;
    PsQRLabel20: TQRLabel;
    producto: TQRLabel;
    pedido: TQRLabel;
    envase: TQRLabel;
    albaran: TQRLabel;
    qrlblunidad: TQRLabel;
    qrlblprecio: TQRLabel;
    qrlblimporte: TQRLabel;
    clienteFacturacion: TQRMemo;
    qrbndPaletsCajas: TQRChildBand;
    BonnyBand: TQRBand;
    QRImageCab: TQRImage;
    PsEmpresa: TQRLabel;
    PsDireccion: TQRLabel;
    PsNif: TQRLabel;
    PiePagina: TQRBand;
    qrmReponsabilidadEnvase: TQRMemo;
    qrlblunidades: TQRLabel;
    qrlblunidades_caja: TQRLabel;
    qrlblKilos: TQRLabel;
    qrshp1: TQRShape;
    qrshp2: TQRShape;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    qrlIncotermLabel: TQRLabel;
    qrlIncoterm: TQRLabel;
    qrsIncoterm: TQRShape;
    qrmGarantia: TQRMemo;
    qrchldbndTotales: TQRChildBand;
    BandaObservaciones: TQRChildBand;
    PsQRLabel7: TQRLabel;
    memoObservaciones: TQRMemo;
    qrmFormaPago: TQRMemo;
    Rtotal: TQRShape;
    ivaFrame: TQRShape;
    Rneto: TQRShape;
    neto: TQRLabel;
    iva: TQRLabel;
    total: TQRLabel;
    Lneto: TQRLabel;
    ivaLabel1: TQRLabel;
    Ltotal: TQRLabel;
    moneda2: TQRLabel;
    PsQRLabel13: TQRLabel;
    ivaLabel2: TQRLabel;
    LTotal2: TQRLabel;
    moneda1: TQRLabel;
    moneda3: TQRLabel;
    qrlblDesPalets: TQRLabel;
    QRShape1: TQRShape;
    qrlblNumPalets: TQRLabel;
    QRShape2: TQRShape;
    qrlblPesoPalets: TQRLabel;
    QRShape3: TQRShape;
    qrlblPrecioPalets: TQRLabel;
    qrlblUndFacPalets: TQRLabel;
    QRShape4: TQRShape;
    qrlblImpPalets: TQRLabel;
    qrlblDesCajas: TQRLabel;
    qrlblNumCajas: TQRLabel;
    qrlblPesoCajas: TQRLabel;
    qrlblPrecioCajas: TQRLabel;
    qrlblUndFacCajas: TQRLabel;
    qrlblImpCajas: TQRLabel;
    qrshp4: TQRShape;
    qrshp5: TQRShape;
    lblcajas: TQRLabel;
    lblunidades: TQRLabel;
    lblkilos: TQRLabel;
    qrlbl6: TQRLabel;
    lblbruto: TQRLabel;
    qrlbl1: TQRLabel;
    qrshp6: TQRShape;
    qrshp7: TQRShape;
    qrshp8: TQRShape;
    qrlblTotalAlbaran: TQRLabel;
    qrshpTotalAlbaran: TQRShape;
    qrlblTotalAlbaran2: TQRLabel;
    qrlblTotal: TQRLabel;
    qrshp3: TQRShape;
    qrlblTotalPlasticos: TQRLabel;
    qrchldbndChildBand1: TQRChildBand;
    qrm1: TQRMemo;
    QRShape5: TQRShape;
    clienteEnvio: TQRMemo;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape16: TQRShape;
    QRShape20: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    tipoFactura: TQRLabel;
    FechaFactura: TQRLabel;
    procedure BandaLineaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaLineaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLFacturaProformaStartPage(Sender: TCustomQuickRep);
    procedure QRLFacturaProformaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BandaLineaNeedData(Sender: TObject; var MoreData: Boolean);
    procedure PiePaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndPesosBrutosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrchldbndChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    contador: integer;
    rCajas, rUnidades, rKilos, rBruto: Real;
    bSpain: Boolean;
    sCodigoCliente: String;

    FQueryCliente: TBonnyQuery;
    FQueryEmpresa: TBonnyQuery;

    function GetResumen(const AEmpresa, ACentro: string; const AAlbaran: integer; const Afecha: TDateTime ): Integer;
  public
    sEmpresa, sCentro: string;
    iALbaran: Integer;
    dFEcha: TDateTime;

    mascara: string;
    StringGrid: TStringGrid;
    bHayGranada: boolean;

    rGGN : TGGN;

    constructor Create(AOwner: TComponent); reintroduce;
    procedure Configurar(const AEmpresa, ACentro: string; const ASpain, AFacDespacho: Boolean; ACodigoCliente: String);
  end;

var
  QRLFacturaProforma: TQRLFacturaProforma;

implementation

uses UDMAuxDB, CVariables, UDMConfig, CGlobal, bTextUtils, UFConstantesFacturacion;

{$R *.DFM}

procedure TQRLFacturaProforma.Configurar(const AEmpresa, ACentro: string; const ASpain, AFacDespacho: Boolean; ACodigoCliente: String);
var
  bAux: Boolean;
  sAux: string;
  ssEmpresa: string;
begin
  bSpain:= ASpain;
  sCodigoCliente := ACodigoCliente;
  sEmpresa:= AEmpresa;
  if Copy( AEmpresa, 1, 1 ) = 'F' then
    ssEmpresa:= 'BAG'
  else
  begin
    if ( AEmpresa = '050' ) or ( AEmpresa = '080' ) then
      ssEmpresa:= 'SAT'
    else
      ssEmpresa:= AEmpresa;
  end;
  if PaisCliente(AEmpresa, ACodigoCliente) <> 'ES' then
  ssEmpresa := 'Ingles ' + ssEmpresa;

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

  if (AFacDespacho) and (ACentro <> '6') then
    QRLabel15.Caption := 'PROFORMA'
  else
    QRLabel15.Caption := 'N? Factura';

end;

constructor TQRLFacturaProforma.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FQueryCliente := TBonnyQuery.Create(Self);
  FQueryCliente.SQL.Add('select es_comunitario_c, tipo_albaran_c, eori_cliente_c from frf_clientes where cliente_c = :cliente_c');

  FQueryEmpresa := TBonnyQuery.Create(Self);
  FQueryEmpresa.SQL.Add('select num_exp_autorizado_e from frf_empresas where empresa_e = :empresa_e');
end;

procedure TQRLFacturaProforma.BandaLineaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  aux: string;
  producto_sl : string;
begin
  producto.Caption := StringGrid.Cells[2, contador];

  producto_sl := StringGrid.Cells[12, contador];

  producto.caption := ArreglaProductoGGN(self.rggn, sEmpresa, producto_sl, producto.caption);

  if  sEmpresa <> 'F18' then
  begin
    if (StringGrid.Cells[1, contador] <> '') and
      (producto.Caption <> '') then
      producto.Caption := producto.Caption + ' - ' +
        StringGrid.Cells[1, contador];
  end;

  envase.Caption := StringGrid.Cells[3, contador];

  qrlblcajas.Caption := FormatFloat('#,##0', StrToFloatDef(StringGrid.Cells[8, contador],0));
  qrlblunidades_caja.Caption := FormatFloat('#,##0', StrToFloatDef(StringGrid.Cells[9, contador],0));
  qrlblunidades.Caption := FormatFloat('#,##0', StrToFloatDef(StringGrid.Cells[10, contador],0));
  qrlblKilos.Caption := FormatFloat('#,##0.00', StrToFloatDef(StringGrid.Cells[11, contador],0));


  //calibre.Caption:= StringGrid.Cells[8,contador];
  aux := StringGrid.Cells[6, contador];
  if aux <> '' then
    qrlblprecio.Caption := FormatFloat(mascara, StrToFloat(aux))
  else
    qrlblprecio.Caption := '';
  qrlblimporte.Caption := FormatFloat('#,##0.00', StrToFloatDef(StringGrid.Cells[7, contador],0));
  qrlblunidad.Caption := StringGrid.Cells[5, contador];

  rCajas:= rCajas + StrToFloatDef(StringGrid.Cells[8, contador],0);
  rUnidades:= rUnidades + StrToFloatDef(StringGrid.Cells[10, contador],0);
  rKilos:= rKilos + StrToFloatDef(StringGrid.Cells[11, contador],0);
  rBruto:= rBruto + StrToFloatDef(StringGrid.Cells[12, contador],0);

end;

procedure TQRLFacturaProforma.BandaLineaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  albaran.Enabled := False;
  pedido.Enabled := False;
  Inc(contador);
end;

procedure TQRLFacturaProforma.QRLFacturaProformaStartPage(
  Sender: TCustomQuickRep);
begin
  albaran.Enabled := True;
  pedido.Enabled := True;
end;

procedure TQRLFacturaProforma.QRLFacturaProformaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  contador := 1;

  rCajas:= 0;
  rUnidades:= 0;
  rKilos:= 0;
  rBruto:= 0;

end;

procedure TQRLFacturaProforma.BandaLineaNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := not (contador = StringGrid.RowCount);
end;

function TQRLFacturaProforma.GetResumen(const AEmpresa, ACentro: string; const AAlbaran: integer; const Afecha: TDateTime ): Integer;
begin
  with DMAuxDB.QAux do
  begin
    with SQL do
    begin
      Clear;
      Add(' SELECT n_albaran_sl, centro_origen_sl, unidad_precio_sl, producto_p, descripcion_p, ');
      Add('       ( select nvl(kilos_tp,0) from frf_tipo_palets where codigo_tp = tipo_palets_sl ) as pesoPalet, ');
      Add('        sum(kilos_sl) as kilosResumen ');
      Add(' FROM frf_salidas_c ');
      Add('      join frf_salidas_l ON (empresa_sl = empresa_sc) AND   (centro_salida_sl = centro_salida_sc) ');
      Add('                         AND   (n_albaran_sl = n_albaran_sc) AND   (fecha_sl = fecha_sc) ');
      Add('      join frf_productos on producto_p = producto_sl ');

      Add(' where empresa_sc = :empresa ');
      Add(' and centro_salida_sc = :centro ');
      Add(' and n_albaran_sc = :albaran ');
      Add(' and fecha_sc = :fecha ');

      Add(' GROUP BY  n_albaran_sl, centro_origen_sl, unidad_precio_sl, producto_p, descripcion_p, pesoPalet ');
    end;

    ParamByName('empresa').AsString := AEmpresa;
    ParamByName('centro').AsString := ACentro;
    ParamByName('albaran').AsInteger := AAlbaran;
    ParamByName('fecha').AsDateTime := Afecha;
    try
      Open;
      result := 0;
      while not Eof do
      begin
        result := result + FieldByName('kilosResumen').AsInteger;
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TQRLFacturaProforma.PiePaginaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bSpain then
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

  (*Vuelto a poner a peticion de Esther Cuerda, si alguien vuelve a pedir que se quite que hable con ella*)

  qrmGarantia.Enabled:= True;
  qrmGarantia.Lines.Clear;
  if not bSpain then
  begin
    qrmGarantia.Lines.Add( 'Partial or complete rejections should be communicated and quantified no later than 48 hours after the reception of the goods by email or fax.' );
  end
  else
  begin
    qrmGarantia.Lines.Add( 'Las incidencias deben ser comunicadas y cuantificadas  por escrito dentro del plazo de 48 horas posteriores a la descarga de la mercanc?a.' );
  end;

  if self.rGGN.imprimir_garantia = true then
  begin
    if not bSpain then
    begin
      qrmGarantia.Lines.Add( self.rGGN.descri_eng+' '+self.rGGN.ggn_code);
    end
    else
    begin
      qrmGarantia.Lines.Add( self.rGGN.descri_esp+' '+self.rGGN.ggn_code);
    end;

//    qrmReponsabilidadEnvase.Top:= 25;
//    PiePagina.Height:= 65;
  end;
//  else
//  begin
//    qrmGarantia.Enabled:= False;
//    qrmReponsabilidadEnvase.Top:= 15;
//    PiePagina.Height:= 40;
//  end;

  if (CGlobal.gProgramVersion = CGlobal.pvSAT) or (rGGN.imprimir_garantia = true) then
  begin
      qrmReponsabilidadEnvase.Top:= 25;
      PiePagina.Height := 65;
  end
  else
  begin
       qrmReponsabilidadEnvase.Top:= 15;
      PiePagina.Height := 40;
  end;


  (*
  else
  begin
    qrmGarantia.Enabled:= False;
    qrmReponsabilidadEnvase.Top:= 0;
    PiePagina.Height:= 40;
  end;
  *)
end;

procedure TQRLFacturaProforma.qrbndPesosBrutosBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lblcajas.Caption:= Formatfloat('#,##0', rCajas );
  lblunidades.Caption:= Formatfloat('#,##0', rUnidades );
  lblkilos.Caption:= Formatfloat('#,##0', GetResumen( sEmpresa, sCentro, iALbaran, dFEcha));//Formatfloat('#,##0.00', rKilos );
  lblbruto.Caption:= Formatfloat('#,##0', rBruto );
end;

procedure TQRLFacturaProforma.qrchldbndChildBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tipo_albaran: Integer;
  num_exportador: String;
begin
  if FQueryCliente.Active then
    FQueryCliente.Close;
  FQueryCliente.ParamByName('cliente_c').asString := sCodigoCliente;
  FQueryCliente.Open;

  if FQueryEmpresa.Active then
    FQueryEmpresa.Close;
  FQueryEmpresa.ParamByName('empresa_e').asString := sEmpresa;
  FQueryEmpresa.Open;


  qrm1.Lines.Clear;
  PrintBand := FQueryCliente.FieldByName('es_comunitario_c').asString = 'N';

  if PrintBand then
  begin
   //Peticion de Amparo Segui. Para el cliente SIL y para facturas menores de 6000 euros, no es necesario que salga el num_exportador en la impresion de la factura. 22/06/2021
    if (sCodigoCliente = 'SIL') and
       (StrToFloat(StringReplace(total.Caption, '.', '', [rfReplaceAll, rfIgnoreCase]) ) < 6000) then
    begin
      qrm1.Lines.Add(Format(_EXPORTADOR_AUTORIZADO_EN_SIL_, []));
    end
    else
    begin                                                                                  
      num_exportador := FQueryEmpresa.FieldByName('num_exp_autorizado_e').asString;
      if sCodigoCliente = 'ODD' then
          num_exportador := Copy(num_exportador, 1, 2) + '/' + Copy(num_exportador, 3, 4) + '/' + Copy(num_exportador, 7, 2) + '/' + Copy(num_exportador, 9, 4)
            + '/' + Copy(num_exportador, 13, 2);

      tipo_albaran := FQueryCliente.FieldByName('tipo_albaran_c').asInteger;
      case tipo_albaran of
        0, 1:  // Tipos albaran Valorado, No valorado
          qrm1.Lines.Add(Format(_EXPORTADOR_AUTORIZADO_ES_, [ num_exportador ]));

        2: // Tipo albaran aleman
          qrm1.Lines.Add(Format(_EXPORTADOR_AUTORIZADO_DE_, [ num_exportador ]));

        3: // Tipo albaran ingles
          qrm1.Lines.Add(Format(_EXPORTADOR_AUTORIZADO_EN_, [ num_exportador ]));
      end;
    end;
  end;
end;

end.

