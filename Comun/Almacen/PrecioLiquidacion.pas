unit PrecioLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, Db, ExtCtrls,
  StdCtrls, Mask, DBCtrls, CMaestro, Buttons, ActnList, BSpeedButton, Grids,
  DBGrids, BGridButton, BGrid, BDEdit, ComCtrls, BEdit, dbTables, nbLabels;

type
  TFPrecioLiquidacion = class(TMaestro)
    DSMaestro: TDataSource;
    QPrecioLiquidacion: TQuery;
    QPrecioLiquidacionanyo_ec: TSmallintField;
    QPrecioLiquidacionmes_ec: TSmallintField;
    QPrecioLiquidacionempresa_ec: TStringField;
    QPrecioLiquidacionenvase_ec: TStringField;
    QPrecioLiquidacionproducto_base_ec: TSmallintField;
    PMaestro: TPanel;
    lblCoste: TLabel;
    lblAnyoSemana: TLabel;
    lblEmpresa: TLabel;
    lblProducto: TLabel;
    lblProveedor: TLabel;
    material_ec: TBDEdit;
    anyo_semana_pl: TBDEdit;
    empresa_pl: TBDEdit;
    producto_pl: TBDEdit;
    proveedor_pl: TBDEdit;
    des_empresa: TnbStaticText;
    des_producto: TnbStaticText;
    QPrecioLiquidacioncentro_ec: TStringField;
    lblNombre1: TLabel;
    personal_ec: TBDEdit;
    dbgEnvasado: TDBGrid;
    qGuia: TQuery;
    dsGuia: TDataSource;
    sqluGuia: TUpdateSQL;
    QPrecioLiquidaciondes_envase: TStringField;
    QPrecioLiquidacioncoste_total: TFloatField;
    lblGeneral: TLabel;
    general_ec: TBDEdit;
    lblEuroKg: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    QPrecioLiquidacionformato_ec: TStringField;
    QPrecioLiquidacionmaterial_ec: TFloatField;
    QPrecioLiquidacionpersonal_ec: TFloatField;
    QPrecioLiquidaciongeneral_ec: TFloatField;
    des_proveedor: TnbStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure RequiredTime(Sender: TObject; var isTime: Boolean);
    procedure empresa_plChange(Sender: TObject);
    procedure centro_ecChange(Sender: TObject);
    procedure QPrecioLiquidacionCalcFields(DataSet: TDataSet);
    procedure qGuiaAfterOpen(DataSet: TDataSet);
    procedure qGuiaBeforeClose(DataSet: TDataSet);
    procedure proveedor_plChange(Sender: TObject);
  private
    { Private declarations }
    Lista: TList;
    Objeto: TObject;

    sEmpresa, sAnyo, sMes, sCentro, sProducto: string;

    procedure ValidarEntradaMaestro;
    procedure AbrirTablas;
    procedure CerrarTablas;

  public
    { Public declarations }
    procedure Filtro; override;
    procedure AnyadirRegistro; override;

    procedure AntesDeLocalizar;
    procedure AntesDeModificar;
    procedure AntesDeVisualizar;
    procedure AntesDeInsertar;

    //Listado
    procedure Previsualizar; override;
  end;

implementation

uses CVariables, CGestionPrincipal, UDMBaseDatos, UDMAuxDB, CReportes,
  CAuxiliarDB, Principal, DError, bSQLUtils, bTimeUtils,
  bDialogs;

{$R *.DFM}

procedure TFPrecioLiquidacion.AbrirTablas;
begin
     // Abrir tablas/Querys
  if not DataSetMaestro.Active then
  begin
    DataSetGuia.SQL.Clear;
    DataSetGuia.SQL.Add(Select);
    DataSetGuia.SQL.Add(Where);
    DataSetGuia.SQL.Add(Order);
    DataSetGuia.Open;
  end;
     //Estado inicial
  Registros := DataSetGuia.RecordCount;
  if registros > 0 then
    Registro := 1
  else
    Registro := 0;
  RegistrosInsertados := 0;
end;

procedure TFPrecioLiquidacion.CerrarTablas;
begin
     // Cerrar tabla
  if DataSetGuia.Active then DataSetGuia.Close;
end;

//************************** CREAMOS EL FORMULARIO ************************

procedure TFPrecioLiquidacion.FormCreate(Sender: TObject);
begin
  des_empresa.Caption := '';
  des_centro.Caption := '';
  des_envase.Caption := '';
  des_producto.Caption := '';
  des_mes.Caption := '';

     //Variables globales
  M := Self;
  MD := nil;
     //Panel sobre el que iran los controles
  PanelMaestro := PMaestro;
  PMaestro.Height:= 150;

     //Fuente de datos maestro
    DataSetGuia := qGuia;
 {+}DataSetMaestro := QCosteEnvases;
     //Intrucciones para sacar los datos (inicialmente consulta vacia)
 {+}Select := ' SELECT anyo_ec, mes_ec, empresa_ec, centro_ec, producto_base_ec FROM frf_env_costes ';
 {+}where := ' WHERE anyo_ec= 1000 ';
 {+}Order := ' GROUP BY anyo_ec, mes_ec, empresa_ec, centro_ec, producto_base_ec ' +
             ' ORDER BY anyo_ec desc, mes_ec desc, empresa_ec, centro_ec, producto_base_ec ';
     //Abrir tablas/Querys
  try
    AbrirTablas;
        //Habilitamos controles de Base de datos
  except
    on e: Exception do
    begin
      ShowError(e);
      Close;
      Exit;
    end;
  end;

     //Lista de componentes
  Lista := TList.Create;
  PMaestro.GetTabOrderList(Lista);

     //Muestra la barra de herramientas de Maestro/Detalle
  if FormType <> tfMaestro then
  begin
    FormType := tfMaestro;
    BHFormulario;
  end;
  Visualizar;
     //Inicialmente grupo de desplazamiento deshabilitado
  BHGrupoDesplazamientoMaestro(pcNulo);

     //Para intentar reducir el numero de veces que abrimos la consulta
  DMBaseDatos.QDespegables.Tag := kNull;
     //Asignamos constantes a los componentes que los tienen
     //para facilitar distingirlos
//     empresa_t.Tag:=kEmpresa;

     //Validar entrada
  OnValidateMasterConstrains := ValidarEntradaMaestro;
  OnEdit := AntesDeModificar;
  OnBrowse:=AntesDeLocalizar;
  OnView := AntesDeVisualizar;
  OnInsert := AntesDeInsertar;
     //Focos
  {+}FocoAltas := empresa_ec;
  {+}FocoModificar := material_ec;
  {+}FocoLocalizar := empresa_ec;

end;

{+ CUIDADIN }

procedure TFPrecioLiquidacion.FormActivate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_SHOWNORMAL);
  if not DataSetMaestro.Active then Exit;
     //Formulario activo
  M := self;
  MD := nil;

     //Muestra la barra de herramientas de Maestro/Detalle
  if FormType <> tfMaestro then
  begin
    FormType := tfMaestro;
    BHFormulario;
  end;
     //Estado botones de desplamiento
  BHGrupoDesplazamientoMaestro(PCMaestro);
  Top:= 1;
end;


procedure TFPrecioLiquidacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Liberamos recursos
  Lista.Free;

     //Restauramos barra de herramientas
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;
     //Codigo de desactivacion
  CerrarTablas;

     // Cambia acción por defecto para Form hijas en una aplicación MDI
     // Cierra el Form y libera toda la memoria ocupada por el Form
  Action := caFree;
end;

procedure TFPrecioLiquidacion.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    // Tecla ENTER - Cambio entre los Controles de Datos en modo edición
    //               y entre los Campos de Búsqueda en la localización
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

//*****************************************************************************
//*****************************************************************************
//En todos los formularios
//*****************************************************************************
//*****************************************************************************

{+}//Sustituir por funcion generica

procedure TFPrecioLiquidacion.Filtro;
var Flag: Boolean;
  i: Integer;
begin
  where := ''; Flag := false;
  for i := 0 to Lista.Count - 1 do
  begin
    Objeto := Lista.Items[i];
    if (Objeto is TBEdit) then
    begin
      with Objeto as TBEdit do
      begin
        if Trim(Text) <> '' then
        begin
          if flag then where := where + ' AND ';
          if InputType = itChar then
            where := where + ' ' + Name + ' LIKE ' + SQLFilter(Text)
          else
            where := where + ' ' + Name + ' =' + QUOTEDSTR(Text);
          flag := True;
        end;
      end;
    end;
  end;
  if flag then where := ' WHERE ' + where;
end;

{+}//sustituir por funcion generica

procedure TFPrecioLiquidacion.AnyadirRegistro;
var Flag: Boolean;
  i: Integer;
begin
  Flag := false;
  if where <> '' then where := where + ' OR ('
  else where := ' WHERE (';

  for i := 0 to Lista.Count - 1 do
  begin
    objeto := Lista.Items[i];
    if (objeto is TBDEdit) then
    begin
      with objeto as TBDEdit do
      begin
        if PrimaryKey and (Trim(Text) <> '') then
        begin
          if flag then where := where + ' AND ';
          where := where + ' ' + Name + ' =' + QUOTEDSTR(Text);
          flag := True;
        end;
      end;
    end;
  end;
  where := where + ') ';
end;

{+}//Sustituir por funcion generica

procedure TFPrecioLiquidacion.ValidarEntradaMaestro;
(*
var
  flag: Boolean
*)
var i: Integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Objeto := Lista.Items[i];
    if (Objeto is TBEdit) then
    begin
      with Objeto as TBEdit do
      begin
        if Required and (Trim(Text) = '') then
        begin
          if Trim(RequiredMsg) <> '' then
            raise Exception.Create(RequiredMsg)
          else
            raise Exception.Create('Faltan datos de obligada inserción.');
        end;

      end;
    end;
  end;

  sEmpresa:= empresa_ec.Text;
  sAnyo:= anyo_ec.Text;
  sMes:= mes_ec.Text;
  sCentro:= centro_ec.Text;
  sProducto:= producto_base_ec.Text;
  FocoAltas:= envase_ec;

  //comprobar que existe el envase para el producto seleccionado
  with DMBaseDatos.QAux do
  begin
    SQl.Clear;
    SQl.Add(' select descripcion_e from frf_envases ');
    SQl.Add(' where empresa_e= :empresa ');
    SQl.Add(' and envase_e= :envase ');
    SQl.Add(' and producto_base_e = :producto ');
    ParamByName('empresa').AsString:= empresa_ec.Text;
    ParamByName('envase').AsString:= envase_ec.Text;
    ParamByName('producto').AsInteger:= StrToIntDef( producto_base_ec.Text, 0 );
    Open;
    if IsEmpty then
    begin
      Close;
      raise Exception.Create('Envase incorrecto [' + empresa_ec.Text + '-' +
                                                   producto_base_ec.Text + '-' +
                                                   envase_ec.Text + '].');
    end;
    Close;
  end;

  (*
    RELENTIZA BASTANTE LA INSERCION, NO ACTIVAR SI NO SE PIDE
  //Comprobar que el envase se vendio en ese año-mes
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_salidas_l ');
    SQL.Add(' where empresa_sl ' + SQLEqualS( empresa_ec.Text ) );
    SQL.Add(' and producto_sl IN ');
    SQL.Add(' (SELECT producto_p ');
    SQL.Add('  FROM frf_productos ');
    SQL.Add('  WHERE empresa_p ' + SQLEqualS( empresa_ec.Text ) );
    SQL.Add('  AND producto_base_p ' + SQLEqualS( producto_base_ec.Text ) );
    SQL.Add(' ) ');
    SQL.Add(' and envase_sl ' + SQLEqualS( envase_ec.Text ) );
    SQL.Add(' and YEAR(fecha_sl)  ' + SQLEqualN( anyo_ec.Text ) );
    SQL.Add(' and MONTH(fecha_sl)  ' + SQLEqualN( mes_ec.Text ) );

    Open;
    flag:= IsEmpty;
    Close;
    if flag then
    begin
      raise Exception.Create(' El envase ' +  QuotedSTr(envase_ec.Text) + ' no fue utilizado en ' +
                       desMes( mes_ec.Text ) + ' del ' + anyo_ec.Text);
    end;
  end;
  *)
end;

procedure TFPrecioLiquidacion.Previsualizar;
begin
  //
  Informar('Sin listado.');
end;

procedure TFPrecioLiquidacion.proveedor_plChange(Sender: TObject);
begin
//  if QPrecioLiquidacion.State = dsBrowse then
//    des_envase.Caption := desEnvasePBase( QCosteEnvasesempresa_ec.Value, QCosteEnvasesenvase_ec.Value, QCosteEnvasesproducto_base_ec.AsString )
//  else
    des_proveedor.Caption := desProveedor(empresa_pl.Text, proveedor_pl.Text);
end;

//*****************************************************************************
//*****************************************************************************
//Funciones asociadas a la rejilla flotante
//Si no existe la rejilla flotante
//   - Borrar Lista de acciones
//   - Borrar las funciones de esta seccion
//*****************************************************************************
//****************************************************************************

//*****************************************************************************
//*****************************************************************************
//EVENTOS
//*****************************************************************************
//*****************************************************************************
//Evento que se produce cuando pulsamos modificar
//Aprobrechar para modificar estado controles
procedure TFPrecioLiquidacion.AntesDeLocalizar;
begin
  PMaestro.Height:= 250;
end;

procedure TFPrecioLiquidacion.AntesDeModificar;
var i: Integer;
begin
  PMaestro.Height:= 250;
  for i := 0 to Lista.Count - 1 do
  begin
    Objeto := Lista.Items[i];
    if (Objeto is TBDEdit) then
      with Objeto as TBDEdit do
        if not Modificable then
          Enabled := false;
  end;
end;

//Evento que se produce cuando vamos a visualizar el resultado de las operaciones
//Aprobrechar para restaurar los cambios realizados por los eventos anteriores

procedure TFPrecioLiquidacion.AntesDeVisualizar;
var i: Integer;
begin
  PMaestro.Height:= 150;
    //Resaturar estado
  for i := 0 to Lista.Count - 1 do
  begin
    Objeto := Lista.Items[i];
    if (Objeto is TBDEdit) then
      with Objeto as TBDEdit do
        if not Modificable then
          Enabled := True;
  end;

  sEmpresa:= '';
  sAnyo:= '';
  sMes:= '';
  sCentro:= '';
  sProducto:= '';
  FocoAltas := empresa_ec;
end;

procedure TFPrecioLiquidacion.AntesDeInsertar;
begin
  PMaestro.Height:= 250;
  empresa_ec.Text:= sEmpresa;
  anyo_ec.Text:= sAnyo;
  mes_ec.Text:= sMes;
  centro_ec.Text:= sCentro;
  producto_base_ec.Text:= sProducto;
end;

//*****************************************************************************
//*****************************************************************************
//FUNCIONES VARIAS
//*****************************************************************************
//*****************************************************************************

procedure TFPrecioLiquidacion.RequiredTime(Sender: TObject;
  var isTime: Boolean);
begin
  isTime := false;
  if TBEdit(Sender).CanFocus then
  begin
    if (Estado = teLocalizar) then
      Exit;
    if (gRF <> nil) then
      if esVisible( gRF ) then
        Exit;
    if (gCF <> nil) then
      if esVisible( gCF ) then
        Exit;
    isTime := true;
  end;
end;

procedure TFPrecioLiquidacion.empresa_plChange(Sender: TObject);
begin
  if QPrecioLiquidacion.State = dsBrowse then
    des_empresa.Caption := desEmpresa(QCosteEnvasesempresa_ec.Value)
  else
    des_empresa.Caption := desEmpresa(empresa_pl.Text);
end;

procedure TFPrecioLiquidacion.centro_ecChange(Sender: TObject);
begin
  if QCosteEnvases.State = dsBrowse then
    des_centro.Caption := desCentro(QCosteEnvasesempresa_ec.Value,
      QCosteEnvasescentro_ec.AsString)
  else
    des_centro.Caption := desCentro(empresa_ec.Text, centro_ec.Text);
end;

procedure TFPrecioLiquidacion.QPrecioLiquidacionCalcFields(DataSet: TDataSet);
begin
  QCosteEnvasesdes_envase.AsString:= desEnvasePBase( QCosteEnvasesempresa_ec.AsString, QCosteEnvasesenvase_ec.AsString, QCosteEnvasesproducto_base_ec.AsString );
  QCosteEnvasescoste_total.AsFloat:= QCosteEnvasesmaterial_ec.AsFloat +  QCosteEnvasespersonal_ec.AsFloat + QCosteEnvasesgeneral_ec.AsFloat;
end;

procedure TFPrecioLiquidacion.qGuiaAfterOpen(DataSet: TDataSet);
begin
  //Abrir detalle
  QCosteEnvases.SQL.Clear;
  QCosteEnvases.SQL.Add('SELECT * FROM frf_env_costes ');
  if Trim(Where) <> '' then
  begin
    QCosteEnvases.SQL.Add( Where );
    QCosteEnvases.SQL.Add( ' and empresa_ec = :empresa_ec ');
  end
  else
  begin
    QCosteEnvases.SQL.Add( ' where empresa_ec = :empresa_ec ');
  end;
  QCosteEnvases.SQL.Add( ' and anyo_ec = :anyo_ec ');
  QCosteEnvases.SQL.Add( ' and mes_ec = :mes_ec ');
  QCosteEnvases.SQL.Add( ' and centro_ec = :centro_ec ');
  QCosteEnvases.SQL.Add( ' and producto_base_ec = :producto_base_ec ');
  QCosteEnvases.SQL.Add( ' ORDER BY envase_ec ');
  QCosteEnvases.Open;
end;

procedure TFPrecioLiquidacion.qGuiaBeforeClose(DataSet: TDataSet);
begin
  //cancelar cambios pendientes en la guia
  qGuia.CancelUpdates;
  //Cerrar detalle
  QCosteEnvases.Close;
end;

end.
