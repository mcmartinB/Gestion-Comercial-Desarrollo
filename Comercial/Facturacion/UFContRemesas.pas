unit UFContRemesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  CMaestroDetalle, Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, dxCore,
  cxDateUtils, Menus, ActnList, cxCheckBox, cxEdit, ComCtrls,
  StdCtrls, cxButtons, SimpleSearch, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGroupBox, Gauges, ExtCtrls, cxTextEdit,

  dxSkinsCore, dxSkinBlue,  dxSkinFoggy, dxSkinBlack, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFContRemesas = class(TForm)
    tx1: TcxTextEdit;
    pnl1: TPanel;
    Gauge1: TGauge;
    gbCriterios: TcxGroupBox;
    lb2: TcxLabel;
    txDesdeRemesa: TcxTextEdit;
    lb3: TcxLabel;
    txHastaRemesa: TcxTextEdit;
    lb4: TcxLabel;
    deDesdeFecha: TcxDateEdit;
    lbCliente: TcxLabel;
    txCliente: TcxTextEdit;
    txDesCliente: TcxTextEdit;
    lb5: TcxLabel;
    txEmpresa: TcxTextEdit;
    txDesEmpresa: TcxTextEdit;
    lb1: TcxLabel;
    deHastaFecha: TcxDateEdit;
    btAceptar: TcxButton;
    btCancelar: TcxButton;
    lb7: TcxLabel;
    lbFacturas: TcxLabel;
    txRuta: TcxTextEdit;
    lb6: TcxLabel;
    btnRuta: TcxButton;
    ActionList: TActionList;
    ACancelar: TAction;
    AAceptar: TAction;
    ssCliente: TSimpleSearch;
    ssEmpresa: TSimpleSearch;
    procedure FormCreate(Sender: TObject);
    procedure btAceptarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PonNombre(Sender: TObject);
    procedure btnRutaClick(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure AAceptarExecute(Sender: TObject);
    procedure txClientePropertiesChange(Sender: TObject);
    procedure ssEmpresaAntesEjecutar(Sender: TObject);

  private
    iNumRemesas, iRemesaIni, iRemesaFin: Integer;
    dFechaIni, dFechaFin: TDateTime;

    procedure RellenarDatosIni;
    function Parametros: boolean;
    function Contabilizar: boolean;
    function RemesasNoProcesadas: integer;
    procedure CreaQGrupoP;
    function EjecutaQGrupoP: boolean;

  public

  end;

var
  FContRemesas: TFContRemesas;

implementation

{$R *.dfm}
uses DError, Principal, UDMAuxDB, bMath, CGlobal, UDMBaseDatos, CAuxiliarDB, FileCtrl, UDFactura,
     CContRemesa, CGestionPrincipal, CVariables, BonnyQuery, CFactura;

procedure TFContRemesas.FormCreate(Sender: TObject);
begin
  FormType := tfOther;
  BHFormulario;

  CrearBuffers;
  CrearConsultas;
end;

procedure TFContRemesas.btAceptarClick(Sender: TObject);
begin
  //Datos del formulario correctos
  if not Parametros then exit;

  LimpiarBuffers;
  CreaQGrupoP;

  NombresFicheros(txRuta.Text, txEmpresa.Text);
  if Contabilizar then
  begin
    GrabarFichero(txRuta.Text);

    Gauge1.Progress := iRemConta;
    if iRemConta <> iNumRemesas then
      showmessage('Proceso de Contabilización finalizado con ERRORES.' + #13 + #10 +
                  IntToStr(iNumRemesas - Gauge1.Progress) + ' remesa/s no contabilizada/s.')
    else
      showmessage('Proceso de Contabilización finalizado correctamente.');
  end;

//  RellenarDatosIni;

end;

function TFContRemesas.Parametros: boolean;
begin
  Result := False;

  if ( txEmpresa.Text <> '' ) and ( txDesEmpresa.Text  = '' ) then
  begin
    txEmpresa.SetFocus;
    ShowError('El codigo de empresa es incorrecto.');
    exit;
  end;

  if ( txCliente.Text <> '' ) and ( txDesCliente.Text  = '' ) then
  begin
    txCliente.SetFocus;
    ShowError('El codigo del cliente es incorrecto.');
    exit;
  end;

  if not TryStrToInt( Trim( txDesdeRemesa.Text ), iRemesaIni ) then
  begin
    txDesdeRemesa.SetFocus;
    ShowError('Falta el número de la remesa inicial o es incorrecto.');
    exit;
  end;

  if not TryStrToInt( Trim( txHastaRemesa.Text ), iRemesaFin ) then
  begin
    txHastaRemesa.SetFocus;
    ShowError('Falta el número de la remesa final o es incorrecto.');
    exit;
  end;

  if iRemesaIni > iRemesaFin then
  begin
    txDesdeRemesa.SetFocus;
    ShowError('Rango de remesas incorrecto.');
    exit;
  end;

  if not TryStrToDate( Trim( deDesdeFecha.Text ), dFechaIni ) then
  begin
    deDesdeFecha.SetFocus;
    ShowError('Falta Fecha de Remesa inicial.');
    exit;
  end;

  if not TryStrToDate( Trim( deHastaFecha.Text ), dFechaFin ) then
  begin
    deHastaFecha.SetFocus;
    ShowError('Falta Fecha de Remesa final.');
    exit;
  end;

  if dFechaIni > dFechaFin then
  begin
    deDesdeFecha.SetFocus;
    ShowError('Rango de fechas incorrecto.');
    exit;
  end;

  if not DirectoryExists( txRuta.Text ) then
  begin
    txRuta.SetFocus;
    ShowError('La ruta destino no es valida.');
    exit;
  end;

  Result := true;
end;

function TFContRemesas.Contabilizar: boolean;
var
    //iRango: Integer;
    sMsg: string;
begin
  Result := true;
  iNumRemesas := RemesasNoProcesadas;
  if iNumRemesas > 0 then
  begin
    //iRango := (iFactFin + 1) - iFactIni;
    sMsg := ' Hay ' + IntToStr( iNumRemesas ) + ' remesas no contabilizadas ' + #13 + #10 +
           ' ¿Continuar con el proceso de Contabilización de Remesas? ';
    if MessageDlg( sMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Gauge1.maxvalue := iNumRemesas;
      Lbfacturas.Caption:= 'Total remesas: '+formatfloat(',0',iNumRemesas);

      EjecutaQGrupoP;
      ContabilizarRemesas(DMBaseDatos.DBBaseDatos);
    end
    else
    begin
      ShowMessage('Operación cancelada por el usuario.');
      Result := false;
    end;
  end
  else
  begin
    ShowMessage('No hay remesas a contabilizar dentro del rango seleccionado.');
    Result := False;
  end;

end;

function TFContRemesas.RemesasNoProcesadas: integer;
var QNumRemesas: TBonnyQuery;
begin
  QNumRemesas := TBonnyQuery.Create(Self);
  with QNumRemesas do
  try
    SQL.Add('  select count(*) from tremesas_cab, frf_empresas ');
    SQL.Add('   where 1= 1 ');
    if txEmpresa.text <> '' then
      SQL.Add(' and empresa_remesa_rc = :empresa ');
    if txCliente.Text <> '' then
      SQL.Add('   and cod_cliente_rc = :cliente ');
    SQL.Add('   and n_remesa_rc between :remesaIni and :remesaFin ');
    SQL.Add('   and fecha_remesa_rc between :fechaIni and :fechaFin ');
    SQL.Add('   and situacion_rc = 30 ');            //Situacion Pdte. Contabilizar
    SQL.Add('   and  empresa_e = empresa_remesa_rc ');
    SQL.Add('   and  contabilizar_remesas_e = 1 ');

    if txEmpresa.Text <> ''  then
      ParamByName('empresa').AsString := txEmpresa.Text;
    if txCliente.Text <> '' then
      ParamByName('cliente').AsString := txCliente.Text;
    ParamByName('remesaIni').AsInteger := iRemesaIni;
    ParamByName('remesaFin').AsInteger := iRemesaFin;
    ParamByName('fechaIni').AsDateTime := dFechaIni;
    ParamByName('fechaFin').AsDateTime := dFechaFin;

    Open;
    Result := Fields[0].AsInteger;
    Close;

  finally
    free;
  end;

end;


procedure TFContRemesas.ssEmpresaAntesEjecutar(Sender: TObject);
begin
  ssEmpresa.SQLAdi := ' contabilizar_emp = 1';
end;

procedure TFContRemesas.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFContRemesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;

  CerrarTablas;
  BorrarListas;

  BEMensajes('');
  Action := caFree;
end;

procedure TFContRemesas.FormShow(Sender: TObject);
begin
  RellenarDatosIni;
  txRuta.Text := ObtenerRuta;
end;

procedure TFContRemesas.RellenarDatosIni;
begin
   //Borrar contenido de las tablas
//  Limpiar;

  //Rellenamos datos iniciales
  if  CGlobal.gProgramVersion = CGlobal.pvBAG then
    txEmpresa.Text := 'BAG'
  else
    txEmpresa.Text := 'SAT';
  txDesdeRemesa.Text := '1';
  txHastaRemesa.Text := '999999';
  deDesdeFecha.Text := DateToStr(Date);
  deHastaFecha.Text := DateToStr(Date);

  Gauge1.progress:=0;
  Gauge1.maxvalue:=0;
  lbFacturas.Caption := 'Total Remesas: 0';

  txEmpresa.SetFocus;

end;

procedure TFContRemesas.txClientePropertiesChange(Sender: TObject);
begin
  if txCliente.Text = '' then
    txDesCliente.Text := 'TODOS LOS CLIENTES'
  else
    txDesCliente.Text := desCliente(txCliente.Text);
end;

procedure TFContRemesas.FormKeyDown(Sender: TObject; var Key: Word;
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
  VK_ESCAPE:
    begin
      btCancelarClick(Self);
    end;
  end;
end;

procedure TFContRemesas.PonNombre(Sender: TObject);
begin
  txDesEmpresa.Text := destEmpresa(txEmpresa.Text);
  if txEmpresa.Text = '' then
    txDesEmpresa.Text := 'TODAS LAS EMPRESAS'
  else
    txDesEmpresa.Text := destEmpresa(txEmpresa.Text);

  if txCliente.Text = '' then
    txDesCliente.Text := 'TODOS LOS CLIENTES'
  else
    txDesCliente.Text := desCliente(txCliente.Text);

end;

procedure TFContRemesas.CreaQGrupoP;
begin
  QGrupoP := TBonnyQuery.Create(Self);
  with QGrupoP do
  begin
    SQL.Add(' select * from tremesas_cab, frf_empresas ');
    SQL.Add('  where 1= 1 ');
    if txEmpresa.text <> '' then
      SQL.Add('  and empresa_remesa_rc = :empresa ');
    if txCliente.Text <> '' then
      SQL.Add('  and cod_cliente_rc = :cliente ');
    SQL.Add('    and n_remesa_rc between :remesaIni and :remesaFin ');
    SQL.Add('    and fecha_remesa_rc between :fechaIni and :fechaFin ');
    SQL.Add('    and situacion_rc = 30 ');           //Situacion Pdte. Contabilizar
    SQL.Add('    and  empresa_e = empresa_remesa_rc ');
    SQL.Add('    and  contabilizar_remesas_e = 1 ');

    SQL.Add('  order by empresa_remesa_rc, YEAR(fecha_remesa_rc), n_remesa_rc, fecha_remesa_rc ');

    Prepare;
  end;
end;

function TFContRemesas.EjecutaQGrupoP: boolean;
begin
  with QGrupoP do
  begin
    if Active then
      Close;

    if txEmpresa.Text <> '' then
      ParamByName('empresa').AsString := txEmpresa.Text;
    if txCliente.Text <> '' then
      ParamByName('cliente').AsString := txCliente.Text;
    ParamByName('remesaIni').AsInteger := iRemesaIni;
    ParamByName('remesaFin').AsInteger := iRemesaFin;
    ParamByName('fechaIni').AsDateTime := dFechaIni;
    ParamByName('fechaFin').AsDateTime := dFechafin;

    Open;
    Result := not IsEmpty;
  end;
end;

procedure TFContRemesas.btnRutaClick(Sender: TObject);
var dir: string;
begin
  dir := txRuta.Text;
  if SelectDirectory(' Selecciona directorio destino.', 'c:\', dir) then
  begin
    if copy(dir, length(dir) - 1, length(dir)) <> '\' then
    begin
      txRuta.Text := dir + '\';
      txRuta.Hint:= txRuta.Text;
    end
    else
    begin
      txRuta.Text := dir;
    end;
  end;
  Application.BringToFront;
end;



procedure TFContRemesas.ACancelarExecute(Sender: TObject);
begin
  btCancelar.Click;
end;

procedure TFContRemesas.AAceptarExecute(Sender: TObject);
begin
  btAceptar.Click;
end;

end.
