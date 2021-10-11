unit ManProvincias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlue, dxSkinFoggy, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
  cxDBData, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  BonnyClientDataSet, dxSkinsdxBarPainter, dxBar, ActnList, dxBarBuiltInMenu,
  Menus, cxContainer, cxDBEdit, StdCtrls, cxButtons, cxPC, BonnyQuery,
  dxSkinBlack, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxGroupBox;

type
  TFManProvincias = class(TForm)
    dsQProvincias: TDataSource;
    dxBarManager: TdxBarManager;
    dxBarPrincipal: TdxBar;
    dxSalir: TdxBarButton;
    ActionList: TActionList;
    actAlta: TAction;
    dxPrimero: TdxBarButton;
    dxAnterior: TdxBarButton;
    dxSiguiente: TdxBarButton;
    dxUltimo: TdxBarButton;
    dxAlta: TdxBarButton;
    dxModificacion: TdxBarButton;
    dxBorrar: TdxBarButton;
    dxImprimir: TdxBarButton;
    actBaja: TAction;
    actModificar: TAction;
    actImprimir: TAction;
    dxBarDetalle: TdxBar;
    dxAceptar: TdxBarButton;
    dxCancelar: TdxBarButton;
    grpDetalle: TcxGroupBox;
    edtCodigo: TcxDBTextEdit;
    edtDescripcion: TcxDBTextEdit;
    grpPrincipal1: TcxGroupBox;
    cxGrid: TcxGrid;
    cxProvinciasProvincia: TcxGridDBTableView;
    cxcProNombreCodigo: TcxGridDBColumn;
    cxcProNombreDescripcion: TcxGridDBColumn;
    cxProvincia: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxSalirClick(Sender: TObject);
    procedure actSalirExecute(Sender: TObject);
    procedure dxPrimeroClick(Sender: TObject);
    procedure dxAnteriorClick(Sender: TObject);
    procedure dxSiguienteClick(Sender: TObject);
    procedure dxUltimoClick(Sender: TObject);
    procedure actModificarExecute(Sender: TObject);
    procedure grpDetalleEnter(Sender: TObject);
    procedure actAceptarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure grpDetalleExit(Sender: TObject);
    procedure dsQProvinciasStateChange(Sender: TObject);
    procedure actAltaExecute(Sender: TObject);
    procedure actBajaExecute(Sender: TObject);

  private
    bAlta, bModificar, bPrincipal: Boolean;
    QProvincias: TBonnyClientDataSet;
    marcador: TBookmark;

    procedure CreaQProvincias;
    procedure CerrarTabla;
    procedure NavPrincipal;
    procedure ActualizarDatos;
    function EjecutaQProvincias: boolean;
    procedure AltaRegistro;
    function DatosCorrectos: boolean;
    function ExisteCodigo(ACodigo: String): boolean;


  public
    { Public declarations }
  end;

var
  FManProvincias: TFManProvincias;

implementation

{$R *.dfm}

uses CVariables, CGestionPrincipal, Principal, UDMBaseDatos, CAuxiliarDB;

{ TFManProvincias }

procedure TFManProvincias.actAceptarExecute(Sender: TObject);
begin
  if not dxAceptar.Enabled then exit;

  if not DatosCorrectos then exit;
  
  QProvincias.Post(False);
  ActualizarDatos;

  bAlta := false;
  bModificar := false;
  bPrincipal := true;

  NavPrincipal;

end;

procedure TFManProvincias.actAltaExecute(Sender: TObject);
begin
  if not dxAlta.Enabled then exit;

  bAlta := true;
  NavPrincipal;
  AltaRegistro;

  grpDetalle.SetFocus;
end;

procedure TFManProvincias.actBajaExecute(Sender: TObject);
begin
  case MessageDlg('¿Desea eliminar la Provincia ' +
                  QProvincias.fieldbyname('codigo_p').AsString + ' - ' +
                  QProvincias.Fieldbyname('nombre_p').AsString + '?', mtInformation, [mbNo,mbYes],0) of
    mryes:
    begin
      QProvincias.Delete(False);
      ActualizarDatos;
      Exit;
    end;
    mrno:
      exit;
  end;
end;

procedure TFManProvincias.actCancelarExecute(Sender: TObject);
begin
  if not dxCancelar.Enabled then exit;

  bAlta := false;
  bModificar := false;
  bPrincipal := true;

  NavPrincipal;
end;

procedure TFManProvincias.actModificarExecute(Sender: TObject);
begin
  if not dxModificacion.Enabled then Exit;

  bModificar := true;
  NavPrincipal;

  edtDescripcion.SetFocus;
end;

procedure TFManProvincias.actSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFManProvincias.ActualizarDatos;
begin
  QProvincias.ApplyUpdates(0);
end;

procedure TFManProvincias.AltaRegistro;
begin
  edtCodigo.Text := '';
  edtDescripcion.Text := '';

  QProvincias.Append;
end;

procedure TFManProvincias.CerrarTabla;
begin
  if QProvincias.Active then
    QProvincias.Close;
end;

procedure TFManProvincias.CreaQProvincias;
begin
  QProvincias:=TBonnyClientDataSet.Create(self);
  dsQProvincias.Dataset:=QProvincias;
  with QProvincias do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_provincias ');
    SQL.Add('  order by codigo_p ');
  end;
end;

function TFManProvincias.DatosCorrectos: boolean;
begin
  Result := false;

  if edtCodigo.Text = '' then
  begin
    ShowMessage('El código de la Provincia no puede ser nulo.');
    edtCodigo.SetFocus;
    exit;
   end;

  if ExisteCodigo(edtCodigo.Text) then
  begin
    ShowMessage('El codigo introducido ya existe para otra Provincia.');
    edtcodigo.Setfocus;
    exit;
  end;


  Result := true;
end;

procedure TFManProvincias.dsQProvinciasStateChange(Sender: TObject);
begin
  dxAceptar.Enabled := (QProvincias.State in dsEditModes);
end;

procedure TFManProvincias.dxAnteriorClick(Sender: TObject);
begin
  QProvincias.Prior;
end;

procedure TFManProvincias.dxPrimeroClick(Sender: TObject);
begin
  QProvincias.First;
end;

procedure TFManProvincias.dxSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFManProvincias.dxSiguienteClick(Sender: TObject);
begin
  QProvincias.Next;
end;

procedure TFManProvincias.dxUltimoClick(Sender: TObject);
begin
  QProvincias.Last;
end;

function TFManProvincias.EjecutaQProvincias: boolean;
var Rec: Integer;
begin
  with QProvincias do
  begin
    if Active then
      Close;

    Open;
    Result:= not IsEmpty;
  end;
end;

function TFManProvincias.ExisteCodigo(ACodigo: String): boolean;
var QueryAux : TBonnyQuery;
begin
  QueryAux := TBonnyQuery.Create(Self);
  with QueryAux do
  try
    SQL.Add(' select * from frf_provincias');
    SQL.Add('  where codigo_p = :codigo ');

    ParamByName('codigo').AsString := ACodigo;
    Open;

    Result := (not isEmpty);

  finally
    free;
  end;
end;

procedure TFManProvincias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CerrarTabla;

  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;

  BEMensajes('');
  Action := caFree;
end;

procedure TFManProvincias.FormCreate(Sender: TObject);
begin
     //Muestra la barra de herramientas de Maestro/Detalle
  if FormType <> tfOther then
  begin
    FormType := tfOther;
    BHFormulario;
  end;

  CreaQProvincias;

end;

procedure TFManProvincias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    $0D: //vk_return
    begin
      Key := 0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Exit;
    end;
    VK_HOME:
    begin
      if dxPrimero.Enabled then
      dxPrimeroClick(Self);
    end;
    VK_END:
    begin
      if dxUltimo.Enabled then
      dxUltimoClick(Self);
    end;
    VK_UP:
    begin
      if dxAnterior.Enabled then
      dxAnteriorClick(Self);
    end;
    VK_DOWN:
    begin
      if dxSiguiente.Enabled then
      dxSiguienteClick(Self);
    end;
    VK_ADD:
    begin
      if dxAlta.Enabled then
        actAltaExecute(Self);
    end;
    VK_SUBTRACT:
    begin
      if dxBorrar.Enabled then
        actBajaExecute(Self);
    end;
    vk_ESCAPE:
    begin
      if dxSalir.Enabled then actSalirExecute(Self)
      else if dxCancelar.Enabled then actCancelarExecute(Self);
    end;
  end;
end;

procedure TFManProvincias.FormShow(Sender: TObject);
begin
  EjecutaQProvincias;

  bAlta := false;
  bModificar := false;
  bPrincipal := true;
  NavPrincipal;
end;

procedure TFManProvincias.grpDetalleEnter(Sender: TObject);
begin
  marcador := dsQProvincias.DataSet.GetBookmark;

  if bAlta then
  begin
    edtCodigo.Enabled := true;
    edtCodigo.SetFocus;
  end
  else
  begin
    edtCodigo.Enabled := false;
    edtDescripcion.SetFocus;
  end;

end;

procedure TFManProvincias.grpDetalleExit(Sender: TObject);
begin
  dsQProvincias.DataSet.GotoBookmark(marcador);
end;

procedure TFManProvincias.NavPrincipal;
begin
  if (bAlta) or (bModificar) then
  begin
    cxGrid.Enabled := false;
    dxBarPrincipal.Visible := false;
    grpDetalle.Visible := true;
    dxBarDetalle.Visible := true;
  end
  else if bPrincipal then
  begin
    cxGrid.Enabled := true;
    dxBarPrincipal.Visible := true;
    grpDetalle.Visible := false;
    dxBarDetalle.Visible := false;
  end;
end;

end.
