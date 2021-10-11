unit AccesoUsuarioFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlue,
  dxSkinFoggy, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, Menus, cxButtons, UDMBaseDatos,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxImage,
  dxGDIPlusClasses;

type
  TFDAccesoUsuario = class(TForm)
    pnl1: TPanel;
    cbbAlias: TcxComboBox;
    teUsuario: TcxTextEdit;
    teClave: TcxTextEdit;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    cxImage1: TcxImage;
    teIniciarSesion: TcxTextEdit;
    spl1: TSplitter;
    teVersion: TcxTextEdit;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbbAliasPropertiesChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure teUsuarioEnter(Sender: TObject);
    procedure teUsuarioExit(Sender: TObject);
    procedure teClaveEnter(Sender: TObject);
    procedure teClaveExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure MostrarValores;
  public
    { Public declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); Override;
  end;

var
  FDAccesoUsuario: TFDAccesoUsuario;

implementation

{$R *.dfm}

uses
  CVariables;

procedure TFDAccesoUsuario.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TFDAccesoUsuario.btnAceptarClick(Sender: TObject);
begin
  // Cierre del Form
  Close;
  ModalResult:= mrOk;
end;

procedure TFDAccesoUsuario.btnCancelarClick(Sender: TObject);
begin
  Close;
  ModalResult:= mrCancel;
end;

procedure TFDAccesoUsuario.cbbAliasPropertiesChange(Sender: TObject);
begin
  teUsuario.Text:= arDataConexion[cbbAlias.ItemIndex].sBDUser;
  teClave.Text:= arDataConexion[cbbAlias.ItemIndex].sBDPass;
  MostrarValores;
end;

procedure TFDAccesoUsuario.FormCreate(Sender: TObject);
var
  i: Integer;
begin
//  if FileExists( 'recursos\ComerPassword.emf' ) then
//    Image1.Picture.LoadFromFile('recursos\ComerPassword.emf');
  if FileExists( 'recursos\cabecera_final.bmp' ) then
    cxImage1.Picture.LoadFromFile('recursos\Bonnysa Agroalimentaria.png');

  cbbAlias.Properties.Sorted := False;
  for i:= 0 to iBDCount - 1 do
  begin
    cbbAlias.Properties.Items.Add(  arDataConexion[i].sDescripcion );
  end;

  cbbAlias.ItemIndex := 0;
  teUsuario.Text:= arDataConexion[0].sBDUser;
  teClave.Text:= arDataConexion[0].sBDPass;
end;

procedure TFDAccesoUsuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Tecla ENTER - Salta a otro campo de edición
  //Excepto cuando estamos sobre un boton
  if Key = #$0D then //vk_return
  begin
{
    //Si los campos de texto estan completos pulsamos sobre el boton
    if (Trim(teUsuario.Text) <> '') and
      (Trim(teClave.Text) <> '') then
    begin
      btnAceptarClick(btnAceptar);
      Exit;
    end;
}    
    Key := #0;
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end
  else
    if Key = #$1B then //vk_escape
    begin
      btnCancelarClick(btnCancelar);
    end;

end;

procedure TFDAccesoUsuario.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f1 then
  begin
    btnAceptarClick(btnAceptar);
  end;
end;

procedure TFDAccesoUsuario.FormShow(Sender: TObject);
begin
  if teUsuario.Text = 'Introduce Usuario' then
    teUsuario.Text := '';
  if teClave.Text = 'Introduce Clave' then
    teClave.Text := '';

  MostrarValores;
  teVersion.Text := 'Versión'  + ' ' + gsAplicVersion;
end;

procedure TFDAccesoUsuario.MostrarValores;
begin
  if teUsuario.Text = '' then
  begin
    teUsuario.Text := 'Introduce Usuario';
    teUsuario.Style.Font.Color := clBtnShadow;
  end
  else
    teUsuario.Style.Font.Color := clNone;
  if teClave.Text = '' then
  begin
    teClave.Text := 'Introduce Clave';
    teClave.Style.Font.Color := clBtnShadow;
  end
  else
    teClave.Style.Font.Color := clNone;
end;

procedure TFDAccesoUsuario.teClaveEnter(Sender: TObject);
begin
  if teClave.Text = 'Introduce Clave' then
  begin
    teClave.Text := '';
    teClave.Style.Font.Color := clNone;
  end
end;

procedure TFDAccesoUsuario.teClaveExit(Sender: TObject);
begin
  if teClave.Text = '' then
  begin
    teClave.Text := 'Introduce Clave';
    teClave.Style.Font.Color := clBtnShadow;
  end;
end;

procedure TFDAccesoUsuario.teUsuarioEnter(Sender: TObject);
begin
  if teUsuario.Text = 'Introduce Usuario' then
  begin
    teUsuario.Text := '';
    teUsuario.Style.Font.Color := clNone;
  end
end;

procedure TFDAccesoUsuario.teUsuarioExit(Sender: TObject);
begin
  if teUsuario.Text = '' then
  begin
    teUsuario.Text := 'Introduce Usuario';
    teUsuario.Style.Font.Color := clBtnShadow;
  end;
end;

end.
