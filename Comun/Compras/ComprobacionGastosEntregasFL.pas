unit ComprobacionGastosEntregasFL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ActnList,
  ComCtrls, Db, DBtables, CGestionPrincipal, BEdit,
  BCalendarButton, BSpeedButton, BGridButton, BCalendario, Derror, Grids,
  DBGrids, BGrid, CheckLst;

type
  TFLComprobacionGastosEntregas = class(TForm)
    Panel1: TPanel;
    ListaAcciones: TActionList;
    BAceptar: TAction;
    BCancelar: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CalendarioFlotante: TBCalendario;
    ADesplegarRejilla: TAction;
    Label3: TLabel;
    eEmpresa: TBEdit;
    STEmpresa: TStaticText;
    clbGastosTransito: TCheckListBox;
    Label1: TLabel;
    EDesde: TBEdit;
    BCBDesde: TBCalendarButton;
    Label2: TLabel;
    EHasta: TBEdit;
    BCBHasta: TBCalendarButton;
    QLCompGastosEntregas: TQuery;
    Label4: TLabel;
    eCliente: TBEdit;
    STCliente: TStaticText;
    lblNombre1: TLabel;
    lblProducto: TLabel;
    edtProducto: TBEdit;
    txtProducto: TStaticText;
    procedure BBAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADesplegarRejillaExecute(Sender: TObject);
    procedure EHastaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure eEmpresaChange(Sender: TObject);
    procedure eClienteChange(Sender: TObject);
    procedure edtProductoChange(Sender: TObject);

  private
    {private declarations}
    sGastos: string;

    function  TipoDeGastos( var AGastos, AEntregas: string ): integer;
    function  ConsultaGastosEntregas: boolean;
    function  ConfiguraGastosEntregas: boolean;

    function  ParametrosCorrectos: boolean;
    procedure VerTiposDeGastos;

  public
    { Public declarations }
  end;

implementation

uses Principal, CVariables, CAuxiliarDB, CReportes,
  ComprobacionGastosEntregasQL, DPreview, UDMAuxDB,
  CGlobal;

{$R *.DFM}

//                          **** FORMULARIO ****

function TFLComprobacionGastosEntregas.TipoDeGastos( var AGastos, AEntregas: string ): integer;
var
  i, cont: integer;
begin
  AGastos:=  '';
  AEntregas:=  '';

  i:= 0;
  cont:= 0;
  while i < clbGastosTransito.Items.Count  do
  begin
    if clbGastosTransito.Checked[i] then
    begin
      if cont > 0 then
      begin
        AEntregas:= AEntregas + '    or' + #13 + #10 ;
        AGastos:= AGastos + ',';
      end;

      AEntregas:= AEntregas + '    nvl( ( SELECT max(codigo_ge) codigo FROM frf_gastos_entregas ' + #13 + #10 ;
      AEntregas:= AEntregas + '         WHERE codigo_ge = codigo_ec ' + #13 + #10 ;
      AEntregas:= AEntregas + '         AND   tipo_ge = ''' + copy(clbGastosTransito.Items[i],1,3) + ''' ), '''' ) = ''''  ' + #13 + #10 ;

      AGastos:= AGastos + copy(clbGastosTransito.Items[i],1,3);

      inc( cont );
    end;
    inc(i);
  end;

  AEntregas:= ' and ( ' + #13 + #10 + AEntregas + #13 + #10 +  ')';

  result:= cont;

end;


function TFLComprobacionGastosEntregas.ConfiguraGastosEntregas: boolean;
var
  sEntregas: string;
  cont: integer;
begin
  cont:= TipoDeGastos( sGastos, sEntregas );
  result:= sGastos <> '';

  if cont > 0 then
  with QLCompGastosEntregas.SQL do
  begin
    Clear;
    begin
      Add(' SELECT codigo_ec codigo, fecha_carga_ec fecha, transporte_ec transporte, ');
      Add(' proveedor_ec cliente, vehiculo_ec matricula ');
      Add(' FROM  frf_entregas_c ');

      Add('  WHERE fecha_llegada_ec BETWEEN :desde AND :hasta ');
      if eEmpresa.Text = 'SAT' then
        Add(' AND ( empresa_ec   = ''050'' or empresa_ec   = ''080'' ) ')
      else
      if eEmpresa.Text = 'BAG' then
        Add(' AND substr( empresa_ec, 1, 1 )   = ''F'' ')
      else
        Add(' AND empresa_ec = :empresa ');
      if edtProducto.Text <> '' then
        Add(' AND   producto_ec = :producto ');
      if eCliente.Text <> '' then
        Add(' AND   proveedor_ec = :proveedor ');
      Add( sEntregas );
    end;

    Add('  ORDER BY 1, 2 ');

  end;
end;

procedure TFLComprobacionGastosEntregas.FormCreate(Sender: TObject);
begin
  edtProducto.Enabled:= CGlobal.gProgramVersion = CGlobal.pvBAG;

  gRF := nil;
  gCF := nil;

  FormType := tfOther;
  BHFormulario;

  EDesde.Text := DateTostr(Date-7);
  EHasta.Text := DateTostr(Date-1);
  CalendarioFlotante.Date := Date;

  eEmpresa.Text:= gsDefEmpresa;

  EDesde.Tag := kCalendar;
  EHasta.Tag := kCalendar;

  eEmpresa.Tag:= kEmpresa;

  gCF := calendarioFlotante;

  Caption:= ' COMPROBACI?N GASTOS ENTREGAS';
  VerTiposDeGastos;
end;

procedure TFLComprobacionGastosEntregas.FormActivate(Sender: TObject);
begin
  ActiveControl := eEmpresa;
end;

procedure TFLComprobacionGastosEntregas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFLComprobacionGastosEntregas.FormClose(Sender: TObject;
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

//                         ****  BOTONES  ****

procedure TFLComprobacionGastosEntregas.BBAceptarClick(Sender: TObject);
var
  bMostrarReport: boolean;
begin
  if not CerrarForm(true) then
    Exit;
  if not ParametrosCorrectos then
    Exit;

  //Llamamos al QReport
  QLComprobacionGastosEntregas := TQLComprobacionGastosEntregas.Create(Application);
  try
    QLComprobacionGastosEntregas.LPeriodo.Caption := EDesde.Text + ' a ' + EHasta.Text;
    bMostrarReport:= ConsultaGastosEntregas;

    if bMostrarReport then
    begin
      PonLogoGrupoBonnysa(QLComprobacionGastosEntregas, eEmpresa.Text );

      QLComprobacionGastosEntregas.DBVariable.Enabled:= True;
      QLComprobacionGastosEntregas.LVariable.Enabled:=  QLComprobacionGastosEntregas.DBVariable.Enabled;
      QLComprobacionGastosEntregas.LMatricula.Enabled:= not QLComprobacionGastosEntregas.DBVariable.Enabled;
      QLComprobacionGastosEntregas.ReportTitle:= 'GastosEntregas';
      QLComprobacionGastosEntregas.LTitulo.Caption := 'Comprobaci?n de gastos de entregas';

      QLComprobacionGastosEntregas.lblTipoGastos.Caption:= 'Gastos Seleccionados: ' + sGastos;
      if eCliente.Text <> '' then
        QLComprobacionGastosEntregas.lblCliente.Caption:= eCliente.Text + ' ' + stCliente.Caption
      else
        QLComprobacionGastosEntregas.lblCliente.Caption:= '';
      QLComprobacionGastosEntregas.bndCabecera.Height:= 90;

      Preview(QLComprobacionGastosEntregas);
    end
    else
    begin
      FreeAndNil(QLComprobacionGastosEntregas);
    end;
  except
    FreeAndNil(QLComprobacionGastosEntregas);
    Raise;
  end;
end;

procedure TFLComprobacionGastosEntregas.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then Close;
end;

//                     ****  CAMPOS DE EDICION  ****

procedure TFLComprobacionGastosEntregas.EHastaExit(Sender: TObject);
begin
  if StrToDate(EHasta.Text) < StrToDate(EDesde.Text) then
  begin
    MessageDlg('Debe escribir un rango de fechas correcto',
      mtError, [mbOk], 0);
    EDesde.SetFocus;
  end;
end;

//                      ****  FUNCIONES ESPECIFICAS  ****

procedure TFLComprobacionGastosEntregas.ADesplegarRejillaExecute(Sender: TObject);
begin
  case ActiveControl.Tag of
    kCalendar:
      begin
        if EDesde.Focused then
          DespliegaCalendario(BCBDesde)
        else
          DespliegaCalendario(BCBHasta);
      end;
  end;
end;

//                     *** PROCEDIMIENTOS PRIVADOS ***


function TFLComprobacionGastosEntregas.ConsultaGastosEntregas: Boolean;
begin
  if ConfiguraGastosEntregas then
  begin
    with QLCompGastosEntregas do
    begin
      Close;
      if ( eEmpresa.Text <> 'BAG' ) and ( eEmpresa.Text <> 'SAT' ) then
        ParamByName('empresa').AsString := eEmpresa.Text;
      if eCliente.Text <> '' then
        ParamByName('proveedor').AsString := eCliente.Text;
      if ( edtProducto.Text <> '' ) and ( edtProducto.Enabled ) then
        ParamByName('producto').AsString := edtProducto.Text;
      ParamByName('desde').AsDate := StrToDate(EDesde.Text);
      ParamByName('hasta').AsDate := StrToDate(EHasta.Text);
      try
        Open;
      except
        on E: EDBEngineError do
        begin
          ShowError(E);
          raise;
        end;
      end;
    end;

    if QLCompGastosEntregas.IsEmpty then
    begin
      ShowMessage('Todos los gastos grabados para los datos pasados.');
      QLCompGastosEntregas.Close;
      result:= False;
    end
    else
    begin
      result:= True;
      with QLComprobacionGastosEntregas do
      begin
        Page.Columns := 2;
        DataSet := QLCompGastosEntregas;

        //Campos de base de datos
        DBAlbaran.DataSet := DataSet;
        DBFecha.DataSet := DataSet;
        DBVariable.DataSet := DataSet;
        DBCliente.DataSet := DataSet;
        DBMatricula.DataSet := DataSet;
      end;
    end;
  end
  else
  begin
    ShowMessage('Por favor, seleccione un gasto.');
    result:= False;
  end;
end;

function TFLComprobacionGastosEntregas.ParametrosCorrectos: boolean;
var
  dIni, dFin: TDateTime;
begin
  result:= False;
  if Trim( stEmpresa.Caption ) = '' then
  begin
    ShowMessage('El c?digo de la empresa es de obligada inserci?n.');
    eEmpresa.SetFocus;
  end
  else
  if Trim( TxtProducto.Caption ) = '' then
  begin
    ShowMessage('El c?digo del producto es incorrecto.');
    eEmpresa.SetFocus;
  end
  else
  if Trim( stCliente.Caption ) = '' then
  begin
    ShowMessage('El c?digo del proveedor es incorrecto.');
    eEmpresa.SetFocus;
  end
  else
  if not TryStrToDate( EDesde.Text, dIni ) then
  begin
    ShowMessage('Fecha de incio incorrecta.');
    EDesde.SetFocus;
  end
  else
  if not TryStrToDate( EHasta.Text, dFin ) then
  begin
    ShowMessage('Fecha de fin incorrecta.');
    EHasta.SetFocus;
  end
  else
  if dIni > dFin then
  begin
    ShowMessage('Rango de fechas incorrecto.');
    EDesde.SetFocus;
  end
  else
  begin
    result:= true;
  end;
end;

procedure TFLComprobacionGastosEntregas.eEmpresaChange(Sender: TObject);
begin
  STEmpresa.Caption := desEmpresa( eEmpresa.Text );
  edtProductoChange( edtProducto );
  eClienteChange( eCliente );
end;

procedure TFLComprobacionGastosEntregas.eClienteChange(Sender: TObject);
begin
  if eCliente.Text = '' then
    STCliente.Caption := 'TODOS LOS PROVEEDORES.'
  else
    STCliente.Caption := desProveedor(eEmpresa.Text, eCliente.Text);
end;

procedure TFLComprobacionGastosEntregas.VerTiposDeGastos;
var
  i: integer;
begin
  clbGastosTransito.Items.Clear;
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_tipo_gastos ');
    SQL.Add(' where gasto_transito_tg = 2 ');
    SQL.Add(' order by tipo_tg ');
    Open;
    i:= 0;
    while not EOF do
    begin
      clbGastosTransito.Items.Add(FieldByName('tipo_tg').AsString + ':' + FieldByName('descripcion_tg').AsString);
      clbGastosTransito.Checked[i]:= False;
      Inc(i);
      Next;
    end;
    Close;
    clbGastosTransito.Enabled:= clbGastosTransito.Items.Count > 0;
  end;
end;

procedure TFLComprobacionGastosEntregas.edtProductoChange(Sender: TObject);
begin
  if edtProducto.Text = '' then
    txtProducto.Caption := 'TODOS LOS PRODUCTOS.'
  else
    txtProducto.Caption := desProducto(eEmpresa.Text, edtProducto.Text);
end;

end.
