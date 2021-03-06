unit UFCalculoPosei;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, Db, ActnList,
  ComCtrls, CGestionPrincipal, BCalendario, Grids,
  DBGrids, BGrid, BCalendarButton, BEdit, BSpeedButton, BGridButton,
  DBTables, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlueprint, dxSkinFoggy,
  dxSkinMoneyTwins, cxCheckBox, dxSkinBlue, UDMCalculoPosei, dxSkinBlack,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFCalculoPosei = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
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
    cxDefinitivo: TcxCheckBox;
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
    lblMsg: TLabel;
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

    function YaEsDefinitivo:Boolean;

  private
    { Private declarations }
    iAnyo, iMes, iDia, iSemestre: integer;
    function ValidarParametros: Boolean;

  public
    { Public declarations }
    sEmpresa, sCentro, sAgrupacion, sProducto, sDefinitivo: string;
    dIni, dFin: TDateTime;
  end;

implementation

uses  DPreview, UDMAuxDB, Principal, UDMBaseDatos, CGlobal, CReportes, CVariables, bTimeUtils,
      CAuxiliarDB;


{$R *.DFM}

procedure TFCalculoPosei.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then Close;
end;

procedure TFCalculoPosei.CambioSemestre;
var dDesde, dHasta: TDateTime;
begin
  if Length(EAnyo.Text) = 4 then
  begin
    if rbPrimero.Checked then
    begin
      dDesde := EncodeDate(iAnyo,1,1);
      dHasta := EncodeDate(iAnyo,6,30);
      iSemestre := 1;
    end
    else
    begin
      dDesde := EncodeDate(iAnyo,7,1);
      dHasta := EncodeDate(iAnyo,12,31);
      iSemestre := 2;
    end;

    MEDesde.Text :=  DateToStr(dDesde);
    MEHasta.Text :=  DateToStr(dHasta);

  end;
end;

procedure TFCalculoPosei.eAgrupacionChange(Sender: TObject);
begin
  if Trim( eAgrupacion.Text ) = '' then
    STAgrupacion.Caption := 'TODAS LAS AGRUPACIONES'
  else
    STAgrupacion.Caption := desAgrupacion(eAgrupacion.Text);
end;

function TFCalculoPosei.ValidarParametros: Boolean;
begin
  Result:= False;

  sempresa:= EEmpresa.Text;
  scentro:= ECentro.Text;
  sagrupacion:=eAgrupacion.Text;
  sproducto:= EProducto.Text;

  //Buscar si para el filtro tenemos algo en Definitivo
  if YaEsDefinitivo then
  begin
    MessageDlg('ATENCIO! Alguno de los productos seleccionados ya tienen un POSEI Definitivo.', mtError, [mbOk], 0);
    eAgrupacion.SetFocus;
    Exit;
  end;

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
  //Tenemos que seleccionar o agrupacion o producto
  if (eAgrupacion.Text = '') and (eProducto.Text = '') then
  begin
    MessageDlg('ATENCION! Se debe seleccionar un Producto o una Agrupacion de Producto  ...', mtError, [mbOk], 0);
    eAgrupacion.SetFocus;
    Exit;
  end;

  result:= True;
end;

function TFCalculoPosei.YaEsDefinitivo: Boolean;
begin
  with DMAuxDB.QAux do
  try
    if Active then
      Close;
    SQL.Clear;

    SQL.Add(' select * from frf_posei                                                                   ');
    SQL.Add(' where anyo_p = :anyo                                                                      ');
    SQL.Add('   and semestre_p = :semestre                                                              ');
    SQL.Add('   and definitivo_p = ''S''                                                                ');
    if sAgrupacion <> '' then
      SQL.Add('   and producto_p in(select producto_a from frf_agrupacion where codigo_a = :agrupacion) ');
    if sProducto <> '' then
      SQL.Add('   and producto_p = :producto                                                            ');

    ParamByName('anyo').AsInteger := iAnyo;
    ParamByName('semestre').AsInteger := iSemestre;
    if sAgrupacion <> '' then
      ParamByName('agrupacion').AsString := sAgrupacion;
    if sProducto <> '' then
      ParamByName('producto').AsString := sProducto;

    Open;

    result := (IsEmpty = False);
  finally
    Close;
  end;
end;

procedure TFCalculoPosei.rbCambioSemClick(Sender: TObject);
begin
  CambioSemestre;
end;

procedure TFCalculoPosei.BBAceptarClick(Sender: TObject);
var sTexto: string;
begin
  if not CerrarForm(true) then
    Exit;

  if ValidarParametros then
  begin
    if cxDefinitivo.Checked then
    begin
      if sAgrupacion <> '' then
        sTexto := sAgrupacion + ' - ' + desAgrupacion(EAgrupacion.Text)
      else
        sTexto := sProducto + ' - ' + desProducto('', eProducto.Text);

      if MessageDlg('ATENCION! Se va a realizar el c?lculo DEFINITIVO para la Ayuda del POSEI ' + #13 + #10 +
                    sTexto + ' - A?o ' + IntToStr(iAnyo) + ' y Semestre ' + IntToStr(iSemestre) + #13 + #10 + #13 + #10 +
                    '?esta seguro que desea continuar?', mtWarning, [mbYes, mbNo], 0	) = mrNo then
      begin
         EAnyo.SetFocus;
         Exit;
      end;
    end;
    if cxDefinitivo.Checked  then
      sDefinitivo := 'S'
    else
      sDefinitivo := 'N';

    DMCalculoPosei.ObtenerDatos (sEmpresa, sCentro, sAgrupacion, sProducto, dIni, dFin, iAnyo, iSemestre, sDefinitivo, lblMsg);
  end;

  lblMsg.Caption:= '';

end;

procedure TFCalculoPosei.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TFCalculoPosei.FormCreate(Sender: TObject);
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

  lblMsg.Caption:= '';
  lblMsg.Visible:= True;

  eAgrupacionChange(eagrupacion);
  EProductoChange( EProducto );

end;

procedure TFCalculoPosei.FormKeyDown(Sender: TObject; var Key: Word;
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
  end;
end;

procedure TFCalculoPosei.ADesplegarRejillaExecute(Sender: TObject);
begin
  case ActiveControl.Tag of
    kEmpresa: DespliegaRejilla(BGBEmpresa);
    kAgrupacion: DespliegaRejilla(BGBAgrupacion);
    kProducto: DespliegaRejilla(BGBProducto, [EEmpresa.Text]);
    kCentro: DespliegaRejilla(btnCentro, [EEmpresa.Text]);
  end;
end;

procedure TFCalculoPosei.EEmpresaChange(Sender: TObject);
begin
  STEmpresa.Caption := desEmpresa(Eempresa.Text);
  ECentroChange( ECentro );
end;

procedure TFCalculoPosei.EproductoChange(Sender: TObject);
begin
  if EProducto.Text <> '' then
    stProducto.Caption := desProducto( Eempresa.Text, EProducto.Text )
  else
    stProducto.Caption := 'TODOS LOS PRODUCTOS';
end;

procedure TFCalculoPosei.EAnyoChange(Sender: TObject);
begin
  if EAnyo.Text <> '' then
  begin
    iAnyo := StrToInt(EAnyo.Text);
    CambioSemestre;
  end;
end;

procedure TFCalculoPosei.ECentroChange(Sender: TObject);
begin
 stCentro.Caption := desCentro( Eempresa.Text, ECentro.Text )
end;

end.
