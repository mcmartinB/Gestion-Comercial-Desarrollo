unit LFAlbaranesSinFacturar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ActnList,
  ComCtrls, Db, CGestionPrincipal, BEdit,
  BCalendarButton, BSpeedButton, BGridButton, BCalendario, Grids, DBGrids,
  BGrid, Derror, DBTables, ExtCtrls;

type
  TFLAlbaranesSinFacturar = class(TForm)
    Panel1: TPanel;
    ListaAcciones: TActionList;
    BAceptar: TAction;
    BCancelar: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    RejillaFlotante: TBGrid;
    CalendarioFlotante: TBCalendario;
    ADesplegarRejilla: TAction;
    Label5: TLabel;
    eCliente: TBEdit;
    Label1: TLabel;
    eEmpresa: TBEdit;
    btnEmpresa: TBGridButton;
    stEmpresa: TStaticText;
    stCentro: TStaticText;
    btnCentro: TBGridButton;
    eCentro: TBEdit;
    Label3: TLabel;
    Label2: TLabel;
    eProducto: TBEdit;
    btnProducto: TBGridButton;
    stProducto: TStaticText;
    Desde: TLabel;
    eDesde: TBEdit;
    btnDesde: TBCalendarButton;
    Label14: TLabel;
    eHasta: TBEdit;
    btnHasta: TBCalendarButton;
    btnCliente: TBGridButton;
    stCliente: TStaticText;
    cbxPrecio: TComboBox;
    cbxNoMercadona: TCheckBox;
    cbxMostrarCalibre: TCheckBox;
    lblPais: TLabel;
    edtPais: TBEdit;
    btnPais: TBGridButton;
    stPais: TStaticText;
    chkClienteNoFacturable: TCheckBox;
    cbbPaises: TComboBox;
    cbbTipoAlbaran: TComboBox;
    procedure BBAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADesplegarRejillaExecute(Sender: TObject);
    procedure PonNombre(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function CamposVacios: boolean;
  private
    {private declarations}

  public
    { Public declarations }
    sEmpresa, sCentro, sProducto, sCliente, sPais: string;
    dIni, dFin: TDateTime;
  end;

var
  FLAlbaranesSinFacturar: TFLAlbaranesSinFacturar;

implementation

uses UDMAuxDB, Principal, CVariables, DPreview, CReportes,
     CAuxiliarDB, UDMBaseDatos, UDMCambioMoneda, LQAlbaranesSinFacturar,
  CGlobal;

{$R *.DFM}


//                         ****  BOTONES  ****

procedure TFLAlbaranesSinFacturar.BBAceptarClick(Sender: TObject);
begin
  if not CamposVacios then
  begin
    if not LQAlbaranesSinFacturar.Imprimir ( sEmpresa, sCentro, sCliente, sPais, cbbPaises.ItemIndex,
                                             cbbTipoAlbaran.ItemIndex, chkClienteNoFacturable.Checked, cbxNoMercadona.Checked, cbxMostrarCalibre.Checked,
                                             sProducto, dIni, dFin, cbxPrecio.ItemIndex ) then
        ShowMessage('Todos los albaranes estan facturados.');
  end;
end;

procedure TFLAlbaranesSinFacturar.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then
    Close;
end;

//                          **** FORMULARIO ****
procedure TFLAlbaranesSinFacturar.FormCreate(Sender: TObject);
begin
  FormType := tfOther;
  BHFormulario;

  eEmpresa.Tag := kEmpresa;
  eCentro.Tag := kCentro;
  eProducto.Tag := kProducto;
  eCliente.Tag := kCliente;
  edtPais.Tag := kPais;
  eDesde.Tag := kCalendar;
  eHasta.Tag := kCalendar;

  if CGlobal.gProgramVersion =  CGlobal.pvSAT then
  begin
    eEmpresa.Text := 'SAT';
  end
  else
  begin
    eEmpresa.Text := 'BAG';
  end;
//  eEmpresa.Text := gsDefEmpresa;
  eCentro.Text := '';
  PonNombre( eCentro );
  eCliente.Text := '';
  PonNombre( eCliente );
  edtPais.Text := '';
  PonNombre( edtPais );
  eProducto.Text := '';
  PonNombre( eProducto );
  eDesde.Text := DateTostr(Date-6);
  eHasta.Text := DateTostr(Date);

  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;
  CalendarioFlotante.Date := Date;

  gRF := rejillaFlotante;
  gCF := calendarioFlotante;

  LQAlbaranesSinFacturar.InicializarReport;
end;

procedure TFLAlbaranesSinFacturar.FormActivate(Sender: TObject);
begin
  Top := 1;
  ActiveControl := EEmpresa;
end;

procedure TFLAlbaranesSinFacturar.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFLAlbaranesSinFacturar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  gRF := nil;
  gCF := nil;
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;
  BEMensajes('');

  LQAlbaranesSinFacturar.FinalizarReport;
  Action := caFree;
end;


//                      ****  FUNCIONES ESPECIFICAS  ****

procedure TFLAlbaranesSinFacturar.ADesplegarRejillaExecute(Sender: TObject);
begin
  case ActiveControl.Tag of
    kEmpresa: DespliegaRejilla(btnEmpresa);
    kProducto: DespliegaRejilla(btnProducto, [EEmpresa.Text]);
    kCentro: DespliegaRejilla(btnCentro, [EEmpresa.Text]);
    kCliente: DespliegaRejilla(btnCliente, [EEmpresa.Text]);
    kPais: DespliegaRejilla(btnPais, [EEmpresa.Text]);
    kCalendar:
      begin
        if eDesde.Focused then
          DespliegaCalendario(btnDesde)
        else
          DespliegaCalendario(btnHasta);
      end;
  end;
end;

procedure TFLAlbaranesSinFacturar.PonNombre(Sender: TObject);
begin
    if (gRF <> nil) then
      if esVisible( gRF ) then
        Exit;
    if (gCF <> nil) then
      if esVisible( gCF ) then
        Exit;
  case TComponent(Sender).Tag of
    kEmpresa: STEmpresa.Caption := desEmpresa(Eempresa.Text);
    kProducto:
    begin
      if Trim(eProducto.Text) = '' then
        STProducto.Caption:= 'TODOS LOS PRODUCTOS'
      else
        STProducto.Caption := desProducto(Eempresa.Text, Eproducto.Text);
    end;
    kCentro:
    begin
      if Trim(eCentro.Text) = '' then
        stCentro.Caption:= 'TODOS LOS CENTROS'
      else
        stCentro.Caption:= desCentro(Eempresa.Text, Ecentro.Text);
    end;
    kCliente:
    begin
      if Trim(eCliente.Text ) = '' then
        stCliente.Caption:= 'TODOS LOS CLIENTES'
      else
        stCliente.Caption:= desCliente( eCliente.Text );
    end;
    kPais:
    begin
      if Trim(edtPais.Text ) = '' then
        stPais.Caption:= 'TODOS LOS PAISES'
      else
        stPais.Caption:= desPais( edtPais.Text );
    end;
  end;
end;

function TFLAlbaranesSinFacturar.CamposVacios: boolean;
begin
  Result := True;
        //Comprobamos que los campos esten todos con datos
  if stEmpresa.Caption = '' then
  begin
    ShowError('Falta c?digo de empresa o c?digo incorrecto.');
    EEmpresa.SetFocus;
    Exit;
  end;
  sEmpresa:= Trim(eEmpresa.Text);

  if stProducto.Caption = '' then
  begin
    ShowError('C?digo de producto incorrecto.');
    EProducto.SetFocus;
    Exit;
  end;
  sProducto:= Trim(eProducto.Text);

  if stCentro.Caption = '' then
  begin
    ShowError('C?digo de centro incorrecto.');
    ECentro.SetFocus;
    Exit;
  end;
  sCentro:= Trim(eCentro.Text);

  if stCliente.Caption = '' then
  begin
    ShowError('C?digo de cliente incorrecto.');
    ECliente.SetFocus;
    Exit;
  end;
  sCliente:= Trim(eCliente.Text);

  if stPais.Caption = '' then
  begin
    ShowError('C?digo de pa?s incorrecto.');
    edtPais.SetFocus;
    Exit;
  end;
  sPais:= Trim(edtPais.Text);

  if not TryStrToDate( EDesde.Text, dIni ) then
  begin
    ShowError('Falta fecha de inicio o fecha incorrecta.');
    EDesde.SetFocus;
    Exit;
  end;
  if not TryStrToDate( EHasta.Text, dFin ) then
  begin
    ShowError('Falta fecha de fin o fecha incorrecta.');
    EHasta.SetFocus;
    Exit;
  end;
  if dFin < dIni then
  begin
    ShowError('Rango de fechas incorrecto.');
    EDesde.SetFocus;
    Exit;
  end;

  Result := False;
end;

//******************************  Parte privada  *******************************

end.

