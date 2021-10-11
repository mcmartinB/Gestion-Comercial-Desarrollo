{NOTAS: Los gastos de transitos s�lo se restan para el centro 6 producto E}
unit LiquidaFrutaEntradasSalidasFD;

interface




uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, Db, ActnList, ComCtrls,
  BEdit, Grids, DBGrids, BGrid, BSpeedButton, BGridButton, BCalendarButton,
  BCalendario, DError, dbtables, QuickRpt;

type
  TFDLiquidaFrutaEntradasSalidas = class(TForm)
    ListaAcciones: TActionList;
    BAceptar: TAction;
    BCancelar: TAction;
    ADesplegarRejilla: TAction;
    CalendarioFlotante: TBCalendario;
    RejillaFlotante: TBGrid;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BGBCentro: TBGridButton;
    LCentro: TLabel;
    BGBEmpresa: TBGridButton;
    LEmpresa: TLabel;
    LProducto: TLabel;
    BGBProducto: TBGridButton;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BCBDesde: TBCalendarButton;
    BCBHasta: TBCalendarButton;
    MEDesde: TBEdit;
    MEHasta: TBEdit;
    STCentro: TStaticText;
    STProducto: TStaticText;
    STEmpresa: TStaticText;
    EEmpresa: TBEdit;
    ECentro: TBEdit;
    EProducto: TBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    ECosteProduccion: TBEdit;
    ECosteAdministrativo: TBEdit;
    Label3: TLabel;
    ECosteComercial: TBEdit;
    Label6: TLabel;
    ECosechero: TBEdit;
    Label7: TLabel;
    cbxAbonos: TCheckBox;
    cbxLiquidaDefinitiva: TCheckBox;
    rbPeriodo: TRadioButton;
    rbPorMes: TRadioButton;
    rbPorSemana: TRadioButton;
    procedure BBCancelarClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADesplegarRejillaExecute(Sender: TObject);
    procedure PonNombre(Sender: TObject);
    procedure EProductoChange(Sender: TObject);

  public
    { Public declarations }
  private
    iTipoPeriodo: Integer;
    procedure LiquidarFrutaEntradaSalida;
    function  VerificarFechas( var SMsg: string ): Boolean;

  public
  end;

implementation

uses CVariables, CAuxiliarDB, UDMBaseDatos, CGestionPrincipal, bSQLUtils,
  UDMAuxDB, bMath, DateUtils, bDialogs, LiquidaFrutaEntradasSalidasDM;


{$R *.DFM}

procedure TFDLiquidaFrutaEntradasSalidas.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then Close;
end;

procedure AddLine(var AText: string; ALine: string);
begin
  if Trim(AText) <> '' then
  begin
    AText := AText + #13 + #10 + ALine;
  end
  else
  begin
    AText := ALine;
  end;
end;

procedure SetFocusNil(var AFocus: TWinControl; AControl: TWinControl);
begin
  if AFocus = nil then AFocus := AControl;
end;


function EstaGastoTransitoAsignado(const AEmpresa, ACentro, AProducto: string;
  const AFechaIni, AFechaFin: TDateTime ): boolean;
begin
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_transitos_c, frf_transitos_l ');
    SQL.Add(' where empresa_tc = :empresa ');
    SQL.Add(' and centro_tc = :centro ');
    SQL.Add(' and fecha_tc between :fechaini and :fechafin ');
    SQL.Add(' and status_gastos_tc = ''N'' ');
    SQL.Add(' and empresa_tl = :empresa ');
    SQL.Add(' and centro_tl = :centro ');
    SQL.Add(' and fecha_tl = fecha_tc ');
    SQL.Add(' and referencia_tl = referencia_tc ');
    SQL.Add(' and producto_tl = :producto ');
    ParamByname('empresa').AsString := AEmpresa;
    ParamByname('centro').AsString := ACentro;
    ParamByname('producto').AsString := AProducto;
    ParamByname('fechaini').AsDate := AFechaIni;
    ParamByname('fechafin').AsDate := AFechaFin;
    Open;
    result:= IsEmpty;
    Close;
  end;
end;

function EstaGastoEnvasadoGrabado(const AEmpresa, ACentro, AProducto: string;
  const AFechaIni, AFechaFin: TDateTime; var AMsg: string): boolean;
var
  sEnvase: string;
  iDia, iMes, iAnyo: word;
begin
  AMsg:= '';
  result := true;
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add('  select distinct centro_salida_sl, producto_base_p, envase_sl, min(fecha_sl) fecha');
    SQL.Add('  from   frf_salidas_l, frf_productos ');
    SQL.Add('  where empresa_sl  =  :empresa ');
    SQL.Add('  and centro_origen_sl  =  :centro ');
    SQL.Add('  and fecha_sl between :fechaini and :fechafin ');
    SQL.Add('  and producto_sl = :producto ');
    SQL.Add('  and empresa_p  =  :empresa ');
    SQL.Add('  and producto_p = producto_sl ');
    SQL.Add('  and not exists ');
    SQL.Add(' ( ');
    SQL.Add('          select ( material_ec + coste_ec ) coste_ec ');
    SQL.Add('          from frf_env_costes ');
    SQL.Add('          where empresa_ec  =  :empresa ');
    SQL.Add('          and centro_ec  =  centro_salida_sl ');
    SQL.Add('          and producto_base_ec = producto_base_p ');
    SQL.Add('          and envase_ec = envase_sl ');
    SQL.Add(' ) ');
    SQL.Add('  group by 1,2,3 ');
    SQL.Add('  order by 1,2,3 ');
    ParamByname('empresa').AsString := AEmpresa;
    ParamByname('centro').AsString := ACentro;
    ParamByname('producto').AsString := AProducto;
    ParamByname('fechaini').AsDate := AFechaIni;
    ParamByname('fechafin').AsDate := AFechaFin;

    if OpenQuery(DMAuxDB.QAux) then
    begin
      sEnvase := '';
      if not isEmpty then
      begin
        DecodeDate( Fields[3].AsDateTime, iDia, iMes, iAnyo );
        sEnvase := '''' + Fields[0].AsString + '/' + Fields[2].AsString + '/' + IntToStr(iMes) + '''';
        Next;
        while not Eof do
        begin
          DecodeDate( Fields[3].AsDateTime, iDia, iMes, iAnyo );
          sEnvase := sEnvase + ',''' + Fields[0].AsString + '/' + Fields[2].AsString + '/' + IntToStr(iMes) + '''';
          Next;
        end;
      end;
      Close;
      if sEnvase <> '' then
        raise Exception.Create('No existe ning�n precio para el centro/producto/envase/mes:  (' + sEnvase + ')');
    end;

    SQL.Clear;
    SQL.Add('  select distinct centro_salida_sl, producto_base_p, envase_sl, ( YEAR(fecha_sl) * 100 ) + MONTH(fecha_sl) mes ');
    SQL.Add('  from   frf_salidas_l, frf_productos ');
    SQL.Add('  where empresa_sl  =  :empresa ');
    SQL.Add('  and centro_origen_sl  =  :centro ');
    SQL.Add('  and fecha_sl between :fechaini and :fechafin ');
    SQL.Add('  and producto_sl = :producto ');
    SQL.Add('  and empresa_p  =  :empresa ');
    SQL.Add('  and producto_p = producto_sl ');
    SQL.Add('  and not exists ');
    SQL.Add(' ( ');
    SQL.Add('          select ( material_ec + coste_ec ) coste_ec ');
    SQL.Add('          from frf_env_costes ');
    SQL.Add('          where anyo_ec  =  YEAR(fecha_sl) ');
    SQL.Add('          and mes_ec  =  MONTH(fecha_sl) ');
    SQL.Add('          and empresa_ec  =  :empresa ');
    SQL.Add('          and centro_ec  =  centro_salida_sl ');
    SQL.Add('          and producto_base_ec = producto_base_p ');
    SQL.Add('          and envase_ec = envase_sl ');
    SQL.Add(' ) ');
    SQL.Add('  order by 1,2,3,4 ');
    ParamByname('empresa').AsString := AEmpresa;
    ParamByname('centro').AsString := ACentro;
    ParamByname('producto').AsString := AProducto;
    ParamByname('fechaini').AsDate := AFechaIni;
    ParamByname('fechafin').AsDate := AFechaFin;

    if OpenQuery(DMAuxDB.QAux) then
    begin
      sEnvase := '';
      if not isEmpty then
      begin
        sEnvase := '''' + Fields[0].AsString + '/' + Fields[1].AsString + '/' + Fields[2].AsString + '/' + Fields[3].AsString + '''';
        Next;
        while not Eof do
        begin
          sEnvase := sEnvase + ',''' + Fields[0].AsString + '/' + Fields[1].AsString + '/' + Fields[2].AsString + '/' + Fields[3].AsString + '''';
          Next;
        end;
        result := false;
        AMsg:= sEnvase;
      end
      else
      begin
        result := True;
      end;
      Close;
    end
    else
    begin
      result := false;
    end;
  end;
end;

function TFDLiquidaFrutaEntradasSalidas.VerificarFechas( var SMsg: string ): Boolean;
var
  dIni, dFin: TDateTime;
  iDia, iMes, iAnyo: Word;
begin
  if not TryStrToDate(MEDesde.Text, dIni) then
  begin
    AddLine(SMsg, 'Falta la fecha de inicio o es incorrecta.');
    VerificarFechas := False;
  end
  else
  if not TryStrToDate(MEHasta.Text, dFin) then
  begin
    AddLine(SMsg, 'Falta la fecha de fin o es incorrecta.');
    VerificarFechas := False;
  end
  else
  if dFin < dIni then
  begin
    AddLine(SMsg, 'La fecha de inicio debe ser menor que la de fin.');
    VerificarFechas := False;
  end
  else
  begin
    if iTipoPeriodo = 1 then
    begin
      DecodeDate( dIni, iAnyo, iMes, iDia);
      if iDia <> 1 then
      begin
        AddLine(SMsg, 'El dia de inicio debe el priemro del mes.');
        VerificarFechas := false;
      end
      else
      begin
        DecodeDate( dFin + 1, iAnyo, iMes, iDia);
        if iDia <> 1 then
        begin
          AddLine(SMsg, 'El dia de fin debe ser el ultimo del mes.');
          VerificarFechas := false;
        end
        else
        begin
          VerificarFechas := True;
        end;
      end;
    end
    else
    if iTipoPeriodo = 2 then
    begin
      if DayOfWeek(dini) <> 2 then
      begin
        AddLine(SMsg, 'El dia de inicio debe ser lunes.');
        VerificarFechas := false;
      end
      else
      if DayOfWeek(dfin) <> 1 then
      begin
        AddLine(SMsg, 'El dia de fin debe ser domingo.');
        VerificarFechas := false;
      end
      else
      begin
        VerificarFechas := True;
      end;
    end
    else
    begin
      VerificarFechas:= True;
    end;
  end;
end;

procedure TFDLiquidaFrutaEntradasSalidas.BBAceptarClick(Sender: TObject);
var
  aux, sAux: string;
  fechasCorrectas: boolean;
  ControlError: TWinControl;
begin
  if not CerrarForm(true) then Exit;

  aux := '';
  ControlError := nil;
  //Comprobar si los campos se han rellenado correctamente
  if EEmpresa.Text = '' then
  begin
    AddLine(aux, 'El c�digo de empresa es de obligada inserci�n.');
    SetFocusNil(ControlError, EEmpresa);
  end;
  if ECentro.Text = '' then
  begin
    AddLine(aux, 'El c�digo de centro es de obligada inserci�n.');
    SetFocusNil(ControlError, ECentro);
  end;
  if EProducto.Text = '' then
  begin
    AddLine(aux, 'El c�digo de producto es de obligada inserci�n.');
    SetFocusNil(ControlError, EProducto);
  end;

  if rbPeriodo.Checked  then
    iTipoPeriodo:= 0
  else
  if rbPorMes.Checked  then
    iTipoPeriodo:= 1
  else
  if rbPorSemana.Checked  then
    iTipoPeriodo:= 2;

  if not VerificarFechas( Aux ) then
    SetFocusNil(ControlError, EProducto);

  if Trim(Aux) <> '' then
  begin
    ShowError(Aux);
    ActiveControl := ControlError;
    Exit;
  end;

  if ECosteComercial.Text = '' then
  begin
    ECosteComercial.Text := '0';
  end;
  if ECosteAdministrativo.Text = '' then
  begin
    ECosteAdministrativo.Text := '0';
  end;
  if ECosteProduccion.Text = '' then
  begin
    ECosteProduccion.Text := '0';
  end;


  //Que todos los costes de envasado esten grabados
  //MAS TRABAJO COMUN ????

  try
    if not (EstaGastoEnvasadoGrabado(EEmpresa.Text, ECentro.Text, EProducto.Text,
      StrToDate(MEDesde.Text), StrToDate(MEHasta.Text), sAux) or
      Preguntar('Falta grabar el coste de algun envase para el mes en curso. �Seguro que desea continuar?' + #13 + #10 +
                '(Si continua se utilizara el coste del envase de meses anteriores.)' + #13 + #10 +
                'Centro/Producto/Envase/mes:  (' + sAux + ')' )) then
    begin
      Exit;
    end;
  except
    on e: exception do
    begin
      ShowMessage(e.Message);
      Exit;
    end;
  end;

  //Que los gastos de los tansitos esten grabados
  if not EstaGastoTransitoAsignado(EEmpresa.Text, ECentro.Text, EProducto.Text, StrToDate(MEDesde.Text), StrToDate(MEHasta.Text)) then
  begin
    if cbxLiquidaDefinitiva.Checked then
    begin
      ShowMessage('No se puede sacar la liquidaci�n definitiva si no estan asignados los gastos de los tr�nsitos.');
    end
    else
    begin
      if Preguntar('Faltan por asignar los gastos de los transitos. �Seguro que desea continuar?' ) then
        LiquidarFrutaEntradaSalida;
    end;
  end
  else
  begin
    LiquidarFrutaEntradaSalida;
  end;
end;


procedure TFDLiquidaFrutaEntradasSalidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BEMensajes('');
  gRF := nil;
  gCF := nil;

  FormType := tfDirector;
  BHFormulario;

  FreeAndNil( DMLiquidaFrutaEntradasSalidas );
  Action := caFree;
end;

procedure TFDLiquidaFrutaEntradasSalidas.FormCreate(Sender: TObject);
begin
  FormType := tfOther;
  BHFormulario;

  EEmpresa.Tag := kEmpresa;
  ECentro.Tag := kCentro;
  EProducto.Tag := kProducto;
  MEDesde.Tag := kCalendar;
  MEHasta.Tag := kCalendar;

  EEmpresa.Text := '080';
  ECentro.Text := '1';
  EProducto.Text := '';
  MEDesde.Text := DateToStr(Date);
  MEHasta.Text := DateTostr(Date);
  CalendarioFlotante.Date := Date;
  gRF := rejillaFlotante;
  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;
  gCF := calendarioFlotante;

  Top := 1;

  DMLiquidaFrutaEntradasSalidas:= TDMLiquidaFrutaEntradasSalidas.Create( Self );
end;

procedure TFDLiquidaFrutaEntradasSalidas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFDLiquidaFrutaEntradasSalidas.ADesplegarRejillaExecute(Sender: TObject);
begin
  case ActiveControl.Tag of
    kEmpresa: DespliegaRejilla(BGBEmpresa);
    kProducto: DespliegaRejilla(BGBProducto, [EEmpresa.Text]);
    kCentro: DespliegaRejilla(BGBCentro, [EEmpresa.Text]);
    kCalendar:
      begin
        if MEDesde.Focused then
          DespliegaCalendario(BCBDesde)
        else
          DespliegaCalendario(BCBHasta);
      end;
  end;
end;

procedure TFDLiquidaFrutaEntradasSalidas.PonNombre(Sender: TObject);
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
        STCentro.Caption := desCentro(Eempresa.Text, Ecentro.Text);
      end;
    kProducto: STProducto.Caption := desProducto(Eempresa.Text, Eproducto.Text);
    kCentro: STCentro.Caption := desCentro(Eempresa.Text, Ecentro.Text);
  end;
end;

procedure TFDLiquidaFrutaEntradasSalidas.LiquidarFrutaEntradaSalida;
begin
  DMLiquidaFrutaEntradasSalidas.LiquidarFrutaEntradaSalida(EEmpresa.Text, ECentro.Text, EProducto.Text, ECosechero.Text,
            MEDesde.Text, MEHasta.Text, ECosteComercial.Text, ECosteProduccion.Text,
            ECosteAdministrativo.Text, False, cbxAbonos.Checked, cbxLiquidaDefinitiva.Checked, iTipoPeriodo );
end;

procedure TFDLiquidaFrutaEntradasSalidas.EProductoChange(Sender: TObject);
begin
  PonNombre(Sender);
end;


end.
