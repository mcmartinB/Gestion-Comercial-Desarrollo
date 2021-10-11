unit LFExpediciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ActnList,
  ComCtrls, Db, CGestionPrincipal, BEdit,
  BCalendarButton, BSpeedButton, BGridButton, BCalendario, Grids, DBGrids,
  BGrid, Derror, DBTables;

type
  TFLExpediciones = class(TForm)
    Panel1: TPanel;
    GBFecha: TGroupBox;
    Desde: TLabel;
    ListaAcciones: TActionList;
    BAceptar: TAction;
    BCancelar: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GBEmpresa: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    BGBEmpresa: TBGridButton;
    BGBCentro: TBGridButton;
    BGBProducto: TBGridButton;
    EProducto: TBEdit;
    ECentro: TBEdit;
    EEmpresa: TBEdit;
    STEmpresa: TStaticText;
    STCentro: TStaticText;
    STProducto: TStaticText;
    MEDesde: TBEdit;
    BCBDesde: TBCalendarButton;
    MEHasta: TBEdit;
    BCBHasta: TBCalendarButton;
    RejillaFlotante: TBGrid;
    CalendarioFlotante: TBCalendario;
    ADesplegarRejilla: TAction;
    RGEuropa: TRadioGroup;
    Label4: TLabel;
    Label14: TLabel;
    QListadosExpedicion2: TQuery;
    QListadosExpedicion: TQuery;
    procedure BBAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADesplegarRejillaExecute(Sender: TObject);
    procedure PonNombre(Sender: TObject);
    procedure MEHastaExit(Sender: TObject);
    procedure EHastaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function seleccionar(): boolean;
    function funcTiempo(tipo: Byte; fecha: string): string;
    function TodosLosCampos: Boolean;
  public
    { Public declarations }
    empresa, centro, producto, factura: string;
  end;

var
  Autorizado: boolean;

implementation

uses bDialogs, UDMAuxDB, Principal, CVariables, DPreview, CReportes,
  CAuxiliarDB, LExpediciones, UDMBaseDatos, bTimeUtils, bSQLUtils;

{$R *.DFM}

//                         ****  BOTONES  ****

function TFLExpediciones.TodosLosCampos: Boolean;
begin
  result := not ((Trim(EEmpresa.Text) = '') or (Trim(ECentro.Text) = '') or
    (Trim(EProducto.Text) = '') or (Trim(MEHasta.Text) = '') or
    (Trim(MEDesde.Text) = ''));
end;

procedure TFLExpediciones.BBAceptarClick(Sender: TObject);
begin
  if not TodosLosCampos then
  begin
    Advertir('Faltan campos de obligada inserción ...');
    Exit;
  end;

  if not CerrarForm(true) then Exit;

  empresa := desEmpresa(EEmpresa.Text);
  centro := desCentro(EEmpresa.Text, ECentro.Text);
  producto := desProducto(EEmpresa.Text, EProducto.Text);

  if not seleccionar then
  begin
    Advertir('Problemas al seleccionar los datos del informe.');
    Exit;
  end;

  try
    QListadosExpedicion.Open;
  except
    on e: EDBEngineError do
    begin
      ShowError(e);
      Exit;
    end;
  end;

  //Comprobar que no este vacia la tabla
  if QListadosExpedicion.IsEmpty then
  begin
    QListadosExpedicion.Close;
    QListadosExpedicion.SQL.Clear;
    QListadosExpedicion.SQL.add(' drop table tmp_expediciones ');
    try
      QListadosExpedicion.ExecSQL;
    except
    end;
    ShowError('No se han encontrado datos para los valores introducidos.');
    EEmpresa.SetFocus;
    Exit;
  end;

  //Crear REPORT
  QRLExpediciones := TQRLExpediciones.Create(Application);

  QRLExpediciones.LabelProducto := Trim(STProducto.Caption);
  QRLExpediciones.LabelCentro := 'Centro expedición: ' + Trim(STCentro.Caption);
  QRLExpediciones.LabelSemana := 'Semana nº. ' +
    funcTiempo(1, MEDesde.Text) + '   Del ' +
    funcTiempo(2, MEDesde.Text) + ' al ' +
    funcTiempo(2, MEHasta.Text) + ' de ' +
    funcTiempo(3, MEDesde.Text);
  QRLExpediciones.LabelComunicado := 'Número de orden de comunicación: ' +
    funcTiempo(1, MEDesde.Text) + '/' +
    Copy(funcTiempo(3, MEDesde.Text), 3, 2);
  PonLogoGrupoBonnysa(QRLExpediciones, EEmpresa.Text);
  Preview(QRLExpediciones);
  QListadosExpedicion.Close;
  QListadosExpedicion.SQL.Clear;
  QListadosExpedicion.SQL.add(' drop table tmp_expediciones ');
  try
    QListadosExpedicion.ExecSQL;
  except
  end;
end;

procedure TFLExpediciones.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then Close;
end;

//                          **** FORMULARIO ****

procedure TFLExpediciones.FormCreate(Sender: TObject);
begin
  FormType := tfOther;
  BHFormulario;

  EEmpresa.Tag := kEmpresa;
  ECentro.Tag := kCentro;
  EProducto.Tag := kProducto;
  MEDesde.Tag := kCalendar;
  MEHasta.Tag := kCalendar;
  gRF := rejillaFlotante;
  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;
  gCF := calendarioFlotante;

  EEmpresa.Text:= gsDefEmpresa;
  ECentro.Text:= gsDefCentro;
  EProducto.Text:= gsDefProducto;
  MEDesde.Text := DateTostr(Date);
  MEHasta.Text := DateTostr(Date);
  CalendarioFlotante.Date := Date;
end;

procedure TFLExpediciones.FormActivate(Sender: TObject);
begin
  ActiveControl := EEmpresa;
end;

procedure TFLExpediciones.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFLExpediciones.FormClose(Sender: TObject;
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
  Action := caFree;
end;

//                     ****  CAMPOS DE EDICION  ****

procedure TFLExpediciones.MEHastaExit(Sender: TObject);
begin
  if StrToDate(MEHasta.Text) < StrToDate(MEDesde.Text) then
  begin
    MessageDlg('Debe escribir un rango de fechas correcto',
      mtError, [mbOk], 0);
    MEDesde.SetFocus;
  end;
end;

procedure TFLExpediciones.EHastaExit(Sender: TObject);
begin
   {  if StrToInt(EHasta.Text) < StrToInt(EDesde.Text) then
     begin
          MessageDlg('Debe escribir un rango de cosecheros correcto',
                           mtError,[mbOk],0);
          EDesde.SetFocus;
     end;}
end;

//                      ****  FUNCIONES ESPECIFICAS  ****

procedure TFLExpediciones.ADesplegarRejillaExecute(Sender: TObject);
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

procedure TFLExpediciones.PonNombre(Sender: TObject);
begin
    if (gRF <> nil) then
      if esVisible( gRF ) then
        Exit;
    if (gCF <> nil) then
      if esVisible( gCF ) then
        Exit;
  case TComponent(Sender).Tag of
    kEmpresa: STEmpresa.Caption := desEmpresa(Eempresa.Text);
    kProducto: STProducto.Caption := desProducto(Eempresa.Text, Eproducto.Text);
    kCentro: STCentro.Caption := desCentro(Eempresa.Text, Ecentro.Text);
  end;
end;

function TFLExpediciones.seleccionar: boolean;
var
  auxComunitario: string;
begin
  case RGEuropa.ItemIndex of
    0: auxComunitario := ' And ((es_comunitario_c = ' + QuotedStr('S') +
      ') OR (es_comunitario_c IS NULL)) ';
    1: auxComunitario := ' And es_comunitario_c = ' + QuotedStr('N') + ' ';
  end;

  with QListadosExpedicion do
  begin
    if Active then Close;
    //                                                                         *
    // SALIDAS                                                                 *
    //                                                                         *
    SQL.Clear;
    SQL.Add(' SELECT empresa_sl, centro_salida_sl, n_albaran_sl, fecha_sl, ' +
      '       pais_c, vehiculo_sc, SUM(kilos_sl) kilos ' +
      ' FROM   frf_salidas_c, frf_salidas_l, frf_clientes ' +
            //FILTRAR POR PARAMETROS DE ENTRADA
      ' where  empresa_sc = ' + QuotedStr(EEmpresa.Text) + ' ' +
      ' And    centro_salida_sc = ' + QuotedStr(ECentro.Text) + ' ' +
      ' and    fecha_sc between ' + SQLDate(MEDesde.Text) +
      '                     and ' + SQLDate(MEHasta.Text) + ' ' +
            //RELACION MAESTRO-DETALLE SALIDAS
      ' and    empresa_sl = empresa_sc ' +
      ' And    centro_salida_sl = centro_salida_sc ' +
      ' and    fecha_sl = fecha_sc ' +
      ' and    n_albaran_sl = n_albaran_sc ' +
            //FILTRAR POR PARAMETROS DE ENTRADA
      ' And    producto_sl = ' + QuotedStr(EProducto.Text) + ' ' +
            //RELACION SALIDAS - CLIENTE
      ' And    (cliente_sl = cliente_c) ' +
            //FILTRAR POR PAIS
      ' AND    pais_c <> ' + QuotedStr('ES') + ' ' +
      auxComunitario +

      //Agrupar
      ' GROUP BY empresa_sl,centro_salida_sl,n_albaran_sl, fecha_sl, ' +
      '         pais_c, vehiculo_sc ' +
      ' INTO TEMP tmp_expediciones');

    try
      ExecSQL;
    except
      result := false;
      exit;
    end;

    SQL.Clear;
    SQL.Add(' SELECT empresa_sl, centro_salida_sl,fecha_sl, ' +
      '        pais_c, SUM(kilos) As Kilos, vehiculo_sc ');
    SQL.Add(' FROM tmp_expediciones ');
    SQL.Add(' GROUP BY empresa_sl, centro_salida_sl,fecha_sl,pais_c,vehiculo_sc');
    SQL.Add(' ORDER BY empresa_sl, centro_salida_sl,fecha_sl,vehiculo_sc');
    result := true;
  end;
end;

function TFLExpediciones.funcTiempo(tipo: Byte; fecha: string): string;
var fec: TDate;
  Year, Month, Day: Word;
  cad, cad2: string;
begin
  fec := StrToDate(fecha);
  case tipo of
    1: begin
        cad := IntToStr(Semana(fec));
        if Length(cad) = 1 then
          funcTiempo := '0' + cad
        else funcTiempo := cad;
      end;
    2: begin
        DecodeDate(fec, year, month, day);
        cad := IntToStr(day);

        if length(cad) = 1 then
          cad := '0' + cad;
        cad2 := IntToStr(month);
        if length(cad2) = 1 then
          funcTiempo := cad + '/0' + cad2
        else funcTiempo := cad + '/' + cad2;

      end;
    3: begin
        DecodeDate(fec, year, month, day);
        funcTiempo := IntToStr(year);
      end;
  end;
end;

end.
