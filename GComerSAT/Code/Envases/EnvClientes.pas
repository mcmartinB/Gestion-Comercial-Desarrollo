unit EnvClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, nbEdits, nbLabels,
  ExtCtrls, Buttons, ActnList, ComCtrls, ToolWin, DBCtrls, BEdit, BDEdit;

type
  TFEnvClientes = class(TForm)
    Panel1: TPanel;
    nbLabel1: TnbLabel;
    nbLabel2: TnbLabel;
    nbLabel3: TnbLabel;
    lblEmpresa: TnbStaticText;
    lblProductoBase: TnbStaticText;
    lblEnvase: TnbStaticText;
    empresa: TnbDBAlfa;
    envase: TnbDBAlfa;
    productoBase_: TnbDBAlfa;
    nbLabel4: TnbLabel;
    nbLabel5: TnbLabel;
    lblCliente: TnbStaticText;
    cliente: TnbDBAlfa;
    DBGrid: TDBGrid;
    Query: TQuery;
    DataSource: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ActionList: TActionList;
    AAnyadir: TAction;
    ABorrar: TAction;
    AModificar: TAction;
    AAceptar: TAction;
    ACancelar: TAction;
    ACerrar: TAction;
    Queryempresa_ce: TStringField;
    Queryproducto_base_ce: TSmallintField;
    Queryenvase_ce: TStringField;
    Querycliente_ce: TStringField;
    Queryunidad_fac_ce: TStringField;
    Querydescripcion_ce: TStringField;
    nbLabel6: TnbLabel;
    unidad_fac_ce: TComboBox;
    descripcion_ce: TBDEdit;
    procedure empresaChange(Sender: TObject);
    procedure productoBase_Change(Sender: TObject);
    procedure envaseChange(Sender: TObject);
    procedure clienteChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AAnyadirExecute(Sender: TObject);
    procedure ABorrarExecute(Sender: TObject);
    procedure AModificarExecute(Sender: TObject);
    procedure AAceptarExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure ACerrarExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    function LoadData: Boolean;
  public
    { Public declarations }
  end;

procedure DescripcionEnvaseCliente(const AEmpresa, AProductoBase, AEnvase: string);

implementation

{$R *.dfm}

uses UDMBaseDatos, UDMAuxDB, bSQLUtils, Menus;

procedure DescripcionEnvaseCliente(const AEmpresa, AProductoBase, AEnvase: string);
begin
  with TFEnvClientes.Create(nil) do
  begin
    empresa.Text := AEmpresa;
    productoBase_.Text := AProductoBase;
    envase.Text := AEnvase;

    if LoadData then
      ShowModal
    else
      Free;
  end;
end;

procedure TFEnvClientes.empresaChange(Sender: TObject);
begin
  lblEmpresa.Caption := desEmpresa(empresa.Text);
end;

procedure TFEnvClientes.productoBase_Change(Sender: TObject);
begin
  lblProductoBase.Caption := desProductoBase(empresa.Text, productoBase_.Text);
end;

procedure TFEnvClientes.envaseChange(Sender: TObject);
begin
  lblEnvase.Caption := desEnvase(empresa.Text, envase.Text);
end;

procedure TFEnvClientes.clienteChange(Sender: TObject);
begin
  lblCliente.Caption := desCliente(empresa.Text, cliente.Text);
end;

procedure TFEnvClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query.Close;
  Action := caFree;
end;

function TFEnvClientes.LoadData: Boolean;
begin
  result := false;
  if not Query.Active then
  begin
    Query.SQl.Clear;
    Query.SQl.Add('Select * from frf_clientes_env');
    Query.SQl.Add('where empresa_ce ' + SQLEqualS(empresa.Text));
    Query.SQl.Add('  and producto_base_ce ' + SQLEqualS(productoBase_.Text));
    Query.SQl.Add('  and envase_ce ' + SQLEqualS(envase.Text));

    result := OpenQuery(Query);
  end;
end;

procedure TFEnvClientes.AAnyadirExecute(Sender: TObject);
begin
  cliente.Enabled := true;
  descripcion_ce.Enabled := true;
  unidad_fac_ce.Enabled := true;
  unidad_fac_ce.ItemIndex:= 0;
  cliente.SetFocus;
  Query.Insert;
  DBGrid.Top := 224;
  DBGrid.Height := 205;
  DBGrid.Enabled:= False;
end;

procedure TFEnvClientes.ABorrarExecute(Sender: TObject);
begin
  Query.Delete;
end;

procedure TFEnvClientes.AModificarExecute(Sender: TObject);
begin
  cliente.Enabled := false;
  descripcion_ce.Enabled := true;
  unidad_fac_ce.Enabled := true;
  if Queryunidad_fac_ce.AsString = 'K' then
    unidad_fac_ce.ItemIndex:= 0
  else
  if Queryunidad_fac_ce.AsString = 'U' then
    unidad_fac_ce.ItemIndex:= 1
  else
  if Queryunidad_fac_ce.AsString = 'C' then
    unidad_fac_ce.ItemIndex:= 2;
  descripcion_ce.SetFocus;
  Query.Edit;
  DBGrid.Top := 224;
  DBGrid.Height := 205;
  DBGrid.Enabled:= False;
end;

procedure TFEnvClientes.AAceptarExecute(Sender: TObject);
begin
  Query.Post;
  Query.Close;
  Query.Open;
  cliente.Enabled := false;
  descripcion_ce.Enabled := false;
  unidad_fac_ce.Enabled := False;
  DBGrid.Top := 137;
  DBGrid.Height := 292;
  DBGrid.Enabled:= True;
end;

procedure TFEnvClientes.ACancelarExecute(Sender: TObject);
begin
  Query.Cancel;
  cliente.Enabled := false;
  descripcion_ce.Enabled := false;
  unidad_fac_ce.Enabled := False;
  DBGrid.Top := 137;
  DBGrid.Height := 292;
  DBGrid.Enabled:= True;
end;

procedure TFEnvClientes.ACerrarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFEnvClientes.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  AAceptar.Enabled := Query.State in [dsEdit, dsInsert];
  ACancelar.Enabled := Query.State in [dsEdit, dsInsert];
  AAnyadir.Enabled := Query.State in [dsBrowse];
  AModificar.Enabled := (Query.State in [dsBrowse]) and (not Query.IsEmpty);
  ABorrar.Enabled := (Query.State in [dsBrowse]) and (not Query.IsEmpty);
  ACerrar.Enabled := Query.State in [dsBrowse];

  if ACerrar.Enabled then
  begin
    ACerrar.ShortCut := ShortCut(vk_escape, []);
    ACancelar.ShortCut := 0;
  end
  else
  begin
    ACancelar.ShortCut := ShortCut(vk_escape, []);
    ACerrar.ShortCut := 0;
  end;
end;

procedure TFEnvClientes.FormCreate(Sender: TObject);
begin
  DBGrid.Top := 137;
  DBGrid.Height := 292;

  ABorrar.ShortCut := ShortCut(VK_SUBTRACT, []);
  AAnyadir.ShortCut := ShortCut(VK_ADD, []);
  AModificar.ShortCut := ShortCut(Word('M'), []);
  AAceptar.ShortCut := ShortCut(VK_F1, []);
end;

procedure TFEnvClientes.QueryBeforePost(DataSet: TDataSet);
begin
  Query.FieldByName('empresa_ce').AsString := empresa.Text;
  Query.FieldByName('producto_base_ce').AsString := productoBase_.Text;
  Query.FieldByName('envase_ce').AsString := envase.Text;
  Queryunidad_fac_ce.AsString:= copy( unidad_fac_ce.Items[unidad_fac_ce.ItemIndex], 1, 1 );
end;

end.
