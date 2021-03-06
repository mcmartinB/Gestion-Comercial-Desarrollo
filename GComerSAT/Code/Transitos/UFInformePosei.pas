unit UFInformePosei;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, Db, ActnList,
  ComCtrls, CGestionPrincipal, BCalendario, Grids,
  DBGrids, BGrid, BCalendarButton, BEdit, BSpeedButton, BGridButton,
  DBTables, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlueprint, dxSkinFoggy,
  dxSkinMoneyTwins, cxCheckBox, dxSkinBlue;

type
  TFInformePosei = class(TForm)
    Panel2: TPanel;
    BAceptar: TSpeedButton;
    BCancelar: TSpeedButton;
    RejillaFlotante: TBGrid;
    LEmpresa: TLabel;
    EEmpresa: TBEdit;
    BGBEmpresa: TBGridButton;
    STEmpresa: TStaticText;
    stCentro: TStaticText;
    Label3: TLabel;
    ECentro: TBEdit;
    MEDesde: TBEdit;
    MEHasta: TBEdit;
    btnCentro: TBGridButton;
    Label5: TLabel;
    Eproducto: TBEdit;
    BGBProducto: TBGridButton;
    stProducto: TStaticText;
    Label8: TLabel;
    eAgrupacion: TBEdit;
    BGBAgrupacion: TBGridButton;
    STAgrupacion: TStaticText;
    Label4: TLabel;
    EAnyo: TBEdit;
    Label6: TLabel;
    rbSegundo: TRadioButton;
    rbPrimero: TRadioButton;
    rgTipoInforme: TRadioGroup;
    procedure BBCancelarClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADesplegarRejillaExecute(Sender: TObject);
    procedure EEmpresaChange(Sender: TObject);
    procedure ECentroChange(Sender: TObject);
    procedure EproductoChange(Sender: TObject);
    procedure eAgrupacionChange(Sender: TObject);
    procedure CambioSemestre;
    procedure EAnyoChange(Sender: TObject);
    procedure rbCambioSemClick(Sender: TObject);

  private
    { Private declarations }
    iAnyo, iMes, iDia: integer;
    function ValidarParametros: Boolean;
    procedure ObtenerDatos;
    procedure PrevisualizarOficial;
    procedure PrevisualizarInforme;
    procedure PrevisualizarControl;
  public
    { Public declarations }
    sEmpresa, sCentro, sAgrupacion, sProducto: string;
    iAnyoP, iSemestre: integer;
    dIni, dFin: TDateTime;
  end;

implementation

uses  DPreview, UDMAuxDB, Principal, UDMBaseDatos, CGlobal, CReportes, CVariables, bTimeUtils,
      CAuxiliarDB, InformeOficialPoseiQR, InformePoseiQR, ControlPoseiQR, UDMCalculoPosei;


{$R *.DFM}

procedure TFInformePosei.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then Close;
end;

procedure TFInformePosei.CambioSemestre;
var dDesde, dHasta: TDateTime;
begin
  if Length(EAnyo.Text) = 4 then
  begin
    if rbPrimero.Checked then
    begin
      dDesde := EncodeDate(iAnyo,1,1);
      dHasta := EncodeDate(iAnyo,6,30);
    end
    else
    begin
      dDesde := EncodeDate(iAnyo,7,1);
      dHasta := EncodeDate(iAnyo,12,31);
    end;

    MEDesde.Text :=  DateToStr(dDesde);
    MEHasta.Text :=  DateToStr(dHasta);

  end;
end;

procedure TFInformePosei.eAgrupacionChange(Sender: TObject);
begin
  if Trim( eAgrupacion.Text ) = '' then
    STAgrupacion.Caption := 'TODAS LAS AGRUPACIONES'
  else
    STAgrupacion.Caption := desAgrupacion(eAgrupacion.Text);
end;

function TFInformePosei.ValidarParametros: Boolean;
begin
  Result:= False;

  //Comprobar parametros de entrada
  if STEmpresa.Caption = '' then
  begin
    MessageDlg('Falta o c?digo de empresa incorrecto', mtError, [mbOk], 0);
    EEmpresa.SetFocus;
    Exit;
  end;

  if stCentro.Caption = '' then
  begin
    MessageDlg('C?digo de centro incorrecto', mtError, [mbOk], 0);
    ECentro.SetFocus;
    Exit;
  end;

  if Trim( STAgrupacion.Caption ) = '' then
  begin
    MessageDlg('El c?digo de agrupaci?n es incorrecto', mtError, [mbOk], 0);
    EAgrupacion.SetFocus;
    Exit;
  end;

  if STProducto.Caption = '' then
  begin
    MessageDlg('C?digo de producto incorrecto.', mtError, [mbOk], 0);
    EProducto.SetFocus;
    Exit;
  end;

  if Length(EAnyo.Text) <> 4 then
  begin
    MessageDlg('A?o incorrecto.', mtError, [mbOk], 0);
    EAnyo.SetFocus;
    Exit;
  end;

  if not TryStrToDate( MEDesde.Text, dIni ) then
  begin
    MessageDlg('Fecha de inicio incorrecta ...', mtError, [mbOk], 0);
    MEDesde.SetFocus;
    Exit;
  end;
  if not TryStrToDate( MEHasta.Text, dFin ) then
  begin
    MessageDlg('Fecha de fin incorrecta ...', mtError, [mbOk], 0);
    MEHasta.SetFocus;
    Exit;
  end;
  if dIni > dFin then
  begin
    MessageDlg('Rango de fechas incorrecto ...', mtError, [mbOk], 0);
    MEDesde.SetFocus;
    Exit;
  end;

  sempresa:= EEmpresa.Text;
  scentro:= ECentro.Text;
  sAgrupacion:=eAgrupacion.Text;
  sproducto:= EProducto.Text;
  iAnyoP := StrToInt(EAnyo.Text);
  if rbPrimero.Checked then
    iSemestre := 1
  else
    iSemestre := 2;



  result:= True;
end;

procedure TFInformePosei.PrevisualizarInforme;
var
  QRInformePosei: TQRInformePosei;
begin

  DMCalculoPosei.CargarDatosInforme;

  QRInformePosei:= TQRInformePosei.Create( Application );
  try
    QRInformePosei.lblTitulo.Caption := 'INFORME POSEI ' + IntToStr(iSemestre) + ' SEMESTRE DE ' + IntToStr(iAnyoP);
    QRInformePosei.qrlblPeriodo.Caption:= 'Del ' + MEDesde.Text + ' al ' + MEHasta.Text;
    PonLogoGrupoBonnysa( QRInformePosei );
    Preview( QRInformePosei );
  except
    FreeAndNil( QRInformePosei );
  end;

end;

procedure TFInformePosei.PrevisualizarOficial;
var
  QRInformeOficialPosei: TQRInformeOficialPosei;
begin

  DMCalculoPosei.CargarDatosOficial;

  QRInformeOficialPosei:= TQRInformeOficialPosei.Create( Application );
  try
    QRInformeOficialPosei.lblTitulo.Caption := 'INFORME OFICIAL POSEI ' + IntToStr(iSemestre) + ' SEMESTRE DE ' + IntToStr(iAnyoP);
    QRInformeOficialPosei.qrlblPeriodo.Caption:= 'Del ' + MEDesde.Text + ' al ' + MEHasta.Text;
    PonLogoGrupoBonnysa( QRInformeOficialPosei );
    Preview( QRInformeOficialPosei );
  except
    FreeAndNil( QRInformeOficialPosei );
  end;


end;

procedure TFInformePosei.PrevisualizarControl;
var
  QRControlPosei: TQRControlPosei;
begin

  DMCalculoPosei.CargarDatosControl;
  QRControlPosei:= TQRControlPosei.Create( Application );
  try
    QRControlPosei.qrLabel1.Caption := 'AYUDA POSEI ' + IntToStr(iSemestre) + ' SEMESTRE DE ' + IntToStr(iAnyoP);
    QRControlPosei.qrlblPeriodo.Caption:= 'Del ' + MEDesde.Text + ' al ' + MEHasta.Text;
    PonLogoGrupoBonnysa( QRControlPosei );
    Preview( QRControlPosei );
  except
    FreeAndNil( QRControlPosei );
  end;

end;

procedure TFInformePosei.rbCambioSemClick(Sender: TObject);
begin
  CambioSemestre;
end;

procedure TFInformePosei.ObtenerDatos;
begin
  if DMAuxDB.QAux.Active then
    Close;

  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select posei.*, prod.descripcion_p des_producto, cod_empresa_fac_fc, n_factura_fc, fecha_factura_fc, cod_factura_fc,                    ');
    SQL.Add('        pa.pais_p codigo_pais, pa.descripcion_p des_pais, provincia_fc des_provincia, nif_c, cliente_c, nombre_c, codigo_a, nombre_a     ');
    SQL.Add('  from frf_posei posei                                                                                     ');
    SQL.Add('  left join frf_productos prod on prod.producto_p = posei.producto_p                                       ');
    SQL.Add('  left join tfacturas_cab on cod_factura_fc = codigo_factura_p                                             ');
    SQL.Add('  left join frf_clientes on cliente_c = cod_cliente_fc                                                     ');
    SQL.Add('  left join frf_paises pa on pa.pais_p = pais_c                                                            ');
    SQL.Add('  left join frf_agrupacion on producto_a = posei.producto_p                                                ');
    SQL.Add(' where empresa_transito_p = :empresa                                                                       ');
    SQL.Add('   and centro_transito_p = :centro                                                                         ');

    if Trim( sAgrupacion ) <> '' then
      SQL.Add(' and posei.producto_p in (select producto_a from frf_agrupacion where codigo_a = :agrupacion)          ');

    if sProducto <> '' then
      SQL.Add('   and posei.producto_p = :producto                                                                    ');

    SQL.Add('   and anyo_p = :anyo                                                                              ');
    SQL.Add('   and semestre_p = :semestre                                                                      ');

    SQL.Add(' order by empresa_transito_p, centro_transito_p, ref_transito_p, fecha_transito_p, fecha_factura_p ');

    ParamByName('empresa').AsString := sEmpresa;
    ParamByName('centro').AsString := sCentro;

    if Trim( sAgrupacion ) <> '' then
      ParamByName('agrupacion').AsString := sAgrupacion;
    if sProducto <> '' then
    ParamByName('producto').AsString := sProducto;

    ParamByName('anyo').AsInteger := iAnyoP;
    ParamByName('semestre').AsInteger := iSemestre;

    Open;
    try
      if IsEmpty then
      begin
        ShowMessage('Sin datos para los parametros seleccionados.');
      end
      else
      begin
        if rgTipoInforme.ItemIndex = 0  then
          PrevisualizarOficial
        else if rgTipoInforme.ItemIndex = 1 then
          PrevisualizarInforme
        else
          PrevisualizarControl;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TFInformePosei.BBAceptarClick(Sender: TObject);
begin
  if not CerrarForm(true) then
    Exit;

  if ValidarParametros then
    ObtenerDatos;

end;

procedure TFInformePosei.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  gRF := nil;
  gCF := nil;
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;
  Action := caFree;
end;

procedure TFInformePosei.FormCreate(Sender: TObject);
var iAnyoC, iMesC, iDiaC: Word;
begin
  FormType := tfOther;
  BHFormulario;

  EEmpresa.Tag := kEmpresa;
  EProducto.Tag := kProducto;
  EAgrupacion.Tag := kAgrupacion;
  ECentro.Tag := kCentro;
  MEDesde.Tag := kCalendar;
  MEHasta.Tag := kCalendar;

  gRF := RejillaFlotante;
  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;

  EProducto.Text := '';

  DecodeDate(Now, iAnyoC, iMesC, iDiaC);
  iAnyo := iAnyoC;
  EAnyo.Text := IntToStr(iAnyo);

  if CGlobal.gProgramVersion = CGlobal.pvBAG then
  begin
    EEmpresa.Text := 'F17';
    ECentro.Text := '1';  //gsDefCentro;
  end
  else
  begin
    EEmpresa.Text := '050';
    ECentro.Text := '6';  //gsDefCentro;
  end;

  eAgrupacionChange(eagrupacion);
  EProductoChange( EProducto );

end;

procedure TFInformePosei.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    // Tecla ENTER - Cambio entre los Controles de Datos en modo edici?n
    //               y entre los Campos de B?squeda en la localizaci?n
  case key of
    vk_Return, vk_down:
      begin
        Key := 0;
        PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    vk_up:
      begin
        Key := 0;
        PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
      end;
    vk_escape:
      begin
        BCancelar.Click;
      end;
    vk_f1:
      begin
        BAceptar.Click;
      end;
  end;
end;

procedure TFInformePosei.ADesplegarRejillaExecute(Sender: TObject);
begin
  case ActiveControl.Tag of
    kEmpresa: DespliegaRejilla(BGBEmpresa);
    kAgrupacion: DespliegaRejilla(BGBAgrupacion);
    kProducto: DespliegaRejilla(BGBProducto, [EEmpresa.Text]);
    kCentro: DespliegaRejilla(btnCentro, [EEmpresa.Text]);
  end;
end;

procedure TFInformePosei.EEmpresaChange(Sender: TObject);
begin
  STEmpresa.Caption := desEmpresa(Eempresa.Text);
  ECentroChange( ECentro );
end;

procedure TFInformePosei.EproductoChange(Sender: TObject);
begin
  if EProducto.Text <> '' then
    stProducto.Caption := desProducto( Eempresa.Text, EProducto.Text )
  else
    stProducto.Caption := 'TODOS LOS PRODUCTOS';
end;

procedure TFInformePosei.EAnyoChange(Sender: TObject);
begin
  if EAnyo.Text <> '' then
  begin
    iAnyo := StrToInt(EAnyo.Text);
    CambioSemestre;
  end;
end;

procedure TFInformePosei.ECentroChange(Sender: TObject);
begin
 stCentro.Caption := desCentro( Eempresa.Text, ECentro.Text )
end;

end.
