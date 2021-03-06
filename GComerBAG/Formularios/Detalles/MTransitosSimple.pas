unit MTransitosSimple;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs
  , Db, ExtCtrls, StdCtrls, Mask, DBCtrls, CMaestroDetalle, Buttons,
  ActnList, BSpeedButton, Grids, DBGrids, BGridButton, BGrid,
  BDEdit, BEdit, dbTables, DError, BCalendarButton, ComCtrls, BCalendario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlue, dxSkinBlueprint, dxSkinFoggy,
  dxSkinMoneyTwins, Menus, cxButtons, SimpleSearch, cxTextEdit, cxDBEdit, bMath;

type
  TFMTransitosSimple = class(TMaestroDetalle)
    DSMaestro: TDataSource;
    PMaestro: TPanel;
    LEmpresa_p: TLabel;
    Label1: TLabel;
    BGBEmpresa_tc: TBGridButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BGBCentro_tc: TBGridButton;
    BGBTransporte_tc: TBGridButton;
    BCBCalendario: TBCalendarButton;
    Referencia: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label20: TLabel;
    BGBCentro_destino_tc: TBGridButton;
    centro_tc: TBDEdit;
    centro_destino_tc: TBDEdit;
    empresa_tc: TBDEdit;
    STEmpresa_tc: TStaticText;
    STCentro_tc: TStaticText;
    fecha_tc: TBDEdit;
    transporte_tc: TBDEdit;
    vehiculo_tc: TBDEdit;
    STTransporte_tc: TStaticText;
    referencia_tc: TBDEdit;
    buque_tc: TBDEdit;
    destino_tc: TBDEdit;
    STCentro_destino_tc: TStaticText;
    QTransitosC: TQuery;
    RejillaFlotante: TBGrid;
    Calendario: TBCalendario;
    PRejilla: TPanel;
    RVisualizacion: TDBGrid;
    TTransitosL: TTable;
    DSDetalle: TDataSource;
    PTenerife: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    nom_gg: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BGBColor_tl: TBGridButton;
    BGBProducto_tl: TBGridButton;
    BGBMarca_tl: TBGridButton;
    Label29: TLabel;
    BGBCalibre_tl: TBGridButton;
    nomColorT: TStaticText;
    nomCategoriaT: TStaticText;
    nomMarcaT: TStaticText;
    nomEnvaseT: TStaticText;
    nomProductoT: TStaticText;
    producto_tl: TBDEdit;
    marca_tl: TBDEdit;
    color_tl: TBDEdit;
    categoria_tl: TBDEdit;
    calibre_tl: TBDEdit;
    kilos_tl: TBDEdit;
    BGBCategoria_tl: TBGridButton;
    DSDetalle2: TDataSource;
    pnlBotones: TPanel;
    btnGastos: TSpeedButton;
    Label24: TLabel;
    porte_bonny_tc: TDBCheckBox;
    cbx_porte_bonny_tc: TComboBox;
    nota_tc: TDBMemo;
    Label12: TLabel;
    lblNumCMR: TLabel;
    n_cmr_tc: TBDEdit;
    Label16: TLabel;
    tipo_palet_tl: TBDEdit;
    BGBTipoPalet: TBGridButton;
    stTipo_palet_tl: TStaticText;
    Label17: TLabel;
    palets_tl: TBDEdit;
    Label8: TLabel;
    fecha_entrada_tc: TBDEdit;
    BCalendarButton1: TBCalendarButton;
    puerto_tc: TBDEdit;
    BGBpuerto_tc: TBGridButton;
    stPuerto_tc: TStaticText;
    lblNombre1: TLabel;
    lblplanta_origen_tc: TLabel;
    planta_origen_tc: TBDEdit;
    btnplanta_origen_tc: TBGridButton;
    stplanta_origen_tc: TStaticText;
    lblplanta_destino_tc: TLabel;
    planta_destino_tc: TBDEdit;
    btnplanta_destino_tc: TBGridButton;
    stplanta_destino_tc: TStaticText;
    btnActivar: TSpeedButton;
    lblOrden: TLabel;
    n_orden_tc: TBDEdit;
    lblStatus: TLabel;
    Label15: TLabel;
    unidades_caja_tl: TBDEdit;
    hora_tc: TBDEdit;
    hora_entrada_tc: TBDEdit;
    envase_tl: TcxDBTextEdit;
    ssEnvase: TSimpleSearch;
    TTransitosLempresa_tl: TStringField;
    TTransitosLcentro_tl: TStringField;
    TTransitosLreferencia_tl: TIntegerField;
    TTransitosLfecha_tl: TDateField;
    TTransitosLcentro_destino_tl: TStringField;
    TTransitosLcentro_origen_tl: TStringField;
    TTransitosLref_origen_tl: TIntegerField;
    TTransitosLfecha_origen_tl: TDateField;
    TTransitosLproducto_tl: TStringField;
    TTransitosLenvase_tl: TStringField;
    TTransitosLenvaseold_tl: TStringField;
    TTransitosLmarca_tl: TStringField;
    TTransitosLcategoria_tl: TStringField;
    TTransitosLcolor_tl: TStringField;
    TTransitosLcalibre_tl: TStringField;
    TTransitosLunidades_caja_tl: TIntegerField;
    TTransitosLcajas_tl: TIntegerField;
    TTransitosLkilos_tl: TFloatField;
    TTransitosLfederacion_tl: TStringField;
    TTransitosLcosechero_tl: TSmallintField;
    TTransitosLplantacion_tl: TSmallintField;
    TTransitosLanyo_semana_tl: TStringField;
    TTransitosLtipo_palet_tl: TStringField;
    TTransitosLpalets_tl: TIntegerField;
    TTransitosLdesEnvase: TStringField;
    Label18: TLabel;
    precio_tl: TBDEdit;
    Label11: TLabel;
    cajas_tl: TBDEdit;
    Label19: TLabel;
    importe_linea_tl: TBDEdit;
    TTransitosLprecio_tl: TFloatField;
    TTransitosLimporte_linea_tl: TCurrencyField;
    lbl6: TLabel;
    incoterm_tc: TBDEdit;
    BGBincoterm_c: TBGridButton;
    stIncoterm: TStaticText;
    lbl7: TLabel;
    plaza_incoterm_tc: TBDEdit;
    lbl4: TLabel;
    precio_palet_plas_tc: TBDEdit;
    lbl5: TLabel;
    precio_caja_plas_tc: TBDEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure empresa_tcRequiredTime(Sender: TObject; var isTime: Boolean);
    procedure empresa_tcChange(Sender: TObject);
    procedure centro_tcChange(Sender: TObject);
    procedure centro_destino_tcChange(Sender: TObject);
    procedure transporte_tcChange(Sender: TObject);
    procedure QTransitosCAfterScroll(DataSet: TDataSet);
    procedure BGBEmpresa_tcClick(Sender: TObject);
    procedure BGBCentro_tcClick(Sender: TObject);
    procedure BGBCentro_destino_tcClick(Sender: TObject);
    procedure BGBTransporte_tcClick(Sender: TObject);
    procedure BCBCalendarioClick(Sender: TObject);
    procedure QTransitosCNewRecord(DataSet: TDataSet);
    procedure QTransitosCBeforePost(DataSet: TDataSet);
    procedure QTransitosCAfterPost(DataSet: TDataSet);
    procedure producto_tlChange(Sender: TObject);
    procedure envase_tlChange(Sender: TObject);
    procedure marca_tlChange(Sender: TObject);
    procedure categoria_tlChange(Sender: TObject);
    procedure color_tlChange(Sender: TObject);
    procedure BGBProducto_tlClick(Sender: TObject);
    procedure BGBMarca_tlClick(Sender: TObject);
    procedure BGBCategoria_tlClick(Sender: TObject);
    procedure BGBColor_tlClick(Sender: TObject);
    procedure BGBCalibre_tlClick(Sender: TObject);
    procedure TTransitosLBeforePost(DataSet: TDataSet);
    procedure TTransitosLNewRecord(DataSet: TDataSet);
    procedure cajas_tlChange(Sender: TObject);
    procedure TTransitosLBeforeEdit(DataSet: TDataSet);
    procedure RVisualizacionDblClick(Sender: TObject);
    procedure btnGastosClick(Sender: TObject);
    procedure porte_bonny_tcEnter(Sender: TObject);
    procedure porte_bonny_tcExit(Sender: TObject);
    procedure cbx_porte_bonny_tcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nota_tcEnter(Sender: TObject);
    procedure nota_tcExit(Sender: TObject);
    procedure tipo_palet_tlChange(Sender: TObject);
    procedure BGBTipoPaletClick(Sender: TObject);
    procedure BGBpuerto_tcClick(Sender: TObject);
    procedure puerto_tcChange(Sender: TObject);
    procedure planta_origen_tcChange(Sender: TObject);
    procedure planta_destino_tcChange(Sender: TObject);
    procedure btnplanta_origen_tcClick(Sender: TObject);
    procedure btnplanta_destino_tcClick(Sender: TObject);
    procedure QTransitosCAfterOpen(DataSet: TDataSet);
    procedure btnActivarClick(Sender: TObject);
    procedure envase_tlExit(Sender: TObject);
    procedure ssEnvaseAntesEjecutar(Sender: TObject);
    procedure TTransitosLCalcFields(DataSet: TDataSet);
    procedure kilos_tlChange(Sender: TObject);
    procedure precio_tlChange(Sender: TObject);
    procedure incoterm_tcChange(Sender: TObject);
    procedure BGBincoterm_cClick(Sender: TObject);
  private
    { Private declarations }
    Lista, ListaDetalle: TList;
    Objeto: TObject;

    kilosCaja: Real;
    auxEnvase, auxMarca, auxCategoria, auxColor, auxCalibre: string;
    auxKilos: Real;
    incrementar: Boolean;
    contador: string;

    procedure ValidarEntradaMaestro;
    procedure ValidarEntradaDetalle;
    procedure VerDetalle;
    procedure EditarDetalle;
    procedure AbrirTablas;
    procedure CerrarTablas;

    procedure GetContador;
    procedure PutKilosLinea;
    procedure PutKilosCaja;

    procedure AntesDeLocalizar;
    procedure AntesDeVisualizar;
    procedure AntesDeInsertar;
    procedure AntesDeModificar;

    procedure PreguntarCMR;
    procedure SeleccionarInforme;
    procedure ImprimirAlbaran;
    procedure ImprimirCMRInyeccion;
    procedure ImprimirCartaPorte;
    procedure CalcularImporte;
    procedure ImprimirAlbaranTransito;
    

  public
    { Public declarations }
    procedure Activar;
    procedure Borrar; override;
    procedure BorrarActivo;

    procedure Filtro; override;
    procedure AnyadirRegistro; override;

    //Listado
    procedure Previsualizar; override;

    function EsCentroExtranjero( const AEmpresa, ACentro: string ): boolean;
  end;

implementation

uses CVariables, CGestionPrincipal, UDMBaseDatos, CAuxiliarDB,
  Principal, UDMAuxDB, Variants, MGastosTransitos,
  QLAlbaranTransito2, UFTransportistas,  UDMCmr,
  bSQLUtils, DInfTransitosSelect, DInfTransitosPreguntar,
  DConfigMail, UDMConfig, CMaestro, PFTransitoActivar,
  CartaTransitoDL, AdvertenciaFD, bTextUtils, LFacturaTransitoProforma;

{$R *.DFM}

procedure TFMTransitosSimple.AbrirTablas;
begin
     // Abrir tablas/Querys
  if not DataSetMaestro.Active then
  begin
    DataSetMaestro.SQL.Clear;
    DataSetMaestro.SQL.Add(Select);
    DatasetMaestro.SQL.Add(Where);
    DataSetMaestro.SQL.Add(Order);
    DataSetMaestro.Open;
  end;

  if not DataSourceDetalle.DataSet.Active then
    DataSourceDetalle.DataSet.Open;

     //Estado inicial
  Registro := 1;
  Registros := 0;
  RegistrosInsertados := 0;
end;

procedure TFMTransitosSimple.CerrarTablas;
begin
  CloseAuxQuerys;
  bnCloseQuerys([DataSourceDetalle.DataSet, DataSetMaestro]);
end;

procedure TFMTransitosSimple.FormCreate(Sender: TObject);
begin
  top:= 2;
  left:= 2;

  LineasObligadas := false;
  ListadoObligado := true;
  MultipleAltas := false;

     //Variables globales
  M := Self;
  MD := Self;
  gRF := RejillaFlotante;
  gCF := Calendario;

  //Panel
  PanelMaestro := PMaestro;
  PanelDetalle := PTenerife;
  RejillaVisualizacion := RVisualizacion;

  //Fuente de datos
  DataSetMaestro := QTransitosC;
  DataSourceDetalle := DSDetalle;
  RVisualizacion.DataSource := DSDetalle;

  Select := ' SELECT * FROM frf_transitos_c ';
  where := ' WHERE empresa_tc = ' + QuotedStr('###');
  Order := ' ORDER BY fecha_tc DESC, empresa_tc, centro_tc, referencia_tc ';

  //Abrir tablas/Querys
  try
    AbrirTablas;
  except
    on e: EDBEngineError do
    begin
      ShowError(e);
      Close;
    end;
  end;

  //Lista de componentes
  Lista := TList.Create;
  PanelMaestro.GetTabOrderList(Lista);
  ListaDetalle := TList.Create;
  PanelDetalle.GetTabOrderList(ListaDetalle);

  //Muestra la barra de herramientas de Maestro/Detalle
  if FormType <> CVariables.tfMaestro then
  begin
    FormType := tfMaestroDetalle;
    BHFormulario;
  end;
  Visualizar;
  //Inicialmente grupo de desplazamiento deshabilitado
  BHGrupoDesplazamientoMaestro(pcNulo);

  //Validar entrada
  OnValidateMasterConstrains := ValidarEntradaMaestro;
  OnValidateDetailConstrains := ValidarEntradaDetalle;


  //Preparar panel de detalle
  OnViewDetail := VerDetalle;
  OnEditDetail := EditarDetalle;

  FocoAltas := empresa_tc;
  FocoModificar := transporte_tc;
  FocoLocalizar := empresa_tc;
  Calendario.Date := date;

  //Constantes para las rejillas de l combo
  empresa_tc.Tag := kEmpresa;
  planta_origen_tc.Tag := kEmpresa;
  planta_destino_tc.Tag := kEmpresa;
  centro_tc.Tag := kCentro;
  centro_destino_tc.Tag := kCentro;
  transporte_tc.Tag := kTransportista;
  puerto_tc.tag:= kAduana;

  OnBrowse:=AntesDeLocalizar;
  OnView:=AntesDeVisualizar;
  OnEdit := AntesDeModificar;
  OnInsert := AntesDeInsertar;
end;

procedure TFMTransitosSimple.FormActivate(Sender: TObject);
begin
  if not DataSetMaestro.Active then Exit;

     //Variables globales
  M := Self;
  MD := Self;
  gRF := RejillaFlotante;
  gCF := Calendario;

     //Muestra la barra de herramientas de Maestro/Detalle
  if FormType <> tfMaestroDetalle then
  begin
    FormType := tfMaestroDetalle;
    BHFormulario;
  end;
  BHGrupoDesplazamientoMaestro(PCMaestro);
  BHGrupoDesplazamientoDetalle(PCDetalle);

     //Maximizamos si no lo esta
     if Self.WindowState<>wsMaximized then
     begin
        Self.WindowState:=wsMaximized;
     end;  
end;

procedure TFMTransitosSimple.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Lista.Free;
  ListaDetalle.Free;

  //Restauramos barra de herramientas
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;

     // Cerrar tabla
  CerrarTablas;

     // Cambia acci?n por defecto para Form hijas en una aplicaci?n MDI
     // Cierra el Form y libera toda la memoria ocupada por el Form
  Action := caFree;
end;

{+ CUIDADIN }

procedure TFMTransitosSimple.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    // Tecla ENTER - Cambio entre los Controles de Datos en modo edici?n
    //               y entre los Campos de B?squeda en la localizaci?n
  case key of
    vk_Return,vk_down:
      begin
        if not nota_tc.Focused then
        begin
          Key := 0;
          PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
        end;
      end;
    vk_up:
      begin
        if not nota_tc.Focused then
        begin
          Key := 0;
          PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
        end;
      end;
    vk_f2:
      begin
        Key := 0;
        if empresa_tc.Focused then
          BGBEmpresa_tc.Click
        else
        if centro_tc.Focused then
          BGBCentro_tc.Click
        else
        if centro_destino_tc.Focused then
          BGBCentro_destino_tc.Click
        else
        if transporte_tc.Focused then
          BGBTransporte_tc.Click
        else
        if fecha_tc.Focused then
          BCBCalendario.Click
        else
        if producto_tl.Focused then
          BGBproducto_tl.Click
        else
        if marca_tl.Focused then
          BGBmarca_tl.Click
        else
        if categoria_tl.Focused then
          BGBcategoria_tl.Click
        else
        if calibre_tl.Focused then
          BGBcalibre_tl.Click
        else
        if color_tl.Focused then
          BGBcolor_tl.Click
        else
        if tipo_palet_tl.Focused then
          BGBTipoPalet.Click
        else
        if puerto_tc.Focused then
          BGBpuerto_tc.Click
        else
        if incoterm_tc.Focused then
          BGBincoterm_c.Click
        else
          Key := vk_f2;
      end;
  end;
end;

//*****************************************************************************
//*****************************************************************************
//En todos los formularios
//*****************************************************************************
//*****************************************************************************

procedure TFMTransitosSimple.Filtro;
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
          if flag then where := where + ' and ';
          if InputType = itChar then
            where := where + ' ' + name + ' LIKE ' + SQLFilter(Text)
          else
            if InputType = itDate then
              where := where + ' ' + name + ' =' + SQLDate(Text)
            else
              where := where + ' ' + name + ' =' + SQLNumeric(Text);
          flag := True;
        end;
      end;
    end;
  end;

  case cbx_porte_bonny_tc.ItemIndex of
    1:
    begin
      if flag then where := where + ' and ';
      where := where + ' porte_bonny_tc <> 0 ';
      flag := True;
    end;
    2:
    begin
      if flag then where := where + ' and ';
      where := where + ' porte_bonny_tc = 0 ';
      flag := True;
    end;
  end;

  if flag then where := ' WHERE ' + where;
end;

procedure TFMTransitosSimple.AnyadirRegistro;
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
          if flag then where := where + ' and ';
          if InputType = itChar then
            where := where + ' ' + name + ' =' + SQLFilter(Text)
          else
            if InputType = itDate then
              where := where + ' ' + name + ' =' + SQLDate(Text)
            else
              where := where + ' ' + name + ' =' + Text;
          flag := True;
        end;
      end;
    end;
  end;

  case cbx_porte_bonny_tc.ItemIndex of
    1:
    begin
      where := where + ' porte_bonny_sc <> 0 ';
    end;
    2:
    begin
      where := where + ' porte_bonny_sc = 0 ';
    end;
  end;

  where := where + ') ';
end;

procedure TFMTransitosSimple.ValidarEntradaMaestro;
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
            raise Exception.Create('Faltan datos de obligada inserci?n.');
        end;

      end;
    end;
  end;
  if ( hora_entrada_tc.Text <> '' ) and ( ( Length( hora_tc.Text ) < 5 ) or  ( Copy( hora_tc.Text, 3, 1 ) <> ':' ) )then
  begin
    raise Exception.Create('El formato de la hora de carga del tr?nsito no es correcto (hh:mm).');
  end;
  if ( hora_entrada_tc.Text <> '' ) and ( ( Length( hora_entrada_tc.Text ) < 5 ) or  ( Copy( hora_entrada_tc.Text, 3, 1 ) <> ':' ) ) then
  begin
    raise Exception.Create('El formato de la hora de entrada no es correcto (hh:mm).');
  end;
end;

procedure TFMTransitosSimple.ImprimirAlbaran;
begin
  QLAlbaranTransito2.ALbaran( empresa_tc.Text, centro_tc.Text, referencia_tc.Text,
                 fecha_tc.Text, centro_destino_tc.Text, transporte_tc.Text, Trim(n_cmr_tc.text),
                 QTransitosC);
end;

procedure TFMTransitosSimple.ImprimirAlbaranTransito;
begin
  LFacturaTransitoProforma.PreviewFactura( self, empresa_tc.Text, centro_tc.Text, StrToInt( referencia_tc.Text ),
                 StrToDate( fecha_tc.Text ) );
end;

procedure TFMTransitosSimple.ImprimirCMRInyeccion;
begin
  UDMCmr.ExecTransitoCMR(empresa_tc.Text, centro_tc.Text, referencia_tc.Text,
             fecha_tc.Text, centro_destino_tc.Text, destino_tc.Text, transporte_tc.Text, DSMaestro);
end;

procedure TFMTransitosSimple.incoterm_tcChange(Sender: TObject);
begin
  stIncoterm.Caption:= desIncoterm( incoterm_tc.Text );
end;

procedure TFMTransitosSimple.kilos_tlChange(Sender: TObject);
begin
  CalcularImporte;
end;

procedure TFMTransitosSimple.ImprimirCartaPorte;
begin
  CartaTransitoDL.Ejecutar( self,  empresa_tc.Text, centro_tc.Text, StrToInt( referencia_tc.Text ), StrToDate( fecha_tc.Text ), '' );
end;

procedure TFMTransitosSimple.PreguntarCMR;
begin
  if DInfTransitosPreguntar.Preguntar('?DESEA IMPRIMIR EL CARTA DE PORTE DEL TR?NSITO?') then
  begin
    ImprimirCartaPorte;
  end;
  if DInfTransitosPreguntar.Preguntar('?DESEA IMPRIMIR EL CMR DEL TR?NSITO?') then
  begin
    ImprimirCMRInyeccion;
  end;
  ImprimirAlbaran;
end;

procedure TFMTransitosSimple.SeleccionarInforme;
var bAlbaran, bCartaPorte ,bCMR, bFacturaTransito: boolean;
begin
  //De momento la factura de transito solo para Bonnysa
  (*case DInfTransitosSelect.Seleccionar( DMConfig.EsLaFont or (UpperCase(gsCodigo) = 'LLA012') ) of
    1: ImprimirAlbaran;
    2: ImprimirCartaPorte;
    3: ImprimirCMRInyeccion;
    4: ImprimirAlbaranTransito;   *)
  bAlbaran := false;
  bCartaPorte := false;
  bCMR := false;
  bFacturaTransito := false;
  DInfTransitosSelect.Seleccionar( bAlbaran, bCartaPorte ,bCMR, bFacturaTransito );

  if bAlbaran then
  begin
    imprimirAlbaran;
  end;

  if bCartaPorte then
  begin
    ImprimirCartaPorte;
  end;

  if bCMR then
  begin
    imprimirCMRInyeccion;
  end;

  if bFacturaTransito then
  begin
    ImprimirAlbaranTransito;
  end;
end;


procedure TFMTransitosSimple.ssEnvaseAntesEjecutar(Sender: TObject);
begin
    ssEnvase.SQLAdi := '';
    if producto_tl.Text <> '' then
      ssEnvase.SQLAdi := ' producto_e = ' +  QuotedStr(producto_tl.Text);
end;

procedure TFMTransitosSimple.Previsualizar;
begin
  DConfigMail.sEmpresaConfig:= empresa_tc.Text;
  DConfigMail.sCentroConfig:= centro_destino_tc.Text;

  if Estado <> teOperacionDetalle then
  begin
    //Dialogo que nos permite seleccionar el informe que deseamos
    SeleccionarInforme;
  end
  else
  begin
    PreguntarCMR;
    (*
    if EsCentroExtranjero( empresa_tc.Text, centro_destino_tc.Text ) then
      PreguntarCMR
    else
      ImprimirAlbaran;
    *)
  end;
end;

procedure TFMTransitosSimple.empresa_tcRequiredTime(Sender: TObject;
  var isTime: Boolean);
begin
  isTime := false;
end;

procedure TFMTransitosSimple.empresa_tcChange(Sender: TObject);
begin
  if DSMaestro.DataSet.State = dsBrowse then Exit;
  STEmpresa_tc.Caption := desEmpresa(empresa_tc.Text);
  //STCentro_tc.Caption := desCentro(empresa_tc.Text, centro_tc.Text);
  //STCentro_destino_tc.Caption := desCentro(empresa_tc.Text, centro_destino_tc.Text);
  STTransporte_tc.Caption := desTransporte(empresa_tc.Text, transporte_tc.Text);
  planta_origen_tc.Text := empresa_tc.Text;
  if DSMaestro.DataSet.State = dsInsert then
  begin
    //if Trim( referencia_tc.text) = ''  then
    GetContador;
  end;
end;

procedure TFMTransitosSimple.centro_tcChange(Sender: TObject);
begin
  if DSMaestro.DataSet.State = dsBrowse then Exit;
  STCentro_tc.Caption := desCentro(planta_origen_tc.Text, centro_tc.Text);

  if DSMaestro.DataSet.State = dsInsert then
  begin
    //if Trim( referencia_tc.text) = ''  then
    GetContador;
  end;
end;

procedure TFMTransitosSimple.centro_destino_tcChange(Sender: TObject);
begin
  if DSMaestro.DataSet.State = dsBrowse then Exit;
  STCentro_destino_tc.Caption := desCentro(planta_destino_tc.Text, centro_destino_tc.Text);
end;

procedure TFMTransitosSimple.puerto_tcChange(Sender: TObject);
begin
  stPuerto_tc.Caption := desAduana(puerto_tc.Text);
end;

procedure TFMTransitosSimple.transporte_tcChange(Sender: TObject);
begin
  if DSMaestro.DataSet.State = dsBrowse then Exit;
  STTransporte_tc.Caption := desTransporte(empresa_tc.Text, transporte_tc.Text);
end;

procedure TFMTransitosSimple.BGBEmpresa_tcClick(Sender: TObject);
begin
  DespliegaRejilla(BGBEmpresa_tc);
end;

procedure TFMTransitosSimple.BGBincoterm_cClick(Sender: TObject);
begin
  Incoterm_tc.tag := kIncoterm;
  DespliegaRejilla(BGBincoterm_c);
end;

procedure TFMTransitosSimple.BGBCentro_tcClick(Sender: TObject);
begin
  DespliegaRejilla(BGBCentro_tc, [planta_origen_tc.Text]);
end;

procedure TFMTransitosSimple.BGBCentro_destino_tcClick(Sender: TObject);
begin
  DespliegaRejilla(BGBCentro_destino_tc, [planta_destino_tc.Text]);
end;

procedure TFMTransitosSimple.BGBpuerto_tcClick(Sender: TObject);
begin
  DespliegaRejilla( BGBpuerto_tc, [] );
end;

procedure TFMTransitosSimple.BGBTransporte_tcClick(Sender: TObject);
var
  sAux: string;
begin
  //DespliegaRejilla(BGBTransporte_tc, [empresa_tc.Text]);
  sAux:= transporte_tc.Text;
  if SeleccionaTransportista( self, transporte_tc, empresa_tc.Text, sAux ) then
  begin
    transporte_tc.Text:= sAux;
  end;
end;

procedure TFMTransitosSimple.BCBCalendarioClick(Sender: TObject);
begin
  DespliegaCalendario(BCBCalendario);
end;

procedure TFMTransitosSimple.QTransitosCNewRecord(DataSet: TDataSet);
begin
  //Valores por defecto
  if estado = teAlta then
  begin
    DataSet.FieldByName('fecha_tc').AsDateTime := Date;
    DataSet.FieldByName('status_gastos_tc').ASString := 'N';
  end;
  //EN LOCALIZAR TAMBIEN INSERTAMOS UN REGISTRO NUEVO, PERO ESTE TOTALMENTE EN
  //BLANCO
  QTransitosC.FieldByName('porte_bonny_tc').AsInteger:= 1;
end;

procedure TFMTransitosSimple.GetContador;
begin
  with DMBaseDatos.QGeneral do
  begin
    if Active then Close;
    SQL.Clear;
    SQL.add(' select cont_transitos_c from frf_centros ' +
      ' where empresa_c = ' + QuotedStr(empresa_tc.text) +
      ' and centro_c = ' + QuotedStr(centro_tc.Text));
    try
      Open;
    except
      raise Exception.Create('Error al obtener el contador de tr?nsitos ...');
    end;
    if not IsEmpty then
    begin
      QTransitosC.FieldByName('referencia_tc').AsString := Fields[0].AsString;
      contador := QTransitosC.FieldByName('referencia_tc').AsString;
    end;
    Close;
  end;
end;

procedure TFMTransitosSimple.QTransitosCBeforePost(DataSet: TDataSet);
begin
  with DMBaseDatos.QGeneral do
  begin
    if DataSet.State = dsInsert then
    begin
      if Active then Close;
      SQL.Clear;
      SQL.add(' select cont_transitos_c from frf_centros ' +
        ' where empresa_c = ' + QuotedStr(empresa_tc.text) +
        ' and centro_c = ' + QuotedStr(centro_tc.Text));
      try
        Open;
      except
        raise Exception.Create('Error al obtener el contador de tr?nsitos ...');
        ShowMessage('Error al obtener el contador de tr?nsitos ...');
      end;
      if not IsEmpty then
      begin
        if contador = QTransitosC.FieldByName('referencia_tc').AsString then
        begin
          incrementar := true;
          QTransitosC.FieldByName('referencia_tc').AsString := Fields[0].AsString;
        end
        else
        begin
          incrementar := false;
        end;
      end
      else
      begin
        incrementar := false;
      end;
      Close;
    end;
    //UPDATEAR CENTRO DESTINO
    if Active then Close;
    SQL.Clear;
    SQL.add(' UPDATE frf_transitos_l ' +
      ' SET centro_destino_tl = :centro_destino ' +
      ' where empresa_tl = :empresa' +
      ' and centro_tl = :centro ' +
      ' and referencia_tl = :referencia ' +
      ' and fecha_tl = :fecha ');
    ParamByName('empresa').AsString := empresa_tc.text;
    ParamByName('centro').AsString := centro_tc.text;
    ParamByName('referencia').AsString := referencia_tc.text;
    ParamByName('fecha').AsDateTime := StrToDate(fecha_tc.text);
    ParamByName('centro_destino').AsString := centro_destino_tc.text;
    ExecSQL;
  end;
end;

procedure TFMTransitosSimple.QTransitosCAfterPost(DataSet: TDataSet);
begin
  //Para que no hayan problemas esta instruccion no deberia de fallar nunca
  if incrementar then
  begin
    with DMBaseDatos.QGeneral do
    begin
      if Active then Close;
      SQL.Clear;
      SQL.add(' update frf_centros set cont_transitos_c  = ' +
        IntToStr(QTransitosC.FieldByName('referencia_tc').AsInteger + 1) +
        ' where empresa_c = ' +
        QuotedStr(QTransitosC.FieldByName('empresa_tc').AsString) +
        ' and centro_c = ' +
        QuotedStr(QTransitosC.FieldByName('centro_tc').AsString));
      try
        ExecSql;
      except
        raise Exception.Create('Error al actualizar el contador de tr?nsitos ...');
        ShowMessage('Error al actualizar el contador de tr?nsitos ...');
      end;
    end;
  end;
end;

procedure TFMTransitosSimple.producto_tlChange(Sender: TObject);
begin
  //if DSDetalle.DataSet.State = dsBrowse then Exit;
  nomProductoT.Caption := desProductoAlta(producto_tl.Text);
  nomCategoriaT.Caption := desCategoria(empresa_tc.Text,
    producto_tl.Text,
    categoria_tl.text);
  nomColorT.Caption := desColor(empresa_tc.TExt,
    producto_tl.text,
    color_tl.Text);
end;

procedure TFMTransitosSimple.envase_tlChange(Sender: TObject);
var
  bEnvaseVar: Boolean;
begin
  nomEnvaseT.Caption := desEnvase(empresa_tc.Text, envase_tl.Text);
  if TTransitosL.State in [dsInsert, dsEdit] then
  begin
    PutKilosLinea;

    bEnvaseVar:= EnvaseUnidadesVariable( empresa_tc.Text, envase_tl.Text, producto_tl.Text );
    unidades_caja_tl.Enabled:= bEnvaseVar;
    if not bEnvaseVar or ( unidades_caja_tl.Text = '' ) then
    begin
      unidades_caja_tl.Text:= IntToStr( UnidadesEnvase( empresa_tc.Text, envase_tl.Text, producto_tl.Text ) );
    end;
  end;
end;

procedure TFMTransitosSimple.envase_tlExit(Sender: TObject);
begin
  if EsNumerico(envase_tl.Text) and (Length(envase_tl.Text) <= 5) then
    if (envase_tl.Text <> '' ) and (Length(envase_tl.Text) < 9) then
      envase_tl.Text := 'COM-' + Rellena( envase_tl.Text, 5, '0');
end;

procedure TFMTransitosSimple.marca_tlChange(Sender: TObject);
begin
  nomMarcaT.Caption := desMarca(marca_tl.Text);
end;

procedure TFMTransitosSimple.categoria_tlChange(Sender: TObject);
begin
  nomCategoriaT.Caption := desCategoria(empresa_tc.Text,
    producto_tl.Text,
    categoria_tl.text);
end;

procedure TFMTransitosSimple.color_tlChange(Sender: TObject);
begin
  nomColorT.Caption := desColor(empresa_tc.TExt,
    producto_tl.text,
    color_tl.Text);
end;

procedure TFMTransitosSimple.VerDetalle;
begin
  if DSDetalle2.DataSet <> nil then
  begin
    DSDetalle2.DataSet.Cancel;
    DSDetalle2.DataSet := nil;
  end;
  PanelDetalle.Enabled := false;
  PanelDetalle.Visible := PanelDetalle.Enabled;
end;

procedure TFMTransitosSimple.EditarDetalle;
begin
  (*QUEPAIXA*)
  FocoDetalle := producto_tl;
  DSDetalle2.DataSet := TTransitosL;
  PanelDetalle.Enabled := TRUE;
  PanelDetalle.Visible := PanelDetalle.Enabled;

  if Length( envase_tl.Text ) = 3 then
    unidades_caja_tl.Enabled:= EnvaseUnidadesVariable( empresa_tc.Text, envase_tl.Text, producto_tl.Text );
end;

procedure TFMTransitosSimple.BGBProducto_tlClick(Sender: TObject);
begin
  producto_tl.Tag := kProducto;
  DespliegaRejilla(BGBProducto_tl, [empresa_tc.Text], TRUE);
end;

procedure TFMTransitosSimple.BGBMarca_tlClick(Sender: TObject);
begin
  Marca_tl.tag := kMarca;
  DespliegaRejilla(BGBMarca_tl);
end;

procedure TFMTransitosSimple.BGBCategoria_tlClick(Sender: TObject);
begin
  Categoria_tl.Tag := kCategoria;
  DespliegaRejilla(BGBCategoria_tl, [empresa_tc.Text, producto_tl.Text]);
end;

procedure TFMTransitosSimple.BGBColor_tlClick(Sender: TObject);
begin
  Color_tl.Tag := kColor;
  DespliegaRejilla(BGBColor_tl, [empresa_tc.Text, producto_tl.Text]);
end;

procedure TFMTransitosSimple.BGBCalibre_tlClick(Sender: TObject);
begin
  Calibre_tl.Tag := kCalibre;
  DespliegaRejilla(BGBCalibre_tl, [empresa_tc.Text, producto_tl.Text]);
end;

procedure TFMTransitosSimple.TTransitosLBeforePost(DataSet: TDataSet);
var
  i: integer;
begin
  //Comprobar que no haya campos vacios
  for i := 0 to ListaDetalle.Count - 1 do
  begin
    Objeto := ListaDetalle.Items[i];
    if (Objeto is TBEdit) then
    begin
      if TBEdit(Objeto).Required and (Trim(TBEdit(Objeto).Text) = '') then
      begin
        if CanFocus then Focused;
        raise Exception.Create('Faltan datos de obligada inserci?n ...');
      end;
    end;
  end;
end;

procedure TFMTransitosSimple.TTransitosLCalcFields(DataSet: TDataSet);
begin
dataSet.fieldbyname('desEnvase').AsString := desEnvase(DataSet.FieldByName('empresa_tl').AsString, DataSet.FieldByName('envase_tl').AsString);
end;

procedure TFMTransitosSimple.TTransitosLNewRecord(DataSet: TDataSet);
begin
  //Rellenar campos que no vemos
  TTransitosL.FieldByName('empresa_tl').AsString :=
    QTransitosC.FieldByName('empresa_tc').AsString;
  TTransitosL.FieldByName('centro_tl').AsString :=
    QTransitosC.FieldByName('centro_tc').AsString;
  TTransitosL.FieldByName('referencia_tl').AsString :=
    QTransitosC.FieldByName('referencia_tc').AsString;
  TTransitosL.FieldByName('fecha_tl').AsString :=
    QTransitosC.FieldByName('fecha_tc').AsString;
  TTransitosL.FieldByName('centro_destino_tl').AsString :=
    QTransitosC.FieldByName('centro_destino_tc').AsString;

  //Valores por defecto
  TTransitosL.FieldByName('centro_origen_tl').AsString :=
    QTransitosC.FieldByName('centro_tc').AsString;
  {TTransitosL.FieldByName( 'ref_origen_tl').AsString :=
    QTransitosC.FieldByName( 'referencia_tc').AsString;
  TTransitosL.FieldByName( 'fecha_origen_tl').AsString :=
    QTransitosC.FieldByName( 'fecha_tc').AsString;}
end;

procedure TFMTransitosSimple.cajas_tlChange(Sender: TObject);
begin
  if TTransitosL.State in [dsInsert, dsEdit] then
  begin
    PutKilosLinea;
  end;
end;

procedure TFMTransitosSimple.CalcularImporte;
var rKilos, rPrecio, rImporteLinea: Real;
begin
  rKilos := StrToFloatDef(kilos_tl.Text, 0);
  rPrecio := StrToFloatDef(precio_tl.Text, 0);
  rImporteLinea := bRoundTo(rKilos * rPrecio,2);

  importe_linea_tl.Text := FormatFloat('#0.00', rImporteLinea);
end;

procedure TFMTransitosSimple.PutKilosCaja;
begin
  if length(envase_tl.Text) < 3 then
  begin
    KilosCaja := 0;
  end
  else
  begin
    with DMBaseDatos.QGeneral do
    begin
      if Active then
      begin
        Close;
      end;
      SQL.Clear;
      SQL.Add(' SELECT peso_neto_e AS kilos FROM frf_envases ' +
        ' WHERE envase_e = :envase and producto_e = :producto ');
      ParamByName('envase').AsString := envase_tl.Text;
      ParamByName('producto').AsString := producto_tl.Text;
      try
        Open;
        if not IsEmpty then
        begin
          kilosCaja := FieldByName('kilos').AsFloat;
        end;
      finally
        Close;
      end;
    end;
  end;
end;

procedure TFMTransitosSimple.PutKilosLinea;
begin
  PutKilosCaja;
  if kilosCaja <> 0 then
  begin
    if Trim(cajas_tl.Text) <> '' then
    begin
      kilos_tl.Text := FormatFloat('#0.00', StrToInt(cajas_tl.Text) * kilosCaja);
    end;
  end;
end;

procedure TFMTransitosSimple.TTransitosLBeforeEdit(DataSet: TDataSet);
begin
  auxEnvase := TTransitosL.FieldByName('envase_tl').AsString;
  auxMarca := TTransitosL.FieldByName('marca_tl').AsString;
  auxCategoria := TTransitosL.FieldByName('categoria_tl').AsString;
  auxColor := TTransitosL.FieldByName('color_tl').AsString;
  auxCalibre := TTransitosL.FieldByName('calibre_tl').AsString;
  auxKilos := TTransitosL.FieldByName('kilos_tl').AsFloat;
end;

procedure TFMTransitosSimple.RVisualizacionDblClick(Sender: TObject);
begin
  if FPrincipal.ADModificar.Enabled then
    FPrincipal.ADModificar.Execute;
end;

procedure TFMTransitosSimple.btnGastosClick(Sender: TObject);
begin
  MGastosTransitos.GastosTransito(empresa_tc.text, centro_tc.text,
    referencia_tc.text, fecha_tc.text, transporte_tc.Text, false );
end;

procedure TFMTransitosSimple.Borrar;
var botonPulsado: Word;
begin
     //Barra estado
  Estado := teBorrar;
  EstadoDetalle := tedOperacionMaestro;
  BEEstado;
  BHEstado;

     //preguntar si realmente queremos borrar
  botonPulsado := mrNo;
  //if application.MessageBox('Esta usted seguro de querer borrar la cabecera con todas sus lineas?',
  //  '  ATENCI?N !', MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON2) = IDOK then
  if VerAdvertencia( Self, #13 + #10 + ' ?Esta usted seguro de querer borrar el tr?nsito completo con su detalle asociado?', '    BORRAR TRANSITO',
                     'Quiero borrar el tr?nsito completo', 'Borrar Tr?nsito'  ) = mrIgnore then
    botonPulsado := mrYes;

  if botonPulsado = mrYes then
    BorrarActivo;

     //Por ultimo visualizamos resultado
  Visualizar;
end;

procedure TFMTransitosSimple.BorrarActivo;
begin
     //Abrir trnsaccion
  try
    AbrirTransaccion(DMBaseDatos.DBBaseDatos);
  except
    ShowError('En este momento no se puede llevar a cabo la operaci?n seleccionada.' + #10 + #13 + 'Por favor vuelva a intentarlo mas tarde.');
    Exit;
  end;

  with DMBaseDatos.QGeneral do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;
    if DMConfig.EsLaFont then
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM frf_gastos_trans ');
      SQL.Add('WHERE empresa_gt=' + quotedstr(empresa_tc.Text) +
        '  and centro_gt=' + quotedstr(centro_tc.Text) +
        '  and referencia_gt=' + referencia_tc.Text +
        '  and fecha_gt=:fecha ');
      ParamByName('fecha').asdatetime := StrToDate(fecha_tc.Text);
      try
        EjecutarConsulta(DMBaseDatos.QGeneral);
      except
        CancelarTransaccion(DMBaseDatos.DBBaseDatos);
        Exit;
      end;
    end;

    SQL.Clear;
    SQL.Add('DELETE FROM frf_transitos_l ');
    SQL.Add('WHERE empresa_tl=' + quotedstr(empresa_tc.Text) +
      '  and centro_tl=' + quotedstr(centro_tc.Text) +
      '  and referencia_tl=' + referencia_tc.Text +
      '  and fecha_tl=:fecha ');
    ParamByName('fecha').asdatetime := StrToDate(fecha_tc.Text);
    try
      EjecutarConsulta(DMBaseDatos.QGeneral);
    except
      CancelarTransaccion(DMBaseDatos.DBBaseDatos);
      Exit;
    end;

    //Borrar datos de radio frecuencia de la central
    if DMConfig.EsLaFont then
    begin
      //Borrar radiofrecuencia -DETALLE
      Sql.Clear;
      Sql.Add(' delete ');
      Sql.Add(' from rf_palet_pc_det ');
      Sql.Add(' where ean128_det in ');
      Sql.Add(' ( ');
      Sql.Add('   select ean128_cab ');
      Sql.Add('   from rf_palet_pc_cab ');
      Sql.Add('   where empresa_cab = :empresa ');
      Sql.Add('   and centro_cab = :centro ');
      Sql.Add('   and ref_transito = :referencia ');
      Sql.Add('   and fecha_transito = :fecha ');
      Sql.Add(' ) ');
      ParamByName('empresa').AsString:=empresa_tc.Text;
      ParamByName('centro').AsString:=centro_tc.Text;
      ParamByName('referencia').AsInteger:=StrToInt(referencia_tc.Text);
      ParamByName('fecha').AsDatetime:=StrToDate(fecha_tc.Text);
      try
        ExecSql;
      except
        on E:EDBEngineError do
        begin
          ShowError(E);
          raise;
        end
        else
        begin
          ShowError(' Problemas al borrar las observaciones del tr?nsito.');
          raise;
        end;
      end;

      //Borrar radiofrecuencia -CABECERA
      Sql.Clear;
      Sql.Add(' delete ');
      Sql.Add(' from rf_palet_pc_cab ');
      Sql.Add(' where empresa_cab = :empresa ');
      Sql.Add(' and centro_cab = :centro ');
      Sql.Add(' and ref_transito = :referencia ');
      Sql.Add(' and fecha_transito = :fecha ');
      ParamByName('empresa').AsString:=empresa_tc.Text;
      ParamByName('centro').AsString:=centro_tc.Text;
      ParamByName('referencia').AsInteger:=StrToInt(referencia_tc.Text);
      ParamByName('fecha').AsDatetime:=StrToDate(fecha_tc.Text);
      try
        ExecSql;
      except
        on E:EDBEngineError do
        begin
          ShowError(E);
          raise;
        end
        else
        begin
          ShowError(' Problemas al borrar las observaciones del tr?nsito.');
          raise;
        end;
      end;
    end;
  end;

    //Borramos maestro
  try
    QTransitosC.Delete;
  except
    on e: EDBEngineError do
    begin
      ShowError(e);
      CancelarTransaccion(DMBaseDatos.DBBaseDatos);
      Exit;
    end;
  end;

  AceptarTransaccion(DMBaseDatos.DBBaseDatos);
  if Registro = Registros then Registro := Registro - 1;
  Registros := Registros - 1;


end;

procedure TFMTransitosSimple.porte_bonny_tcEnter(Sender: TObject);
begin
  porte_bonny_tc.Color:= clMoneyGreen;
end;

procedure TFMTransitosSimple.porte_bonny_tcExit(Sender: TObject);
begin
  porte_bonny_tc.Color:= clBtnFace;
end;

procedure TFMTransitosSimple.precio_tlChange(Sender: TObject);
begin
  CalcularImporte;
end;

procedure TFMTransitosSimple.AntesDeInsertar;
begin
  empresa_tc.Text:= gsDefEmpresa;
  planta_origen_tc.Text:= gsDefEmpresa;
  centro_tc.Text:= gsDefCentro;
end;

procedure TFMTransitosSimple.AntesDeModificar;
var i: Integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Objeto := Lista.Items[i];
    if (Objeto is TBDEdit) then
      with Objeto as TBDEdit do
        if not Modificable then
          Enabled := false;
  end;
end;

procedure TFMTransitosSimple.AntesDeLocalizar;
begin
  porte_bonny_tc.Visible:= False;
  cbx_porte_bonny_tc.ItemIndex:= 0;
  cbx_porte_bonny_tc.Visible:= True;

  nota_tc.Enabled:= False;
  nota_tc.Color:= clBtnFace;
end;

procedure TFMTransitosSimple.AntesDeVisualizar;
var
  i: integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Objeto := Lista.Items[i];
    if (Objeto is TBDEdit) then
      with Objeto as TBDEdit do
          Enabled := True;
  end;

  porte_bonny_tc.Visible:= True;
  cbx_porte_bonny_tc.Visible:= False;

  nota_tc.Enabled:= True;
  nota_tc.Color:= clWhite;
end;

procedure TFMTransitosSimple.cbx_porte_bonny_tcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  cbx_porte_bonny_tc.DroppedDown:= True;
end;

function TFMTransitosSimple.EsCentroExtranjero( const AEmpresa, ACentro: string ): boolean;
begin
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQl.Add('select * ');
    SQl.Add('from frf_centros ');
    SQl.Add('where empresa_c = :empresa ');
    SQl.Add('  and centro_c = :centro ');
    SQl.Add('  and pais_c = ''ES'' ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    Open;
    result:= IsEmpty;
    Close;
  end;
end;

procedure TFMTransitosSimple.nota_tcEnter(Sender: TObject);
begin
  nota_tc.Color:= clMoneyGreen;
end;

procedure TFMTransitosSimple.nota_tcExit(Sender: TObject);
begin
  nota_tc.Color:= clWhite;
end;

procedure TFMTransitosSimple.tipo_palet_tlChange(Sender: TObject);
begin
  stTipo_palet_tl.Caption:= desTipoPalet( tipo_palet_tl.Text );
end;

procedure TFMTransitosSimple.BGBTipoPaletClick(Sender: TObject);
begin
  tipo_palet_tl.tag := kTipoPalet;
  DespliegaRejilla(BGBTipoPalet);
end;

procedure TFMTransitosSimple.planta_origen_tcChange(Sender: TObject);
begin
  if DSMaestro.DataSet.State = dsBrowse then Exit;
  stplanta_origen_tc.Caption := desEmpresa(planta_origen_tc.Text);
  STCentro_tc.Caption := desCentro(empresa_tc.Text, centro_tc.Text);
end;

procedure TFMTransitosSimple.planta_destino_tcChange(Sender: TObject);
begin
  if DSMaestro.DataSet.State = dsBrowse then Exit;
  stplanta_destino_tc.Caption := desEmpresa(planta_destino_tc.Text);
  STCentro_destino_tc.Caption := desCentro(planta_destino_tc.Text, centro_destino_tc.Text);
end;

procedure TFMTransitosSimple.btnplanta_origen_tcClick(Sender: TObject);
begin
  DespliegaRejilla(btnplanta_origen_tc);
end;

procedure TFMTransitosSimple.btnplanta_destino_tcClick(Sender: TObject);
begin
  DespliegaRejilla(btnplanta_destino_tc);
end;

procedure TFMTransitosSimple.QTransitosCAfterScroll(DataSet: TDataSet);
begin
  if DataSet.State = dsBrowse then
  begin
    STEmpresa_tc.Caption := desEmpresa(DataSet.FieldByName('empresa_tc').AsString);
    stplanta_origen_tc.Caption := desEmpresa(DataSet.FieldByName('planta_origen_tc').AsString);
    STCentro_tc.Caption := desCentro(DataSet.FieldByName('planta_origen_tc').AsString,
      DataSet.FieldByName('centro_tc').AsString);
    stplanta_destino_tc.Caption := desEmpresa(DataSet.FieldByName('planta_destino_tc').AsString);
    STCentro_destino_tc.Caption := desCentro(DataSet.FieldByName('planta_destino_tc').AsString,
      DataSet.FieldByName('centro_destino_tc').AsString);
    STTransporte_tc.Caption := desTransporte(DataSet.FieldByName('empresa_tc').AsString,
      DataSet.FieldByName('transporte_tc').AsString);

    btnActivar.Enabled := not QTransitosC.IsEmpty;// and not DMConfig.EsLaFont and
                         //( DataSet.FieldByName('status_tc').AsInteger = 4 );
    btnGastos.Enabled := not QTransitosC.IsEmpty and DMConfig.EsLaFont;

    case DataSet.FieldByName('status_tc').AsInteger of
      0,2: lblStatus.Caption:= ' PEND. ENVIAR';
      1,3: lblStatus.Caption:= ' ENVIADO';
      4: lblStatus.Caption:= ' PEND. ACTIVAR';
      5: lblStatus.Caption:= ' ACTIVADO';
      6: lblStatus.Caption:= ' REGULARIZADO';
      else lblStatus.Caption:= '';
    end;
  end
  else
  begin
    lblStatus.Caption:= '';
    btnActivar.Enabled:= false;
    btnGastos.Enabled := false;
  end;
end;

procedure TFMTransitosSimple.QTransitosCAfterOpen(DataSet: TDataSet);
begin
  if DataSet.State = dsBrowse then
  begin
    STEmpresa_tc.Caption := desEmpresa(DataSet.FieldByName('empresa_tc').AsString);
    stplanta_origen_tc.Caption := desEmpresa(DataSet.FieldByName('planta_origen_tc').AsString);
    STCentro_tc.Caption := desCentro(DataSet.FieldByName('planta_origen_tc').AsString,
      DataSet.FieldByName('centro_tc').AsString);
    stplanta_destino_tc.Caption := desEmpresa(DataSet.FieldByName('planta_destino_tc').AsString);
    STCentro_destino_tc.Caption := desCentro(DataSet.FieldByName('planta_destino_tc').AsString,
      DataSet.FieldByName('centro_destino_tc').AsString);
    STTransporte_tc.Caption := desTransporte(DataSet.FieldByName('empresa_tc').AsString,
      DataSet.FieldByName('transporte_tc').AsString);

    btnActivar.Enabled := not QTransitosC.IsEmpty and not DMConfig.EsLaFont and
                         ( DataSet.FieldByName('status_tc').AsInteger = 4 );
    btnGastos.Enabled := not QTransitosC.IsEmpty and DMConfig.EsLaFont;

    case DataSet.FieldByName('status_tc').AsInteger of
      0,2: lblStatus.Caption:= ' PEND. ENVIAR';
      1,3: lblStatus.Caption:= ' ENVIADO';
      4: lblStatus.Caption:= ' PEND. ACTIVAR';
      5: lblStatus.Caption:= ' ACTIVADO';
      6: lblStatus.Caption:= ' REGULARIZADO';
      else lblStatus.Caption:= '';
    end;
  end
  else
  begin
    lblStatus.Caption:= '';
    btnActivar.Enabled:= false;
    btnGastos.Enabled := false;
  end;
end;

procedure TFMTransitosSimple.btnActivarClick(Sender: TObject);
var
  Marca: TBookmark;
begin
  if not QTransitosC.IsEmpty then
  begin
    PFTransitoActivar.Activar( empresa_tc.Text, centro_tc.Text, referencia_tc.Text, fecha_tc.Text, fecha_entrada_tc.Text, hora_entrada_tc.Text );
    Marca:= QTransitosC.GetBookmark;
    QTransitosC.DisableControls;
    QTransitosC.Close;
    QTransitosC.Open;
    QTransitosC.GotoBookmark( Marca );
    QTransitosC.FreeBookmark(Marca );
    QTransitosC.EnableControls;
  end
  else
  begin
    ShowMessage('Seleccione primero el transito a activar.');
  end;
end;

(*
var
  FPTransitoActivar: TFPTransitoActivar;
begin
  FPTransitoActivar:= TFPTransitoActivar.Create( Self );
  try
    FPTransitoActivar.eEmpresa.Text:= empresa_tc.Text;
    FPTransitoActivar.edtCentroOrigen.Text:= centro_tc.Text;
    FPTransitoActivar.eRefTransito.Text:= referencia_tc.Text;
    FPTransitoActivar.eFechaTransito.Text:= fecha_tc.Text;
    FPTransitoActivar.ActiveControl:= FPTransitoActivar.edtEntrada;
    self.Enabled := false;//TransitoActivar.Show;
  except
    FreeAndNil( FPTransitoActivar );
  end;
end;
*)
(*
  if MessageDlg( 'Pone los palets asignados al transito en estado de stock, preparados para usar. ' + #13 + #10 +
              'Usar esta opci?n cuando se reciba fisicamente el tr?nsito. ' + #13 + #10 +
              '?Desea activar el tr?nsito seleccionado? ', mtConfirmation, mbOKCancel, 0 ) = mrOk then
  begin
    PDTransitoActivar.InicializarModulo;
    if PDTransitoActivar.Proceso ( planta_destino_tc.Text, centro_destino_tc.Text, n_orden_tc.Text,
                                       referencia_tc.Text, StrTodate( fecha_tc.text ) ) then
      ShowMessage('Proceso finalizado correctamente.')
    else
      ShowMessage('Tr?nsito sin palets asociados o ya activados.');
    PDTransitoActivar.FinalizarModulo;

    QTransitosC.Edit;
    QTransitosC.FieldByname('status_tc').AsInteger:= 5;
    QTransitosC.Post;
    lblStatus.Caption:= ' ACTIVADO';
    btnActivar.Enabled:= False;
  end
  else
  begin
    ShowMessage('Proceso cancelado por el usuario.');
  end;
end;
*)

procedure TFMTransitosSimple.ValidarEntradaDetalle;
var i: Integer;
begin
  //controlar que no hayan campos vacios y que se cumplan las restricciones que no
  //hemos implementado en la base de datos
  for i := 0 to ListaDetalle.Count - 1 do
  begin
    Objeto := ListaDetalle.Items[i];
    if (Objeto is TBDEdit) then
    begin
      with Objeto as TBDEdit do
      begin
        if Required and (Trim(Text) = '') then
        begin
          if Trim(RequiredMsg) <> '' then
            raise Exception.Create(RequiredMsg)
          else
            raise Exception.Create('Faltan datos de obligada inserci?n.');
          TBEdit(Objeto).setfocus;
        end;
      end;
    end;
  end;

  if nomProductoT.Caption =  '' then
  begin
    if not EsProductoAlta( producto_tl.Text) then
      raise Exception.Create(' ATENCI?N: Error al grabar la linea, el producto est? dado de BAJA. ')
    else
      raise Exception.Create('Falta el producto o es incorrecto.');
  end;


  //Es correcto el envase
  with DMBaseDatos.QAux do
  begin
    Close;
    SQL.Clear;
    SQl.Add(' select * ');
    SQl.Add(' from frf_envases ');
    SQl.Add(' where envase_e = :envase ');
    SQl.Add(' and producto_e = :producto');
    ParamByName('envase').AsString:= envase_tl.Text;
    ParamByName('producto').AsString:= producto_tl.Text;
    Open;
    if IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQl.Add(' select * ');
      SQl.Add(' from frf_envases ');
      SQl.Add(' where envase_e = :envase ');
      SQl.Add(' and producto_e is null ');
      ParamByName('envase').AsString:= envase_tl.Text;
      Open;
      if IsEmpty then
      begin
        Close;
        raise Exception.Create('La combinaci?n de envase y producto es incorrecta.');
      end;
    end;
    Close;
  end;
end;

procedure TFMTransitosSimple.Activar;
begin
  Enabled:= True;
  QTransitosC.Edit;
  try
    QTransitosC.Post;
  except
    QTransitosC.Cancel;
  end;
end;

end.

