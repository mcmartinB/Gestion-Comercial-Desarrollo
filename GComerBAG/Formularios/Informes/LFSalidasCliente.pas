unit LFSalidasCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, Db, DbTables, ActnList,
  ComCtrls, CGestionPrincipal, BEdit, Grids, DBGrids,
  BGrid, BSpeedButton, BGridButton, BCalendarButton, BCalendario, DError,
  QuickRpt, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, dxSkinBlueprint, dxSkinFoggy,
  dxSkinMoneyTwins, Menus, cxButtons, SimpleSearch, cxTextEdit;

type
  TFLSalidasCliente = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ListaAcciones: TActionList;
    BAceptar: TAction;
    BCancelar: TAction;
    BGBEmpresa: TBGridButton;
    LEmpresa: TLabel;
    STEmpresa: TStaticText;
    grupPie: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ADesplegarRejilla: TAction;
    EEmpresa: TBEdit;
    MEDesde: TBEdit;
    BCBDesde: TBCalendarButton;
    BCBHasta: TBCalendarButton;
    MEHasta: TBEdit;
    CalendarioFlotante: TBCalendario;
    RejillaFlotante: TBGrid;
    LProducto: TLabel;
    ECliente: TBEdit;
    BGBCliente: TBGridButton;
    STCliente: TStaticText;
    lblNombre1: TLabel;
    lblNombre2: TLabel;
    eProducto: TBEdit;
    BGBProducto: TBGridButton;
    stProducto: TStaticText;
    stEnvase: TStaticText;
    grupCab: TGroupBox;
    cbxReclamacion: TComboBox;
    lblNombre3: TLabel;
    chkValorarAlbaranes: TCheckBox;
    chkIgnorarCliente: TCheckBox;
    eEnvase: TcxTextEdit;
    ssEnvase: TSimpleSearch;
    procedure BBCancelarClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADesplegarRejillaExecute(Sender: TObject);
    procedure PonNombre(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkIgnorarClienteClick(Sender: TObject);
    procedure ssEnvaseAntesEjecutar(Sender: TObject);
    procedure eEnvaseExit(Sender: TObject);
  private
      {private declarations}
    bPrimeraVez: boolean;
    sEmpresa, sCliente, sProducto, sEnvase: string;
    dIni, dFin: TDateTime;

    function CamposVacios: boolean;
    procedure Imprimir;

  public
    { Public declarations }

  end;

//var
  //FLSalidasCliente: TFLSalidasCliente;

implementation

uses UDMAuxDB, LSalidasCliente, CVariables, Principal, CAuxiliarDB,
  DPreview, UDMBaseDatos, bSQLUtils, CReportes, bTextUtils;

{$R *.DFM}

procedure TFLSalidasCliente.FormCreate(Sender: TObject);
begin
  FormType := tfOther;
  BHFormulario;

  EEmpresa.Tag := kEmpresa;
  ECliente.Tag := kCliente;
  EProducto.Tag := kProducto;
  EEnvase.Tag := kEnvase;
  MEDesde.Tag := kCalendar;
  MEHasta.Tag := kCalendar;

  gRF := rejillaFlotante;
  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;
  gCF := calendarioFlotante;

  bPrimeraVez:= True;
end;

procedure TFLSalidasCliente.FormActivate(Sender: TObject);
begin
  if bPrimeraVez then
  begin
    MEDesde.Text := DateToStr(Date-6);
    MEHasta.Text := DateTostr(Date);
    CalendarioFlotante.Date := Date;
    EEmpresa.Text := gsDefEmpresa;
    ECliente.Text := '';
    eProducto.Text := '';
    eEnvase.Text := '';

    bPrimeraVez:= False;
  end;
end;

procedure TFLSalidasCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseAuxQuerys;
  BEMensajes('');
  gRF := nil;
  gCF := nil;
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;
  Action := caFree;
end;

procedure TFLSalidasCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    $0D, $28: //vk_return,vk_down
      begin
        Key := 0;
        PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
        Exit;
      end;
    $26: //vk_up
      begin
        Key := 0;
        PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
        Exit;
      end;
  end;
end;

procedure TFLSalidasCliente.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then Close;
end;

procedure TFLSalidasCliente.BBAceptarClick(Sender: TObject);
begin
  if not CerrarForm(true) then
    Exit;
  if CamposVacios then
    Exit;
  Imprimir;
end;

procedure TFLSalidasCliente.ADesplegarRejillaExecute(Sender: TObject);
begin
  case ActiveControl.Tag of
    kEmpresa: DespliegaRejilla(BGBEmpresa);
    kCliente: DespliegaRejilla(BGBCliente, [EEmpresa.Text]);
    kProducto: DespliegaRejilla(BGBProducto, [EEmpresa.Text]);
//    kEnvase: DespliegaRejilla(BGBEnvase, [EEmpresa.Text]);
    kCalendar:
      begin
        if MEDesde.Focused then
          DespliegaCalendario(BCBDesde)
        else
          DespliegaCalendario(BCBHasta);
      end;
  end;
end;

procedure TFLSalidasCliente.PonNombre(Sender: TObject);
begin
    if (gRF <> nil) then
      if esVisible( gRF ) then
        Exit;
    if (gCF <> nil) then
      if esVisible( gCF ) then
        Exit;
  case TComponent(Sender).Tag of
    kEmpresa:
    begin
      STEmpresa.Caption := desEmpresa(Eempresa.Text);
      PonNombre( eCliente );
      PonNombre( eProducto );
      PonNombre( eEnvase );
    end;
    kCliente:
    begin
      if ECliente.Text <> '' then
      begin
        STCliente.Caption := desCliente(ECliente.Text);
      end
      else
      begin
        STCliente.Caption := 'VACIO TODOS LOS CLIENTES';
      end;
    end;

    kProducto:
    begin
      if EProducto.Text <> '' then
      begin
        STProducto.Caption := desProducto(eEmpresa.Text, EProducto.Text);
      end
      else
      begin
        STProducto.Caption := 'VACIO TODOS LOS PRODUCTOS';
      end;
    end;
    kEnvase:
    begin
      if EEnvase.Text <> '' then
      begin
        STEnvase.Caption := desEnvaseP(eEmpresa.Text, EEnvase.Text, eProducto.Text );
      end
      else
      begin
        STEnvase.Caption := 'VACIO TODOS LOS ARTICULOS';
      end;
    end;
  end;
end;

procedure TFLSalidasCliente.ssEnvaseAntesEjecutar(Sender: TObject);
begin
    ssEnvase.SQLAdi := '';
    if eProducto.Text <> '' then
      ssEnvase.SQLAdi := ' producto_e = ' +  QuotedStr(eProducto.Text);
end;

function TFLSalidasCliente.CamposVacios: boolean;
begin
  Result := True;
  //Comprobar si los campos se han rellenado correctamente
  if stEmpresa.Caption = '' then
  begin
    ShowError('Falta c?digo de empresa o es incorrecto.');
    EEmpresa.SetFocus;
    Exit;
  end;
  sEmpresa:= EEmpresa.Text;

  if stCliente.Caption = '' then
  begin
    ShowError('C?digo de cliente incorrecto.');
    ECliente.SetFocus;
    Exit;
  end;
  sCliente:= eCliente.Text;

  if stProducto.Caption = '' then
  begin
    ShowError('C?digo de producto incorrecto.');
    eProducto.SetFocus;
    Exit;
  end;
  sProducto:= eProducto.Text;

  if stEnvase.Caption = '' then
  begin
    ShowError('C?digo de envase incorrecto.');
    eEnvase.SetFocus;
    Exit;
  end;
  sEnvase:= eEnvase.Text;

  if not TryStrToDate( MEDesde.Text, dIni ) then
  begin
    ShowError('Fecha desde incorrecta.');
    MEDesde.SetFocus;
    Exit;
  end;

  if not TryStrToDate( MEHasta.Text, dFin ) then
  begin
    ShowError('Fecha hasta incorrecta.');
    MEHasta.SetFocus;
    Exit;
  end;

  if dFin < dIni then
  begin
    ShowError('Rango de fechas incorrecto.');
    MEDesde.SetFocus;
    Exit;
  end;

  Result := False;
end;

procedure TFLSalidasCliente.Imprimir;
begin
     //Llamada al report que mostrara el informe
  QRLSalidasCliente := TQRLSalidasCliente.Create(Application);
  try
    PonLogoGrupoBonnysa(QRLSalidasCliente, EEmpresa.Text);
    QRLSalidasCliente.LPeriodo.Caption := MEDesde.Text + ' a ' + MEHasta.Text;
    QRLsalidasCliente.Imprimido := False;
//    QRLsalidasCliente.PrinterSettings.PrinterIndex := giPrintDef;
    QRLsalidasCliente.PrinterSettings.PrinterIndex := giPrintDefault;

    with QRLsalidasCliente.QListado do
    begin
      SQL.Clear;
      SQL.Add(' SELECT empresa_sc, cliente_sal_sc, dir_sum_sc, fecha_sc, n_albaran_sc, moneda_sc, categoria_sl, ' +
        '        envase_sl, producto_sl, SUM(kilos_sl)as kilos, SUM(cajas_sl)as cajas, SUM(importe_neto_sl) importe,  ');
      SQL.Add('         sum( unidades_caja_sl * cajas_sl ) unidades ');
      SQL.Add(' FROM frf_salidas_c , frf_salidas_l ');
      SQL.Add('  WHERE  (empresa_sl = empresa_sc) ' +
        ' AND  (centro_salida_sl = centro_salida_sc) ' +
        ' AND  (n_albaran_sl = n_albaran_sc) ' +
        ' AND  (fecha_sl = fecha_sc) ' +
        ' AND  (empresa_sl = :empresa) ' +
        ' AND  (fecha_sl BETWEEN :desde AND :hasta )');

      SQL.Add(' and es_transito_sc <> 2 ');             //Tipo Salida: Devolucion  

      if sCliente <> '' then
      begin
        if chkIgnorarCliente.Checked then
          SQL.Add( ' AND  (cliente_sal_sc <> :cliente)')
        else
          SQL.Add( ' AND  (cliente_sal_sc = :cliente)');
      end;
      if sProducto <> '' then
      begin
        SQL.Add( ' AND  (producto_sl = :producto )');
      end;
      if sEnvase <> '' then
      begin
        SQL.Add( ' AND  (envase_sl = :envase )');
      end;
      case cbxReclamacion.ItemIndex of
        1:
        begin
          SQL.Add( ' AND  reclamacion_sc <> 0 ' );
          QRLSalidasCliente.lblTitulo.Caption:= 'SALIDAS CON RECLAMACION POR CLIENTE';
        end;
        2:
        begin
          SQL.Add( ' AND  reclamacion_sc = 0 ' );
          QRLSalidasCliente.lblTitulo.Caption:= 'SALIDAS SIN RECLAMACION POR CLIENTE';
        end
        else
        begin
          QRLSalidasCliente.lblTitulo.Caption:= 'SALIDAS POR CLIENTE';
        end;
      end;
      SQL.Add(' GROUP BY empresa_sc, cliente_sal_sc, producto_sl, dir_sum_sc, n_albaran_sc, moneda_sc, fecha_sc, categoria_sl, ' +
        ' envase_sl ' +
        ' ORDER BY cliente_sal_sc, producto_sl, fecha_sc, n_albaran_sc, envase_sl ');
    end;

    QRLSalidasCliente.QListado.ParamByName('empresa').AsString:= sEmpresa;
    QRLSalidasCliente.QListado.ParamByName('desde').AsDateTime:= dIni;
    QRLSalidasCliente.QListado.ParamByName('hasta').AsDateTime:= dFin;
    if sCliente <> '' then
    begin
      QRLSalidasCliente.QListado.ParamByName('cliente').AsString:= sCliente;
      if chkIgnorarCliente.Checked then
      begin
        QRLSalidasCliente.LCliente.Caption := 'IGNORAR ' + ECliente.Text + ', ' + STCliente.Caption;
        QRLSalidasCliente.cliente_sal_sc.Enabled:= True;
        QRLSalidasCliente.bndGroupCliente.Height:= 24;
      end
      else
      begin
        QRLSalidasCliente.LCliente.Caption := ECliente.Text + ', ' + STCliente.Caption;
        QRLSalidasCliente.cliente_sal_sc.Enabled:= False;
        QRLSalidasCliente.bndGroupCliente.Height:= 0;
      end;
    end
    else
    begin
      QRLSalidasCliente.LCliente.Caption := 'TODOS LOS CLIENTES';
      QRLSalidasCliente.cliente_sal_sc.Enabled:= True;
      QRLSalidasCliente.bndGroupCliente.Height:= 24;
    end;
    if sProducto <> '' then
    begin
      QRLSalidasCliente.QListado.ParamByName('producto').AsString:= sProducto;
      QRLSalidasCliente.LProducto.Caption:= sProducto + ', ' + desProducto( sEmpresa, sProducto );
    end
    else
    begin
      QRLSalidasCliente.LProducto.Caption:= '';
    end;
    if sEnvase <> '' then
    begin
      QRLSalidasCliente.QListado.ParamByName('envase').AsString:= sEnvase;
      QRLSalidasCliente.LEnvase.Caption:= sEnvase + ', ' + desEnvaseP( sEmpresa, sEnvase, sProducto );
    end
    else
    begin
      QRLSalidasCliente.LEnvase.Caption:= '';
    end;

    QRLSalidasCliente.QListado.Open;

    QRLSalidasCliente.qreImporte.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.qrlImporte.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.qrePrecioKg.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.qrlPrecioKg.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.qrePrecioCaj.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.qrlPrecioCaj.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.qrePrecioUnd.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.qrlPrecioUnd.Enabled:= chkValorarAlbaranes.Checked;
    QRLSalidasCliente.bValorar:= chkValorarAlbaranes.Checked;

    if not QRLSalidasCliente.QListado.IsEmpty then
    begin
      QRLsalidasCliente.bndProducto.Enabled:=  ( sProducto <> '' ) or ( sEnvase <> '' );
      Preview(QRLsalidasCliente);
    end
    else
    begin
      ShowMessage('No salidas que cumplan las condiciones seleccionadas.');
      FreeAndNil( QRLsalidasCliente );
    end;

  except
    FreeAndNil( QRLsalidasCliente );
  end;
end;

procedure TFLSalidasCliente.chkIgnorarClienteClick(Sender: TObject);
begin
  if chkIgnorarCliente.Checked then
  begin
    if ECliente.Text <> '' then
    begin
      chkIgnorarCliente.Caption:= 'Ignorar Cliente ' + ECliente.Text + ' - ' + STCliente.Caption;
    end
    else
    begin
      chkIgnorarCliente.Caption:= 'Ignorar Cliente Seleccionado';
    end;
  end
  else
  begin
    chkIgnorarCliente.Caption:= 'Ignorar Cliente Seleccionado';
  end;
end;

procedure TFLSalidasCliente.eEnvaseExit(Sender: TObject);
begin
  if EsNumerico(eEnvase.Text) and (Length(eEnvase.Text) <= 5) then
    if (eEnvase.Text <> '' ) and (Length(eEnvase.Text) < 9) then
      eEnvase.Text := 'COM-' + Rellena( eEnvase.Text, 5, '0');
end;

end.
