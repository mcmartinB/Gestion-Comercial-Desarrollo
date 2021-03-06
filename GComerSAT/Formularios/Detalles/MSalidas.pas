unit MSalidas;



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, CMaestroDetalle, ActnList, Grids,
  DBGrids, BGrid, BDEdit, BSpeedButton, Menus, ComCtrls, DPreview,
  BCalendario, BEdit, BCalendarButton, BGridButton,
  CVariables, DError, QRPrntr, DBTables, DBCtrls, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlueprint, dxSkinFoggy, cxButtons, SimpleSearch, cxTextEdit, cxDBEdit,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, uSalidaUtils;

type
  TSalidaRecord = record            
    rEmpresa_sc: string;
    rCentro_salida_sc: string;
    rN_albaran_sc: integer;
    rFecha_sc: TDate;
    rHora_sc: string;
    rCliente_sal_sc: string;
    rDir_sum_sc: string;
    rCliente_fac_sc: string;
    rN_pedido_sc: string;
    rMoneda_sc: string;
    rOperadorTransporte_sc: integer;
    rTransporte_sc: integer;
    rVehiculo_sc: string;
  end;

  TFMSalidas = class(TMaestroDetalle)
    PMaestro: TPanel;
    DSMaestro: TDataSource;
    ACosecheros: TActionList;
    ARejillaFlotante: TAction;
    LEmpresa_p: TLabel;
    centro_salida_sc: TBDEdit;
    Label1: TLabel;
    BGBEmpresa_sc: TBGridButton;
    empresa_sc: TBDEdit;
    STEmpresa_sc: TStaticText;
    Label5: TLabel;
    vehiculo_sc: TBDEdit;
    operador_transporte_sc: TBDEdit;
    LCliente: TLabel;
    DSDetalle: TDataSource;
    CalendarioFlotante: TBCalendario;
    RejillaFlotante: TBGrid;
    LAno_semana_p: TLabel;
    PDetalle: TPanel;
    RVisualizacion: TDBGrid;
    STOperador_transporte_sc: TStaticText;
    BGBoperador_transporte_sc: TBGridButton;
    BGBCentro_sc: TBGridButton;
    STCentro_salida_sc: TStaticText;
    Label9: TLabel;
    n_albaran_sc: TBDEdit;
    fecha_sc: TBDEdit;
    hora_sc: TBDEdit;
    Label14: TLabel;
    cliente_sal_sc: TBDEdit;
    BGBCliente_sal_sc: TBGridButton;
    STCliente_sal_sc: TStaticText;
    Label19: TLabel;
    dir_sum_sc: TBDEdit;
    BGBDir_sum_sc: TBGridButton;
    STDir_sum_sc: TStaticText;
    cliente_fac_sc: TBDEdit;
    BGBCliente_fac_sc: TBGridButton;
    STCliente_fac_sc: TStaticText;
    Label20: TLabel;
    moneda_sc: TBDEdit;
    BGBMoneda_sc: TBGridButton;
    STMoneda_sc: TStaticText;
    LPedido: TLabel;
    n_pedido_sc: TBDEdit;
    BCBFecha_sc: TBCalendarButton;
    Label2: TLabel;
    STProducto_sl: TStaticText;
    BGBProducto_sl: TBGridButton;
    producto_sl: TBDEdit;
    Label7: TLabel;
    centro_origen_sl: TBDEdit;
    BGBCentro_origen_sl: TBGridButton;
    STCentro_origen_sl: TStaticText;
    Label6: TLabel;
    STEnvase_sl: TStaticText;
    Label15: TLabel;
    marca_sl: TBDEdit;
    BGBMarca_sl: TBGridButton;
    STMarca_sl: TStaticText;
    Label16: TLabel;
    categoria_sl: TBDEdit;
    BGBCategoria_sl: TBGridButton;
    STCategoria_sl: TStaticText;
    Label17: TLabel;
    color_sl: TBDEdit;
    BGBColor_sl: TBGridButton;
    STcolor_sl: TStaticText;
    Label18: TLabel;
    cajas_sl: TBDEdit;
    Label21: TLabel;
    precio_sl: TBDEdit;
    Label30: TLabel;
    calibre_sl: TBDEdit;
    BGBCalibre_sl: TBGridButton;
    Label31: TLabel;
    kilos_sl: TBDEdit;
    Label32: TLabel;
    unidad_precio_sl: TBDEdit;
    Label33: TLabel;
    importe_neto_sl: TBDEdit;
    STUnidades: TStaticText;
    Lporc_iva_sl: TLabel;
    porc_iva_sl: TBDEdit;
    iva_sl: TBDEdit;
    Liva_sl: TLabel;
    LImporteTotal: TLabel;
    importe_total_sl: TBDEdit;
    Label24: TLabel;
    n_palets_sl: TBDEdit;
    Label26: TLabel;
    tipo_palets_sl: TBDEdit;
    PCabecera: TPanel;
    Label8: TLabel;
    STEmpresa: TStaticText;
    Label10: TLabel;
    STCentro: TStaticText;
    Label27: TLabel;
    STFecha: TStaticText;
    STAlbaran: TStaticText;
    Label28: TLabel;
    STCliente: TStaticText;
    Label29: TLabel;
    STSuministro: TStaticText;
    Label34: TLabel;
    tipo_iva_sl: TBDEdit;
    BGBtipo_palets_sl: TBGridButton;
    Label12: TLabel;
    ref_transitos_sl: TBDEdit;
    AModificarDetalle: TAction;
    ABorrarDetalle: TAction;
    AInsertarDetalle: TAction;
    AGastos: TAction;
    AMenuEmergente: TAction;
    PanelPrecio: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    precio: TBEdit;
    StaticText1: TStaticText;
    TextoPrecio: TStaticText;
    etiquetaUnidad: TStaticText;
    QSalidasC: TQuery;
    TSalidasL: TTable;
    SBGastos: TButton;
    sbVentas: TButton;
    Label22: TLabel;
    emp_procedencia_sl: TBDEdit;
    lblFactura: TLabel;
    n_factura_sc: TBDEdit;
    fecha_factura_sc: TBDEdit;
    Label23: TLabel;
    porte_bonny_sc: TDBCheckBox;
    cbx_porte_bonny_sc: TComboBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;     
    cbx_higiene_sc: TComboBox;
    n_orden_sc: TBDEdit;
    nota_sc: TDBMemo;
    higiene_sc: TDBCheckBox;
    lblNotaFactura: TLabel;
    nota_factura_sc: TDBMemo;
    Bevel1: TBevel;
    stTipoPalets: TStaticText;
    Label38: TLabel;
    transporte_sc: TBDEdit;
    BGBtransporte_sc: TBGridButton;
    STTransporte_sc: TStaticText;
    lblNombre2: TLabel;
    stxtTipoVenta: TStaticText;
    lblNombre1: TLabel;
    lblNombre3: TLabel;
    reclamacion_sc: TDBCheckBox;
    cbx_reclamacion_sc: TComboBox;
    QAbonos: TQuery;
    lblAbonos: TLabel;
    DSAbonos: TDataSource;
    lbl1: TLabel;
    incoterm_sc: TBDEdit;
    BGBincoterm_c: TBGridButton;
    stIncoterm: TStaticText;
    lbl2: TLabel;
    plaza_incoterm_sc: TBDEdit;
    edtfecha_transito_sl: TBDEdit;
    edtcentro_transito_sl: TBDEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    unidades_caja_sl: TBDEdit;
    Label11: TLabel;
    lbl5: TLabel;
    edt_facturable_sc: TDBEdit;
    btnValidar: TButton;
    facturable_sc: TDBCheckBox;
    lblComercial: TLabel;
    comercial_sl: TBDEdit;
    btnComercial: TBGridButton;
    txtDesComercial: TStaticText;
    SBFacturable: TButton;
    btnVerAbonos: TButton;
    lbl6: TLabel;
    edtentrega_sl: TBDEdit;
    lblFechaDescarga: TLabel;
    fecha_descarga_sc: TBDEdit;
    btnFechaDescarga: TBCalendarButton;
    edtImporteFacturado: TEdit;
    btnVerImpFac: TButton;
    dbgAbonos: TDBGrid;
    btnDeposito: TButton;
    pmTransitos: TPopupMenu;
    mniAsignarTrnsito1: TMenuItem;
    lblCarpeta: TLabel;
    carpeta_deposito_sc: TBDEdit;
    btnFacturar: TButton;
    lblHasta: TLabel;
    edtFechaHasta: TBEdit;
    es_transito_sc: TBDEdit;
    btnTipoSalida: TBGridButton;
    btnEntrega: TButton;
    btnDesadv: TButton;
    lblEntrega: TLabel;
    entrega_sl: TBDEdit;
    lblAnyoSem: TLabel;
    anyo_semana_entrega_sl: TBDEdit;
    envase_sl: TcxDBTextEdit;
    ssEnvase: TSimpleSearch;
    TSalidasLempresa_sl: TStringField;
    TSalidasLcentro_salida_sl: TStringField;
    TSalidasLn_albaran_sl: TIntegerField;
    TSalidasLfecha_sl: TDateField;
    TSalidasLcentro_origen_sl: TStringField;
    TSalidasLproducto_sl: TStringField;
    TSalidasLformato_cliente_sl: TStringField;
    TSalidasLenvase_sl: TStringField;
    TSalidasLenvaseold_sl: TStringField;
    TSalidasLmarca_sl: TStringField;
    TSalidasLcategoria_sl: TStringField;
    TSalidasLcalibre_sl: TStringField;
    TSalidasLcolor_sl: TStringField;
    TSalidasLref_transitos_sl: TIntegerField;
    TSalidasLfecha_transito_sl: TDateField;
    TSalidasLcentro_transito_sl: TStringField;
    TSalidasLunidades_caja_sl: TIntegerField;
    TSalidasLcajas_sl: TIntegerField;
    TSalidasLkilos_sl: TFloatField;
    TSalidasLprecio_sl: TFloatField;
    TSalidasLunidad_precio_sl: TStringField;
    TSalidasLimporte_neto_sl: TFloatField;
    TSalidasLporc_iva_sl: TFloatField;
    TSalidasLiva_sl: TFloatField;
    TSalidasLimporte_total_sl: TFloatField;
    TSalidasLn_palets_sl: TSmallintField;
    TSalidasLtipo_palets_sl: TStringField;
    TSalidasLtipo_iva_sl: TStringField;
    TSalidasLfederacion_sl: TStringField;
    TSalidasLcliente_sl: TStringField;
    TSalidasLemp_procedencia_sl: TStringField;
    TSalidasLentrega_sl: TStringField;
    TSalidasLanyo_semana_entrega_sl: TIntegerField;
    TSalidasLcomercial_sl: TStringField;
    TSalidasLnotas_sl: TStringField;
    TSalidasLdesEnvase: TStringField;
    Label3: TLabel;
    fecha_pedido_sc: TBDEdit;
    btnFechaPedido: TBCalendarButton;
    TSalidasLid_linea_albaran_sl: TIntegerField;
    btnDesglose: TButton;
    btnValorar: TButton;
    TSalidasLkilos_reales_sl: TCurrencyField;
    TSalidasLkilos_posei_sl: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ARejillaFlotanteExecute(Sender: TObject);
    procedure PonNombre(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure RequiredTime(Sender: TObject; var isTime: Boolean);
    procedure SalirEdit(Sender: TObject);
    procedure EntrarEdit(Sender: TObject);

    procedure PonNumeroAlbaran(Sender: TObject);
    procedure RellenaClienteFacturacion(Sender: TObject);
    procedure RellenaMoneda(Sender: TObject);
    procedure CalculaImporte(Sender: TObject);
    procedure cajas_slChange(Sender: TObject);
    procedure dir_sum_scChange(Sender: TObject);
    procedure dir_sum_scExit(Sender: TObject);
    procedure ref_transitos_slExit(Sender: TObject);
    procedure kilos_slChange(Sender: TObject);
    procedure ref_transitos_slEnter(Sender: TObject);
    procedure centro_origen_slExit(Sender: TObject);
    procedure importe_neto_slChange(Sender: TObject);
    procedure CambioDeEnvase(Sender: TObject);
    procedure CambioProducto(Sender: TObject);
    procedure AGastosExecute(Sender: TObject);
    procedure AMenuEmergenteExecute(Sender: TObject);
    procedure RVisualizacionDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure precioEnter(Sender: TObject);
    procedure precioExit(Sender: TObject);
    procedure precioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure precioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure CuentaVentas(Sender: TObject);
    procedure sbVentasClick(Sender: TObject);
    procedure TSalidasLNewRecord(DataSet: TDataSet);
    procedure DSDetalleStateChange(Sender: TObject);
    procedure porte_bonny_scEnter(Sender: TObject);
    procedure porte_bonny_scExit(Sender: TObject);
    procedure QSalidasCNewRecord(DataSet: TDataSet);
    procedure SBFacturableClick(Sender: TObject);
    procedure tipo_palets_slChange(Sender: TObject);
    procedure QSalidasCAfterOpen(DataSet: TDataSet);
    procedure QSalidasCBeforeClose(DataSet: TDataSet);
    procedure btnValorarClick(Sender: TObject);
    procedure TSalidasLAfterPost(DataSet: TDataSet);
    procedure TSalidasLAfterDelete(DataSet: TDataSet);
    procedure incoterm_scChange(Sender: TObject);
    procedure porte_bonny_scClick(Sender: TObject);
    procedure unidades_caja_slChange(Sender: TObject);
    procedure nota_factura_scEnter(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure edt_facturable_scChange(Sender: TObject);
    procedure fecha_factura_scChange(Sender: TObject);
    procedure comercial_slChange(Sender: TObject);
    procedure btnVerAbonosClick(Sender: TObject);
    procedure btnVerImpFacClick(Sender: TObject);
    procedure QSalidasCAfterScroll(DataSet: TDataSet);
    procedure btnDepositoClick(Sender: TObject);
    procedure mniAsignarTrnsito1Click(Sender: TObject);
    procedure btnFacturarClick(Sender: TObject);
    procedure QSalidasCBeforeEdit(DataSet: TDataSet);
    procedure es_transito_scChange(Sender: TObject);
    procedure entrega_slChange(Sender: TObject);
    procedure btnDesadvClick(Sender: TObject);
    procedure btnEntregaClick(Sender: TObject);
    procedure envase_slExit(Sender: TObject);
    procedure ssEnvaseAntesEjecutar(Sender: TObject);
    procedure TSalidasLCalcFields(DataSet: TDataSet);
    procedure btnDesgloseClick(Sender: TObject);
    procedure TSalidasLBeforeDelete(DataSet: TDataSet);
    procedure DSDetalleDataChange(Sender: TObject; Field: TField);
    procedure TSalidasLBeforePost(DataSet: TDataSet);
    procedure ActualizarComercial(Sender: TObject);
    procedure ComprobarDatosMaestro(Sender: TObject);

    private
    { Private declarations }
    bAbonos, bImpFac: Boolean;

    ListaComponentes: TList;
    ListaDetalle: TList;
    Objeto: TObject;

    SalidaRecord: TSalidaRecord;

    bPesoVariableLinea, bEnvaseVariableLinea, bFlagCambios: Boolean;
    rPesoCaja, rImpuestoLinea: real;
    sUnidadPrecioLinea: string;

    KilosTran: string;

    albaranObtenido: Integer;

    oldEnvase, oldMatricula: string; //Para controlar la insercion de envases dados de baja


    procedure RecalcularUnidades( const ASender: TObject; const AImporte: boolean = false );
    procedure EnvaseInicial;

    procedure VerDetalle;
    procedure EditarDetalle;
    procedure ValidarEntradaDetalle;
    procedure RellenaClaveDetalle;
    procedure ValidarEntradaMaestro;
    function Consulta(value: Integer; printError: Boolean): Boolean;
    function ConsultaCentro: string;
    function ConsultaProDucto: string;
    function ConsultaTransportista: string;
    function ConsultaCliente: string;
    function ConsultaSuministro: string;
    function ConsultaCalibre: string;
    function ConsultaCategoria: string;
    function ConsultaColor: string;
    procedure AbrirTablas;
    procedure CerrarTablas;
    function GetNumeroDeAlbaran(const empresa, centro: string; const AIncrementa: boolean;
               const albaran: integer = -1): Integer;
    procedure PonPanelDetalle;
    procedure PonPanelMaestro;
    function ExisteDirSuministro: boolean;

    procedure Rejilla(boton: TBGridButton);
    procedure CambiarRegistro;
    procedure PonTextoEstaticoDetalle;
    procedure ValidarKilosTransitos;
    procedure TransitoCorrecto;

    procedure GastosClick( const AFacturable: Boolean );
    procedure QSalidasCBeforePost(DataSet: TDataSet);
    procedure QSalidasCAfterEdit(DataSet: TDataSet);
    procedure QSalidasCAfterPost(DataSet: TDataSet);

    procedure CargaRegistro;
    function  EstoyFacturada: boolean;
    function  EstoyContabilizada: boolean;

    procedure PrevFacturaProforma( const AFacDespacho: Boolean );
    procedure PreguntarInforme;
    procedure SeleccionarInforme;
    procedure PreguntarInformeEx;
    procedure SeleccionarInformeEx;
    function  UnidadesCorrectas( var AMsg: string ): Boolean;

    procedure PonFocoDetalle( const AEdit: TBEdit );

    procedure CambiarPrecio( const APrecio: real );
    procedure ValorarAlbaran;
    function  GetPrecioDiario( const ACliente, AEnvase, AMoneda: string; const AFecha: TDateTime; var VUnidad: string ): real;
    procedure ActualizarPrecio( const AUnidad: String; const APrecio, ANeto, ATipoIva, AIva: real; const ARowid: integer );

    procedure PonerIncotermPorDefecto;
    function  TieneDetalle: boolean;

    function  ValidarAlbaran: boolean;
    function  DesValidarAlbaran: boolean;
    function  ValidarLineas: Boolean;
    procedure DesasignarAlbFac;
    procedure AsignarAlbFac;

    function  ImporteFacturado: string;

    procedure ActualizarMatricula;

    procedure BotonesVisible( const AVisible: boolean );
    procedure Observaciones;
    procedure ActualizarUnidades( const AEmpresa, ACentro: string; const AFecha: TDate; const AAlbaran: Integer );
    function EsProductoDesglose: boolean;
    procedure ArticuloDesgloseInsertar;
    procedure ArticuloDesgloseModificar;
    procedure ArticuloDesgloseBorrar;
    function ObtenerLineaAlbaran: integer;
    function TieneDeposito:boolean;
    function EsCertificadoLame( const AEmpresa, ACentro, AAlbaran, AFecha: string): boolean;


  public
    { Public declarations }
    cabecera: TStringList;
    rGGN : TGGN;
    //SOBREESCRIBIR METODO
    procedure Filtro; override;
    procedure AnyadirRegistro; override;

    procedure Borrar; override;
    procedure BorrarSalida;
{    procedure Aceptar;override;}
{    procedure AceptarAltaSalida;}
    procedure AntesDeInsertar;
    procedure AntesDeLocalizar;
    procedure AntesDeModificar;
      procedure ModificarNormal;
      procedure ModificarContabilizada;
    procedure AntesDeVisualizar;
    procedure AntesDeBorrarDetalle;
{    procedure ErrorAlInsertar;}

    procedure ComprobrarClavePrimaria;

    //Listado
    function  GetFirmaFileName: string;
    procedure Previsualizar; override;
    function  PrevisualizarAlbaran( const AIdioma: Integer; const APedirFirma, AOriginal: boolean ): boolean;
    //function  PreAlbaran( const APedirFirma, AOriginal: boolean ): boolean;
    procedure PreviewCartaPorte( const APedirFirma: boolean );
    procedure PreviewCertificadoLame;

    procedure PreviewDeclaracionResponsable;

    procedure RestaurarCabecera; override;
    procedure ReintentarAlta; override;

    function esClienteExtranjero(codEmp: string; codCliente: string): Boolean;

    procedure AplicaFiltro(const AFiltro: string);

    procedure InsertarLogTransacciones(AAcion: string);

    procedure BuscarPrecioVenta;

  end;

var
  FMSalidas: TFMSalidas;
  sOrden: String = '';

implementation

uses Variants, bDialogs, LFacturaProforma, UFTransportistas, bTimeUtils, CGestionPrincipal,
  UDMBaseDatos, StrUtils, CAuxiliarDB, UDMAuxDB, Principal,  CFactura,
  UDMCmr, DFacturaProforma, MGastosSalida, DCuentaVentas ,
  bSQLUtils, DInfSalidasSelect, DInfSalidasPreguntar,
  DAsignarAlbFac, UFClientes, UFSuministros, CartaPorteDL, DConfigMail, UDMConfig,
  bMath, bTextUtils, GetFechaDiarioEnvases, CDAsignarGastosServicioVenta,
  AdvertenciaFD, UDQAlbaranSalida, UDMMaster, SeleccionarComercialFD, UQRAlbaranAlemaniaNoVar,
  CFDTransitosAduana, CRDTransitosAduanaFicha, AsignarTransitoFD, UFProcFacturacion,
  UDQAlbaranSalidaWEB, AlbaranEntreCentrosMercadonaDM, VerOrdenFD, ArticuloDesgloseSalMod,
  UDLCertificadoLame, UDLDeclaracionResponsable;
  //UQRAlbaranSat,

{$R *.DFM}

var
  Impuesto: TImpuesto;

function bnStrToFloat(AValue: string): Real;
begin
  if Trim(AValue) = '' then
    result := 0
  else
    result := StrToFloat(AValue);
end;

function bnStrToInt(AValue: string): Integer;
begin
  if Trim(AValue) = '' then
    result := 0
  else
    result := StrToInt(AValue);
end;

procedure TFMSalidas.AbrirTablas;
begin
     // Abrir tablas/Querys
  QSalidasC.SQL.Clear;
  QSalidasC.SQL.Add(Select);
  QSalidasC.SQL.Add(Where);
  QSalidasC.SQL.Add(Order);
  QSalidasC.Open;

  TSalidasL.Open;

   //Estado inicial
  if QSalidasC.IsEmpty then
  begin
    Registros := 0;
    Registro := 0;
    Estado:= teEspera;
  end
  else
  begin
    Registros := QSalidasC.RecordCount;
    Registro := 1;
    Estado:= teConjuntoResultado
  end;
 RegistrosInsertados := 0;
end;

procedure TFMSalidas.CerrarTablas;
begin
  CloseAuxQuerys;
  bnCloseQuerys([TSalidasL, QSalidasC]);
end;

//************************** CREAMOS EL FORMULARIO ************************

procedure TFMSalidas.FormCreate(Sender: TObject);
begin
  bAbonos:= False;
  bImpFac:= False;
  rPesoCaja := 0;
  rImpuestoLinea:= 0;
  bFlagCambios:= True;

  if DMConfig.EsLaFont then
  begin
    with QAbonos do
    begin
      SQL.Clear;
      SQl.Add(' select cod_serie_fac_fc serie_fal, n_factura_fc factura_fal,  fecha_factura_fc fecha_fal, cod_factura_anula_fc,');
      SQl.Add('        case when not( automatica_fc = 0 and anulacion_fc = 0 ) then ''*'' ');
      SQl.Add('              else cod_producto_fd end  producto_fal, sum( importe_neto_fd ) importe, ');
      SQL.Add('   n_remesa_rf, fecha_vencimiento_rc ');
      SQl.Add(' from tfacturas_cab ');
      SQL.Add('      join tfacturas_det on cod_factura_fc = cod_factura_fd ');
      SQL.Add('      left join tremesas_fac on cod_factura_fc = cod_factura_rf ');
      SQL.Add('      left join tremesas_cab on empresa_remesa_rc = empresa_remesa_rf ');
      SQL.Add('                            and n_remesa_rc = n_remesa_rf ');
      SQl.Add(' where cod_empresa_albaran_fd = :empresa_sc ');
      SQl.Add(' and cod_centro_albaran_fd = :centro_salida_sc ');
      SQl.Add(' and n_albaran_fd = :n_albaran_sc ');
      SQl.Add(' and fecha_albaran_fd = :fecha_sc ');
      SQl.Add(' group by cod_serie_fac_fc, factura_fal, fecha_fal, cod_factura_anula_fc, producto_fal, n_remesa_rf, fecha_vencimiento_rc  ');
      SQl.Add(' order by fecha_fal, factura_fal desc, producto_fal ');
    end;
  end;

  LineasObligadas := true;
  ListadoObligado := true;
  // INICIO
  //Tama?o y posicion del formulario
 {+}Height := 25;
  Width := 200;

    //Titulo
  Self.Caption := 'SALIDAS DE FRUTA/CABECERA';

     //Variables globales
  M := Self;
  MD := Self;
     //Panel sobre el que iran los controles
  PanelMaestro := PMaestro;
  PanelDetalle := PDetalle;
  RejillaVisualizacion := RVisualizacion;
  cabecera := TStringList.Create;

     //Fuente de datos
 {+}DataSetMaestro := QSalidasC;
  DataSourceDetalle := DSDetalle;
     //Intrucciones para sacar los datos (inicialmente consulta vacia)
 {+}Select := ' SELECT * FROM frf_salidas_c ';
  from := ' FROM frf_salidas_c ';
 {+}if sOrden <> '' then
    where := ' WHERE n_orden_sc=' + sOrden
  else
    where := ' WHERE empresa_sc=' + QuotedStr('###');

  Order := ' ORDER BY fecha_sc DESC, empresa_sc, centro_salida_sc, n_albaran_sc, cliente_sal_sc ';

     //Abrir tablas/Querys
  try
    AbrirTablas;
  except
    on e: EDBEngineError do
    begin
      ShowError(e);
      Close;
      Exit;
    end;
  end;

     //Lista de componentes
  ListaComponentes := TList.Create;
  PMaestro.GetTabOrderList(ListaComponentes);
  ListaDetalle := TList.Create;
  PDetalle.GetTabOrderList(ListaDetalle);

     //Panel principal el de cabecera
  PonPanelMaestro;
     //Muestra la barra de herramientas de Maestro/Detalle
  if FormType <> CVariables.tfMaestroDetalle then
  begin
    FormType := CVariables.tfMaestroDetalle;
    BHFormulario;
  end;
     //Inicialmente grupo de desplazamiento deshabilitado
  Visualizar;

     //Para intentar reducir el numero de veces que abrimos la consulta
  DMBaseDatos.QDespegables.Tag := 0;
     //Asignamos constantes a los componentes que los tienen
     //para facilitar distingirlos
  empresa_sc.Tag := kEmpresa;
  centro_salida_sc.Tag := kCentro;
  cliente_sal_sc.Tag := kCliente;
  cliente_fac_sc.Tag := kCliente;
  dir_sum_sc.Tag := kSuministro;
  transporte_sc.Tag := kTransportista;
  operador_transporte_sc.Tag := kTransportista;
  moneda_sc.Tag := kMoneda;
  incoterm_sc.Tag := kIncoterm;
  es_transito_sc.Tag := kTipoSalida;

  emp_procedencia_sl.Tag := kEmpresa;
  centro_origen_sl.Tag := kCentro;
  producto_sl.Tag := kProducto;
  envase_sl.Tag := kEnvase;
  marca_sl.Tag := kMarca;
  calibre_sl.Tag := kCalibre;
  categoria_sl.Tag := kCategoria;
  color_sl.Tag := kColor;
  tipo_palets_sl.Tag := kTipoPalet;
  comercial_sl.Tag := kComercial;

  fecha_sc.Tag := kCalendar;
  fecha_pedido_sc.Tag := kCalendar;
  fecha_descarga_sc.Tag := kCalendar;


     //Validar entrada
  OnValidateMasterConstrains := ValidarEntradaMaestro;
  OnValidateDetailConstrains := ValidarEntradaDetalle;
  OnInsert := AntesDeInsertar;
  OnEdit := AntesDeModificar;
  OnBrowse := AntesDeLocalizar;
  OnView := AntesDeVisualizar;
  OnViewDetail := VerDetalle;
  OnEditDetail := EditarDetalle;
  OnChangeMasterRecord := CambiarRegistro;
  OnBeforeDetailDelete := AntesDeBorrarDetalle;

{     OnErrorInsert:=ErrorAlInsertar;}

     //Asociar eventos
  QSalidasC.AfterPost := QSalidasCAfterPost;
  QSalidasC.BeforePost := QSalidasCBeforePost;
  QSalidasC.AfterEdit := QSalidasCAfterEdit;

     //Focos
  {+}  FocoAltas := empresa_sc;
  {+}  FocoModificar := cliente_sal_sc;
  {+}  FocoLocalizar := empresa_sc;
     //Inicializacion calendarios
  CalendarioFlotante.Date := Date;

     //Inicializacion variables globales


  edt_facturable_scChange(edt_facturable_sc);
  fecha_factura_scChange(fecha_factura_sc);

  lblHasta.Visible:= False;
  edtFechaHasta.Visible:= False;

  //Comer BAG
  bPesoVariableLinea:= True;
  bEnvaseVariableLinea:= True;
  bFlagCambios:= True;
  rPesoCaja:= 0;
  rImpuestoLinea:= 0;
  sUnidadPrecioLinea:= 'K';

  btnEntrega.Top:= btnDesadv.Top;
  btnEntrega.Left:= btnDesadv.Left;
  btnEntrega.Width:= 220;
  BotonesVisible( TRUE );

end;

procedure TFMSalidas.BotonesVisible( const AVisible: boolean );
begin
  btnDeposito.Enabled:= AVisible and (DMConfig.EsLaFont or DMConfig.EsLasMoradas);
//  sbVentas.Enabled:= AVisible and DMConfig.EsLaFont;
  sbVentas.Enabled := false;
  btnDesadv.Visible:= not DMConfig.EsLaFont;

  SBGastos.Visible := ( AVisible and DMConfig.EsLaFont ) or ( cliente_sal_sc.Text = 'WEB' );
  btnEntrega.Visible:= AVisible and DMConfig.EsLaFont and ( empresa_sc.Text = 'F42' );;

  btnVerImpFac.Visible:=  AVisible and DMConfig.EsLaFont;
  btnVerAbonos.Visible:=  AVisible and DMConfig.EsLaFont;
  edtImporteFacturado.Visible:=  AVisible and DMConfig.EsLaFont;
  lblAbonos.Visible:=  AVisible and DMConfig.EsLaFont;
  dbgAbonos.Visible:=  AVisible and DMConfig.EsLaFont;
  facturable_sc.Visible:=  AVisible and DMConfig.EsLaFont;
  lblFactura.Visible:=  AVisible and DMConfig.EsLaFont;
  n_factura_sc.Visible:=  AVisible and DMConfig.EsLaFont;
  fecha_factura_sc.Visible:=  AVisible and DMConfig.EsLaFont;    
  
//  SBFacturable.Visible:= AVisible and DMConfig.EsLaFont;
  btnValorar.Visible:= AVisible and DMConfig.EsLaFont;
  btnValidar.Visible:= AVisible and DMConfig.EsLaFont;
end;

procedure TFMSalidas.FormActivate(Sender: TObject);
begin
     //Variables globales
  M := Self;
  MD := Self;
  gRF := RejillaFlotante;
  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;
  gCF := CalendarioFlotante;

     //Muestra la barra de herramientas de Maestro/Detalle
  if FormType <> CVariables.tfMaestroDetalle then
  begin
    FormType := CVariables.tfMaestroDetalle;
    BHFormulario;
  end;
     //Inicialmente grupo de desplazamiento deshabilitado
  BHGrupoDesplazamientoMaestro(PCMaestro);
  BHGrupoDesplazamientoDetalle(PCDetalle);

     //Maximizamos si no lo esta
  if Self.WindowState <> wsMaximized then
    Self.WindowState := wsMaximized;
end;


procedure TFMSalidas.FormDeactivate(Sender: TObject);
begin
  gRF := nil;
  gCF := nil;
end;

procedure TFMSalidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaComponentes.Free;
  ListaDetalle.free;

  //Destruir lista de cadenas
  if cabecera <> nil then begin
    cabecera.Free;
    cabecera := nil;
  end;

  //Variables globales
  gRF := nil;
  gCF := nil;

  //Codigo de desactivacion
  CerrarTablas;

  //Restauramos barra de herramientas si es necesario
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;

  // Cambia acci?n por defecto para Form hijas en una aplicaci?n MDI
  // Cierra el Form y libera toda la memoria ocupada por el Form
  Action := caFree;
end;

procedure TFMSalidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{*}//Si la rejilla esta desplegada no hacemos nada
  if (RejillaFlotante <> nil) then
    if (RejillaFlotante.Visible) then
           //No hacemos nada
      Exit;

{*}//Si  el calendario esta desplegado no hacemos nada
  if (CalendarioFlotante <> nil) then
    if (CalendarioFlotante.Visible) then
            //No hacemos nada
      Exit;


    // Tecla ENTER - Cambio entre los Controles de Datos en modo edici?n
    //               y entre los Campos de B?squeda en la localizaci?n
  case key of
    vk_Return, vk_down:
      begin
        if not( nota_sc.Focused or nota_factura_sc.Focused ) then
        begin
          Key := 0;
          PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
        end;
      end;
    vk_up:
      begin
        if not( nota_sc.Focused or nota_factura_sc.Focused ) then
        begin
          Key := 0;
          PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
        end;
      end;
  end;
end;

//*****************************************************************************
//*****************************************************************************
//En todos los formularios
//*****************************************************************************
//*****************************************************************************

//...................... FILTRO LOCALIZACION .........................
//function generica, tiene mucha importancia que los datos esten en campos
//que hereden de TBEdit y que se llamen igual que el campo al que representan
//en la base de datos
//....................................................................

procedure TFMSalidas.Filtro;
var Flag: Boolean;
  i: Integer;
  dFechaDesde, dFechaHasta: TDateTime;
begin
  where := '';
  Flag := false;
  for i := 0 to ListaComponentes.Count - 1 do
  begin
    Objeto := ListaComponentes.Items[i];
    if (Objeto is TBEdit) then
    begin
      with Objeto as TBEdit do
      begin
        if ( Name <> 'fecha_sc' ) and ( Name <> 'edtFechaHasta' ) then
        if ( Trim(Text) <> '' ) and Visible then
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

  if ( fecha_sc.Text <> '' ) or ( edtFechaHasta.Text <> '' ) then
  begin
    if ( fecha_sc.Text <> '' ) and ( edtFechaHasta.Text <> '' ) then
    begin
      dFechaDesde:= StrToDateTime( fecha_sc.Text );
      dFechaHasta:= StrToDateTime( edtFechaHasta.Text );
      if dFechaHasta < dFechaDesde then
        Raise Exception.Create('Rango de fechas incorrecto.');
      if flag then where := where + ' and ';
      if ( fecha_sc.Text <> '' )  then
        where := where + ' fecha_sc ' + ' between ' + SQLDate(fecha_sc.Text) + ' and ' + SQLDate(edtFechaHasta.Text);
      flag := True;
    end
    else
    begin
    (*
      if ( fecha_sc.Text <> '' )  then
      begin
        dFechaDesde:= StrToDateTime( fecha_sc.Text );
      end
      else
      begin
        dFechaHasta:= StrToDateTime( edtFechaHasta.Text );
      end;
    *)
      if flag then where := where + ' and ';
      if ( fecha_sc.Text <> '' )  then
      begin
        where := where + ' fecha_sc ' + ' =' + SQLDate(fecha_sc.Text);
      end
      else
      begin
        where := where + ' fecha_sc ' + ' =' + SQLDate(edtFechaHasta.Text);
      end;
      flag := True;
    end;
  end;  

  case cbx_porte_bonny_sc.ItemIndex of
    1:
    begin
      if flag then where := where + ' and ';
      where := where + ' porte_bonny_sc <> 0 ';
      flag := True;
    end;
    2:
    begin
      if flag then where := where + ' and ';
      where := where + ' porte_bonny_sc = 0 ';
      flag := True;
    end;
  end;

  case cbx_higiene_sc.ItemIndex of
    1:
    begin
      if flag then where := where + ' and ';
      where := where + ' higiene_sc <> 0 ';
      flag := True;
    end;
    2:
    begin
      if flag then where := where + ' and ';
      where := where + ' higiene_sc = 0 ';
      flag := True;
    end;
  end;

  case cbx_reclamacion_sc.ItemIndex of
    1:
    begin
      if flag then where := where + ' and ';
      where := where + ' reclamacion_sc <> 0 ';
      flag := True;
    end;
    2:
    begin
      if flag then where := where + ' and ';
      where := where + ' reclamacion_sc = 0 ';
      flag := True;
    end;
  end;

  if facturable_sc.State = cbUnchecked then
  begin
    if flag then where := where + ' and ';
    where := where + ' facturable_sc = 0 ';
    flag := True;
  end
  else
  if facturable_sc.State = cbChecked then
  begin
    if flag then where := where + ' and ';
    where := where + ' facturable_sc <> 0 ';
    flag := True;
  end;

  if flag then where := ' WHERE ' + where;
end;

//...................... REGISTROS INSERTADOS .........................
//function generica, tiene mucha importancia que los datos esten en campos
//que hereden de TBDEdit y que se llamen igual que el campo al que representan
//en la base de datos. Si quieres que salgan aqui pon a True la propiedad
// PrimaryKey del componente.
//....................................................................

procedure TFMSalidas.AnyadirRegistro;
var Flag: Boolean;
  i: Integer;
begin
  Flag := false;
  if where <> '' then where := where + ' OR ('
  else where := ' WHERE (';

  for i := 0 to ListaComponentes.Count - 1 do
  begin
    objeto := ListaComponentes.Items[i];
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
  where := where + ') ';
end;

//...................... VALIDAR CAMPOS .........................
//function generica, tiene mucha importancia que los datos esten en campos
//que hereden de TBDEdit y que se llamen igual que el campo al que representan
//en la base de datos. Si quieres que salgan aqui pon a True la propiedad
// Required del componente y en RequiredMsg el mensaje que quieres mostrar
//....................................................................
// La funcion generica que realiza es comprobar que los campos que tienen
// datos por obligacion los tengan, en caso de querer hacer algo mas hay
// que implenentarlo, como comprobar la existencia de un valor en la base
// de datos
//....................................................................

procedure TFMSalidas.ValidarEntradaMaestro;
var
  i: Integer;
  dAuxDate, dDescarga, dFecPedido: TDateTime;
begin
    //REQUERIDOS
  for i := 0 to ListaComponentes.Count - 1 do
  begin
    Objeto := ListaComponentes.Items[i];
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
          TBEdit(Objeto).setfocus;
        end;

      end;
    end;
  end;

  if empresa_sc.Text = '080' then
  begin
    raise Exception.Create('ATENCION! No se puede crear albaranes en la 080.');
  end;
  

    //Comprobar que la fecha se correcta
  if not TryStrTodate( fecha_sc.Text, dAuxDate ) then
  begin
    if fecha_sc.CanFocus then
      fecha_sc.SetFocus;
    raise Exception.Create('Fecha incorrecta.');
  end;

  if DMConfig.EsLaFont then
  if ( Length( hora_sc.Text ) < 5 ) or  ( Copy( hora_sc.Text, 3, 1 ) <> ':' ) then
  begin
    raise Exception.Create('Falta la hora de carga o el formato no es correcto (hh:mm).');
  end;

  //fecha pedido
  //Fecha de pedido obligatoria para el cliente Sainsbury - Campo obligatorio en ficheros EDI 13/11/2018
  if (cliente_sal_sc.Text = 'JS') and (fecha_pedido_sc.Text = '') then
        raise Exception.Create('Para el cliente ' + cliente_sal_sc.Text + ' es obligatorio la fecha de pedido.');

  if fecha_pedido_sc.Text <> '' then
  begin
    if TryStrTodate( fecha_pedido_sc.Text, dFecPedido ) then
    begin
      if dFecPedido > dAuxDate then
      begin
        if fecha_pedido_sc.CanFocus then
          fecha_pedido_sc.SetFocus;
        raise Exception.Create('Fecha de pedido debe de ser menor o igual a la fecha del albaran.');
      end;
    end
    else
    begin
      if fecha_pedido_sc.CanFocus then
        fecha_pedido_sc.SetFocus;
      raise Exception.Create('Fecha de pedido incorrecta.');;
    end;
  end;


  //fecha descarga
  if fecha_descarga_sc.Text <> '' then
  begin
    if TryStrTodate( fecha_descarga_sc.Text, dDescarga ) then
    begin
      if dDescarga < dAuxDate then
      begin
        if fecha_descarga_sc.CanFocus then
          fecha_descarga_sc.SetFocus;
        raise Exception.Create('Fecha de descarga debe de ser superior o igual a la de descarga.');
      end;
    end
    else
    begin
      if fecha_descarga_sc.CanFocus then
        fecha_descarga_sc.SetFocus;
      raise Exception.Create('Fecha descarga incorrecta.');;
    end;
  end;


    //Clave primaria si es una alta
  if DSMaestro.State <> dsEdit then
    ComprobrarClavePrimaria;

    //Restricciones ALTAS-MODIFICAR
    //Empresa
  if DSMaestro.State <> dsEdit then
    if Trim(STEmpresa_sc.Caption) = '' then
    begin
      cliente_sal_sc.SetFocus;
      raise Exception.Create('C?digo de Empresa incorrecto.');
    end;

    //Centro
  if DSMaestro.State <> dsEdit then
    if Trim(STCentro_salida_sc.Caption) = '' then
    begin
      cliente_sal_sc.SetFocus;
      raise Exception.Create('C?digo de Centro incorrecto.');
    end;

    //Cliente salida
  if (Trim(STcliente_sal_sc.Caption) = '') then
  begin
    cliente_sal_sc.SetFocus;
    raise Exception.Create('Cliente de salida incorrecto.');
  end;

  //DIRECCION SUMINISTRO
  if (Trim(STDir_sum_sc.Caption) = '') then
  begin
    dir_sum_sc.SetFocus;
    raise Exception.Create('Falta la direccion de suministro o es incorrecta.');
  end;
//  if dir_sum_sc.Text <> cliente_sal_sc.Text then
//  begin
    //COMPROBAR CLAVE AJENA
    if not ExisteDirSuministro then
    begin
      dir_sum_sc.setfocus;
      raise Exception.Create('Direcci?n de suministro incorrecta o de baja');
    end;
//  end;
  //Cliente facturacion
  if (Trim(STcliente_fac_sc.Caption) = '') then
  begin
    cliente_fac_sc.SetFocus;
    raise Exception.Create('Falta cliente de facturaci?n o es incorrecto.');
  end;
  //Moneda
  if (Trim(STMoneda_sc.Caption) = '') then
  begin
    moneda_sc.SetFocus;
    raise Exception.Create('Falta moneda o es  incorrecta.');
  end;
     //Transporte
  if (Trim(STOperador_transporte_sc.Caption) = '') and (Trim(STtransporte_sc.Caption) = '') then
  begin
    transporte_sc.SetFocus;
    raise Exception.Create('Transporte incorrecto.');
  end
  else
  if (Trim(STOperador_transporte_sc.Caption) = '') then
  begin
    operador_transporte_sc.Text:= transporte_sc.Text;
  end
  else
  if (Trim(STtransporte_sc.Caption) = '') then
  begin
    transporte_sc.Text:= operador_transporte_sc.Text;
  end;

  if porte_bonny_sc.State = cbGrayed then
  begin
    porte_bonny_sc.setFocus;
    raise Exception.Create('Falta seleccionar quien paga el porte.');
  end;

  if Trim(incoterm_sc.text) = '' then
  begin
    DSMaestro.DataSet.FieldByname('incoterm_sc').Value := NULL;
    DSMaestro.DataSet.FieldByname('plaza_incoterm_sc').Value := NULL;
  end;


  if es_transito_sc.Text = '' then
  begin
    es_transito_sc.setFocus;
    raise Exception.Create('Falta tipo de la salida.');
  end
  else
  begin
    if stxtTipoVenta.Caption = '' then
    begin
      es_transito_sc.setFocus;
      raise Exception.Create('El tipo de la salida es incorecto.');
    end;
  end;

    //Guardar cabecera
  if (Estado = teAlta) then
    CargaRegistro;
end;

procedure TFMSalidas.PrevFacturaProforma( const AFacDespacho: Boolean );
var
  iAux: integer;
begin
  QRLFacturaProforma := TQRLFacturaProforma.Create(self);
  try
    FDFacturaProforma:= TFDFacturaProforma.Create(Self);
  except
    FreeAndNil(QRLFacturaProforma);
    Exit;
  end;

  try
    with FDFacturaProforma do
    begin
      RellenaDatos(empresa_sc.Text, centro_salida_sc.Text, fecha_sc.Text,
        n_albaran_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text, AFacDespacho);
      ShowModal;
      iAux:= StrToInt(nCopias.Text);
      QRLFacturaProforma.ReportTitle:= sTitulo;
    end ;

    if iAux > 0 then
    begin
      QRLFacturaProforma.StringGrid:= FDFacturaProforma.StringGrid1;
      QRLFacturaProforma.printerSettings.Copies:= iAux;
      try
        if not DMConfig.EsLaFont then
          QRLFacturaProforma.Configurar( empresa_sc.Text, centro_salida_sc.Text, PaisCliente( empresa_sc.Text, cliente_sal_sc.Text ) = 'ES', AFacDespacho, cliente_sal_sc.Text );
        Previsualiza(QRLFacturaProforma,iAux);
      finally
        FreeAndNil( QRLFacturaProforma );
      end;
    end
    else
    begin
      FreeAndNil(QRLFacturaProforma);
    end;
    FreeAndNil(FDFacturaProforma);
  except
    FreeAndNil(QRLFacturaProforma);
    FreeAndNil(FDFacturaProforma);
  end;
end;


procedure AddMsg( var AMsg: string; const ACad: string );
begin
  if AMsg = '' then
    AMsg:=  ACad
  else
    AMsg:=  AMsg + #13 + #10 + ACad;
end;

function TFMSalidas.UnidadesCorrectas( var AMsg: string ): Boolean;
begin
  AMsg:= '';
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add('select producto_sl, envase_sl, unidades_caja_sl, unidades_variable_e, unidades_e,  kilos_sl, peso_variable_e, round( peso_neto_e * cajas_sl, 2) peso ');
    SQL.Add('from frf_salidas_l join frf_envases on envase_e = envase_sl ');
    SQL.Add('where empresa_sl = :empresa ');
    SQL.Add('and centro_salida_sl = :centro ');
    SQL.Add('and n_albaran_sl = :albaran ');
    SQL.Add('and fecha_sl = :fecha ');
    ParamByName('empresa').AsString:= empresa_sc.Text;
    ParamByName('centro').AsString:= centro_salida_sc.Text;
    ParamByName('fecha').AsString:= fecha_sc.Text;
    ParamByName('albaran').AsString:= n_albaran_sc.Text;
    Open;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        //Kilos
        if FieldByName('peso_variable_e').AsInteger = 0 then
        begin
          if FieldByName('kilos_sl').AsInteger <> FieldByName('peso').AsInteger then
          begin
            AddMsg( AMsg, 'ERROR: No coincide los kilos para el art?culo ' + FieldByname('envase_sl').AsString +
                          ' Albaran: ' +  FieldByname('kilos_sl').AsString +  ' Esperado: ' +
                          FieldByname('peso').AsString );
          end;
        end;
        //Unidades
        if FieldByName('unidades_variable_e').AsInteger = 0 then
        begin
          if FieldByName('unidades_caja_sl').AsInteger <> FieldByName('unidades_e').AsInteger then
          begin
            AddMsg( AMsg, 'ERROR: No coincide las unidades por caja para el art?culo ' + FieldByname('envase_sl').AsString +
                          ' Albaran: ' +  FieldByname('unidades_caja_sl').AsString +  ' Esperado: ' +
                          FieldByname('unidades_e').AsString );
          end;
        end;
        Next;
      end;
    end
    else
    begin
      AMsg:= 'ERROR: Albaran sin lineas.';
    end;
    Close;
  end;
  Result:= AMsg = '';
end;

procedure TFMSalidas.SeleccionarInforme;
var
  sMsg: string;
begin
  if UnidadesCorrectas( sMsg ) then
  begin
    SeleccionarInformeEx;
  end
  else
  begin
    if VerAdvertencia( Self, Trim( sMsg ) ) = mrIgnore then
    begin
      SeleccionarInformeEx
    end;
  end;
end;

procedure TFMSalidas.PreguntarInforme;
var
  sMsg: string;
begin
  if UnidadesCorrectas( sMsg ) then
  begin
    PreguntarInformeEx;
  end
  else
  begin
    if VerAdvertencia( Self, Trim( sMsg ) ) = mrIgnore then
    begin
      PreguntarInformeEx;
    end;
  end;
end;

procedure TFMSalidas.SeleccionarInformeEx;
var
  iTipoAlbaran, iResult: integer;
  bPedirFirma, bOriginal, bCertificadoLame: boolean;
  bFlag: boolean;
begin
  bPedirFirma:= gbFirmar;
  iTipoAlbaran:= TipoAlbaran( empresa_sc.Text, cliente_sal_sc.Text );
  bCertificadoLame := EsCertificadoLame(empresa_sc.Text, centro_salida_sc.Text, n_albaran_sc.Text, fecha_sc.Text);
  iResult:= DInfSalidasSelect.Seleccionar( iTipoAlbaran, bPedirFirma, bOriginal, bCertificadoLame );

  bFlag:= True;

  if (iResult - 100000 ) >= 0 then
  begin
    iResult := iResult - 100000;
    //bFlag
    PreviewDeclaracionResponsable;
  end;


  if ( iResult - 10000 ) >= 0 then
  begin
    iResult:= iResult - 10000;
    //bFlag:=
    PrevisualizarAlbaran( iTipoAlbaran, bPedirFirma, bOriginal );
  end;

  if ( iResult - 1000 ) >= 0 then
  begin
    iResult:= iResult - 1000;
    //bFlag:=
    PreviewCertificadoLame;
  end;

  if bFlag then
  begin
    if ( iResult - 100 ) >= 0 then
    begin
      iResult:= iResult - 100;
      PreviewCartaPorte( bPedirFirma );
    end;

    if ( iResult - 10 ) >= 0 then
    begin
      iResult:= iResult - 10;

      UDMCmr.ExecVentaCMR( empresa_sc.Text, centro_salida_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text, transporte_sc.Text, nota_sc.Text,
                      StrToDate( fecha_sc.Text ), StrToInt( n_albaran_sc.Text ), QSalidasC.FieldByName('higiene_sc').AsInteger = 1 );
    end;

    if ( iResult mod 10 ) = 1 then
    begin
      PrevFacturaProforma( false );
    end
    else
    if ( iResult mod 10 ) = 2 then
    begin
      PrevFacturaProforma( True );
    end;
  end;
end;

procedure TFMSalidas.PreguntarInformeEx;
var
  iTipoAlbaran: integer;
  bPedirFirma, bOriginal: boolean;
begin
  if esClienteExtranjero(empresa_sc.Text, cliente_sal_sc.Text) or (Cliente_sal_sc.Text = 'DAI') then
  begin
    if DInfSalidasPreguntar.Preguntar( 0, bPedirFirma, bOriginal ) then
    begin
      iTipoAlbaran:= TipoAlbaran( empresa_sc.Text, cliente_sal_sc.Text );
      if iTipoAlbaran = 2 then
        iTipoAlbaran:= 1
      else
        iTipoAlbaran:= 0;
      PrevisualizarAlbaran( iTipoAlbaran, bPedirFirma, bOriginal );
    end;
    if DMConfig.EsUnAlmacen then
    begin
      if DInfSalidasPreguntar.Preguntar( 1, bPedirFirma, bOriginal ) then
      begin
        UDMCmr.ExecVentaCMR( empresa_sc.Text, centro_salida_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text, transporte_sc.Text, nota_sc.Text,
                      StrToDate( fecha_sc.Text ), StrToInt( n_albaran_sc.Text ), QSalidasC.FieldByName('higiene_sc').AsInteger = 1 );
      end;
      if  DInfSalidasPreguntar.Preguntar( 2,  bPedirFirma, bOriginal ) then
        PrevFacturaProforma( False );
    end;
  end
  else
  begin
    if DInfSalidasPreguntar.Preguntar( 0, bPedirFirma, bOriginal ) then
    begin
      iTipoAlbaran:= TipoAlbaran( empresa_sc.Text, cliente_sal_sc.Text );
      if iTipoAlbaran = 2 then
        iTipoAlbaran:= 1
      else
        iTipoAlbaran:= 0;
      PrevisualizarAlbaran( iTipoAlbaran, bPedirFirma, bOriginal );
    end;
    if DMConfig.EsUnAlmacen then
    begin
      //if Preguntar( 3, AImpresora ) then
      PreviewCartaPorte( bPedirFirma );
      if DInfSalidasPreguntar.Preguntar( 2,  bPedirFirma, bOriginal ) then
        PrevFacturaProforma( False );
    end;
  end;
end;

procedure TFMSalidas.Previsualizar;
begin
  DConfigMail.sEmpresaConfig:= empresa_sc.Text;
  DConfigMail.sClienteConfig:= cliente_sal_sc.Text;
  DConfigMail.sSuministroConfig:= dir_sum_sc.Text;
  DConfigMail.sAlbaranConfig:= n_albaran_sc.Text;
  DConfigMail.sFechaConfig:= fecha_sc.Text;
  if cliente_sal_sc.Text = 'GL' then
  begin
      DConfigMail.sAsunto:= 'Envio Albar?n [' + cliente_sal_sc.Text + '-' + n_albaran_sc.Text + ' || ' +
                             desProductoVenta(producto_sl.Text) + ' || ' +
                             vehiculo_sc.Text + ' || ' +
                             desSuministroEx(empresa_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text);
//                             desPaisSuministro(empresa_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text);
  end
  else
  begin
    if n_pedido_sc.Text <> '' then
      DConfigMail.sAsunto:= 'Envio Albar?n [' + cliente_sal_sc.Text + '-' + n_albaran_sc.Text + '] - Pedido: ' + n_pedido_sc.Text
    else
      DConfigMail.sAsunto:= 'Envio Albar?n [' + cliente_sal_sc.Text + '-' + n_albaran_sc.Text + ']';
  end;

  if Estado <> teOperacionDetalle then
  begin
    //Dialogo que nos permite seleccionar el informe que deseamos
    SeleccionarInforme;
  end
  else
  begin
    //Serie de preguntas para imprimir los distintos informes
    PreguntarInforme;
  end;
end;


function  TFMSalidas.GetFirmaFileName: string;
var
  sFilename: string;
  iAnyo, iMes, iDia: word;
begin

  result:= '';
  if gsDirFirmasGlobal <> '' then
  begin
    if DirectoryExists( gsDirFirmasGlobal ) then
      result:=  gsDirFirmasGlobal;
  end;
  if result = '' then
  begin
    if gsDirFirmasLocal <> '' then
    begin
      if DirectoryExists( gsDirFirmasLocal ) then
        result:=  gsDirFirmasLocal;
    end;
  end;

  if result <> '' then
  begin
    DecodeDate( StrToDate( fecha_sc.Text ), iAnyo, iMes, iDia );
    sFilename:= intToStr( iAnyo ) + empresa_sc.Text + centro_salida_sc.Text + cliente_sal_sc.Text + '-' + n_albaran_sc.Text;
    result:= result + '\' + sFileName + '.jpg';
  end;
end;

procedure TFMSalidas.PreviewCartaPorte( const APedirFirma: boolean );
var
  SFileName: string;
begin
  SFileName:= GetFirmaFileName;
  (*BAG
  if APedirFirma then
  begin
    if sFileName = '' then
    begin
      ShowMessage('Falta inicializar la ruta para guardar las firmas.');
    end
    else
    begin
      if not FileExists( sFileName ) then
      if not SignatureForm.SignSave( self, sFilename, sMsg ) then
      begin
        ShowMessage( sMsg );
      end;
        //GetFirma( self, sFilename );//OLDTablet
    end;
  end;
  *)

  CartaPorteDL.Ejecutar( self, empresa_sc.Text, centro_salida_sc.Text,
                         StrToInt(n_albaran_sc.Text), StrToDate(fecha_sc.Text),
                         SFileName );
end;

procedure TFMSalidas.PreviewDeclaracionResponsable;
begin
   UDLDeclaracionResponsable.Ejecutar(self, empresa_sc.Text, centro_salida_sc.Text, StrToInt(n_albaran_sc.Text) ,StrToDate(fecha_sc.Text));
end;


procedure TFMSalidas.PreviewCertificadoLame;
begin
  UDLCertificadoLame.Ejecutar( self, empresa_sc.Text, centro_salida_sc.Text,
                              StrToInt(n_albaran_sc.Text), StrToDate(fecha_sc.Text));
end;

function TFMSalidas.PrevisualizarAlbaran( const AIdioma: Integer; const APedirFirma, AOriginal: boolean ): boolean;
begin
  Result:= False;

  self.rGGN :=   ConfigurarGGN('database', empresa_sc.text, centro_salida_sc.text, StrToInt(n_albaran_sc.Text), StrToDateTime(fecha_sc.Text));

  if AIdioma = 0 then
  begin

    if cliente_sal_sc.Text = 'WEB' then
    begin
       result:= UDQAlbaranSalidaWEB.PreAlbaran( Self, empresa_sc.text, centro_salida_sc.Text,
                   StrToInt( n_albaran_sc.Text), StrToDateTime( fecha_sc.Text ), APedirFirma, AOriginal, self.rggn );
    end
    else
    if empresa_sc.Text = '506'  then
    begin
       result:= AlbaranEntreCentrosMercadonaDM.PreAlbaran( Self, empresa_sc.text, centro_salida_sc.Text,
                   StrToInt( n_albaran_sc.Text), StrToDateTime( fecha_sc.Text ), APedirFirma, AOriginal, self.rggn );
    end
    else
    if ( cliente_sal_sc.Text = 'GOM' ) or ( cliente_sal_sc.Text = 'ERO' ) or
       ( cliente_sal_sc.Text = 'THA' ) or ( cliente_sal_sc.Text = 'M&W' ) or
       ( cliente_sal_sc.Text = 'APS' ) or ( cliente_sal_sc.Text = 'P' ) or (cliente_sal_sc.Text = 'DPS') then
    begin
      result:= UDQAlbaranSalida.PreAlbaran( Self, empresa_sc.text, centro_salida_sc.Text,
                   StrToInt( n_albaran_sc.Text), StrToDateTime( fecha_sc.Text ), APedirFirma, AOriginal, self.rggn );
    end
    else
    begin
       result:= UDQAlbaranSalida.PreAlbaranSAT( Self, empresa_sc.text, centro_salida_sc.Text,
                   StrToInt( n_albaran_sc.Text), StrToDateTime( fecha_sc.Text ), APedirFirma, AOriginal, self.rggn );
    end;
  end
  else
  if AIdioma = 1 then
  begin
    result:= UQRAlbaranAlemaniaNoVar.PreAlbaranAleman( empresa_sc.Text, centro_salida_sc.Text, cliente_sal_sc.Text, StrToInt( n_albaran_sc.text ),
                               StrToDate( fecha_sc.text ), APedirFirma, AOriginal, self.rggn );
  end
  else
  if AIdioma = 2 then
  begin
      //Valorado
      result := UDQAlbaranSalida.PreAlbaranIngles(Self, empresa_sc.text, centro_salida_sc.Text, StrToInt(n_albaran_sc.Text), StrToDateTime(fecha_sc.Text), APedirFirma, AOriginal, self.rggn);
  end;
end;

//actualiza el campo comercial seg?n cliente y producto seg?n SI-1282
procedure TFMSalidas.ActualizarComercial(Sender: TObject);
begin
    comercial_sl.Text := GetCodeComercial(producto_sl.Text, cliente_sal_sc.Text, StrToDate(fecha_sc.Text));
end;

//*****************************************************************************
//*****************************************************************************
//Funciones asociadas a la rejilla flotante
//Si no existe la rejilla flotante
//   - Borrar Lista de acciones
//   - Borrar las funciones de esta seccion
//*****************************************************************************
//*****************************************************************************

procedure TFMSalidas.ARejillaFlotanteExecute(Sender: TObject);
var
  sAux: string;
begin
  if envase_sl.Focused then
    ssEnvase.Execute;

  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;
  if ActiveControl <> nil then
  case ActiveControl.Tag of
    kEmpresa:
      begin
        DespliegaRejilla(BGBEmpresa_sc);
      end;
    kCentro:
      begin
        if centro_salida_sc.Focused then
        begin
          DespliegaRejilla(BGBcentro_sc, [empresa_sc.Text])
        end
        else
        begin
          if Trim(ref_transitos_sl.Text) = '' then
          begin
            DespliegaRejilla(BGBCentro_origen_sl, [empresa_sc.Text])
          end
          else
          begin
            Rejilla(BGBcentro_origen_sl);
          end;
        end;
      end;
    kCliente:
      begin
        if cliente_sal_sc.Focused then
        begin
          //DespliegaRejilla(BGBcliente_sal_sc, [empresa_sc.Text])
          sAux:= cliente_sal_sc.Text;
          if SeleccionaClientes( self, cliente_sal_sc, empresa_sc.Text, sAux ) then
          begin
            cliente_sal_sc.Text:= sAux;
          end;
        end
        else
        begin
          //DespliegaRejilla(BGBcliente_fac_sc, [empresa_sc.Text]);
          sAux:= cliente_fac_sc.Text;
          if SeleccionaClientes( self, cliente_fac_sc, empresa_sc.Text, sAux ) then
          begin
            cliente_fac_sc.Text:= sAux;
          end;
        end;
      end;
    kSuministro:
      //DespliegaRejilla(BGBdir_sum_sc, [empresa_sc.Text, cliente_sal_sc.Text]);
      begin
        sAux:= dir_sum_sc.Text;
        if SeleccionaSuministros( self, dir_sum_sc, empresa_sc.Text, cliente_sal_sc.Text, sAux ) then
        begin
          dir_sum_sc.Text:= sAux;
        end;
      end;
    kMoneda: DespliegaRejilla(BGBmoneda_sc);
    kIncoterm: DespliegaRejilla(BGBincoterm_c);
    kTransportista:
    if operador_transporte_sc.Focused then
    begin
      sAux:= operador_transporte_sc.Text;
      if SeleccionaTransportista( self, operador_transporte_sc, empresa_sc.Text, sAux ) then
      begin
        operador_transporte_sc.Text:= sAux;
      end;
    end
    else
    begin
      sAux:= transporte_sc.Text;
      if SeleccionaTransportista( self, transporte_sc, empresa_sc.Text, sAux ) then
      begin
        transporte_sc.Text:= sAux;
      end;
    end;
    kTipoSalida: DespliegaRejilla(btnTipoSalida);
    kProducto:
    begin
      if Trim(ref_transitos_sl.Text) = '' then
      begin
        DespliegaRejilla(BGBproducto_sl, [empresa_sc.Text], TRUE, TRUE)
      end
      else
      begin
        Rejilla(BGBproducto_sl);
      end;
    end;
    kMarca: DespliegaRejilla(BGBmarca_sl);
//    kEnvase: DespliegaRejilla(BGBenvase_sl, [empresa_sc.Text, producto_sl.Text, cliente_sal_sc.Text]);
    kColor: DespliegaRejilla(BGBcolor_sl, [empresa_sc.Text, producto_sl.Text]);
    kCategoria: DespliegaRejilla(BGBcategoria_sl, [empresa_sc.Text, producto_sl.Text]);
    kCalibre: DespliegaRejilla(BGBcalibre_sl, [empresa_sc.Text, producto_sl.Text]);
    ktipoPalet: DespliegaRejilla(BGBTipo_palets_sl);
    kCalendar:
      if fecha_sc.Focused then
         DespliegaCalendario(BCBfecha_sc)
      else if fecha_descarga_sc.Focused then
         DespliegaCalendario(btnFechaDescarga)
      else
         DespliegaCalendario(btnFechaPedido);

    kComercial:
    begin
      DespliegaRejilla(btnComercial);
    end;
  end;
end;

procedure TFMSalidas.ArticuloDesgloseBorrar;
begin
  with DMBaseDatos.QGeneral do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;

    SQL.Clear;
    SQL.Add('DELETE FROM frf_salidas_l2 ');
    SQL.Add(' WHERE empresa_sl2 =' + QuotedStr(TSalidasL.FieldByName('empresa_sl').AsString) +
            '  and centro_salida_sl2 =' + QuotedStr(TSalidasL.FieldByName('centro_salida_sl').AsString) +
            '  and n_albaran_sl2 =' + TSalidasL.FieldByName('n_albaran_sl').AsString +
            '  and fecha_sl2 = ' + QuotedStr(TSalidasL.FieldByName('fecha_sl').AsString) +
            '  and id_linea_albaran_sl2 = ' + TSalidasL.FieldByName('id_linea_albaran_sl').AsString );
//    try
      EjecutarConsulta(DMBaseDatos.QGeneral);
//    except
//      CancelarTransaccion(DMBaseDatos.DBBaseDatos);
//      Exit;
//    end;
  end;
end;

procedure TFMSalidas.ArticuloDesgloseInsertar;
begin

  // Insertamos en frf_salidas_l2 desglose de producto
  with DMBaseDatos.QGeneral do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;

    SQL.Clear;
    SQL.Add(' select * from frf_articulos_desglose ');
    SQL.Add('  where articulo_ad = :articulo ');

    ParamByName('articulo').AsString := TSalidasL.FieldByName('envase_sl').AsString;

    Open;
    if IsEmpty then
      raise Exception.Create('ERROR: No se puede crear la linea de albar?n. Falta indicar el % de desglose por el producto');

    while not Eof do
    begin
      with DMBaseDatos.QAux do
      begin
        SQL.Clear;
        SQL.Add(' insert into frf_salidas_l2 (empresa_sl2, centro_salida_sl2, n_albaran_sl2, fecha_sl2, id_linea_albaran_sl2,' );
        SQL.Add('                             articulo_sl2, producto_sl2, producto_desglose_sl2, porcentaje_sl2, kilos_desglose_sl2) ');
        SQL.Add('                     values (:empresa, :centro, :albaran, :fecha, :id_linea, ');
        SQL.Add('                             :articulo, :producto, :producto_desglose, :porcentaje_desglose, :kilos_desglose) ');
        ParamByName('empresa').AsString := TSalidasL.FieldByName('empresa_sl').AsString;
        ParamByName('centro').AsString := TSalidasL.FieldByName('centro_salida_sl').AsString;
        ParamByName('albaran').AsString := TSalidasL.FieldByName('n_albaran_sl').AsString;
        ParamByName('fecha').AsString := TSalidasL.FieldByName('fecha_sl').AsString;
        ParamByName('id_linea').AsInteger := TSalidasL.FieldByName('id_linea_albaran_sl').AsInteger;
        ParamByName('articulo').AsString := TSalidasL.FieldByName('envase_sl').AsString;
        ParamByName('producto').AsString := TSalidasL.FieldByName('producto_sl').AsString;
        ParamByName('producto_desglose').AsString := DMBaseDatos.QGeneral.FieldByName('producto_desglose_ad').AsString;
        ParamByName('porcentaje_desglose').AsFloat := DMBaseDatos.QGeneral.FieldByName('porcentaje_ad').AsFloat;
        ParamByName('kilos_desglose').AsFloat := bRoundTo(TSalidasL.FieldByName('kilos_sl').AsFloat * DMBaseDatos.QGeneral.FieldByName('porcentaje_ad').AsFloat / 100, 2);

  //      try
          EjecutarConsulta(DMBaseDatos.QAux);
  //      except
  //        CancelarTransaccion(DMBaseDatos.DBBaseDatos);
  //        Exit;
  //      end;
      end;

      Next;
    end;
  end;
end;

procedure TFMSalidas.ArticuloDesgloseModificar;
begin
  // Modificamos en frf_salidas_l2 desglose de producto
  with DMBaseDatos.QModificable do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;

    SQL.Clear;
    SQL.Add(' select * from frf_salidas_l2 ');
    SQL.Add('  where empresa_sl2 = :empresa ');
    SQL.Add('    and centro_salida_sl2 = :centro ');
    SQL.Add('    and n_albaran_sl2 = :n_albaran ');
    SQL.Add('    and fecha_sl2 = :fecha ');
    SQL.Add('    and id_linea_albaran_sl2 = :id_linea ');

    ParamByName('empresa').AsString := TSalidasL.FieldByName('empresa_sl').AsString;
    ParamByName('centro').AsString := TSalidasL.FieldByName('centro_salida_sl').AsString;
    ParamByName('n_albaran').AsInteger := TSalidasL.FieldByName('n_albaran_sl').AsInteger;
    ParamByName('fecha').AsString := TSalidasL.FieldByName('fecha_sl').AsString;
    ParamByName('id_linea').AsInteger := TSalidasL.FieldByName('id_linea_albaran_sl').AsInteger;

    Open;

    while not Eof do
    begin
      Edit;
      FieldByName('kilos_desglose_sl2').AsFloat := bRoundTo(TSalidasL.FieldByName('kilos_sl').AsFloat * DMBaseDatos.QModificable.FieldByName('porcentaje_sl2').AsFloat/100 , 2);
      Post;

      Next;
    end;
  end;
end;

//*****************************************************************************
//*****************************************************************************
//EVENTOS
//Borrar si no es necesario
//*****************************************************************************
//*****************************************************************************

//Evento que se produce cuando cambia el registro activo
//Tambien se genera cuando se muestra el primero
//Evento que se produce cuando pulsamos altas
//Aprobrechar para modificar estado controles

procedure TFMSalidas.AntesDeInsertar;
begin
     //Rejilla en visualizacion
  VerDetalle;
  empresa_sc.Text := gsDefEmpresa;
  centro_salida_sc.Text := gsDefCentro;
     //Fecha y hora la del sistema
  fecha_sc.Text := DateToStr(Date);
  //if DMConfig.EsLaFont then
    hora_sc.Text := HoraMinuto(Time);
  PonPanelMaestro;
  //porte_bonny_sc.AllowGrayed:= True;
end;

procedure TFMSalidas.AntesDeLocalizar;
begin
     //Rejilla en visualizacion
  VerDetalle;

  PonPanelMaestro;

  porte_bonny_sc.Visible:= False;
  cbx_porte_bonny_sc.ItemIndex:= 0;
  cbx_porte_bonny_sc.Visible:= True;

  higiene_sc.Visible:= False;
  cbx_higiene_sc.ItemIndex:= 0;
  cbx_higiene_sc.Visible:= True;

  reclamacion_sc.Visible:= False;
  cbx_reclamacion_sc.ItemIndex:= 0;
  cbx_reclamacion_sc.Visible:= True;

  facturable_sc.AllowGrayed:= True;
  facturable_sc.State:= cbGrayed;
  facturable_sc.Enabled:= True;

  n_factura_sc.Enabled:= True;
  n_factura_sc.TabStop:= True;
  n_factura_sc.ReadOnly:= False;
  n_factura_sc.ColorEdit:= clMoneyGreen;
  n_factura_sc.ColorNormal:= clWhite;
  n_factura_sc.ColorDisable:= clSilver;

  fecha_factura_sc.Enabled:= True;
  fecha_factura_sc.TabStop:= True;
  fecha_factura_sc.ReadOnly:= False;
  fecha_factura_sc.ColorEdit:= clMoneyGreen;
  fecha_factura_sc.ColorNormal:= clWhite;
  fecha_factura_sc.ColorDisable:= clSilver;

  lblHasta.Visible:= True;
  edtFechaHasta.Visible:= True;
  edtFechaHasta.Text:= '';  
end;

//Evento que se produce cuando pulsamos modificar
//Aprobrechar para modificar estado controles

procedure TFMSalidas.ModificarContabilizada;
var
  i: Integer;
begin
  //S?lo para modificaciones normales
  if Estado = teModificar then
  begin
    for i := 0 to ListaComponentes.Count - 1 do
    begin
      Objeto := ListaComponentes.Items[i];
      if (Objeto is TwinControl) then
        TwinControl( Objeto ).Enabled:= False;
    end;
    transporte_sc.Enabled:= True;
    operador_transporte_sc.Enabled:= True;
    porte_bonny_sc.Enabled:= True;
    n_orden_sc.Enabled:= True;
    higiene_sc.Enabled:= True;
    reclamacion_sc.Enabled:= True;
    nota_sc.Enabled:= True;
    n_pedido_sc.Enabled:= True;
    fecha_pedido_sc.Enabled:=True;
    vehiculo_sc.Enabled:= True;
    nota_factura_sc.Enabled:= True;
    nota_factura_sc.Color:= clWhite;
    //nota_factura_sc.Color:= clBtnFace;
    es_transito_sc.Enabled := True;
    carpeta_deposito_sc.Enabled := True;
    incoterm_sc.Enabled := True;
    plaza_incoterm_sc.Enabled := True;
  end;
  FocoModificar := n_pedido_sc;
  PonPanelMaestro;
end;

procedure TFMSalidas.ModificarNormal;
var
  i: Integer;
begin
  //S?lo para modificaciones normales
  if Estado = teModificar then
  begin
    for i := 0 to ListaComponentes.Count - 1 do
    begin
      Objeto := ListaComponentes.Items[i];
      if (Objeto is TBDEdit) then
        with Objeto as TBDEdit do
          if not Modificable then
            Enabled := false;
    end;
  end;
  FocoModificar := cliente_sal_sc;
  PonPanelMaestro;
end;

procedure TFMSalidas.AntesDeModificar;
begin
  (*TODO*)
  (*Solo el numero de pedido*)
  if estoyContabilizada then
  begin
    ShowMessage('Factura contabilizada, solo se permitira modificar un n?mero limitado de campos.');
    ModificarContabilizada;
  end
  else
  if estoyFacturada then
  begin
//    ShowMessage('Albar?n asociado a una factura, recuerde repetirla si modifica el albar?n');
    ShowMessage('Albar?n asociado a una factura, solo se permitira modificar un n?mero limitado de campos.');   // Pedido por Irene Segur 28/11/2018
    ModificarContabilizada;
  end
  else
  begin
    ModificarNormal;
  end;
end;

//Evento que se produce cuando vamos a visualizar el resultado de las operaciones
//Aprobrechar para restaurar los cambios realizados por los eventos anteriores

procedure TFMSalidas.AntesDeVisualizar;
var i: Integer;
begin
  for i := 0 to ListaComponentes.Count - 1 do
  begin
    Objeto := ListaComponentes.Items[i];
    if (Objeto is TBDEdit) then
      with Objeto as TBDEdit do
          Enabled := true;
  end;
  porte_bonny_sc.Enabled:= True;
  BotonesVisible( TRUE );

     //Borramos los nombres de la empresa, cosechero, ...
     //si el resultado de una busqueda fue vacio
     //habilitamos campos facturacion, para que tenga el mismo Color
     //que el resto
  PonPanelMaestro;
  STOperador_transporte_sc.Caption := desTransporte(empresa_sc.Text, operador_transporte_sc.Text);
  STTransporte_sc.Caption := desTransporte(empresa_sc.Text, transporte_sc.Text);
  STcliente_sal_sc.Caption := desCliente(cliente_sal_sc.Text);
  STcliente_fac_sc.Caption := desCliente(cliente_fac_sc.Text);
  STdir_sum_sc.Caption := desSuministroEx(empresa_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text);

  porte_bonny_sc.Visible:= True;
  cbx_porte_bonny_sc.Visible:= False;
  higiene_sc.Visible:= True;
  cbx_higiene_sc.Visible:= False;
  reclamacion_sc.Visible:= True;
  cbx_reclamacion_sc.Visible:= False;

  n_factura_sc.Enabled:= False;
  n_factura_sc.TabStop:= False;
  n_factura_sc.ReadOnly:= True;
  n_factura_sc.ColorEdit:= clBtnFace;
  n_factura_sc.ColorNormal:= clBtnFace;
  n_factura_sc.ColorDisable:= clBtnFace;

  fecha_factura_sc.Enabled:= False;
  fecha_factura_sc.TabStop:= False;
  fecha_factura_sc.ReadOnly:= True;
  fecha_factura_sc.ColorEdit:= clBtnFace;
  fecha_factura_sc.ColorNormal:= clBtnFace;
  fecha_factura_sc.ColorDisable:= clBtnFace;

  nota_factura_sc.Color:= clWhite;
  nota_factura_sc.Enabled:= True;

  lblHasta.Visible:= False;
  edtFechaHasta.Visible:= False;

end;

procedure TFMSalidas.VerDetalle;
var i: integer;
begin
  for i := 0 to ListaDetalle.Count - 1 do
  begin
    Objeto := ListaDetalle.Items[i];
    if (Objeto is TBDEdit) then
    begin
      with Objeto as TBDEdit do
      begin
        if Modificable = false then
          Enabled := true;
      end;
    end;
  end;
    //rejilla al tama?o maximo
  PonPanelMaestro;
    //RejillaVisualizacion.Height:=256;
end;


procedure TFMSalidas.PonFocoDetalle( const AEdit: TBEdit );
begin
  if AEdit.Visible and AEdit.Enabled then
  begin
    FocoDetalle:= AEdit;
  end
  else
  begin
    FocoDetalle:= producto_sl;
  end;
end;

procedure TFMSalidas.EditarDetalle;
var i: integer;
begin
  if estoyContabilizada then
  begin
    if ( Date = StrToDate('2/7/2012') ) and ( gsCodigo = 'informix' ) then
    begin
      ShowMessage( 'Albar?n asociado a una factura contabilizada, ' + gsNombre + ' recuerde no modificar kilos e importes. ');
    end
    else
    Begin
      raise Exception.Create('No se puede modificar una salida asociada a una factura contabilizada.');
    end;
  end
  else
  if estoyFacturada then
  begin
//    ShowMessage('Albar?n asociado a una factura, recuerde repetirla si modifica el albar?n');
    raise Exception.Create('No se puede modificar una salida facturada.');    // Pedido por Irene Segur 28/11/2018
  end;
  PonTextoEstaticoDetalle;

     //Guardamos valores modificables para saber si hay cambios
  if EstadoDetalle = tedModificar then
  begin
    for i := 0 to ListaDetalle.Count - 1 do
    begin
      Objeto := ListaDetalle.Items[i];
      if (Objeto is TBDEdit) then
      begin
        with Objeto as TBDEdit do
        begin
          if (Modificable = false) then
            Enabled := false;
        end;
      end;
    end;
    PonFocoDetalle( cajas_sl );
  end
  else
  begin
    PonFocoDetalle( producto_sl );
    //PonFocoDetalle( ref_transitos_sl );
  end;

    //Si la salida proviene de un transito, guardaremos los kilos para comprobar
    //luego la suma total de todas las salidad que vengan de ese transito
    //if (ref_transitos_sl.Text <> '' then
  KilosTran := kilos_sl.Text;

  PonPanelDetalle;

  (*IVA*)

  Impuesto:= ImpuestosCliente(empresa_sc.Text, centro_salida_sc.Text, cliente_fac_sc.Text, dir_sum_sc.Text, StrToDateTimeDef( fecha_sc.Text, Now ) );
  //Calcular porcentaje de impuestos
  if impuesto.sCodigo = 'E' then
  begin
    LIva_sl.Caption := ' IMPUESTOS';
    LPorc_iva_sl.Caption := ' EXENTO';
  end
  else
  begin
    LIva_sl.Caption := '  ' + impuesto.sTipo;
    LPorc_iva_sl.Caption := ' %' + impuesto.sTipo;
  end;

  //foco y campos editables
  if DSDetalle.State = dsEdit then
    PonFocoDetalle( cajas_sl );

  EnvaseInicial;
end;


//...................... VALIDAR CAMPOS .........................
//function generica, tiene mucha importancia que los datos esten en campos
//que hereden de TBDEdit y que se llamen igual que el campo al que representan
//en la base de datos. Si quieres que salgan aqui pon a True la propiedad
// Required del componente y en RequiredMsg el mensaje que quieres mostrar
//....................................................................
// La funcion generica que realiza es comprobar que los campos que tienen
// datos por obligacion los tengan, en caso de querer hacer algo mas hay
// que implenentarlo, como comprobar la existencia de un valor en la base
// de datos
//....................................................................

procedure TFMSalidas.ValidarEntradaDetalle;
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

  //Es correcto el art?culo
  with DMBaseDatos.QAux do
  begin
    Close;
    SQL.Clear;
    SQl.Add(' select * ');
    SQl.Add(' from frf_envases ');
    SQl.Add(' where envase_e = :envase ');
    SQl.Add(' and producto_e = :producto ');
    ParamByName('envase').AsString:= envase_sl.Text;
    ParamByName('producto').AsString:= producto_sl.Text;
    Open;
    if IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQl.Add(' select * ');
      SQl.Add(' from frf_envases ');
      SQl.Add(' where envase_e = :envase ');
      SQl.Add(' and producto_e is null ');
      ParamByName('envase').AsString:= envase_sl.Text;
      Open;
      if IsEmpty then
      begin
        Close;
        raise Exception.Create('La combinaci?n de envase y producto es incorrecta.');
      end;
    end;
    Close;
  end;

  //el envase no debe estar de baja
  if oldEnvase <> envase_sl.Text then
    with DMBaseDatos.QAux do
    begin
      Close;
      SQL.Clear;
      SQl.Add(' Select * from frf_envases ');
      SQl.Add(' where envase_e = ' + QuotedStr( envase_sl.Text ) );
      (*BAG
      SQl.Add(' and producto_base_e = ');
      SQl.Add(' ( ');
      SQl.Add('   select producto_base_p ');
      SQl.Add('   from frf_productos ');
      SQl.Add('   where empresa_p = :empresa ');
      SQl.Add('   and producto_p = :producto ');
      SQl.Add(' ) ');
      *)
      SQl.Add('   and fecha_baja_e is  null ');
      Open;
      if IsEmpty then
      begin
        Close;
        raise Exception.Create('No se pueden usar los art?culos que han sido dados de baja.');
      end;
      Close;
    end;

    //Precio a cero si no ponemos nada
  if Trim(precio_sl.Text) = '' then
  begin
    precio_sl.Text := '0';
    importe_neto_sl.text := '0';
    importe_total_sl.text := '0';
  end;
  if Trim(porc_iva_sl.Text) = '' then
  begin
    porc_iva_sl.Text:= '0';
    iva_sl.Text:= '0';
  end;




  if ( empresa_sc.Text = 'F42' ) and ( producto_sl.Text = 'P' ) then
  begin
    if anyo_semana_entrega_sl.Text = '' then
    begin
      PonFocoDetalle( entrega_sl );
      if MessageDlg('Falta o es incorrecta la entrega de la que proviene la fruta.' + #13 + #10 +
               '?Seguro que desea continuar?', mtWarning, [mbNo, mbYes], 0) = mrNo then
        Abort;
    end;
  end;

  //Unidades variables distintas de cero
  if unidades_caja_sl.Enabled and ( StrToIntDef( unidades_caja_sl.Text, 0 ) = 0 ) then
  begin
    //Unidades variables, informar si la cantidad de cajas = 0
    if MessageDlg('El art?culo seleccionado es de unidades variable y la unidades por cajas son 0, ?es correcto?.',
                  mtWarning,[mbYes, mbNo],0 ) = mrNO then
    begin
      if unidades_caja_sl.CanFocus then
        unidades_caja_sl.SetFocus;
      Abort;
    end;
  end;

   //*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/
  if ( Trim(ref_transitos_sl.Text) <> '' ) or
     ( Trim(edtfecha_transito_sl.Text) <> '' ) or
     ( Trim(edtcentro_transito_sl.Text) <> '' ) then
  begin
    TransitoCorrecto;
    ValidarKilosTransitos;
  end;
  //Comercial
  if txtDesComercial.Caption = '' then
  begin
    raise Exception.Create('Falta el comercial asignado a la venta.');
  end;

  if ( centro_origen_sl.text <> '' ) and ( STCentro_origen_sl.Caption =  '' ) then
  begin
    raise Exception.Create('Falta centro de origen o es incorrecto.');
  end;

  if STProducto_sl.Caption =  '' then
  begin
    if not EsProductoAlta( producto_sl.Text) then
      raise Exception.Create(' ATENCI?N: Error al grabar la linea, el producto est? dado de BAJA. ')
    else if not EsProductoVenta(producto_sl.Text) then
      raise Exception.Create(' ATENCI?N: Error al grabar la linea, el producto NO est? marcado como Producto de Venta. ')
    else
      raise Exception.Create('Falta el producto o es incorrecto.');
  end;
  if STEnvase_sl.Caption =  '' then
  begin
    raise Exception.Create('Falta el art?culo o es incorrecto.');
  end;
  if STMarca_sl.Caption =  '' then
  begin
    raise Exception.Create('Falta la marca o es incorrecta.');
  end;
  if STcolor_sl.Caption =  '' then
  begin
    raise Exception.Create('Falta el color o es incorrecto.');
  end;
  if STCategoria_sl.Caption =  '' then
  begin
    raise Exception.Create('Falta la categoria o es incorrecta.');
  end;
  if ( tipo_palets_sl.Text <> '')  and ( stTipoPalets.Caption =  '' ) then
  begin
    raise Exception.Create('El tipo de palet es incorrecto.');
  end;
  if ( StrToIntDef( n_palets_sl.Text, 0 ) <> 0 ) and  ( stTipoPalets.Caption =  '' ) then
  begin
    raise Exception.Create('Falta el tipo de palet o es incorrecto.');
  end;
  if not ExisteCalibre( empresa_sc.Text, producto_sl.Text, calibre_sl.Text) then
  begin
    raise Exception.Create('El calibre es incorrecto.');
  end;

  //Completamos la clave primaria
  RellenaClaveDetalle;
end;

procedure TFMSalidas.RellenaClaveDetalle;
begin
         //S?lo durante la insrcion de una nueva linea
  if (EstadoDetalle = tedAltaRegresoMaestro) or (EstadoDetalle = tedAlta) then
  begin

         //empresa
    if Trim(empresa_sc.Text) = '' then
      raise Exception.Create('Faltan datos de la cabecera.');
    TSalidasL.FieldByName('empresa_sl').AsString :=
      empresa_sc.Text;
          //centro
    if Trim(centro_salida_sc.Text) = '' then
      raise Exception.Create('Faltan datos de la cabecera.');
    TSalidasL.FieldByName('centro_salida_sl').AsString :=
      centro_salida_sc.Text;
          //numero de albaran
    if Trim(n_albaran_sc.Text) = '' then
      raise Exception.Create('Faltan datos de la cabecera.');
    TSalidasL.FieldByName('n_albaran_sl').AsString :=
      n_albaran_sc.Text;
          //fecha
    if Trim(fecha_sc.Text) = '' then
      raise Exception.Create('Faltan datos de la cabecera.');
    TSalidasL.FieldByName('fecha_sl').AsDateTime :=
      StrToDate(fecha_sc.Text);

          //campo oculto y redundante, perdemos en tama?o pero
          //se cree que aumentara la velocidad
    TSalidasL.FieldByName('cliente_sl').AsString := Trim(cliente_sal_sc.Text);

    //BAG centro origen
    TSalidasL.FieldByName('centro_origen_sl').AsString := centro_salida_sc.Text;
    //BAG
    //TSalidasL.FieldByName('federacion_sl').AsString := '';
  end;
end;

//*****************************************************************************
//*****************************************************************************
//FUNCIONES VARIAS
//*****************************************************************************
//*****************************************************************************

//Realiza la consulta

function TFMSalidas.Consulta(value: Integer; printError: Boolean): Boolean;
begin
  Consulta := True;
  if (DMBaseDatos.QDespegables.Tag <> value) then
  begin
          //Consultas diferentes
    DMBaseDatos.QDespegables.Tag := value;
          //Cerramo la consulta
    DMBaseDatos.QDespegables.Cancel;
    DMBaseDatos.QDespegables.Close;
  end;

  if DMBaseDatos.QDespegables.Active then
  begin
        //Si la tabla esta abierta salimos
    Exit;
  end
  else
        //Sino construimos la consulta
    case value of
      kEmpresa:
        begin
          RejillaFlotante.ColumnResult := 0;
          RejillaFlotante.ColumnFind := 1;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(' SELECT DISTINCT empresa_e, nombre_e ' +
            ' FROM frf_empresas ' +
            ' ORDER BY nombre_e ');
        end;
      kCentro:
        begin
                //Depende de empresa
          RejillaFlotante.ColumnResult := 1;
          RejillaFlotante.ColumnFind := 2;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaCentro);
        end;
      kProducto:
        begin
                //Depende de empresa
          RejillaFlotante.ColumnResult := 1;
          RejillaFlotante.ColumnFind := 2;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaProducto);
        end;
      kCliente:
        begin
          RejillaFlotante.ColumnResult := 1;
          RejillaFlotante.ColumnFind := 2;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaCliente);
        end;
      kTransportista:
        begin
          RejillaFlotante.ColumnResult := 1;
          RejillaFlotante.ColumnFind := 2;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaTransportista);
        end;
      kSuministro:
        begin
          RejillaFlotante.ColumnResult := 2;
          RejillaFlotante.ColumnFind := 3;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaSuministro);
        end;
      kMoneda:
        begin
          RejillaFlotante.ColumnResult := 0;
          RejillaFlotante.ColumnFind := 1;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(' SELECT DISTINCT moneda_m, descripcion_m ' +
            ' FROM frf_monedas ' +
            ' ORDER BY descripcion_m ');
        end;
      kEnvase:
        begin
          RejillaFlotante.ColumnResult := 0;
          RejillaFlotante.ColumnFind := 1;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(' SELECT DISTINCT envase_e, descripcion_e ' +
            ' FROM frf_envases Frf_envases ' +
            ' ORDER BY descripcion_e ');
        end;
      kMarca:
        begin
          RejillaFlotante.ColumnResult := 0;
          RejillaFlotante.ColumnFind := 1;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(' SELECT DISTINCT codigo_m, descripcion_m ' +
            ' FROM frf_marcas Frf_marcas ' +
            ' ORDER BY descripcion_m ');
        end;
      kCalibre:
        begin
          RejillaFlotante.ColumnResult := 2;
          RejillaFlotante.ColumnFind := 2;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaCalibre);
        end;
      kCategoria:
        begin
          RejillaFlotante.ColumnResult := 2;
          RejillaFlotante.ColumnFind := 3;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaCategoria);
        end;
      kColor:
        begin
          RejillaFlotante.ColumnResult := 2;
          RejillaFlotante.ColumnFind := 3;
          DMBaseDatos.QDespegables.Sql.Clear;
          DMBaseDatos.QDespegables.Sql.Add(ConsultaColor);
        end;
      kTipoPalet:
        begin
          RejillaFlotante.ColumnResult := 0;
          RejillaFlotante.ColumnFind := 1;
          DMBaseDatos.QDespegables.SQL.Clear;
          DMBaseDatos.QDespegables.SQL.Add(' SELECT codigo_tp, descripcion_tp' +
            ' FROM frf_tipo_palets ' +
            ' ORDER BY codigo_tp');
        end;
    end;

     //Abre consulta
  try
    DMBaseDatos.QDespegables.Open;
  except
    ShowError('Error al abrir la consulta.');
  end;
     //Tiene valores
  if DMBaseDatos.QDespegables.IsEmpty then
  begin
    if printError then ShowError('No se han encontrado datos.');
    Consulta := False;
  end;
end;

procedure TFMSalidas.PonNombre(Sender: TObject);
begin
  gRF := RejillaFlotante;
  gCF := CalendarioFlotante;

  if esVisible( gRF ) or esVisible( gCF ) then Exit;

  if DSDetalle.State = dsInsert then
  begin
    case TComponent(Sender).Tag of
      kCentro:
        begin
          if Estado = teOperacionDetalle then
            STcentro_origen_sl.Caption := desCentro(empresa_sc.Text, centro_origen_sl.Text);
        end;
      kProducto: STProducto_sl.Caption := desProductoVenta(producto_sl.Text);
      kMarca: STMarca_sl.Caption := desMarca(marca_sl.Text);
      kCategoria: STcategoria_sl.Caption := desCategoria(empresa_sc.Text, producto_sl.Text, categoria_sl.Text);
      kColor: STcolor_sl.Caption := desColor(empresa_sc.Text, producto_sl.Text, color_sl.Text);
    end;
  end
  else
  begin
    if Estado = teConjuntoResultado then
    begin
      STEmpresa_sc.Caption := desEmpresa(empresa_sc.Text);
      STCentro_salida_sc.Caption := desCentro(empresa_sc.Text, centro_salida_sc.Text);
      STOperador_transporte_sc.Caption := desTransporte(empresa_sc.Text, operador_transporte_sc.Text);
      STTransporte_sc.Caption := desTransporte(empresa_sc.Text, transporte_sc.Text);
      STcliente_sal_sc.Caption := desCliente(cliente_sal_sc.Text);
      STcliente_fac_sc.Caption := desCliente(cliente_fac_sc.Text);
      STMoneda_sc.Caption := desMoneda(moneda_sc.Text);
    end
    else
    begin
      case TComponent(Sender).Tag of
       kEmpresa:
          begin
            STEmpresa_sc.Caption := desEmpresa(empresa_sc.Text);
            STCentro_salida_sc.Caption := desCentro(empresa_sc.Text, centro_salida_sc.Text);
            STOperador_transporte_sc.Caption := desTransporte(empresa_sc.Text, operador_transporte_sc.Text);
            STTransporte_sc.Caption := desTransporte(empresa_sc.Text, transporte_sc.Text);
            STcliente_sal_sc.Caption := desCliente(cliente_sal_sc.Text);
            STcliente_fac_sc.Caption := desCliente(cliente_fac_sc.Text);
          end;
        kCentro:
          begin
            if Estado <> teOperacionDetalle then
            begin
              STCentro_salida_sc.Caption := desCentro(empresa_sc.Text, centro_salida_sc.Text);
            end;
          end;
        kTransportista:
          begin
           STOperador_transporte_sc.Caption := desTransporte(empresa_sc.Text, operador_transporte_sc.Text);
           STTransporte_sc.Caption := desTransporte(empresa_sc.Text, transporte_sc.Text);
          end;
        kcliente:
          begin
            if cliente_sal_sc.Focused then
            begin
              STcliente_sal_sc.Caption := desCliente(cliente_sal_sc.Text);
              if ( Estado = teAlta ) and ( STcliente_sal_sc.Caption <> '' ) then
              begin
                porte_bonny_sc.Checked:= PorteCliente( empresa_sc.Text, cliente_sal_sc.Text ) = 0;
                if porte_bonny_sc.Checked then
                  QSalidasC.FieldByName('porte_bonny_sc').AsInteger:= 1
                else
                  QSalidasC.FieldByName('porte_bonny_sc').AsInteger:= 0;
              end;
              (*
              if STcliente_sal_sc.Caption <> '' then
              if ( nota_sc.Text = '' ) and (Estado = teAlta) then
              begin
                 if ( empresa_sc.Text = '050' ) and ( cliente_sal_sc.Text = 'MER' ) then
                 begin
                   nota_sc.Lines.Add('TEMPERATURA OPTIMA DE +8 A +10 GRADOS.');
                   nota_sc.Lines.Add('EQUIPO FR?O EN FUNCIONAMIENTO: SI.');
                 end;
              end;
              *)
            end
            else
            begin
              STcliente_fac_sc.Caption := desCliente(cliente_fac_sc.Text);
              RellenaMoneda( cliente_fac_sc );
            end;
          end;
        kMoneda: STMoneda_sc.Caption := desMoneda(moneda_sc.Text);
        kProducto: STProducto_sl.Caption := desProductoVenta(producto_sl.Text);
        kColor: STcolor_sl.Caption := desColor(empresa_sc.Text, producto_sl.Text, color_sl.Text);
        kCategoria: STcategoria_sl.Caption := desCategoria(empresa_sc.Text, producto_sl.Text, categoria_sl.Text);
       end;
    end;
  end;
end;


procedure TFMSalidas.RequiredTime(Sender: TObject;
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

function TFMSalidas.ConsultaCentro: string;
begin
  if Trim(empresa_sc.Text) <> '' then
    ConsultaCentro := ' SELECT DISTINCT empresa_c, centro_c, descripcion_c ' +
      ' FROM frf_centros  ' +
      ' WHERE empresa_c= ' + QuotedStr(empresa_sc.Text) + ' ' +
      ' ORDER BY descripcion_c'
  else
    ConsultaCentro := ' SELECT DISTINCT empresa_c, centro_c, descripcion_c ' +
      ' FROM frf_centros  ' +
      ' ORDER BY descripcion_c';
end;

function TFMSalidas.ConsultaProducto: string;
begin
    ConsultaProducto := ' SELECT DISTINCT producto_p, descripcion_p ' +
      ' FROM frf_productos Frf_productos ' +
      ' ORDER BY descripcion_p ';
end;

function TFMSalidas.ConsultaCliente: string;
begin
  if Trim(empresa_sc.Text) <> '' then

  else
    ConsultaCliente := ' SELECT DISTINCT cliente_c, nombre_c ' +
      ' FROM frf_clientes ' +
      ' ORDER BY nombre_c ';
end;

function TFMSalidas.ConsultaSuministro: string;
var flag: boolean;
  aux: string;
begin
  Aux := ' SELECT DISTINCT cliente_ds,dir_sum_ds, nombre_ds ' +
    ' FROM frf_dir_sum ';
  flag := false;

  if (Trim(cliente_sal_sc.Text) <> '') then
  begin
    if flag then Aux := Aux + ' AND   (cliente_ds = ' + QuotedStr(cliente_sal_sc.Text) + ') '
    else Aux := Aux + ' WHERE   (cliente_ds = ' + QuotedStr(cliente_sal_sc.Text) + ') ';
  end;

  ConsultaSuministro := Aux +
    ' ORDER BY nombre_ds ';
end;


function TFMSalidas.ConsultaTransportista: string;
begin
  ConsultaTransportista := ' SELECT transporte_t, descripcion_t ' +
    ' FROM frf_transportistas ' +
    ' ORDER BY descripcion_t ';
end;

function TFMSalidas.ConsultaCalibre: string;
var flag: boolean;
  aux: string;
begin
  Aux := ' SELECT DISTINCT empresa_c, producto_c, calibre_c ' +
    ' FROM frf_calibres ';
  flag := false;

  if (Trim(empresa_sc.Text) <> '') then
  begin
    Aux := Aux + ' WHERE   (empresa_c = ' + empresa_sc.Text + ') ';
    flag := true;
  end;

  if (Trim(producto_sl.Text) <> '') then
  begin
    if flag then Aux := Aux + ' AND  (producto_c = ' + QuotedStr(producto_sl.Text) + ') '
    else Aux := Aux + ' WHERE  (producto_c = ' + QuotedStr(producto_sl.Text) + ') ';
  end;

  ConsultaCalibre := Aux +
    ' ORDER BY calibre_c ';
end;

function TFMSalidas.ConsultaCategoria: string;
var flag: boolean;
  aux: string;
begin
  Aux := ' SELECT DISTINCT empresa_c, producto_c, categoria_c, descripcion_c ' +
    ' FROM frf_categorias ';
  flag := false;

  if (Trim(empresa_sc.Text) <> '') then
  begin
    Aux := Aux + ' WHERE   (empresa_c = ' + empresa_sc.Text + ') ';
    flag := true;
  end;

  if (Trim(producto_sl.Text) <> '') then
  begin
    if flag then Aux := Aux + ' AND  (producto_c = ' + QuotedStr(producto_sl.Text) + ') '
    else Aux := Aux + ' WHERE  (producto_c = ' + QuotedStr(producto_sl.Text) + ') ';
  end;

  ConsultaCategoria := Aux +
    ' ORDER BY descripcion_c ';
end;

function TFMSalidas.ConsultaColor: string;
var flag: boolean;
  aux: string;
begin
  Aux := ' SELECT DISTINCT empresa_c, producto_c, color_c, descripcion_c ' +
    ' FROM frf_colores ';
  flag := false;

  if (Trim(empresa_sc.Text) <> '') then
  begin
    Aux := Aux + ' WHERE   (empresa_c = ' + empresa_sc.Text + ') ';
    flag := true;
  end;

  if (Trim(producto_sl.Text) <> '') then
  begin
    if flag then Aux := Aux + ' AND  (producto_c = ' + quotedstr(producto_sl.Text) + ') '
    else Aux := Aux + ' WHERE  (producto_c = ' + quotedstr(producto_sl.Text) + ') ';
  end;

  ConsultaColor := Aux +
    ' ORDER BY descripcion_c ';
end;


procedure TFMSalidas.SalirEdit(Sender: TObject);
begin
  if Length(hora_sc.Text) = 4 then
    hora_sc.Text := '0' + hora_sc.Text;
  
  BEMensajes('');
end;

procedure TFMSalidas.EntrarEdit(Sender: TObject);
begin
  BEMensajes(TEdit(Sender).Hint);
end;


procedure TFMSalidas.entrega_slChange(Sender: TObject);
begin
  if ( DSDetalle.DataSet.State = dsEdit ) or ( DSDetalle.DataSet.State = dsInsert ) then
  begin
    if Length( entrega_sl.Text ) = 12 then
    begin
      //Busca a?o semana / producto
      with DMAuxDB.Qaux do
      begin
        SQL.Clear;
        SQL.Add('select anyo_semana_ec from frf_entregas_c where codigo_ec = :entrega ');
        ParamByName('entrega').AsString:= entrega_sl.Text;
        Open;
        anyo_semana_entrega_sl.Text:= FieldByName('anyo_semana_ec').AsString;
        Close;
      end;
    end
    else
    begin
      anyo_semana_entrega_sl.Text:= '';
    end;
  end;

  if entrega_sl.Text = '' then
    btnEntrega.Caption:= 'Insertar Entrega'
  else
    btnEntrega.Caption:= 'Cambiar Entrega ' + entrega_sl.Text;
end;

function TFMSalidas.GetNumeroDeAlbaran( const empresa, centro: string; const AIncrementa: boolean;
                      const albaran: Integer = -1): Integer;
begin
  if albaran <> -1 then begin
    if albaran <> albaranObtenido then begin
      result := albaran;
      Exit;
    end;
  end;

  //Sacamos contador
  with DMBaseDatos.QGeneral do
  begin
    Close;
    SQl.Clear;
    SQL.Add(' SELECT cont_albaranes_c FROM frf_centros ' +
      ' WHERE empresa_c=' + quotedstr(empresa_sc.Text) +
      ' AND centro_c=' + quotedstr(centro_salida_sc.Text));
    try
      Open;
    except
      ShowError('Error al intentar conseguir el contador de albaranes.');
      Abort;
    end;

    if IsEmpty then
    begin
      ShowError('Error al intentar conseguir el contador de albaranes.');
      Abort;
    end;
    result := Fields[0].AsInteger;

    Close;
    if AIncrementa then
    begin
      SQL.Clear;
      SQL.Add(' UPDATE frf_centros ' +
        ' SET cont_albaranes_c =' + IntToStr(result + 1) +
        ' WHERE empresa_c=' + quotedstr(empresa_sc.Text) +
        ' AND centro_c=' + quotedstr(centro_salida_sc.Text));
      try
        ExecSQL;
      except
        ShowError('Error al intentar actualizar el contador de albaranes.');
        Abort;
      end;
    end;
  end;
end;

procedure TFMSalidas.PonNumeroAlbaran(Sender: TObject);
begin
  if (Trim(empresa_sc.Text) <> '') and
    (Trim(centro_salida_sc.Text) <> '') and
    (Estado = teAlta) and
    (DSMaestro.State <> dsBrowse) then
  begin
    n_albaran_sc.Text := IntToStr(GetNumeroDeAlbaran(empresa_sc.Text, centro_salida_sc.Text, False ));
    albaranObtenido := bnStrToInt(n_albaran_sc.Text);
  end;
end;

procedure TFMSalidas.RellenaClienteFacturacion(Sender: TObject);
begin
     //Rellenamos cliente de facturacion
  if (Trim(cliente_sal_sc.Text) <> '') and
    (DSMaestro.State <> dsBrowse) and
    (Estado <> teLocalizar) then
  begin
       (* Se pelearon los colegillas
       if (cliente_sal_sc.Text='TS') or
          (cliente_sal_sc.Text='JS') or
          (cliente_sal_sc.Text='HS') or
          (cliente_sal_sc.Text='MR') then
          cliente_fac_sc.Text:='UK'
       else
       *)
    cliente_fac_sc.Text := cliente_sal_sc.Text;
  end;
end;

procedure TFMSalidas.RellenaMoneda(Sender: TObject);
begin
     //Rellenamos cliente de facturacion
  if (length( Trim(cliente_fac_sc.Text) ) > 1) and
    ( length( Trim(empresa_sc.Text)) = 3 ) and
    //(Trim(moneda_sc.Text) = '') and
    (estado <> teLocalizar) and
    (DSMaestro.State <> dsBrowse) then
  begin
    with DMBaseDatos.QGeneral do
    begin
      if Active then
      begin
        Cancel;
        Close;
      end;
      SQL.Clear;
      SQL.Add(' SELECT moneda_c FROM frf_clientes ' +
        ' WHERE cliente_c=' + quotedstr(cliente_fac_sc.Text));
      try
        Open;
      except
        Exit;
      end;

      if not IsEmpty then
      begin
        moneda_sc.Text := Fields[0].AsString;
      end;
    end;
  end;
end;

procedure TFMSalidas.PonPanelDetalle  ;
begin
    //Valores de la cabecera
  STAlbaran.Caption := n_albaran_sc.Text;
  STFecha.Caption := fecha_sc.Text;
  STEmpresa.Caption := STempresa_sc.Caption;
  STCentro.Caption := STcentro_salida_sc.Caption;
  STCliente.Caption := STcliente_sal_sc.Caption;
  STSuministro.Caption := STdir_sum_sc.Caption;

    //Mostrar panel cabecera
  PMaestro.Visible := false;
  PCabecera.Visible := true;
  PCabecera.Top := 0;
  PDetalle.Visible := True;
  PDetalle.Height := 183;


    //Titulo
  Self.Caption := 'SALIDAS DE FRUTA/LINEAS';

  //Ocultar boton
  BotonesVisible( FALSE );
end;

procedure TFMSalidas.PonPanelMaestro;
begin
    //Mostrar panel maestro
  PMaestro.Visible := true;
  PCabecera.Visible := false;
  PDetalle.Visible := false;

    //Titulo
  Self.Caption := 'SALIDAS DE FRUTA/CABECERA';

  //Ver boton
    BotonesVisible( True );
end;



procedure TFMSalidas.CalculaImporte(Sender: TObject);
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;

  if bFlagCambios and  precio_sl.Focused then
    RecalcularUnidades( Sender );
end;

function TFMSalidas.ExisteDirSuministro: Boolean;
begin
  with DMAuxDB.QDescripciones do
  begin
    SQL.Text := ' select count(*) from frf_dir_sum ' +
      ' where cliente_ds=' + QuotedStr(cliente_sal_sc.Text) +
      ' and dir_sum_ds=' + QuotedStr(dir_sum_sc.Text) +
      ' and fecha_baja_ds is null ';
    try
      try
        Open;
        ExisteDirSuministro := Fields[0].AsInteger <> 0;
      except
        ExisteDirSuministro := False;
      end;
    finally
      Cancel;
      Close;
    end;
  end;
end;

procedure TFMSalidas.AntesDeBorrarDetalle;
begin
  if estoyContabilizada then
  begin
    if ( Date = StrToDate('2/7/2012') ) and ( gsCodigo = 'informix' ) then
    begin
      ShowMessage( 'Albar?n asociado a una factura conatbilizada, ' + gsNombre + ' recuerde no modificar kilos e importes. ');
    end
    else
    Begin
      raise Exception.Create('No se puede modificar una salida asociada a una factura contabilizada.');
    end;
  end
  else
  if estoyFacturada then
  begin
//    ShowMessage('Albar?n asociado a una factura, recuerde repetirla si modifica el albar?n');
    Raise Exception.Create('No se puede modificar una salida ya facturada.');       // Pedido por Irene Segur 28/11/2018
  end;

  if (TieneDeposito) and (TSalidasL.RecordCount = 1)  then
    Raise Exception.Create('ATENCION! No se puede borrar el albaran completo, porque tiene datos en Deposito de Aduanas.');
  
end;


function TFMSalidas.TieneDetalle: boolean;
begin
  Result:= False;

  //Tiene entradas asigndas
  if not Result then
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select Trim( empresa_es || '' - '' || centro_salida_es  || '' - ('' || fecha_entrada_es  || '') - '' || n_entrada_es ) entrada ' );
    SQL.Add(' from frf_entradas_sal ');
    SQL.Add(' where empresa_es = :empresa ');
    SQL.Add(' and centro_salida_es = :centro ');
    SQL.Add(' and fecha_salida_es = :fecha ');
    SQL.Add(' and n_salida_es = :albaran');
    SQL.Add(' and transito_es = 0 ');
    ParamByName('empresa').AsString:= QSalidasC.fieldByName('empresa_sc').AsString;
    ParamByName('centro').AsString:= QSalidasC.fieldByName('centro_salida_sc').AsString;
    ParamByName('albaran').AsInteger:= QSalidasC.fieldByName('n_albaran_sc').AsInteger;
    ParamByName('fecha').AsDateTime:= QSalidasC.fieldByName('fecha_sc').AsDateTime;
    Open;
    if not IsEmpty then
    begin
      ShowError('No se puede borrar una salida con entradas asignadas -> ' + fieldByName('entrada').AsString );
      Result:= True;
    end;
    Close;

  end;

  //Tiene ABONOS
  (*
  if not Result then
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_fal, fecha_fal, factura_fal ');
    SQL.Add(' from frf_fac_abonos_l ');
    SQL.Add(' where empresa_fal = :empresa ');
    SQL.Add(' and n_albaran_fal = :centro ');
    SQL.Add(' and fecha_albaran_fal = :albaran ');
    SQL.Add(' and centro_Salida_fal = :fecha ');
    SQL.Add(' group by empresa_fal, fecha_fal, factura_fal ');
    SQL.Add(' order by empresa_fal, fecha_fal, factura_fal ');
    ParamByName('empresa').AsString:= QSalidasC.fieldByName('empresa_sc').AsString;
    ParamByName('centro').AsString:= QSalidasC.fieldByName('centro_salida_sc').AsString;
    ParamByName('albaran').AsInteger:= QSalidasC.fieldByName('n_albaran_sc').AsInteger;
    ParamByName('fecha').AsDateTime:= QSalidasC.fieldByName('fecha_sc').AsDateTime;
    Open;
    if not IsEmpty then
    begin
      ShowError('No se puede borrar una salida asociada con un abono -> ' + fieldByName('empresa_fal').AsString + '-' +
                                                                            fieldByName('fecha_fal').AsString + '-' +
                                                                            fieldByName('factura_fal').AsString  );
      Result:= True;
    end;
    Close;
  end;
  *)

  //Tiene un servicio de transporte asosiado
  if not Result then
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_ssv, servicio_ssv  ');
    SQL.Add(' from frf_salidas_servicios_venta  ');
    SQL.Add(' where empresa_ssv = :empresa  ');
    SQL.Add(' and n_albaran_ssv = :albaran  ');
    SQL.Add(' and fecha_ssv = :fecha ');
    SQL.Add(' and centro_Salida_ssv = :centro  ');
    ParamByName('empresa').AsString:= QSalidasC.fieldByName('empresa_sc').AsString;
    ParamByName('centro').AsString:= QSalidasC.fieldByName('centro_salida_sc').AsString;
    ParamByName('albaran').AsInteger:= QSalidasC.fieldByName('n_albaran_sc').AsInteger;
    ParamByName('fecha').AsDateTime:= QSalidasC.fieldByName('fecha_sc').AsDateTime;
    Open;
    if not IsEmpty then
    begin
      ShowError('No se puede borrar una salida asociada a un servicio de transportista -> ' + fieldByName('empresa_ssv').AsString + '-' +
                                                                            fieldByName('servicio_ssv').AsString   );
      Result:= True;
    end;
    Close;
  end;

  //Tiene una salida del deposito asociada
  (*
  if not Result then
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_dac, centro_dac, referencia_dac, fecha_dac  ');
    SQL.Add(' from frf_depositos_aduana_sal, frf_depositos_aduana_c  ');
    SQL.Add(' where empresa_das = :empresa  ');
    SQL.Add(' and n_albaran_das = :albaran  ');
    SQL.Add(' and fecha_das = :fecha  ');
    SQL.Add(' and centro_Salida_das = :centro  ');
    SQL.Add(' and codigo_das = codigo_dac ');
    ParamByName('empresa').AsString:= QSalidasC.fieldByName('empresa_sc').AsString;
    ParamByName('centro').AsString:= QSalidasC.fieldByName('centro_salida_sc').AsString;
    ParamByName('albaran').AsInteger:= QSalidasC.fieldByName('n_albaran_sc').AsInteger;
    ParamByName('fecha').AsDateTime:= QSalidasC.fieldByName('fecha_sc').AsDateTime;
    Open;
    if not IsEmpty then
    begin
      Result:= MessageDlg('Salida asociada a un deposito de aduanas, tr?nsito: -> ' + fieldByName('empresa_dac').AsString + ' - ' +
                                                                            fieldByName('centro_dac').AsString + ' - ' +
                                                                            fieldByName('referencia_dac').AsString + ' - ' +
                                                                            fieldByName('fecha_dac').AsString + ' - ' + #13 + #10 +
                                                                            '?Seguro que quiere borrar la salida?',
                          mtConfirmation, [mbYes, mbCancel], 0 )= mrCancel;
    end;
    Close;
  end;
  *)
end;

procedure TFMSalidas.Borrar;
var botonPulsado: Word;
begin
  if estoyFacturada then
  begin
    raise Exception.Create('No se puede borrar una salida que tiene una factura asociada.');
  end;

  if TieneDeposito then
  begin
    raise Exception.Create(' ATENCION! No se puede borrar un albaran de salida con informaci?n en Deposito de Aduanas. ');
  end;

  if not TieneDetalle then
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
    if VerAdvertencia( Self, #13 + #10 + ' ?Esta usted seguro de querer borrar el albar?n de venta completo con su detalle asociado?', '    BORRAR SALIDA',
                     'Quiero borrar el albar?n completo', 'Borrar Albar?n'  ) = mrIgnore then
      botonPulsado := mrYes;

    if botonPulsado = mrYes then
      BorrarSalida;

     //Por ultimo visualizamos resultado
    Visualizar;
  end;
end;

procedure TFMSalidas.BorrarSalida;
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

    SQL.Clear;
    SQL.Add('DELETE FROM frf_gastos ');
    SQL.Add('WHERE empresa_g=' + quotedstr(empresa_sc.Text) +
      '  and centro_salida_g=' + quotedstr(centro_salida_sc.Text) +
      '  and n_albaran_g=' + n_albaran_sc.Text +
      '  and fecha_g=:fecha ');
    ParamByName('fecha').asdatetime := StrToDate(fecha_sc.Text);
    try
      EjecutarConsulta(DMBaseDatos.QGeneral);
    except
      CancelarTransaccion(DMBaseDatos.DBBaseDatos);
      Exit;
    end;

    SQL.Clear;
    SQL.Add('DELETE FROM frf_salidas_l2 ');
    SQL.Add('WHERE empresa_sl2=' + quotedstr(empresa_sc.Text) +
      '  and centro_salida_sl2=' + quotedstr(centro_salida_sc.Text) +
      '  and n_albaran_sl2=' + n_albaran_sc.Text +
      '  and fecha_sl2=:fecha ');
    ParamByName('fecha').asdatetime := StrToDate(fecha_sc.Text);
    try
      EjecutarConsulta(DMBaseDatos.QGeneral);
    except
      CancelarTransaccion(DMBaseDatos.DBBaseDatos);
      Exit;
    end;

    SQL.Clear;
    SQL.Add('DELETE FROM frf_salidas_l ');
    SQL.Add('WHERE empresa_sl=' + quotedstr(empresa_sc.Text) +
      '  and centro_salida_sl=' + quotedstr(centro_salida_sc.Text) +
      '  and n_albaran_sl=' + n_albaran_sc.Text +
      '  and fecha_sl=:fecha ');
    ParamByName('fecha').asdatetime := StrToDate(fecha_sc.Text);
    try
      EjecutarConsulta(DMBaseDatos.QGeneral);
    except
      CancelarTransaccion(DMBaseDatos.DBBaseDatos);
      Exit;
    end;

  end;

    //Borramos maestro
  try
    //Log
    InsertarLogTransacciones('BAJA ALBARAN COMPLETO');

    QSalidasC.Delete;
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

procedure TFMSalidas.cajas_slChange(Sender: TObject);
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if bFlagCambios and  ( cajas_sl.Focused or unidades_caja_sl.Focused )then
  begin
    RecalcularUnidades( Sender );
    TSalidasL.FieldByName('kilos_reales_sl').AsString := kilos_sl.Text;
    TSalidasL.FieldByName('kilos_posei_sl').AsString := kilos_sl.Text;
  end;
end;


//*************************** MARIO *****************************
//esta rejilla es para cuando se selecciona un transito que se saquen los productos
//disponibles de la tabla de transito no de la de producto.

procedure TFMSalidas.Rejilla(boton: TBGridButton);
begin
  if (DMBaseDatos.QDespegables.Tag <> boton.Control.Tag) then
  begin
          //Consultas diferentes
    DMBaseDatos.QDespegables.Tag := boton.Control.Tag;
          //Cerramo la consulta
    DMBaseDatos.QDespegables.Cancel;
    DMBaseDatos.QDespegables.Close;
  end;

  if DMBaseDatos.QDespegables.Active then
  begin
        //Si la tabla esta abierta miramos a ver si estaba sin datos
    if not DMBaseDatos.QDespegables.IsEmpty then
      Exit;
    Exit;
  end;

  with DMBaseDatos.QDespegables do
  begin
    Cancel;
    Close;
    case ActiveControl.Tag of
      (*
      kCentro:
        begin
            SQL.Clear;
            SQL.Add('SELECT centro_tc,descripcion_c FROM frf_transitos_c,frf_centros');
            SQL.Add(' WHERE empresa_tc =' + empresa_sc.Text + '  AND referencia_tc= ' + ref_transitos_sl.Text);
            SQL.Add(' AND empresa_c = empresa_tc AND centro_tc=centro_c ');
            SQL.Add(' Group by centro_tc,descripcion_c order by centro_tc,descripcion_c ');
        end;
      kProducto:
        begin
            SQL.Clear;
            SQL.Add('SELECT producto_tl,descripcion_p FROM frf_transitos_l,frf_productos');
            SQL.Add(' WHERE empresa_tl =' + empresa_sc.Text + '  AND centro_tl= ' + centro_origen_sl.Text
              + ' AND referencia_tl= ' + ref_transitos_sl.Text);
            SQL.Add(' AND empresa_p = empresa_tl AND producto_p=producto_tl');
            SQL.Add(' Group by producto_tl,descripcion_p order by producto_tl,descripcion_p ' );
        end;
      *)
      kCentro:
        begin
          SQL.Clear;
          SQL.Add('SELECT centro_c,descripcion_c FROM frf_centros');
          SQL.Add(' WHERE empresa_c = ' + quotedstr(empresa_sc.Text));
        end;
      kProducto:
        begin
          SQL.Clear;
          SQL.Add('SELECT producto_p,descripcion_p FROM frf_productos where fecha_baja_p is null ');
        end;
    end;

    try
      Open;
    except
      ShowError('Error al realizar la consulta asociada.');
      Exit;
    end;

       //Tiene valores
    if IsEmpty then
    begin
      ShowError('Consulta sin datos.');
      Exit;
    end;

       //Mostrar resultado
    TBGrid(boton.Grid).BControl := TBEdit(boton.Control);
    TBGrid(boton.Grid).ColumnResult := 0;
    TBGrid(boton.Grid).ColumnFind := 1;
    boton.GridShow;

  end;
end;

//Compruebo que existe la referencia de transito y  relleno el transito

procedure TFMSalidas.ref_transitos_slExit(Sender: TObject);
begin
  if ((DSDetalle.State = dsInsert) or (DSDetalle.State = dsEdit)) and
    (Trim(edtfecha_transito_sl.Text) = '') and
    (Trim(ref_transitos_sl.Text) <> '') then
    with DMBaseDatos.QGeneral do
    begin
      Cancel;
      Close;
      with SQL do
      begin
        Clear;
        Add(' SELECT centro_tc, fecha_tc');
        Add(' FROM frf_transitos_c');
        Add(' WHERE referencia_tc = ' + ref_transitos_sl.Text);
        Add(' AND empresa_tc = ' + QuotedStr(empresa_sc.Text));
        Add(' AND fecha_tc between :fechaini and :fechafin ');
        ParamByName('fechaini').AsDate:= DSMaestro.DataSet.FieldByName('fecha_sc').AsDateTime  - 90;
        ParamByName('fechafin').AsDate:= DSMaestro.DataSet.FieldByName('fecha_sc').AsDateTime  + 90;
      end;
      try
        Open;
      except
        on E: EDBEngineError do
        begin
          ShowError(e);
          ref_transitos_sl.SetFocus;
          Exit;
        end;
      end;
       //Tiene Valores
      case RecordCount of
        0:
          begin
            ShowError('Referencia de tr?nsito no valida.');
            ref_transitos_sl.SetFocus;
            Exit;
          end;
        1:
          begin
           //Rellenar centro, pasar a producto
            centro_origen_sl.Text := FieldByName('centro_tc').AsString;
            edtcentro_transito_sl.Text := FieldByName('centro_tc').AsString;
            edtfecha_transito_sl.Text := FormatDateTime('dd/mm/yyyy', FieldByName('fecha_tc').AsDateTime);
            centro_origen_slExit(centro_origen_sl);
          end;
      end;
    end;
end;

procedure TFMSalidas.ComprobrarClavePrimaria;
var anyo, mes, dia: word;
begin
  with DMBaseDatos.QGeneral do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;
    SQL.Clear;
    SQL.Add(' SELECT count(*) FROM frf_salidas_c ');
    SQL.Add(' WHERE empresa_sc=' + quotedstr(empresa_sc.Text) + ' ');
    SQL.Add(' AND centro_salida_sc=' + quotedstr(centro_salida_sc.Text) + ' ');
    SQL.Add(' AND n_albaran_sc=' + n_albaran_sc.Text + ' ');
    decodedate(strtodate(fecha_sc.Text), anyo, mes, dia);
    SQL.Add(' AND YEAR(fecha_sc)=' + IntToStr(anyo));

    try
      Open;
    except
      n_albaran_sc.SetFocus;
      raise;
    end;

    if Fields[0].AsInteger > 0 then begin
      n_albaran_sc.SetFocus;
      raise Exception.Create('N?mero de albar?n ya utilizado.');
    end;

    Cancel;
    Close;
  end;
end;

procedure TFMSalidas.CambiarRegistro;
begin
  STdir_sum_sc.Caption := desSuministroEx(empresa_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text);

  //Calculamos total gastos, para  saber si la salida tiene gastos
  //asignados sin tener que pulsar el boton (s?lo central)
  if DMConfig.EsLaFont or ( cliente_sal_sc.Text = 'WEB' ) then
  begin
   with DMBaseDatos.QGeneral do
   begin
    if Active then
    begin
      Cancel;
      Close;
    end;
    SQl.Clear;
    SQL.Add('SELECT sum(Importe_g*CASE WHEN facturable_tg="S" THEN -1 ELSE 1 END) gastos ' +
    //Sql.Add(' select sum(importe_g) as gastos '+
      ' from frf_gastos, frf_tipo_gastos ' +
      ' where empresa_g=:empresa ' +
      ' and centro_salida_g=:centro ' +
      ' and n_albaran_g=:referencia ' +
      ' and fecha_g=:fecha ' +
      ' and tipo_tg = tipo_g');
    ParamByName('empresa').AsString := empresa_sc.Text;
    ParamByName('centro').AsString := centro_salida_sc.Text;
    ParamByName('referencia').Asinteger := bnStrToInt(n_albaran_sc.Text);
    ParamByName('fecha').AsDateTime := StrTodate(fecha_sc.Text);

    try
      Open;
    except
      if ( cliente_sal_sc.Text = 'WEB' ) and not DMConfig.EsLaFont then
        SBGastos.Caption := 'Transporte'
      else
        SBGastos.Caption := '&Gastos (-)';
      Exit;
    end;

    if isempty then
    begin
      if ( cliente_sal_sc.Text = 'WEB' ) and not DMConfig.EsLaFont then
        SBGastos.Caption := 'Transporte'
      else
        SBGastos.Caption := '&Gastos (0)';
      Exit;
    end;

      if ( cliente_sal_sc.Text = 'WEB' ) and not DMConfig.EsLaFont then
        SBGastos.Caption := 'Transporte'
      else
        SBGastos.Caption := '&Gastos (' + FieldByName('gastos').AsString + ')';
   end;
  end;
end;

procedure TFMSalidas.dir_sum_scChange(Sender: TObject);
begin
  STDir_sum_sc.Caption := desSuministro(empresa_sc.text,
        cliente_sal_sc.Text,
        dir_sum_sc.Text);
  (*
     //CLAVE AJENA SUMINISTRO
  if (not (dir_sum_sc.Text = cliente_sal_sc.Text)) then
  begin
    if (Trim(dir_sum_sc.Text) <> '') then
    begin
      STDir_sum_sc.Caption := '';
    end
    else
    begin
               //COMPROBAR CLAVE AJENA
      STDir_sum_sc.Caption := desSuministro(empresa_sc.text,
        cliente_sal_sc.Text,
        dir_sum_sc.Text);
    end;
  end
  else
  begin
    STDir_sum_sc.Caption := STcliente_sal_sc.Caption;
  end;
  *)
  if Estado = teAlta then
  begin
    if STDir_sum_sc.Caption <> '' then
    begin
      if nota_sc.Lines.Count = 2 then
        nota_sc.Lines.Clear;
      Observaciones;
    end;
  end;
end;


procedure TFMSalidas.Observaciones;
begin
    if ( Trim(nota_sc.Text) = '' )  then
    begin
      if ( empresa_sc.Text = '050' ) and ( cliente_sal_sc.Text = 'MER' ) then
      begin
        nota_sc.Lines.Add('TEMPERATURA OPTIMA DE +8 A +10 GRADOS.');
        nota_sc.Lines.Add('EQUIPO FR?O EN FUNCIONAMIENTO: SI.');
        if ( dir_sum_sc.Text = '2MN' ) then
        begin
          nota_sc.Lines.Add(UpperCase('La mercanc?a transportada realiza tr?fico mar?timo entre islas'));
        end;
      end
      else
      if ( empresa_sc.Text = '050' ) and ( cliente_sal_sc.Text = 'VTO' ) then
      begin
        nota_sc.Lines.Add(UpperCase('Mercancia procedente de producci?n controlada y certificada bajo el est?ndar de calidad Globalgap.'));
      end
      else
      if ( empresa_sc.Text = 'F18' ) then
      begin
        if ( cliente_sal_sc.Text = 'WEB' ) then
        begin
          if ( StrToDate(fecha_sc.Text) < StrToDate('1/2/2014') ) then
          begin
            nota_sc.Lines.Add('');
            nota_sc.Lines.Add('Bienvenido al Mundo P?caro.');
            nota_sc.Lines.Add('Esperamos que disfrute de la nueva experiencia de "picar naturalmente".');
            nota_sc.Lines.Add('');
            nota_sc.Lines.Add('Si desea algunos consejos de uso, no dude en consultarnos, le daremos ideas muy originales.');
            nota_sc.Lines.Add('');
            nota_sc.Lines.Add('P?caro by Bonnysa');
          end;
        end
        else
        begin
          if cliente_sal_sc.Text = 'SOC' then
          begin
            nota_sc.Lines.Add('TEMPERATURA ENTRE 1? y 6? C');
            nota_sc.Lines.Add('TEMPERATURA SALIDA PRODUCTO INFERIOR A +4? C');
          end
          else
          if cliente_sal_sc.Text = 'DIA' then
          begin
            nota_sc.Lines.Add('TEMPERATURA ENTRE 1? y 8? C');
          end
          else
          begin
            nota_sc.Lines.Add('TEMPERATURA ENTRE 1? y 4? C');
            nota_sc.Lines.Add('TEMPERATURA SALIDA PRODUCTO INFERIOR A +4? C');
          end;
        end;
      end
      else
      if ( Copy(empresa_sc.Text,1,1) = 'F' ) then
      begin
        if ( empresa_sc.Text = 'F21' ) then
        begin
          if ( centro_salida_sc.Text = '4' ) and
             ( cliente_sal_sc.Text = 'MER' ) and
             ( dir_sum_sc.Text = '927' ) then
          begin
            nota_sc.Lines.Add('TEMPERATURA OPTIMA DE +2 A +4 GRADOS.');
            nota_sc.Lines.Add('FURGON PRE-ENFRIADO : SI');
          end
          else
          begin
            nota_sc.Lines.Add('TEMPERATURA OPTIMA DE +8 A +12 GRADOS.');
            nota_sc.Lines.Add('FURGON PRE-ENFRIADO : SI');
          end;
        end
        else
        if ( empresa_sc.Text = 'F17' ) and ( centro_salida_sc.Text = '2' ) then
        begin
          nota_sc.Lines.Add('TEMPERATURA ?PTIMA 8 GRADOS.');
          nota_sc.Lines.Add('EQUIPO FR?O EN FUNCIONAMIENTO: SI.');
        end
        else
        begin
          //if cliente_sal_sc.Text = 'MER' then
          begin
            nota_sc.Lines.Add('TEMPERATURA ?PTIMA 12 GRADOS.');
            nota_sc.Lines.Add('EQUIPO FR?O EN FUNCIONAMIENTO: SI.');
          end;
        end;
      end;
      if ( cliente_sal_sc.Text = 'MER' ) and ( dir_sum_sc.Text = '2MN' ) then
      begin
        nota_sc.Lines.Add(UpperCase('La mercanc?a transportada realiza tr?fico mar?timo entre islas'));
      end;
      nota_sc.Lines.Add('-" EL CONDUCTOR CONFIRMA QUE LA MERCANC?A VA SUJETA POR BARRAS".');
      nota_sc.Lines.Add('-" TEMPERATURA DE LA CARGA: CONFORME".');
    end;
end;

function TFMSalidas.ObtenerLineaAlbaran: integer;
begin
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select nvl(max(id_linea_albaran_sl), 0) max_linea     ');
    SQL.Add('   from frf_salidas_l                  ');
    SQL.Add('  where empresa_sl = :empresa          ');
    SQL.Add('    and centro_salida_sl = :centro     ');
    SQL.Add('    and n_albaran_sl = :albaran        ');
    SQL.Add('    and fecha_sl = :fecha              ');

    ParamByName('empresa').AsString := empresa_sc.Text;
    ParamByName('centro').AsString := centro_salida_sc.Text;
    ParamByName('albaran').Asinteger := bnStrToInt(n_albaran_sc.Text);
    ParamByName('fecha').AsDateTime := StrTodate(fecha_sc.Text);

    Open;
    result := FieldByName('max_linea').AsInteger + 1;
    Close;
  end;
end;

procedure TFMSalidas.dir_sum_scExit(Sender: TObject);
begin
  if RejillaFlotante.Visible then Exit;
  if Estado = teLocalizar then Exit;

  if (DSMaestro.State = dsInsert) or (DSMaestro.State = dsedit) then
  begin
    if Trim(dir_sum_sc.Text) = '' then
    begin
      if Trim(cliente_sal_sc.Text) <> '' then
      begin
        dir_sum_sc.Text := cliente_sal_sc.Text;
        STDir_sum_sc.Caption := STcliente_sal_sc.Caption;
      end;
    end
    else
    begin
               //COMPROBAR CLAVE AJENA
      if (dir_sum_sc.Text = cliente_sal_sc.Text) then
      begin
        STDir_sum_sc.Caption := STcliente_sal_sc.Caption;
      end
      else
      begin
        STDir_sum_sc.Caption := desSuministroEx(empresa_sc.Text, cliente_sal_sc.Text, dir_sum_sc.Text);
        if STDir_sum_sc.Caption = '' then
        begin
          dir_sum_sc.SetFocus;
          Advertir('Direccion de suministro incorrecta');
        end;
      end;
    end;
  end;
  if Estado = teAlta then
  begin
    if STDir_sum_sc.Caption <> '' then
    begin
      if nota_sc.Lines.Count = 2 then
        nota_sc.Lines.Clear;
      Observaciones;
    end;
    (*
    if ( nota_sc.Text = '' ) and (Estado = teAlta) then
    begin
      if ( empresa_sc.Text = '050' ) and ( cliente_sal_sc.Text = 'MER' ) then
      begin
        nota_sc.Lines.Add('TEMPERATURA OPTIMA DE +8 A +10 GRADOS.');
        nota_sc.Lines.Add('EQUIPO FR?O EN FUNCIONAMIENTO: SI.');
        if ( dir_sum_sc.Text = '2MN' ) then
        begin
          nota_sc.Lines.Add(UpperCase('La mercanc?a transportada realiza tr?fico mar?timo entre islas'));
        end;
      end
      else
      if ( empresa_sc.Text = '050' ) and ( cliente_sal_sc.Text = 'VTO' ) then
      begin
        nota_sc.Lines.Add(UpperCase('Mercancia procedente de producci?n controlada y certificada bajo el est?ndar de calidad Globalgap.'));
      end;
      nota_sc.Lines.Add('-" EL CONDUCTOR CONFIRMA QUE LA MERCANC?A VA SUJETA POR BARRAS".');
    end;
    *)
  end;
end;

procedure TFMSalidas.RestaurarCabecera;
begin
  QSalidasC.Insert;
  with cabecera do
  begin
    QSalidasC.FieldByName('empresa_sc').AsString := SalidaRecord.rEmpresa_sc;
    QSalidasC.FieldByName('centro_salida_sc').AsString := SalidaRecord.rCentro_salida_sc;
    QSalidasC.FieldByName('n_albaran_sc').AsInteger := SalidaRecord.rN_albaran_sc;
    QSalidasC.FieldByName('fecha_sc').AsDateTime := SalidaRecord.rFecha_sc;
    QSalidasC.FieldByName('hora_sc').AsString := SalidaRecord.rHora_sc;
    QSalidasC.FieldByName('cliente_sal_sc').AsString := SalidaRecord.rCliente_sal_sc;
    QSalidasC.FieldByName('dir_sum_sc').AsString := SalidaRecord.rDir_sum_sc;
    QSalidasC.FieldByName('cliente_fac_sc').AsString := SalidaRecord.rCliente_fac_sc;
    QSalidasC.FieldByName('moneda_sc').AsString := SalidaRecord.rMoneda_sc;
    QSalidasC.FieldByName('n_pedido_sc').AsString := SalidaRecord.rN_pedido_sc;
    QSalidasC.FieldByName('operador_transporte_sc').AsInteger := SalidaRecord.rOperadorTransporte_sc;    
    QSalidasC.FieldByName('transporte_sc').AsInteger := SalidaRecord.rTransporte_sc;
    QSalidasC.FieldByName('vehiculo_sc').AsString := SalidaRecord.rVehiculo_sc;
  end;
end;

procedure TFMSalidas.ReintentarAlta;
begin
     //Estado
  Estado := teAlta;
  EstadoDetalle := tedOperacionMaestro;
  BEEstado;
  BHEstado;
  PanelMaestro.Enabled := True;
  PanelDetalle.Enabled := False;

  if Assigned(FOnEdit) then FOnEdit;

     //Poner foco
  Self.ActiveControl := FocoModificar;
end;

procedure TFMSalidas.kilos_slChange(Sender: TObject);
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if bFlagCambios and  kilos_sl.Focused then
  begin
    RecalcularUnidades( sender );
    TSalidasL.FieldByName('kilos_reales_sl').AsString := kilos_sl.Text;
    TSalidasL.FieldByName('kilos_posei_sl').AsString := kilos_sl.Text;
  end;
end;

procedure TFMSalidas.PonTextoEstaticoDetalle;
begin
  STEnvase_sl.Caption := desEnvase(empresa_sc.Text, envase_sl.Text);
  STcentro_origen_sl.Caption := desCentro(empresa_sc.Text, centro_origen_sl.Text);
  STProducto_sl.Caption := desProductoVenta(producto_sl.Text);
  STMarca_sl.Caption := desMarca(marca_sl.Text);
  STcategoria_sl.Caption := desCategoria(empresa_sc.Text, producto_sl.Text, categoria_sl.Text);
  STcolor_sl.Caption := desColor(empresa_sc.Text, producto_sl.Text, color_sl.Text);

  if Trim(Moneda_sc.Text) <> '' then
    LImporteTotal.Caption := 'ImporteTotal-' + Moneda_sc.Text
  else
    LImporteTotal.Caption := 'ImporteTotal';

end;

procedure TFMSalidas.ValidarKilosTransitos;
var TotalKilos, SumVendidos, TotalVendidos, Resto: real;
  fechaTrans: TDate;
begin
     //resto:=0;
     //TotalKilos:=0;
  SumVendidos := 0;
  TotalVendidos := 0;
//En este apartado se comprueba que los kilos escogidos de un transito
    //son correcto y no se supera la cantidad tope que hay en las lineas de transitos
  if (Trim(ref_transitos_sl.Text) <> '') and
    (Trim(centro_origen_sl.Text) <> '') then
  begin
        //hallar fecha del transito
    with DMBaseDatos.QGeneral do
    begin
      Close;
      with SQL do
      begin
        Clear;
        Add(' SELECT MAX(fecha_tl) as fecha');
        Add(' FROM frf_transitos_l');
        Add(' WHERE referencia_tl = ' + ref_transitos_sl.Text);
            //Add(' AND centro_tl = '+QuotedStr(centro_origen_sl.Text));
        Add(' AND producto_tl = ' + QuotedStr(producto_sl.Text));
      end;
      try
        Open;
      except
        on E: EDBEngineError do
        begin
          ShowError(e);
          Cancelar;
          Visualizar;
        end;
      end;
      if not isEmpty then
        fechaTrans := FieldByName('fecha').AsFloat
      else
        raise Exception.Create('Tr?nsito inexistente.');
      Close;
    end;

        //hallar la suma total de kilos utilizados en las salidas provinientes de transitos
    with DMBaseDatos.QGeneral do
    begin
      Close;
      with SQL do
      begin
        Clear;
        Add('SELECT SUM(kilos_sl) as Vendidos');
        Add(' FROM frf_salidas_l');
        Add(' WHERE ref_transitos_sl = ' + ref_transitos_sl.Text);
        Add(' AND producto_sl = ' + QuotedStr(producto_sl.Text));
            //Add(' AND centro_origen_sl = '+QuotedStr(centro_origen_sl.Text));
        Add(' AND fecha_sl >= ' + SQLDate(fechaTrans));
      end;
      try
        Open;
      except
        on E: EDBEngineError do
        begin
          ShowError(e);
          Cancelar;
          Visualizar;
        end;
      end;
          //Suma de los kilos utilizados en las salidas que vienen de transitos
      if not isEmpty then
        SumVendidos := FieldByName('Vendidos').AsFloat;
      Close;
    end;

        //hallar la suma total de kilos utilizados en las transitos provinientes de transitos
    with DMBaseDatos.QGeneral do
    begin
      Close;
      with SQL do
      begin
        Clear;
        Add('SELECT SUM(kilos_tl) as Vendidos');
        Add(' FROM frf_transitos_l');
        Add(' WHERE ref_origen_tl  = ' + ref_transitos_sl.Text);
        Add(' AND producto_tl = ' + QuotedStr(producto_sl.Text));
        Add(' AND fecha_tl >= ' + SQLDate(fechaTrans));
      end;
      try
        Open;
      except
        on E: EDBEngineError do
        begin
          ShowError(e);
          Cancelar;
          Visualizar;
        end;
      end;
          //Suma de los kilos utilizados en las salidas que vienen de transitos
      if not isEmpty then
        SumVendidos := SumVendidos + FieldByName('Vendidos').AsFloat;
      Close;
    end;


    with DMBaseDatos.QGeneral do
    begin
      Close;
      with SQL do
      begin
        Clear;
        Add(' SELECT sum(kilos_tl) as KilosHay');
        Add(' FROM frf_transitos_l');
        Add(' WHERE referencia_tl = ' + ref_transitos_sl.Text);
            //Add(' AND centro_tl = '+QuotedStr(centro_origen_sl.Text));
        Add(' AND producto_tl = ' + QuotedStr(producto_sl.Text));
        Add(' AND fecha_tl = ' + SQLDate(fechaTrans));
      end;
      try
        Open;
      except
        on E: EDBEngineError do
        begin
          ShowError(e);
          Cancelar;
          Visualizar;
        end;
      end;
          //Suma de los kilos utilizados en las salidas que vienen de transitos
      if not isEmpty then
        TotalKilos := FieldByName('KilosHay').AsFloat
      else
        raise Exception.Create('Tr?nsito sin kilos.');
      Close;
    end;

        //Esto se hace si el EstadoDetalle es modificar
        //restar los kilos que habian para averiguar los kilos que quedan por seleccionar
    if EstadoDetalle = tedModificar then
    begin
           //Le resto los kilos que habian en la linea antes de modificarla
           //y le sumo los kilos que se han seleccionado ahora, para comprobar
           //si se sobrepasa el total de kilos seleccionables.
      TotalVendidos := SumVendidos + (bnStrToFloat(kilos_sl.Text) - bnStrToFloat(KilosTran));
    end;
    if EstadoDetalle in [tedAlta, tedAltaRegresoMaestro] then
    begin
      TotalVendidos := bnStrToFloat(kilos_sl.Text) + SumVendidos;
    end;
        //Compruebo que no se sobrepase el total de kilos de transitos
        //TotalVendido = la suma de los kilos ya grabados con la cantidad que intento introducir ahora
        //TotalKilos = proviene de la linea de transitos
        //SumVendidos = los kilos que ya estan grabados
        //Resto = si todavia quedan kilos por vender del transito digo cuantos son
        //      en el mensaje de error.
    if TotalKilos < TotalVendidos then
    begin
      Resto := TotalVendidos - TotalKilos;
      raise Exception.Create('Se ha excedido el n?mero de kilos seleccionables.' +
        'Sobran ' + floatToStr(Resto) + ' kilogramos.');

    end;
  end;
end;

procedure TFMSalidas.ref_transitos_slEnter(Sender: TObject);
begin
  if TSalidasL.State = dsEdit then
  begin
    try
      ValidarKilosTransitos;
    except
      on e: Exception do
      begin
        ShowError(e);
      end;
    end;
  end;
end;

procedure TFMSalidas.centro_origen_slExit(Sender: TObject);
begin
  //Existe el centro para el transito
  if (DSDetalle.State = dsInsert) and
    (Trim(ref_transitos_sl.Text) <> '') and
    (Trim(centro_origen_sl.Text) <> '') then
    with DMBaseDatos.QGeneral do
    begin
      Cancel;
      Close;
      with SQL do
      begin
        Clear;
        Add(' SELECT UNIQUE producto_tl');
        Add(' FROM frf_transitos_l');
        Add(' WHERE referencia_tl = ' + ref_transitos_sl.Text);
        Add(' AND empresa_tl = ' + QuotedStr(empresa_sc.Text));
(*
          //Add(' AND centro_tl = '+QuotedStr(centro_origen_sl.Text));
          //La fecha del transito es anterior a la de la salida
          Add(' AND fecha_tl <= '+SQLDate(fecha_sc.Text));
          //Entre la fecha de la salida y el transito no han podido transcurrir mas de un mes,
          //pero para curarnos en salud ponemos dos
          Add(' AND '+SQLDate(fecha_sc.Text)+' - fecha_tl < 90');
*)
      end;
      try
        Open;
      except
        on E: EDBEngineError do
        begin
          ShowError(e);
          ref_transitos_sl.SetFocus;
          Exit;
        end;
      end;
       //Tiene Valores
      case RecordCount of
        0:
          begin
            ShowError('Centro no v?lido parar la ref?rencia de tr?nsito actual.');
            centro_origen_sl.SetFocus;
            Exit;
          end;
        1:
          begin
           //Rellenar centro, pasar a producto
            producto_sl.Text := FieldByName('producto_tl').AsString;
          end;
      end;
    end;
end;

procedure TFMSalidas.TransitoCorrecto;
var
  dFecha: TDateTime;
begin
  if not TryStrToDate( edtfecha_transito_sl.Text, dFecha ) then
  begin
    raise Exception.Create('Falta la fecha del tr?nsito o es incorrecta.');
  end;
  if StrToDate( fecha_sc.Text ) < dFecha then
  begin
    raise Exception.Create('La fecha de la salida no puede ser inferior a la del tr?nsito.');
  end;
  
  with DMBaseDatos.QGeneral do
  begin
    Cancel;
    Close;
    with SQL do
    begin
      Clear;
      Add(' SELECT fecha_tl');
      Add(' FROM frf_transitos_l');
      Add(' WHERE empresa_tl = ' + QuotedStr(empresa_sc.Text));
      Add(' AND referencia_tl = ' + ref_transitos_sl.Text);
      Add(' AND fecha_tl = :fecha');
      Add(' AND centro_tl = ' + QuotedStr(edtcentro_transito_sl.Text));
      Add(' AND producto_tl = ' + QuotedStr(producto_sl.Text));
      ParamByName('fecha').AsDate:= StrToDate( edtfecha_transito_sl.Text );
    end;
    try
      Open;

    except
      Close;
      ref_transitos_sl.SetFocus;
      raise Exception.Create('Imposible comprobar validez del tr?nsito.');
    end;

       //Tiene Valores
    if isEmpty then
    begin
      Close;
      ref_transitos_sl.SetFocus;
      raise Exception.Create('Tr?nsito incorrecto.');
    end;
  (*
    else
    begin
      if FieldByName('fecha_tl').AsDateTime > DSMaestro.DataSet.FieldByName('fecha_sc').AsDateTime then
      begin
        Close;
        ref_transitos_sl.SetFocus;
        raise Exception.Create('No se puede asignar a un salida producto de un tr?nsito con fecha posterior.');
      end;
    end;
   *)
    Close;
  end;
end;



procedure TFMSalidas.envase_slExit(Sender: TObject);
begin
  if EsNumerico(envase_sl.Text) and (Length(envase_sl.Text) <= 5) then
    if (envase_sl.Text <> '' ) and (Length(envase_sl.Text) < 9) then
      envase_sl.Text := 'COM-' + Rellena( envase_sl.Text, 5, '0');

  if DMConfig.EsLaFont then
    BuscarPrecioVenta;
end;

function TFMSalidas.EsCertificadoLame(const AEmpresa, ACentro, AAlbaran,  AFecha: string): boolean;
begin
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add( ' select cont_lame_dac from frf_depositos_aduana_c ');
    SQL.Add( '  where empresa_dac = :empresa  ');
    SQL.Add( '    and centro_dac = :centro  ');
    SQL.Add( '    and referencia_dac = :albaran  ');
    SQL.Add( '    and fecha_dac = :fecha  ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('albaran').AsString:= AAlbaran;
    ParamByName('fecha').AsString:= AFecha;
    Open;
    if FieldByName('cont_lame_dac').AsString <> '' then
      result := true
    else
      result := false;

    Close;  
  end;

end;

function TFMSalidas.esClienteExtranjero(codEmp: string; codCliente: string): Boolean;
begin
  with DMAuxDB.QAux do
  begin
    SQL.Text := ' select pais_c from frf_clientes ' +
      ' where cliente_c=' + QuotedStr(codCliente);
    try
      try
        Open;
        if IsEmpty then esClienteExtranjero := false
        else esClienteExtranjero := (Fields[0].AsString <> 'ES') and (Fields[0].AsString <> '');
      except
        esClienteExtranjero := false;
      end;
    finally
      Cancel;
      Close;
    end;
  end;
end;


procedure TFMSalidas.importe_neto_slChange(Sender: TObject);
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if bFlagCambios and  importe_neto_sl.Focused then
    RecalcularUnidades( Sender, True );
end;

procedure TFMSalidas.CambioDeEnvase(Sender: TObject);
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;

    //foco y campos editables
  STEnvase_sl.Caption := desEnvase(empresa_sc.Text, envase_sl.Text);

  if Length( envase_sl.Text ) >= 3 then
  begin
    //UNIDAD DE FACTURACION
    unidad_precio_sl.Text := unidadFacturacion(empresa_sc.text, cliente_sal_sc.text,
        producto_sl.Text, envase_sl.Text);
    sUnidadPrecioLinea:= Copy( unidad_precio_sl.Text, 1, 1 );

    tipo_iva_sl.Text:= Impuesto.sCodigo;
    case TipoIVAEnvaseProducto( empresa_sc.Text, envase_sl.Text, producto_sl.Text ) of
      1: //if impuesto.rReducido <> StrToFloatDef( porc_iva_sl.Text, -1 ) then
           rImpuestoLinea:= impuesto.rReducido;
      2: //if impuesto.rGeneral <> StrToFloatDef( porc_iva_sl.Text, -1 ) then
           rImpuestoLinea:= impuesto.rGeneral;
      else
        //if impuesto.rSuper <> StrToFloatDef( porc_iva_sl.Text, -1 ) then
          rImpuestoLinea:= impuesto.rSuper;
    end;

    bEnvaseVariableLinea:= EnvaseUnidadesVariable( empresa_sc.Text, envase_sl.Text, producto_sl.Text );
    unidades_caja_sl.Enabled:= bEnvaseVariableLinea;
    if not bEnvaseVariableLinea or ( unidades_caja_sl.Text = '' ) then
    begin
      unidades_caja_sl.Text:= IntToStr( UnidadesEnvase( empresa_sc.Text, envase_sl.Text, producto_sl.Text ) );
    end;

    bPesoVariableLinea:= EnvasePesoVariable( empresa_sc.Text, envase_sl.Text, producto_sl.Text );
    kilos_sl.Enabled:= bPesoVariableLinea;
    rPesoCaja:= KilosEnvase( empresa_sc.Text, envase_sl.Text, producto_sl.Text );

    if bFlagCambios then
    begin
      RecalcularUnidades( sender );
      TSalidasL.FieldByName('kilos_reales_sl').AsString := kilos_sl.Text;
      TSalidasL.FieldByName('kilos_posei_sl').AsString := kilos_sl.Text;
    end;

  end;
end;

(*IVA*)
procedure TFMSalidas.CambioProducto(Sender: TObject);
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if not DMConfig.EsLaFont then
  begin
    if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
      Exit;
  end;


  PonNombre(Sender);
  PonNombre( color_sl );
  PonNombre( categoria_sl );
  if Length( envase_sl.Text ) >= 3 then
    CambioDeEnvase( envase_SL );
end;

procedure TFMSalidas.GastosClick( const AFacturable: boolean );
//Var tip:String;
begin
  with DMBaseDatos.QGeneral do
  begin
    if Active then Close;
// Elimina de la tabla Temporal...
    SQL.Clear;
    SQL.Add('DELETE FROM tmp_gastos ');
    SQL.Add('WHERE usuario_tg = ' + QuotedStr(gsCodigo) + ' ');

    ExecSQL;

    SQL.Clear;
    SQL.Add('INSERT INTO tmp_gastos (empresa_tg,centro_tg,albaran_tg,' +
      'fecha_tg,tipo_tg,importe_tg,usuario_tg,ref_fac_tg, fecha_fac_tg, producto_tg, solo_lectura_tg, transporte_tg) ');
    SQL.Add('SELECT empresa_g,centro_salida_g,n_albaran_g,' +
      'fecha_g,tipo_g,' +
      'importe_g,' +
      QuotedStr(gsCodigo) + ' As usuario ');
    SQL.Add(' ,ref_fac_g, fecha_fac_g, producto_g, solo_lectura_g, transporte_g ');
    SQL.Add('FROM frf_gastos');
    SQL.Add('WHERE empresa_g=' + QuotedStr(empresa_sc.Text) + ' ' +
      'And centro_salida_g=' + QuotedStr(centro_salida_sc.Text) + ' ' +
      'And n_albaran_g=' + n_albaran_sc.Text + ' ' +
      'And fecha_g=:fecha ');
    ParamByName('fecha').asdatetime := StrToDate(fecha_sc.Text);
    ExecSQL;
  end;

  try
    FMGastosSalida := TFMGastosSalida.Create(Self);


    with FMGastosSalida.QGastosSalida do
    begin
          // Datos de gastos de la Salida que
      if Active then Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM tmp_gastos ');
      SQL.Add('WHERE empresa_tg =' + QuotedStr(empresa_sc.Text) + ' ' +
        'And centro_tg =' + QuotedStr(centro_salida_sc.Text) + ' ' +
        'And albaran_tg =' + n_albaran_sc.Text + ' ' +
        'And fecha_tg = :fecha ' +
        'And usuario_tg = ' + QuotedStr(gsCodigo) + ' ');
      SQL.Add('ORDER BY tipo_tg');
      ParamByName('fecha').asdatetime := StrToDate(fecha_sc.Text);
      Open;
      First;
      while not Eof do
      begin
        DMAuxDB.QDescripciones.SQL.Text := ' select descripcion_tg, facturable_tg from frf_tipo_gastos ' +
          ' where tipo_tg=' + QuotedStr(FieldByName('tipo_tg').AsString);
        try
          DMAuxDB.QDescripciones.Open;
          if not DMAuxDB.QDescripciones.IsEmpty then
          begin
            Edit;
            FieldByName('descriptipo_tg').AsString :=
              DMAuxDB.QDescripciones.FieldByName('descripcion_tg').AsString;
            FieldByName('facturable_tg').AsString :=
              DMAuxDB.QDescripciones.FieldByName('facturable_tg').AsString;
            Post;
          end;
        finally
          DMAuxDB.QDescripciones.Cancel;
          DMAuxDB.QDescripciones.Close;
        end;
        if FieldByName('transporte_tg').AsString <> ''then
        begin
          DMAuxDB.QDescripciones.SQL.Text := ' select descripcion_t from frf_transportistas ' +
            ' where transporte_t=' + FieldByName('transporte_tg').AsString;
          try
            DMAuxDB.QDescripciones.Open;
            if not DMAuxDB.QDescripciones.IsEmpty then
            begin
              Edit;
              FieldByName('descriptrans_tg').AsString :=
                DMAuxDB.QDescripciones.FieldByName('descripcion_t').AsString;
              Post;
            end;
          finally
            DMAuxDB.QDescripciones.Cancel;
            DMAuxDB.QDescripciones.Close;
          end;
        end;
        Next;
      end;
      Close;
      Open;
    end;


    FMGastosSalida.sEmpresa := empresa_sc.Text;
    FMGastosSalida.empNom := empresa_sc.Text + ' - ' + STEmpresa_sc.Caption;
    FMGastosSalida.sCentro := centro_salida_sc.Text;
    FMGastosSalida.cenNom := STCentro_salida_sc.Caption;
    FMGastosSalida.sAlbaran := n_albaran_sc.Text;
    FMGastosSalida.sFecha := fecha_sc.Text;
    FMGastosSalida.STEmpresa.Caption := FMGastosSalida.empNom;
    FMGastosSalida.STCentro.Caption := FMGastosSalida.cenNom;
    FMGastosSalida.STAlbaran.Caption := FMGastosSalida.sAlbaran;
    FMGastosSalida.STFecha.Caption := FMGastosSalida.sFecha;
    FMGastosSalida.sTransporte := transporte_sc.Text;
    FMGastosSalida.descripcionCliente;
    FMGastosSalida.Botones;
    FMGastosSalida.bFacturable:= AFacturable;
    FMGastosSalida.ShowModal;
  finally
    FMGastosSalida.QGastosSalida.Close;
    FMGastosSalida.Free;
  end;
  CambiarRegistro;
end;

procedure TFMSalidas.AGastosExecute(Sender: TObject);
begin
  // Mantenimiento de Gastos por Salida...
  if (Estado = teConjuntoResultado) then
  begin
    if estoyContabilizada then
    begin
      ShowError('La salida ya esta asociada a una factura contabilizada. Recuerde que s?lo debe modificar gastos no facturables.');
      GastosClick( False );
    end
    else
    if estoyFacturada then
    begin
      ShowMessage('Albar?n asociado a una factura. Recuerde que s?lo debe modificar gastos no facturables.');
      GastosClick( False );
    end
    else
    begin
      GastosClick( True );
    end;
  end;
end;

procedure TFMSalidas.DesasignarAlbFac;
//var
  //enclave: TBookMark;
  //cBack: TCursor;
begin
  if Application.MessageBox('?Seguro que quiere romper el enlace entre el albar?n actual y su factura asociada.?' + #13 + #10 +
                            'Recuerde repetir la factura para que el cambio se vea reflejado.',
                            'Desasociar factura.', MB_YESNO ) = IDNO then
    Exit;

  //cBack:= Screen.Cursor;
  //Screen.Cursor:= crHourGlass;
  //Application.ProcessMessages;

  //DSMaestro.DataSet.DisableControls;
  //enclave:= DSMaestro.DataSet.GetBookmark;
  DSMaestro.DataSet.Edit;
  DSMaestro.DataSet.FieldByName('n_factura_sc').Value:= NULL;
  DSMaestro.DataSet.FieldByName('fecha_factura_sc').Value:= NULL;
  DSMaestro.DataSet.Post;

  //Log
  InsertarLogTransacciones('DESASIGNAR ALBARAN_FACTURA');

  //DSMaestro.DataSet.Close;
  //DSMaestro.DataSet.Open;
  //DSMaestro.DataSet.GotoBookmark( enclave );

  //Screen.Cursor:= cBack;
  //Application.ProcessMessages;
  //DSMaestro.DataSet.EnableControls;
  //DSMaestro.DataSet.FreeBookmark( enclave );
end;

function ExisteFactura( const AEmpresa: string; const AFecha: TDateTime; const AFactura: integer ): boolean;
begin
  with DMBaseDatos.QGeneral do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;
    SQL.Clear;
    SQl.Add('Select n_factura_f from frf_facturas ');
    SQl.Add(' where empresa_f = :empresa ');
    SQl.Add('   and n_factura_f = :factura ');
    SQl.Add('   and fecha_factura_f = :fecha ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('factura').AsInteger:= AFactura;
    ParamByName('fecha').AsDateTime:= AFecha;

    Open;
    result:= not IsEmpty;
    Close;
  end;
end;

procedure TFMSalidas.AsignarAlbFac;
var
  sEmpresa: string;
  dFecha: TDateTime;
  iFactura: Integer;
  //enclave: TBookMark;
  //cBack: TCursor;
begin
  sEmpresa:= empresa_sc.Text;
  dFecha:= Date;
  ifactura:= 0;
  if GetFacturaAsignar( sEmpresa, dFecha, iFactura) then
  begin
    if ExisteFactura( sEmpresa, dFecha, iFactura ) then
    begin
      //cBack:= Screen.Cursor;
      //Screen.Cursor:= crHourGlass;
      //Application.ProcessMessages;

      //DSMaestro.DataSet.DisableControls;
      //enclave:= DSMaestro.DataSet.GetBookmark;
      DSMaestro.DataSet.Edit;
      DSMaestro.DataSet.FieldByName('n_factura_sc').AsInteger:= iFactura;
      DSMaestro.DataSet.FieldByName('fecha_factura_sc').AsDateTime:= dFecha;
      DSMaestro.DataSet.Post;
      //DSMaestro.DataSet.Close;
      //DSMaestro.DataSet.Open;
      //DSMaestro.DataSet.GotoBookmark( enclave );

      //Screen.Cursor:= cBack;
      //Application.ProcessMessages;
      //DSMaestro.DataSet.EnableControls;
      //DSMaestro.DataSet.FreeBookmark( enclave );

      //Log
      InsertarLogTransacciones('ASIGNAR ALBARAN_FACTURA');

    end
    else
    begin
      ShowMessage('No se puede asignar un albar?n a una factura inexistente.');
    end;
  end;
end;

procedure TFMSalidas.SBFacturableClick(Sender: TObject);
begin
  if not DSMaestro.DataSet.IsEmpty then
  begin
    if EstoyContabilizada then
    begin
      ShowMessage('No se puede desasignar un albar?n de una factura ya contabilizada.');
    end
    else
    begin
      if n_factura_sc.Text <> '' then
      begin
        DesasignarAlbFac;
      end
      else
      begin
        AsignarAlbFac;
      end;
    end;
  end;
end;

procedure TFMSalidas.AMenuEmergenteExecute(Sender: TObject);
begin
  MessageDlg(IntToStr(RVisualizacion.SelectedRows.Count), mtInformation, [], 0);
end;

procedure TFMSalidas.RVisualizacionDblClick(Sender: TObject);
var
  i: integer;
  unidad: string;
  sComer: string;
begin
  if estoyContabilizada then
  begin
    //raise Exception.Create('No se puede modificar una salida asociada a una factura contabilizada.');
    ShowMessage('No se puede modificar una salida asociada a una factura contabilizada.');
    sComer:= DSDetalle.DataSet.FieldByName('comercial_sl').AsString;
    if SeleccionarComercialFD.SeleccionarComercial( sComer ) = mrOk then
    begin
      DSDetalle.DataSet.Edit;
      DSDetalle.DataSet.FieldByName('comercial_sl').AsString:= sComer;
      DSDetalle.DataSet.Post;
    end;
    Exit;
  end
  else
  if estoyFacturada then
  begin
    ShowMessage('No se puede modificar una salida facturada');   // Pedido por Irene Segur 28/11/2018
    exit;
  end;

  if Estado <> teConjuntoResultado then exit;
  //Comprobar si hay mas de un registro seleccionado
  if RVisualizacion.SelectedRows.Count = 1 then
  begin
    TextoPrecio.Caption := '1 registro selccionado.';
    etiquetaUnidad.Caption :=
      RVisualizacion.DataSource.DataSet.FieldByName('unidad_precio_sl').AsString;
    PanelPrecio.Visible := true;
    PanelPrecio.Enabled := true;
    RVisualizacion.Enabled := false;
    Precio.SetFocus;
  end;
  if RVisualizacion.SelectedRows.Count > 1 then
  begin
    etiquetaUnidad.Caption :=
      RVisualizacion.DataSource.DataSet.FieldByName('unidad_precio_sl').AsString;
    with RVisualizacion.DataSource.DataSet do
    begin
      GotoBookmark(pointer(RVisualizacion.SelectedRows.Items[0]));
      unidad := FieldByName('unidad_precio_sl').AsString;
      for i := 1 to RVisualizacion.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(RVisualizacion.SelectedRows.Items[i]));
        if unidad <> FieldByName('unidad_precio_sl').AsString then
        begin
          ShowError('Las lineas seleccionadas deben tener la misma unidad de facturaci?n.');
          Exit;
        end;
      end;
    end;
    TextoPrecio.Caption := IntToStr(RVisualizacion.SelectedRows.Count) +
      ' registros selccionados.';
    PanelPrecio.Visible := true;
    PanelPrecio.Enabled := true;
    RVisualizacion.Enabled := false;
    Precio.SetFocus;
  end;
end;

procedure TFMSalidas.SpeedButton1Click(Sender: TObject);
begin
  RVisualizacion.Enabled := true;
  PanelPrecio.Enabled := false;
  PanelPrecio.Visible := false;
end;


procedure TFMSalidas.SpeedButton2Click(Sender: TObject);
var
  i: integer;
begin
  RVisualizacion.DataSource.DataSet.DisableControls;
  try
    with RVisualizacion.DataSource.DataSet do
    begin
      if RVisualizacion.SelectedRows.Count > 1 then
      begin
        for i := 0 to RVisualizacion.SelectedRows.Count - 1 do
        begin
          GotoBookmark(pointer(RVisualizacion.SelectedRows.Items[i]));
          CambiarPrecio( StrToFloatDef( precio.Text, 0 ) );
        end;
      end
      else
      begin
        CambiarPrecio( StrToFloatDef( precio.Text, 0 ) );
      end;
      RVisualizacion.SelectedRows.Clear;
    end;
  finally
    RVisualizacion.DataSource.DataSet.EnableControls;
    TSalidasL.Close;
    TSalidasL.Open;
  end;
  RVisualizacion.Enabled := true;
  PanelPrecio.Enabled := false;
  PanelPrecio.Visible := false;
end;

procedure TFMSalidas.ssEnvaseAntesEjecutar(Sender: TObject);
begin
    ssEnvase.SQLAdi := '';
    if producto_sl.Text <> '' then
      ssEnvase.SQLAdi := ' producto_e = ' +  QuotedStr(producto_sl.Text);
end;

procedure TFMSalidas.precioEnter(Sender: TObject);
begin
  Precio.Text := '';
  FMSalidas.KeyPreview := false;
  BHMaestroDetalleDeshabilitar(true);
  BHMaestroDeshabilitar(true);
  Fprincipal.AIPrevisualizar.Enabled := false;
end;

procedure TFMSalidas.precioExit(Sender: TObject);
begin
  FMSalidas.KeyPreview := true;
  BHEstado;
  BHGrupoDesplazamientoMaestro(self.PCMaestro);
  BHGrupoDesplazamientoDetalle(self.PCdetalle);
  {BHMaestroDetalleDeshabilitar(false);
  BHMaestroDeshabilitar(false);}
  Fprincipal.AIPrevisualizar.Enabled := true;
end;

procedure TFMSalidas.precioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
  begin
    SpeedButton2.Click;
  end;
end;

procedure TFMSalidas.precioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_ESCAPE then
  begin
    SpeedButton1.Click;
  end;
end;

procedure TFMSalidas.sbVentasClick(Sender: TObject);
begin
  if estoyContabilizada then
  begin
    raise Exception.Create('No se puede modificar una salida asociada a una factura contabilizada.')
  end;
  if estoyFacturada then
  begin
    raise Exception.Create('No se puede modificar una salida asociada a una factura.');
  end;
  CuentaVentas(Sender);
end;


procedure TFMSalidas.CuentaVentas(Sender: TObject);
begin
  //Este boton no existe en el almacen
  if DMConfig.EsUnAlmacen then
    exit;

  if Estado = teConjuntoResultado then
    with TFDCuentaVentas.Create(Application) do
    begin
      try
        if not Error then ShowModal;
      finally
        Free;
      end;
    end
  else
    Exit;
end;

///////////////////////////////////////////////////////////////////
//                                                               //
//   EVENTOS ASOCIADOS A LA QUERY                                //
//                                                               //
///////////////////////////////////////////////////////////////////

procedure TFMSalidas.QSalidasCBeforePost(DataSet: TDataSet);
var
  nAlbaran: Integer;
begin
  if DataSet.State = dsInsert then
  begin
     //Abrir transaccion
     {i:=0;
     while TQuery(DataSet).DataBase.InTransaction and (i<30) do
     begin
       sleep(1000);
       Inc(i);
     end;
     if TQuery(DataSet).DataBase.InTransaction then
     begin
       Abort;
     end;
     TQuery(DataSet).DataBase.StartTransaction;}

    nAlbaran := GetNumeroDeAlbaran(empresa_sc.Text, centro_salida_sc.Text, True, bnStrToInt(n_albaran_sc.Text));
    DataSet.FieldByName('n_albaran_sc').AsInteger := nAlbaran;
    DataSourceDetalle.DataSet.FieldByName('n_albaran_sl').AsInteger := nAlbaran;
    SalidaRecord.rN_albaran_sc := nALbaran;
    n_albaran_sc.Text := IntToStr(nAlbaran);
  end;
end;

(*IVA*)
procedure TFMSalidas.QSalidasCAfterPost(DataSet: TDataSet);
var
  Bookmark: TBookmark;
begin
  if Estado = teModificar then
  begin
    //Comprobar si hay cambio de iva
    Impuesto:= ImpuestosCliente(empresa_sc.Text, centro_salida_sc.Text, cliente_fac_sc.Text, dir_sum_sc.Text, StrToDateTimeDef( fecha_sc.Text, Now ));
    TSalidasL.DisableControls;
    Bookmark:= TSalidasL.GetBookmark;
    TSalidasL.First;
    while not TSalidasL.Eof do
    begin
      if ( TSalidasL.FieldByName('tipo_iva_sl').AsString <> Impuesto.sCodigo ) or
         ( QSalidasC.FieldByName('cliente_sal_sc').AsString <> TSalidasL.FieldByName('cliente_sl').AsString ) then
      begin
        TSalidasL.Edit;
        if ( TSalidasL.FieldByName('tipo_iva_sl').AsString <> Impuesto.sCodigo ) then
        begin
          TSalidasL.FieldByName('tipo_iva_sl').AsString:= Impuesto.sCodigo;
          case TipoIVAEnvaseProducto( TSalidasL.FieldByName('empresa_sl').AsString,
                                      TSalidasL.FieldByName('envase_sl').AsString,
                                      TSalidasL.FieldByName('producto_sl').AsString ) of
//            0: TSalidasL.FieldByName('porc_iva_sl').AsFloat:= Impuesto.rSuper;
            1: TSalidasL.FieldByName('porc_iva_sl').AsFloat:= Impuesto.rReducido;
            2: TSalidasL.FieldByName('porc_iva_sl').AsFloat:= Impuesto.rGeneral;
            else
              TSalidasL.FieldByName('porc_iva_sl').AsFloat:= Impuesto.rSuper;
          end;
          TSalidasL.FieldByName('iva_sl').AsFloat:= bRoundTo((TSalidasL.FieldByName('importe_neto_sl').AsFloat*TSalidasL.FieldByName('porc_iva_sl').AsFloat)/100, -2);
          TSalidasL.FieldByName('importe_total_sl').AsFloat:= TSalidasL.FieldByName('importe_neto_sl').AsFloat + TSalidasL.FieldByName('iva_sl').AsFloat;
        end;
        if ( QSalidasC.FieldByName('cliente_sal_sc').AsString <> TSalidasL.FieldByName('cliente_sl').AsString ) then
        begin
          TSalidasL.FieldByName('cliente_sl').AsString:= QSalidasC.FieldByName('cliente_sal_sc').AsString;
        end;
        TSalidasL.Post;
      end;
      TSalidasL.Next;
    end;

    TSalidasL.GotoBookmark( Bookmark );
    TSalidasL.FreeBookmark( Bookmark );
    TSalidasL.EnableControls;
  end
  else
  begin
    //BAG
    //IncSalidaCliente(empresa_sc.Text, cliente_sal_sc.Text);
  end;
  //Log
  if Estado = teModificar then
    InsertarLogTransacciones('MODIFICACION CABECERA')
  else
    if Estado = teAlta then
      InsertarLogTransacciones('ALTA CABECERA');

  ActualizarMatricula;
end;

(*
procedure TFMSalidas.IncSalidaCliente(empresa, cliente: string);
var
  aux: integer;
begin
  with DMAuxDB.QDescripciones do
  begin
    SQL.Text := ' select expediciones_c from frf_clientes ' +
      ' where empresa_c=' + QuotedStr(empresa) + ' ' +
      ' and cliente_c=' + QuotedStr(cliente);
    try
      try
        Open;
        if IsEmpty then aux := 0
        else aux := Fields[0].AsInteger;
      except
        Exit;
      end;
    finally
      Cancel;
      Close;
    end;

    SQL.Text := ' update frf_clientes set expediciones_c = ' + IntToStr(aux + 1) +
      ' where empresa_c=' + QuotedStr(empresa) + ' ' +
      ' and cliente_c=' + QuotedStr(cliente);
    ExecSQL; ;
  end;
end;
*)

procedure TFMSalidas.ActualizarMatricula;
begin
  if not DMConfig.EsLaFont then
  begin
    if ( oldMatricula <> QSalidasC.FieldByName('vehiculo_sc').AsString ) and
       ( oldmatricula <> 'IGNORAR' ) then
    begin
      DMAuxDB.QAux.SQL.Clear;
      DMAuxDB.QAux.SQL.Add('update frf_orden_carga_c ');
      DMAuxDB.QAux.SQL.Add('set vehiculo_occ = :matricula  ');
      DMAuxDB.QAux.SQL.Add('where empresa_occ = :empresa  ');
      DMAuxDB.QAux.SQL.Add('and centro_salida_occ = :centro ');
      DMAuxDB.QAux.SQL.Add('and fecha_occ = :fecha ');
      DMAuxDB.QAux.SQL.Add('and n_albaran_occ = :albaran ');

      DMAuxDB.QAux.ParamByName('matricula').AsString:= QSalidasC.FieldByName('vehiculo_sc').AsString;
      DMAuxDB.QAux.ParamByName('empresa').AsString:= QSalidasC.FieldByName('empresa_sc').AsString;
      DMAuxDB.QAux.ParamByName('centro').AsString:= QSalidasC.FieldByName('centro_salida_sc').AsString;
      DMAuxDB.QAux.ParamByName('albaran').AsInteger:= QSalidasC.FieldByName('n_albaran_sc').AsInteger;
      DMAuxDB.QAux.ParamByName('fecha').AsDateTime:= QSalidasC.FieldByName('fecha_sc').AsDateTime;

      DMAuxDB.QAux.ExecSQL;
    end;
  end;
end;

procedure TFMSalidas.QSalidasCAfterEdit(DataSet: TDataSet);
begin
  if not EstoyContabilizada then
    CargaRegistro;
end;

///////////////////////////////////////////////////////////////////
//                                                               //
///////////////////////////////////////////////////////////////////

procedure TFMSalidas.CargaRegistro;
begin
  with QSalidasC, SalidaRecord do
  begin
    rEmpresa_sc := FieldByName('empresa_sc').asString;
    rCentro_salida_sc := FieldByName('centro_salida_sc').AsString;
    rN_albaran_sc := FieldByName('n_albaran_sc').AsInteger;
    rFecha_sc := FieldByName('fecha_sc').AsDateTime;
    rHora_sc := FieldByName('hora_sc').AsString;
    rCliente_sal_sc := FieldByName('cliente_sal_sc').AsString;
    rDir_sum_sc := FieldByName('dir_sum_sc').AsString;
    rCliente_fac_sc := FieldByName('cliente_fac_sc').AsString;
    rN_pedido_sc := FieldByName('n_pedido_sc').AsString;
    rMoneda_sc := FieldByName('moneda_sc').AsString;
    rOperadorTransporte_sc := FieldByName('operador_transporte_sc').AsInteger;
    rTransporte_sc := FieldByName('transporte_sc').AsInteger;
    rVehiculo_sc := FieldByName('vehiculo_sc').AsString;
  end;
end;

function TFMSalidas.EstoyFacturada: boolean;
begin
  (*
  result:= False;
  Exit;
  *)
  result:= Trim(n_factura_sc.Text) <> '';
end;

function TFMSalidas.EsProductoDesglose: boolean;
begin
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add('select producto_desglose_p ');
    SQL.Add('  from frf_productos ');
    SQL.Add(' where producto_p = :producto ');
    ParamByName('producto').AsString := TSalidasL.FieldByName('producto_sl').AsString;
    Open;

    result := (FieldByName('producto_desglose_p').AsString = 'S');
  end;
end;

function TFMSalidas.TieneDeposito: boolean;
begin
  with DMAuxDB.QAux do
  try
    SQL.Clear;
    SQL.Add('select * ');
    SQL.Add('  from frf_depositos_aduana_c ');
    SQL.Add(' where empresa_dac = :empresa ');
    SQL.Add('   and centro_dac = :centro ');
    SQL.Add('   and referencia_dac = :albaran ');
    SQL.Add('   and fecha_dac = :fecha ');

    ParamByName('empresa').AsString := QSalidasC.FieldByName('empresa_sc').AsString;
    ParamByName('centro').AsString := QSalidasC.FieldByName('centro_salida_sc').AsString;
    ParamByName('albaran').AsString := QSalidasC.FieldByName('n_albaran_sc').AsString;
    ParamByName('fecha').AsString := QSalidasC.FieldByName('fecha_sc').AsString;
    Open;

    result := not isEmpty;
  finally
    close;
  end;
end;

function TFMSalidas.EstoyContabilizada: boolean;
begin
  (*
  Result:= False;
  Exit;
  (*)
  begin
    //Comprobar que no se haya facturado
    if Trim(n_factura_sc.Text) = '' then
    begin
      Result := false;
    end
    else
    begin
      Result := EstaContabilizada(DSMaestro.DataSet.FieldByName('empresa_fac_sc').AsString, DSMaestro.DataSet.FieldByName('serie_fac_sc').AsString, n_factura_sc.Text, fecha_factura_sc.Text);
    end;
  end;
end;

procedure TFMSalidas.TSalidasLNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('emp_procedencia_sl').AsString := empresa_sc.Text;
  DataSet.FieldByName('comercial_sl').AsString := GetCodeComercial(producto_sl.Text, cliente_sal_sc.Text, strtodate(fecha_sc.Text));
  DataSet.FieldByName('desEnvase').AsString := desEnvase(DataSet.FieldByName('empresa_sl').AsString, DataSet.FieldByName('envase_sl').AsString);
  DataSet.FieldByName('empresa_sl').AsString := QSalidasC.FieldByName('empresa_sc').AsString;
  DataSet.FieldByName('centro_salida_sl').AsString := QSalidasC.FieldByName('centro_salida_sc').AsString;
  DataSet.FieldByName('centro_origen_sl').AsString := centro_salida_sc.text;
  DataSet.FieldByName('n_albaran_sl').AsString := QSalidasC.FieldByName('n_albaran_sc').AsString;
  DataSet.FieldByName('fecha_sl').AsString := QSalidasC.FieldByName('fecha_sc').AsString;
  DataSet.FieldByName('id_linea_albaran_sl').AsInteger := ObtenerLineaAlbaran;

end;

procedure TFMSalidas.AplicaFiltro(const AFiltro: string);
begin
     //Cerramos detalle
  DataSourceDetalle.DataSet.Cancel;
  DataSourceDetalle.DataSet.Close;
     //Cerramos maestro
  DataSeTMaestro.Cancel;
  DataSeTMaestro.Close;

     //Aplicar Query
  DataSeTMaestro.SQL.Clear;
  DataSeTMaestro.SQL.Add(Select);
  DataSeTMaestro.SQL.Add(AFiltro);
  DataSeTMaestro.SQL.Add(Order);
  DataSeTMaestro.EnableControls;

     //activar Query
  try
    DataSeTMaestro.Open;
    DataSourceDetalle.DataSet.Open;
  except
    on e: EDBengineError do
    begin
      ShowError(e);
      Registros := 0;
      Registro := 0;
      Visualizar;
      Exit;
    end;
  end;

     //Numero de registros
  Registros := CantidadRegistros;
  Registro := 1;

     //Poner estado segun el resultado de la busqueda
  Visualizar;

     //Mensaje si no encontramos ningun registro
  if Registros = 0 then
    BEMensajes('No se han encontrado datos para los valores introducidos.');
end;

procedure TFMSalidas.DSDetalleDataChange(Sender: TObject; Field: TField);
begin
  btnDesglose.Enabled := EsProductoDesglose;
end;

procedure TFMSalidas.DSDetalleStateChange(Sender: TObject);
begin
  if DSDetalle.State = dsEdit then
    oldEnvase := envase_sl.Text
  else
    oldEnvase := '';
end;

procedure TFMSalidas.porte_bonny_scEnter(Sender: TObject);
begin
  TDBCheckBox( Sender ).Color:= clMoneyGreen;
end;

procedure TFMSalidas.porte_bonny_scExit(Sender: TObject);
begin
  TDBCheckBox( Sender ).Color:= clBtnFace;
end;

procedure TFMSalidas.QSalidasCNewRecord(DataSet: TDataSet);
begin
  if (Estado <> teAlta) then
  begin
    //QSalidasC.FieldByName('porte_bonny_sc').AsInteger:= 0;
    QSalidasC.FieldByName('higiene_sc').AsInteger:= 1;
    QSalidasC.FieldByName('reclamacion_sc').AsInteger:= 0;

    oldmatricula:= '';
  end
  else
  begin
    QSalidasC.FieldByName('es_transito_sc').AsInteger:= 0;
  end;
end;


procedure TFMSalidas.QSalidasCBeforeEdit(DataSet: TDataSet);
begin
  oldMatricula:= QSalidasC.FieldByName('vehiculo_sc').AsString;
end;

procedure TFMSalidas.tipo_palets_slChange(Sender: TObject);
begin
  stTipoPalets.Caption:= desTipoPalet( tipo_palets_sl.Text );
end;

procedure TFMSalidas.CambiarPrecio( const APrecio: real );
var
  rAux: Real;
begin
  if APrecio = 0 then
  begin
    with DSDetalle.DataSet do
    begin
{
      with DMBaseDatos.QGeneral do
      begin

       SQL.Clear;
       SQL.Add(' update frf_salida_l set ');
       SQl.Add('   (precio_sl, importe_neto_sl, iva_sl, importe_total_sl) = (:precio, :importeNeto, :iva, :importeTotal) ');
       Sql.Add(' where empresa_sl = :empresa ');
       Sql.Add(' and centro_salida_sl = :centro ');
       Sql.Add(' and n_albaran_sl = :albaran ');
       Sql.Add(' and fecha_sl = :fecha ');
       Sql.Add(' and id_linea_albaran_sl :linea ');
       ParamByName('empresa').AsString:=DSDetalle.DataSet.FieldByName('empresa_sl').AsString;
       ParamByName('centro').AsString:=DSDetalle.DataSet.FieldByName('centro_salida_sl').AsString;
       ParamByName('albaran').AsString:=DSDetalle.DataSet.FieldByName('n_albaran_sl').AsString;
       ParamByName('fecha').AsString:=DSDetalle.DataSet.FieldByName('fecha_sl').AsString;
       ParamByName('linea').AsInteger:=DSDetalle.DataSet.FieldByName('id_linea_albaran_sl').AsInteger;

       ExecSql;
      end;
}

      Edit;
      FieldByName('precio_sl').AsFloat:= 0;
      FieldByName('importe_neto_sl').AsFloat:= 0;
      FieldByName('iva_sl').AsFloat:= 0;
      FieldByName('importe_total_sl').AsFloat:= 0;
      Post;

    //Log
    InsertarLogTransacciones('MODIFICACION PRECIO')

    end;
  end
  else
  begin
    with DSDetalle.DataSet do
    begin
      Edit;
      FieldByName('precio_sl').AsFloat:= APrecio;

      if FieldByName('unidad_precio_sl').AsString = 'UND' then
      begin
        rAux:= FieldByName('cajas_sl').AsInteger * FieldByName('unidades_caja_sl').AsInteger;
      end
      else
      if FieldByName('unidad_precio_sl').AsString = 'CAJ' then
      begin
        rAux:= FieldByName('cajas_sl').AsInteger;
      end
      else
      //if FieldByName('unidad_precio_sl').AsSting = 'KGS' then
      begin
        rAux:= FieldByName('kilos_sl').AsFloat;
      end;
                                                                                         
      rAux:= bRoundTo( rAux * APrecio, -2 );
      FieldByName('importe_neto_sl').AsFloat:= rAux;
      rAux:= bRoundTo( ( FieldByName('importe_neto_sl').AsFloat * FieldByName('porc_iva_sl').AsFloat ) / 100, -2 );
      FieldByName('iva_sl').AsFloat:= rAux;
      rAux:= FieldByName('importe_neto_sl').AsFloat + FieldByName('iva_sl').AsFloat;
      FieldByName('importe_total_sl').AsFloat:= rAux;

      Post;

      //Log
      InsertarLogTransacciones('MODIFICACION PRECIO')

    end;
  end;
end;

procedure TFMSalidas.QSalidasCAfterOpen(DataSet: TDataSet);
begin
  if bAbonos then
  begin
    if DMConfig.EsLaFont then
      QAbonos.Open;
  end;
  btnDesadv.Enabled:= ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'ECI' ) or
                      ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'AMA' ) or
                      ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'SOK' ) or
                      ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'MER' );
end;

procedure TFMSalidas.QSalidasCBeforeClose(DataSet: TDataSet);
begin
  if DMConfig.EsLaFont then
    QAbonos.Close;
end;

(*IVA*)
procedure TFMSalidas.btnValorarClick(Sender: TObject);
begin
  if (Estado = teConjuntoResultado) and ( not DSDetalle.DataSet.isEmpty ) then
  begin
    if estoyContabilizada then
    begin
      ShowError('La salida ya esta asociada a una factura contabilizada, no se pueden modificar los precios.');
    end
    else
    begin
      if estoyFacturada then
      begin
        ShowMessage('Albar?n asociado a una factura, no se puede modificar los precios.');
      end
      else
        ValorarAlbaran;
    end;
  end;
end;

function  TFMSalidas.GetPrecioDiario( const ACliente, AEnvase, AMoneda: string; const AFecha: TDateTime; var VUnidad: string ): real;
begin
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select precio_pv, unidad_precio_pv   ');
    SQL.Add(' from frf_precio_venta                ');
    SQL.Add(' where cliente_pv = :cliente          ');
    SQL.Add('   and envase_pv = :envase            ');
    SQL.Add('   and fecha_pv = :fecha              ');
    SQL.Add('   and moneda_pv = :moneda            ');
    SQL.Add(' order by 1 desc                      ');

    ParamByName('cliente').AsString:= ACliente;
    ParamByName('envase').AsString:= AEnvase;
    ParamByName('fecha').AsDatetime:= AFecha;
    ParamByName('moneda').AsString:= AMoneda;
    Open;
    if IsEmpty then
    begin
      result:= 0;
      VUnidad:= '';
    end
    else
    begin
      result:= FieldByName('precio_pv').AsFloat;
      VUnidad:= FieldByName('unidad_precio_pv').AsString;
    end;
    Close;
  end;
end;

procedure TFMSalidas.ActualizarPrecio( const AUnidad: string; const APrecio, ANeto, ATipoIva, AIva: real; const ARowid: integer );
begin
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add(' update frf_salidas_l ');
    SQL.Add(' set unidad_precio_sl = :unidad, ');
    SQL.Add('     precio_sl = :precio, ');
    SQL.Add('     importe_neto_sl = :neto, ');
    SQL.Add('     porc_iva_sl = :tipoiva, ');
    SQL.Add('     iva_sl = :iva, ');
    SQL.Add('     importe_total_sl = :total ');
    SQL.Add(' where rowid = :rowid ');

    ParamByName('unidad').AsString:= AUnidad;
    ParamByName('precio').AsFloat:= APrecio;
    ParamByName('neto').AsFloat:= ANeto;
    ParamByName('tipoiva').AsFloat:= ATipoIva;
    ParamByName('iva').AsFloat:= AIva;
    ParamByName('total').AsFloat:= ANeto + AIva;
    ParamByName('rowid').AsInteger:= ARowid;
    ExecSQL;
  end;
end;


procedure TFMSalidas.ValorarAlbaran;
var
  rPrecio, rNeto, rTipoIva, rIva: real;
  dFecha: TDateTime;
  bFlag: boolean;
  iCount, iTotal: integer;
  sAux, sUnidad: string;
  iUnidadesEnvase: Integer;
begin
  iCount:= 0;
  iTotal:= 0;
  bFlag:= false;
  while not bFlag do
  begin
    dFecha:= DSDetalle.DataSet.FieldByName('fecha_sl').AsDateTime;
    if GetFechaDiarioEnvases.Preguntar( 'PRECIOS DIARIOS POR ENVASES', 'Introduce fecha', dFecha ) then
    begin
      DSDetalle.DataSet.DisableControls;
      try
        with DMAuxDB.QGeneral do
        begin
          SQL.Clear;
          SQL.Add(' select frf_salidas_l.rowid, * from frf_salidas_c, frf_salidas_l');
          SQL.Add(' where empresa_sl = :empresa ');
          SQL.Add('   and centro_salida_sl = :centro ');
          SQL.Add('   and fecha_sl = :fecha ');
          SQL.Add('   and n_albaran_sl = :albaran ');
          SQL.Add('   and precio_sl = 0 ');
          SQL.Add('   and empresa_sc = empresa_sl  ');
          SQL.Add('   and centro_salida_sc = centro_salida_sl ');
          SQL.Add('   and n_albaran_sc = n_albaran_sl ');
          SQL.Add('   and fecha_sc = fecha_sl ');
          SQL.Add(' order by 1 desc ');
          ParamByName('empresa').AsString:= DSDetalle.DataSet.FieldByName('empresa_sl').AsString;
          ParamByName('centro').AsString:= DSDetalle.DataSet.FieldByName('centro_salida_sl').AsString;
          ParamByName('fecha').AsDate:= DSDetalle.DataSet.FieldByName('fecha_sl').AsDateTime;
          ParamByName('albaran').AsInteger:= DSDetalle.DataSet.FieldByName('n_albaran_sl').AsInteger;
          Open;
        end;
        DSDetalle.DataSet.Close;

        sAux:= '';
        while not DMAuxDB.QGeneral.Eof do
        begin
          inc( iTotal );
          rPrecio:= GetPrecioDiario( DMAuxDB.QGeneral.FieldByName('cliente_sal_sc').AsString,
                                     DMAuxDB.QGeneral.FieldByName('envase_sl').AsString,
                                     DMAuxDB.QGeneral.FieldByName('moneda_sc').AsString, dFecha, sUnidad );
          //que coincidan el numero de unidades
          iUnidadesEnvase:= unidadesEnvaseEx( DMAuxDB.QGeneral.FieldByName('empresa_sl').AsString,
                                              DMAuxDB.QGeneral.FieldByName('envase_sl').AsString,
                                              DMAuxDB.QGeneral.FieldByName('producto_sl').AsString );
          if sUnidad = '' then
          begin
              sAux:= sAux + #13 + #10 + 'ERROR Falta grabar precios para -> ' + DMAuxDB.QGeneral.FieldByName('empresa_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('centro_salida_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('envase_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('producto_sl').AsString + '-' +
                                                                            DateToStr( dFecha );
          end
          else
{
          if DMAuxDB.QGeneral.FieldByName('unidad_precio_sl').AsString <> sUnidad then
          begin
            sAux:= sAux + #13 + #10 + 'ERROR No coincide la unidad de facturacion ' + sUnidad + ' -> ' + DMAuxDB.QGeneral.FieldByName('empresa_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('centro_salida_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('envase_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('producto_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('unidad_precio_sl').AsString;
          end
          else
}
          if ( sUnidad = 'UND' ) and ( iUnidadesEnvase <> DMAuxDB.QGeneral.FieldByName('unidades_caja_sl').AsInteger ) then
          begin
            sAux:= sAux + #13 + #10 + 'ERROR No coincide las unidades por envase ' + DMAuxDB.QGeneral.FieldByName('unidades_caja_sl').AsString + ' -> ' +
                                                                              DMAuxDB.QGeneral.FieldByName('empresa_sl').AsString + '-' +
                                                                              DMAuxDB.QGeneral.FieldByName('envase_sl').AsString + '-' +
                                                                              DMAuxDB.QGeneral.FieldByName('producto_sl').AsString + '-' +
                                                                              IntToStr( iUnidadesEnvase );
          end
          else
          begin
            if rPrecio <> 0 then
            begin
              rPrecio:= bRoundTo( rPrecio, 4 );
              if sUnidad = 'UND' then
              begin
                rNeto:= bRoundTo( rPrecio *  ( DMAuxDB.QGeneral.FieldByName('cajas_sl').AsFloat *
                                               UnidadesEnvase( DMAuxDB.QGeneral.FieldByName('empresa_sl').AsString,
                                                               DMAuxDB.QGeneral.FieldByName('envase_sl').AsString,
                                                               DMAuxDB.QGeneral.FieldByName('producto_sl').AsString) ) , 2 );
              end
              else
              if sUnidad = 'CAJ' then
              begin
                rNeto:= bRoundTo( rPrecio * DMAuxDB.QGeneral.FieldByName('cajas_sl').AsFloat, 2 );

              end
              else
              begin
                rNeto:= bRoundTo( rPrecio * DMAuxDB.QGeneral.FieldByName('kilos_sl').AsFloat, 2 );
              end;

              if DMAuxDB.QGeneral.FieldByName('envase_sl').AsString = '371' then
              begin
                rTipoIva:= 8;
                rIva:= bRoundTo( ( rNeto * rTipoIva ) / 100, 2 );
              end
              else
              begin
                rTipoIva:= DMAuxDB.QGeneral.FieldByName('porc_iva_sl').AsFloat;
                rIva:= bRoundTo( ( rNeto * rTipoIva ) / 100, 2 );
              end;
              ActualizarPrecio( sUnidad, rPrecio, rNeto, rTipoIva, rIva, DMAuxDB.QGeneral.FieldByName('rowid').AsInteger );
              inc( iCount );
            end
            else
            begin
              sAux:= sAux + #13 + #10 + 'ERROR Falta grabar precios para -> ' + DMAuxDB.QGeneral.FieldByName('empresa_sl').AsString + '-' +
                                                                            DMAuxDB.QGeneral.FieldByName('centro_salida_sl').AsString + '-' +
                                                                          DMAuxDB.QGeneral.FieldByName('envase_sl').AsString + '-' +
                                                                          DMAuxDB.QGeneral.FieldByName('producto_sl').AsString + '-' +
                                                                          DateToStr( dFecha );
            end;
          end;
          DMAuxDB.QGeneral.Next;
        end;
      finally
        DMAuxDB.QGeneral.Close;
        DSDetalle.DataSet.Open;
        DSDetalle.DataSet.EnableControls;
      end;

      if sAux <> '' then
      begin
        sAux:= 'Proceso finalizado con errores.' + #13 + #10 + sAux + #13 + #10 + #13 + #10 +
               'Valoradas ' + IntToStr( iCount ) + ' lineas de ' + IntToStr( iTotal ) + '.';

      end
      else
      begin
        ValidarAlbaran;
        (*
        if ValidarAlbaran then
        begin
          sAux:= 'Proceso finalizado correctamente.' + #13 + #10 +
                 'Valoradas ' + IntToStr( iCount ) + ' lineas de ' + IntToStr( iTotal ) + '.';
        end
        else
        begin
          sAux:= 'Proceso finalizado sin validar factura.' + #13 + #10 + sAux + #13 + #10 + #13 + #10 +
               'Valoradas ' + IntToStr( iCount ) + ' lineas de ' + IntToStr( iTotal ) + '.';
        end;
        *)
      end;
      ShowMessage( sAux );
      bFlag:= True;
    end
    else
    begin
      bFlag:= True;
    end;
  end;
end;

procedure TFMSalidas.TSalidasLAfterPost(DataSet: TDataSet);
begin
  CDAsignarGastosServicioVenta.ActualizarEstadoServicio_( QSalidasC.FieldBYName('empresa_sc').AsString,
                                                         QSalidasC.FieldBYName('centro_salida_sc').AsString,
                                                         QSalidasC.FieldBYName('n_albaran_sc').AsInteger,
                                                         QSalidasC.FieldBYName('fecha_sc').AsDateTime );
  // Desglose Articulo frf_articulos_desglose
  if EsProductoDesglose then
    if (EstadoDetalle = tedAlta) or (EstadoDetalle = tedAltaRegresoMaestro) then
      ArticuloDesgloseInsertar
    else
    if EstadoDetalle = tedModificar then
      ArticuloDesgloseModificar;

  //Log
  if EstadoDetalle=tedModificar then
    InsertarLogTransacciones('MODIFICACION LINEA')
  else
    if EstadoDetalle=tedAlta then
      InsertarLogTransacciones('ALTA LINEA');

end;

procedure TFMSalidas.TSalidasLBeforeDelete(DataSet: TDataSet);
begin
  // Desglose Articulo frf_articulos_desglose
  if EsProductoDesglose then
    ArticuloDesgloseBorrar;
end;

procedure TFMSalidas.TSalidasLBeforePost(DataSet: TDataSet);
begin
  if DSDetalle.State = dsInsert then
  begin
    TSalidasL.fieldbyname('kilos_reales_sl').AsFloat := TSalidasL.fieldbyname('kilos_sl').AsFloat;
    TSalidasL.fieldbyname('kilos_posei_sl').AsFloat := TSalidasL.fieldbyname('kilos_sl').AsFloat;
  end;
end;

procedure TFMSalidas.TSalidasLCalcFields(DataSet: TDataSet);
begin
  DataSet.fieldbyname('desEnvase').AsString := desEnvase(DataSet.FieldByName('empresa_sl').AsString, DataSet.FieldByName('envase_sl').AsString);
end;

procedure TFMSalidas.TSalidasLAfterDelete(DataSet: TDataSet);
begin
  CDAsignarGastosServicioVenta.ActualizarEstadoServicio_( QSalidasC.FieldBYName('empresa_sc').AsString,
                                                         QSalidasC.FieldBYName('centro_salida_sc').AsString,
                                                         QSalidasC.FieldBYName('n_albaran_sc').AsInteger,
                                                         QSalidasC.FieldBYName('fecha_sc').AsDateTime );
  //Log
  InsertarLogTransacciones('BAJA LINEA');

end;

procedure TFMSalidas.incoterm_scChange(Sender: TObject);
begin
  stIncoterm.Caption:= desIncoterm( incoterm_sc.Text );
end;

procedure TFMSalidas.InsertarLogTransacciones(AAcion: string);
var qInsertarLog: TQuery;
begin
  // Log
  qInsertarLog := TQuery.Create(nil);
  qInsertarLog.DatabaseName:= DataSeTMaestro.DatabaseName;
  qInsertarLog.RequestLive := true;
  with qInsertarLog do
  try
    SQL.Clear;
    SQL.Add(' insert into cnf_logTransacciones (tabla_l, accion_l, fecha_accion_l, usuario_l, centro_l, empresa_id_l, centro_id_l, numero_id_l, fecha_id_l) ');
    SQL.Add(' values ');
    SQL.Add(' (:tabla, :accion, :fecha_accion, :usuario, :centro, :empresa_id, :centro_id, :numero_id, :fecha_id) ');
    ParamByName('tabla').AsString := 'frf_salidas_c';
    ParamByName('accion').AsString := AAcion;
    ParamByName('fecha_accion').AsDateTime := now;
    ParamByName('usuario').AsString := gsCodigo;
    ParamByName('centro').AsString := DMConfig.sDesInstalacion;
    ParamByName('empresa_id').AsString := empresa_sc.Text;
    ParamByName('centro_id').AsString := centro_salida_sc.Text;
    ParamByName('numero_id').AsString := n_albaran_sc.Text;
    ParamByName('fecha_id').AsString := fecha_sc.Text;

    ExecSQL;
  finally
    Free;
  end;

end;

procedure TFMSalidas.porte_bonny_scClick(Sender: TObject);
begin
  //si el porte la pagamos nosotros ponemos el grabado por defecto
  if porte_bonny_sc.Checked and ( incoterm_sc.Text = '' ) then
  begin
    PonerIncotermPorDefecto;
  end;
end;

procedure TFMSalidas.PonerIncotermPorDefecto;
begin
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;
    SQL.Add(' select incoterm_c, plaza_incoterm_c ');
    SQL.Add(' from frf_clientes ');
    SQL.Add(' where cliente_c = :cliente ');
    ParamByName('cliente').AsString:= cliente_sal_sc.Text;
    Open;
    if FieldByname('incoterm_c').AsString <> '' then
    begin
      incoterm_sc.Text:= FieldByname('incoterm_c').AsString;
      plaza_incoterm_sc.Text:= FieldByname('plaza_incoterm_c').AsString;
    end;
    Close;
  end;
end;

procedure TFMSalidas.RecalcularUnidades( const ASender: TObject; const AImporte: boolean = false );
var
  iUnidadesCaja: integer;
  iUnidadesLinea, iCajasLinea: Integer;
  rKilosLinea, rPrecioLinea, rNetoLinea, rIvaLinea, rTotalLinea: Real;
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
    
  bFlagCambios:= False;

  iUnidadesCaja:= StrToIntDef( unidades_caja_sl.Text, 1);
  iCajasLinea:= StrToIntDef( cajas_sl.Text, 0);
  iUnidadesLinea:= iCajasLinea * iUnidadesCaja;
  if bPesoVariableLinea then
  begin
    rKilosLinea:= StrToFloatDef( kilos_sl.Text, 0);
  end
  else
  begin
    rKilosLinea:= bRoundTo( rPesoCaja * iCajasLinea, 2 );
  end;

  if AImporte then
  begin
    rNetoLinea:= StrToFloatDef( importe_neto_sl.Text, 0);
    if rNetoLinea = 0 then
    begin
      rPrecioLinea:= 0;
    end
    else
    if sUnidadPrecioLinea = 'K' then
    begin
      rPrecioLinea:= bRoundTo( rNetoLinea / rKilosLinea, 3 );
    end
    else
    if sUnidadPrecioLinea = 'U' then
    begin
      rPrecioLinea:= bRoundTo( rNetoLinea / iUnidadesLinea, 3 );
    end
    else
    //if sUnidadPrecioLinea = 'C' then
    begin
      rPrecioLinea:= bRoundTo( rNetoLinea / iCajasLinea, 3 );
    end;
  end
  else
  begin
    rPrecioLinea:= StrToFloatDef( precio_sl.Text, 0);
    if sUnidadPrecioLinea = 'K' then
    begin
      rNetoLinea:= bRoundTo( rPrecioLinea * rKilosLinea, 2);
    end
    else
    if sUnidadPrecioLinea = 'U' then
    begin
      rNetoLinea:= bRoundTo( rPrecioLinea * iUnidadesLinea, 2);
    end
    else
    //if sUnidadPrecioLinea = 'C' then
    begin
      rNetoLinea:= bRoundTo( rPrecioLinea * iCajasLinea, 2);
    end;
  end;


  rIvaLinea:= bRoundTo( rNetoLinea * ( rImpuestoLinea / 100 ), 2 );
  rTotalLinea:= rNetoLinea + rIvaLinea;


  if TComponent( ASender ).Name <> 'cajas_sl' then
    cajas_sl.Text:= FormatFloat('#0',iCajasLinea );
  if TComponent( ASender ).Name <> 'unidades_caja_sl' then
    unidades_caja_sl.Text:= FormatFloat('#0',iUnidadesCaja );

  if TComponent( ASender ).Name <> 'STUnidades' then
    STUnidades.Caption := FormatFloat('#0.00', iUnidadesLinea );
  if TComponent( ASender ).Name <> 'kilos_sl' then
    kilos_sl.Text := FormatFloat('#0.00', rKilosLinea );
  if TComponent( ASender ).Name <> 'precio_sl' then
    precio_sl.Text := FormatFloat('#0.0000', rPrecioLinea );
  if TComponent( ASender ).Name <> 'importe_neto_sl' then
    importe_neto_sl.Text := FormatFloat('#0.00', rNetoLinea );
  if TComponent( ASender ).Name <> 'porc_iva_sl' then
    porc_iva_sl.Text := FormatFloat('#0.00', rImpuestoLinea );
  if TComponent( ASender ).Name <> 'iva_sl' then
    iva_sl.Text := FormatFloat('#0.00', rIvaLinea );
  if TComponent( ASender ).Name <> 'importe_total_sl' then
    importe_total_sl.Text := FormatFloat('#0.00', rTotalLinea );


  bFlagCambios:= True;
end;

procedure TFMSalidas.EnvaseInicial;
var
  iUnidadesCaja: integer;
  iUnidadesLinea, iCajasLinea: Integer;
begin
  STEnvase_sl.Caption := desEnvase(empresa_sc.Text, envase_sl.Text);

  (*
  if not DMConfig.EsLaFont then
  begin
    unidad_precio_sl.Text := unidadFacturacion(empresa_sc.text, cliente_sal_sc.text,
     producto_sl.Text, envase_sl.Text);
  end;
  *)

  sUnidadPrecioLinea:= Copy( unidad_precio_sl.Text, 1, 1 );

  tipo_iva_sl.Text:= Impuesto.sCodigo;

  case TipoIVAEnvaseProducto( empresa_sc.Text, envase_sl.Text, producto_sl.Text ) of
    1: rImpuestoLinea:= impuesto.rReducido;
    2: rImpuestoLinea:= impuesto.rGeneral;
    else
      rImpuestoLinea:= impuesto.rSuper;
  end;

  bEnvaseVariableLinea:= EnvaseUnidadesVariable( empresa_sc.Text, envase_sl.Text, producto_sl.Text );
  unidades_caja_sl.Enabled:= bEnvaseVariableLinea;
  bPesoVariableLinea:= EnvasePesoVariable( empresa_sc.Text, envase_sl.Text, producto_sl.Text );
  kilos_sl.Enabled:= bPesoVariableLinea;
  rPesoCaja:= KilosEnvase( empresa_sc.Text, envase_sl.Text, producto_sl.Text );

  iUnidadesCaja:= StrToIntDef( unidades_caja_sl.Text, 1);
  iCajasLinea:= StrToIntDef( cajas_sl.Text, 0);
  iUnidadesLinea:= iCajasLinea * iUnidadesCaja;
  STUnidades.Caption := FormatFloat('#0.00', iUnidadesLinea );
end;

procedure TFMSalidas.unidades_caja_slChange(Sender: TObject);
begin
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if bFlagCambios and  unidades_caja_sl.Focused then
  begin
    RecalcularUnidades( Sender );
    TSalidasL.FieldByName('kilos_reales_sl').AsString := kilos_sl.Text;
    TSalidasL.FieldByName('kilos_posei_sl').AsString := kilos_sl.Text;
  end;
end;

procedure TFMSalidas.nota_factura_scEnter(Sender: TObject);
begin
    if ( ( empresa_sc.Text = '050' ) or  ( empresa_sc.Text = '080' ) ) and
       ( ( cliente_fac_sc.Text = 'BEL' ) or  ( cliente_fac_sc.Text = 'DAN' ) or  ( cliente_fac_sc.Text = 'EIN' ) or  ( cliente_fac_sc.Text = 'FL4' )
         or  ( cliente_fac_sc.Text = 'FOI' ) or  ( cliente_fac_sc.Text = 'FOR' ) or  ( cliente_fac_sc.Text = 'LEG' ) or  ( cliente_fac_sc.Text = 'LOM' )
         or  ( cliente_fac_sc.Text = 'MAG' ) or  ( cliente_fac_sc.Text = 'MGG' ) or  ( cliente_fac_sc.Text = 'SAP' ) or  ( cliente_fac_sc.Text = 'URS' )) then
    begin
      if Pos( 'PAYABLE', nota_factura_sc.Text ) = 0 then
      begin
        if Trim( nota_factura_sc.Text ) = '' then

          nota_factura_sc.Text:= 'PAYABLE PAR CRENO IMPEX'
        else
          nota_factura_sc.Text:= 'PAYABLE PAR CRENO IMPEX' + #13 + #10 + nota_factura_sc.Text;;
      end;
    end;
end;

function TFMSalidas.DesValidarAlbaran: boolean;
begin
  //Desvalidar
  if EstoyFacturada then
  begin
    ShowMessage('No se puede desvalidar un albar?n ya facturado.');
    Result:= False;
  end
  else
  begin
    QSalidasC.Edit;
    QSalidasC.FieldByName('facturable_sc').AsInteger:= 0;
    QSalidasC.Post;
    Result:= True;

    //Log
    InsertarLogTransacciones('DESVALIDAR ALBARAN');

  end;
end;

function TFMSalidas.ValidarLineas: Boolean;
var
  bRecargo: Boolean;
  rSuper, rReducido, rGeneral: Real;
  bActualizarUnidades: Boolean;

  sImpuesto: string;
  sSuministro, sImpuestoSuministro: string;
  sEnvase: string; iIvaEnvase: Integer;
  sEnvaseCliente, sUnidadFactura: string;
  sAlbaran, sErrores: string;
  iUnidadesEnvase: Integer;
begin
  bActualizarUnidades:= False;
  sErrores:= '';
  result:= True;
  //Comprobar que tenga si tiene recargo de equivalencia
  with DMBaseDatos.QGeneral do
  begin
    SQL.Clear;

    SQL.Add(' select empresa_sc, centro_salida_sc, cliente_sal_sc, dir_sum_sc,   ');
    SQL.Add('        fecha_sc, n_albaran_sc, producto_sl, envase_sl, unidades_caja_sl, ');
    SQL.Add('        unidad_precio_sl, tipo_iva_sl, porc_iva_sl, precio_sl, kilos_sl ');
    SQL.Add(' from frf_salidas_c, frf_salidas_l ');
    SQL.Add(' where empresa_sc = :empresa ');
    SQL.Add(' and centro_salida_sc = :centro ');
    SQL.Add(' and fecha_sc = :fecha ');
    SQL.Add(' and n_albaran_sc = :albaran ');
    SQL.Add(' and empresa_sl = empresa_sc ');
    SQL.Add(' and centro_salida_sl = centro_salida_sc ');
    SQL.Add(' and fecha_sl = fecha_sc ');
    SQL.Add(' and n_albaran_sl = n_albaran_sc ');
    SQL.Add(' order by  producto_sl, envase_sl ');
    ParamByName('empresa').AsString:= QSalidasC.fieldByName('empresa_sc').AsString;
    ParamByName('centro').AsString:= QSalidasC.fieldByName('centro_salida_sc').AsString;
    ParamByName('fecha').AsDateTime:= QSalidasC.fieldByName('fecha_sc').AsDateTime;
    ParamByName('albaran').AsInteger:= QSalidasC.fieldByName('n_albaran_sc').AsInteger;

    Open;
    try
      sImpuesto:= '';
      sSuministro:= '';
      sImpuestoSuministro:= 'IR';
      sEnvase:= '';
      iIvaEnvase:= 0; //Super
      sEnvaseCliente:= '';
      sUnidadFactura:= 'KGS';
      iUnidadesEnvase:= 0;

      bRecargo:= ClienteConRecargo( FieldByName('empresa_sc').AsString,FieldByName('cliente_sal_sc').AsString, Date );
      while not Eof do
      begin
        if sSuministro <> FieldByName('empresa_sc').AsString + FieldByName('centro_salida_sc').AsString +
                          FieldByName('cliente_sal_sc').AsString + FieldByName('dir_sum_sc').AsString then
        begin
          sSuministro:= FieldByName('empresa_sc').AsString + FieldByName('centro_salida_sc').AsString +
                        FieldByName('cliente_sal_sc').AsString + FieldByName('dir_sum_sc').AsString;
          sImpuestoSuministro:= ImpuestosEntre( FieldByName('empresa_sc').AsString, FieldByName('centro_salida_sc').AsString,
                        FieldByName('cliente_sal_sc').AsString, FieldByName('dir_sum_sc').AsString );
        end;
        if sEnvase <> FieldByName('empresa_sc').AsString + FieldByName('envase_sl').AsString +
                                          FieldByName('producto_sl').AsString then
        begin
          sEnvase:= FieldByName('empresa_sc').AsString + FieldByName('envase_sl').AsString +
                                          FieldByName('producto_sl').AsString;
          iIvaEnvase:= TipoIvaEnvaseProducto( FieldByName('empresa_sc').AsString,FieldByName('envase_sl').AsString,
                                          FieldByName('producto_sl').AsString );
          if not ExisteEnvase(FieldByName('empresa_sc').AsString, FieldByName('envase_sl').AsString, FieldByName('producto_sl').AsString ) then
          begin
            raise Exception.Create('ERROR ->  NO existe el art?culo '  + FieldByName('envase_sl').AsString );
          end;
        end;
        if sEnvaseCliente <> FieldByName('empresa_sc').AsString + FieldByName('cliente_sal_sc').AsString +
                                         FieldByName('envase_sl').AsString + FieldByName('producto_sl').AsString then
        begin
          sEnvaseCliente:= FieldByName('empresa_sc').AsString + FieldByName('cliente_sal_sc').AsString +
                                         FieldByName('envase_sl').AsString + FieldByName('producto_sl').AsString ;
          sUnidadFactura:= unidadFacturacion( FieldByName('empresa_sc').AsString, FieldByName('cliente_sal_sc').AsString,
                                              FieldByName('producto_sl').AsString, FieldByName('envase_sl').AsString );
          iUnidadesEnvase:= unidadesEnvaseEx( FieldByName('empresa_sc').AsString,
                                               FieldByName('envase_sl').AsString, FieldByName('producto_sl').AsString );
        end;
        if sImpuesto <> sImpuestoSuministro  then
        begin
          sImpuesto:= sImpuestoSuministro;
          ImpuestosActuales( sImpuesto, rSuper, rReducido, rGeneral, bRecargo );
        end;

        sAlbaran:= FieldByName('empresa_sc').AsString + ' ' + FieldByName('centro_salida_sc').AsString + ' ' +
                   FieldByName('n_albaran_sc').AsString + ' ' +  FieldByName('fecha_sc').AsString;

        //Validar impuesto
        case  iIvaEnvase of
          0: if FieldByName('porc_iva_sl').AsFloat <> rSuper then
             begin
               Result:= False;
               sErrores:= sErrores + #13 + #10 +
                 '* Para el art?culo ' + FieldByName('envase_sl').AsString +
                 ' se esperaba un IVA de ' + FormatFloat( '#,##0.00', rSuper ) +
                 ' y se ha encontrado '  + FormatFloat( '#,##0.00', FieldByName('porc_iva_sl').AsFloat );
             end;
          1: if FieldByName('porc_iva_sl').AsFloat <> rReducido then
             begin
               Result:= False;
               sErrores:= sErrores + #13 + #10 +
                 '* Para el art?culo ' + FieldByName('envase_sl').AsString +
                 ' se esperaba un IVA de ' + FormatFloat( '#,##0.00', rReducido ) +
                 ' y se ha encontrado '  + FormatFloat( '#,##0.00', FieldByName('porc_iva_sl').AsFloat );
             end;
          2: if FieldByName('porc_iva_sl').AsFloat <> rGeneral then
             begin
               Result:= False;
               sErrores:= sErrores + #13 + #10 +
                 '* Para el art?culo ' + FieldByName('envase_sl').AsString +
                 ' se esperaba un IVA de ' + FormatFloat( '#,##0.00', rGeneral ) +
                 ' y se ha encontrado '  + FormatFloat( '#,##0.00', FieldByName('porc_iva_sl').AsFloat );
             end;
        end;

        //Validar unidad de facturacion
        if FieldByName('unidad_precio_sl').AsString <> sUnidadFactura then
        begin
          Result:= False;
          sErrores:= sErrores + #13 + #10 +
               '* Para el art?culo ' + FieldByName('envase_sl').AsString +
               ' se esperaba facturar por ' +  sUnidadFactura +
               ' y se ha encontrado '  + FieldByName('unidad_precio_sl').AsString ;
        end;



        //Validar unidades
        if iUnidadesEnvase <> - 1 then
        begin
          //Solo si no son variables, si son variables no se si pueden ser correctas
          if FieldByName('unidades_caja_sl').AsInteger <> iUnidadesEnvase then
          begin
            //Si no coinciden
            if sUnidadFactura = 'UND' then
            begin
              //Error si la unidad_precio_sl de facturacion EstoyFacturada por unidades
              Result:= False;
              sErrores:= sErrores + #13 + #10 +
                   '* Para el art?culo ' + FieldByName('envase_sl').AsString +
                   ' se esperaba ' +  IntToStr( iUnidadesEnvase ) +
                   ' unidades caja y se ha encontrado '  + FieldByName('unidades_caja_sl').AsString ;
            end
            else
            begin
              //si no facturamos poe unidades ponemos las de la central
              bActualizarUnidades:= True;
            end;
          end;
        end;

        if FieldByName('precio_sl').AsFloat = 0 then
        begin
          Result:= False;
          sErrores:= sErrores + #13 + #10 + '* Falta precio para el art?culo ' + FieldByName('envase_sl').AsString;
        end;

        if FieldByName('kilos_sl').AsFloat = 0 then
        begin
          Result:= False;
          sErrores:= sErrores + #13 + #10 + '* Falta precio para el art?culo ' + FieldByName('envase_sl').AsString;
          raise Exception.Create('ERROR ->  Hay una linea sin kilos ');
        end;

        Next;

      end;
    finally
      Close;
    end;
  end;
  if not Result then
  begin
    Result:= VerAdvertencia( Self, Trim( sErrores ) ) = mrIgnore;
  end;
  if bActualizarUnidades then
    ActualizarUnidades( QSalidasC.fieldByName('empresa_sc').AsString,
                        QSalidasC.fieldByName('centro_salida_sc').AsString,
                        QSalidasC.fieldByName('fecha_sc').AsDateTime,
                        QSalidasC.fieldByName('n_albaran_sc').AsInteger);
end;

procedure TFMSalidas.ActualizarUnidades( const AEmpresa, ACentro: string; const AFecha: TDate; const AAlbaran: Integer );
var
  iAux: Integer;
begin
  //Solo las que no se facturan por unidades
  with DMBaseDatos.QAux do
  begin
    SQL.Clear;

    SQL.Add(' update frf_salidas_l ');

    SQL.Add(' set unidades_caja_sl = ');
    SQL.Add('        ( ');
    SQL.Add('          select unidades_e ');
    SQL.Add('          from frf_envases ');
    SQL.Add('          where envase_e = envase_sl ');

    SQL.Add('          and producto_e = producto_sl ) ');

    SQL.Add(' where empresa_sl = :empresa ');
    SQL.Add(' and centro_salida_sl = :centro ');
    SQL.Add(' and n_albaran_sl = :albaran ');
    SQL.Add(' and fecha_sl = :fecha ');
    SQL.Add(' and unidad_precio_sl <> ''UND'' ');

    SQL.Add(' and  exists ');
    SQL.Add(' ( ');
    SQL.Add('   select * ');
    SQL.Add('   from frf_envases ');
    SQL.Add('   where envase_e = envase_sl ');

    SQL.Add('   and producto_e = producto_sl ');
    SQL.Add('   and nvl(unidades_variable_e,0) = 0 ');

    SQL.Add('   and unidades_e <> unidades_caja_sl ');
    SQL.Add('   and unidades_e is not null ');
    SQL.Add(' ) ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('fecha').AsDateTime:= AFecha;
    ParamByName('albaran').AsInteger:= AAlbaran;
    ExecSQL;

    iAux:= RowsAffected;
  end;
end;


function TFMSalidas.ValidarAlbaran: boolean;
begin
  //Validar
  if ValidarLineas then
  begin
    QSalidasC.Edit;
    QSalidasC.FieldByName('facturable_sc').AsInteger:= 1;
    QSalidasC.Post;
    Result:= True;

    //Log
    InsertarLogTransacciones('VALIDAR ALBARAN');

  end
  else
  begin
    Result:= False;
  end;
end;


procedure TFMSalidas.btnValidarClick(Sender: TObject);
begin
  if QSalidasC.IsEmpty then
  begin
    ShowError('Seleccione primero un albar?n.');
  end
  else
  begin
    if not ( ( QSalidasC.State = dsInsert ) or ( QSalidasC.State = dsEdit ) ) then
    begin
      if Copy( cliente_fac_sc.Text, 1, 1 ) = '0' then
      begin
        ShowMessage('Los clientes que empiezan por cero (0) no son facturables.');
      end
      else
      begin
        if QSalidasC.FieldByName('facturable_sc').AsInteger = 1 then
        begin
          DesValidarAlbaran;
        end
        else
        begin
          ValidarAlbaran;
        end;
      end;
    end;
  end;
end;

procedure TFMSalidas.edt_facturable_scChange(Sender: TObject);
begin
  if QSalidasC.FieldByName('facturable_sc').AsInteger = 1 then
  begin
    btnValidar.Caption:= 'Desmarcar facturable';
    SBFacturable.Enabled:= True;
  end
  else
  begin
    btnValidar.Caption:= 'Pasar a Facturable';
    SBFacturable.Enabled:= False;
  end;
end;

procedure TFMSalidas.fecha_factura_scChange(Sender: TObject);
begin
  if QSalidasC.FieldByName('fecha_factura_sc').AsString = '' then
  begin
    SBFacturable.Caption:= 'Ligar a Factura';
  end
  else
  begin
    SBFacturable.Caption:= 'Desligar de Factura';
  end;
end;

procedure TFMSalidas.ComprobarDatosMaestro(Sender: TObject);
begin
  if DataSetMaestro.FieldByName('empresa_sc').AsString = '' then
    QSalidasC.FieldByName('empresa_sc').AsString := empresa_sc.Text;

  if DataSetMaestro.FieldByName('centro_salida_sc').AsString = '' then
    QSalidasC.FieldByName('centro_salida_sc').AsString := centro_salida_sc.Text;

  if DataSetMaestro.FieldByName('n_albaran_sc').AsString = '' then
    QSalidasC.FieldByName('n_albaran_sc').AsString := n_albaran_sc.Text;

  if DataSetMaestro.FieldByName('fecha_sc').AsString = '' then
    QSalidasC.FieldByName('fecha_sc').AsString := fecha_sc.Text;

  if DataSetMaestro.FieldByName('hora_sc').AsString = '' then
    QSalidasC.FieldByName('hora_sc').AsString := hora_sc.Text;
end;

procedure TFMSalidas.comercial_slChange(Sender: TObject);
begin
  txtDesComercial.Caption:= desComercial( comercial_sl.Text );
end;

procedure TFMSalidas.btnVerAbonosClick(Sender: TObject);
begin
  if bAbonos then
  begin
    bAbonos:= False;
    QAbonos.Close;
    btnVerAbonos.Caption:= 'Ver Facturas';
  end
  else
  begin
    bAbonos:= True;
    if QSalidasC.Active then
      QAbonos.Open;
    btnVerAbonos.Caption:= 'Ocultar Facturas';
  end;
end;

procedure TFMSalidas.btnVerImpFacClick(Sender: TObject);
begin
  if bImpFac then
  begin
    bImpFac:= False;
    QSalidasCAfterScroll(QSalidasC);
    btnVerImpFac.Caption:= 'Ver Importe Facturado';
  end
  else
  begin
    bImpFac:= True;
    QSalidasCAfterScroll(QSalidasC);
    btnVerImpFac.Caption:= 'Ocultar Imp. Facturado';
  end;
end;

procedure TFMSalidas.QSalidasCAfterScroll(DataSet: TDataSet);
begin
  if ( QSalidasC.State = dsBrowse	) and bImpFac then
  begin
    edtImporteFacturado.Text:= ImporteFacturado;
  end
  else
  begin
    edtImporteFacturado.Text:= '';
  end;
  btnDesadv.Enabled:= ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'ECI' ) or
                      ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'AMA' ) or
                      ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'SOK' ) or
                      ( QSalidasC.FieldByName('cliente_sal_sc').AsString = 'MER' );
end;

function TFMSalidas.ImporteFacturado: string;
begin
  if QSalidasC.IsEmpty then
  begin
    Result:= '';
  end
  else
  begin
    with QSalidasC do
    begin
      Result:= FormatFloat( '#,##0.00', DMMaster.GetImpFacAlbaran( FieldByName('empresa_sc').AsString,
                                                                  FieldByName('centro_salida_sc').AsString,
                                                                  FieldByName('fecha_sc').AsDateTime,
                                                                  FieldByName('n_albaran_sc').AsInteger) );
    end;
  end;
end;

procedure TFMSalidas.btnDepositoClick(Sender: TObject);
var
  iAux: integer;
  bTransito: boolean;
begin
  if not QSalidasC.IsEmpty then
  begin
    bTransito:= false;
    iAux:= CFDTransitosAduana.Ejecutar( self, bTransito, empresa_sc.Text, centro_salida_sc.Text,
                                 StrToDate( fecha_sc.Text ), StrToInt( n_albaran_sc.Text ) );
    while iAux <> 0 do
    begin
      if not CRDTransitosAduanaFicha.ImprimirFichaDepositoAduana( self, iAux, empresa_sc.Text ) then
      begin
        ShowMessage('SIN DATOS');
      end;
      iAux:= CFDTransitosAduana.Ejecutar( self, bTransito, empresa_sc.Text, centro_salida_sc.Text,
                                 StrToDate( fecha_sc.Text ), StrToInt( n_albaran_sc.Text ) );
    end;
  end
  else
  begin
    ShowMessage('Seleccione primero una salida.');
  end;
end;

procedure TFMSalidas.btnDesadvClick(Sender: TObject);
var
  sMsg: string;
begin
  if (Estado = teConjuntoResultado) and ( not DSMaestro.DataSet.IsEmpty ) then
  begin
    if  ( DSMaestro.DataSet.fieldByname('cliente_sal_sc').AsString = 'ECI' ) or
        ( DSMaestro.DataSet.fieldByname('cliente_sal_sc').AsString = 'AMA' ) or
        ( DSMaestro.DataSet.fieldByname('cliente_sal_sc').AsString = 'SOK' ) or
        ( DSMaestro.DataSet.fieldByname('cliente_sal_sc').AsString = 'MER' ) then
    begin
      VerOrdenFD.MakeDsadv( DSMaestro.DataSet.fieldByname('empresa_sc').AsString,
                                    DSMaestro.DataSet.fieldByname('centro_salida_sc').AsString,
                                    DSMaestro.DataSet.fieldByname('n_albaran_sc').AsInteger,
                                    DSMaestro.DataSet.fieldByname('fecha_sc').AsDateTime  );
    end
    else
    begin
      ShowMessage('Cliente no valido.');
    end;
  end
  else
  begin
    ShowMessage('Seleccione primero un albar?n.');
  end;
end;

procedure TFMSalidas.btnDesgloseClick(Sender: TObject);
begin
  FArticuloDesgloseSalMod:= TFArticuloDesgloseSalMod.Create( self );
  try
    FArticuloDesgloseSalMod.txtEmpresa.Text := TSalidasL.FieldByName('empresa_sl').AsString;
    FArticuloDesgloseSalMod.txtDesEmpresa.Text := DesEmpresa(FArticuloDesgloseSalMod.txtEmpresa.Text);
    FArticuloDesgloseSalMod.txtCentro.Text := TSalidasL.FieldByName('centro_salida_sl').AsString;
    FArticuloDesgloseSalMod.txtDesCentro.Text := DesCentro(FArticuloDesgloseSalMod.txtEmpresa.Text, FArticuloDesgloseSalMod.txtCentro.Text);
    FArticuloDesgloseSalMod.txtAlbaran.Text := TSalidasL.FieldByName('n_albaran_sl').AsString;
    FArticuloDesgloseSalMod.txtIdAlbaran.Text := TSalidasL.FieldByName('id_linea_albaran_sl').AsString;
    FArticuloDesgloseSalMod.txtFechaAlb.Text := TSalidasL.FieldByName('fecha_sl').AsString;
    FArticuloDesgloseSalMod.txtArticulo.Text := TSalidasL.FieldByName('envase_sl').AsString;
    FArticuloDesgloseSalMod.txtDesArticulo.Text := DesEnvase('', FArticuloDesgloseSalMod.txtArticulo.Text);
    FArticuloDesgloseSalMod.txtProducto.Text := TSalidasL.FieldByName('producto_sl').AsString;
    FArticuloDesgloseSalMod.txtDesProducto.Text := DesProducto('', FArticuloDesgloseSalMod.txtProducto.Text);
    FArticuloDesgloseSalMod.txtKilosTotal.Text :=TSalidasL.FieldByName('kilos_sl').AsString;

    FArticuloDesgloseSalMod.ShowModal;

  finally
    FreeAndNil(FArticuloDesgloseSalMod );
  end;
end;

procedure TFMSalidas.btnEntregaClick(Sender: TObject);
var
  sEntrega, sSemana: string;
begin
  //function InputBox(const ACaption, APrompt, ADefault: string): string;
  sEntrega:= entrega_sl.Text;
  sEntrega:= InputBox('CAMBIAR N?MERO ENTREGA', 'Introduzca el c?digo de la entrega:', sEntrega);
  if sEntrega <> entrega_sl.Text then
  begin
    if Trim( sEntrega ) = '' then
    begin
      DSDetalle.DataSet.Edit;
      DSDetalle.DataSet.FieldByName('entrega_sl').Value:= null;
      DSDetalle.DataSet.FieldByName('anyo_semana_entrega_sl').Value:= null;
      DSDetalle.DataSet.Post;
      ShowMessage('Proceso finalizado correctamente.');

      //Log
      InsertarLogTransacciones('DESASIGNAR ENTREGA');

    end
    else
    if Length(sEntrega) <> 12 then
    begin
      ShowMessage('ERROR: el codigo de la entrega debe de ser de 12 caracteres.');
    end
    else
    begin
      if Copy(sEntrega,1,3) <> 'F42' then
      begin
        ShowMessage('ERROR: Solo entregas de la planta F42.')
      end
      else
      //Busca a?o semana / producto
      with DMAuxDB.Qaux do
      begin
        SQL.Clear;
        SQL.Add('select anyo_semana_ec from frf_entregas_c where codigo_ec = :entrega ');
        ParamByName('entrega').AsString:= sEntrega;
        Open;
        sSemana:= FieldByName('anyo_semana_ec').AsString;
        Close;
        if sSemana = '' then
        begin
          ShowMessage('ERROR: NO se ha encontado el a?o/semana para la entrega introducida.');
        end
        else
        begin
          //Actualizar
          DSDetalle.DataSet.Edit;
          DSDetalle.DataSet.FieldByName('entrega_sl').AsString:= sEntrega;
          DSDetalle.DataSet.FieldByName('anyo_semana_entrega_sl').AsString:= sSemana;
          DSDetalle.DataSet.Post;
          ShowMessage('Proceso finalizado correctamente.');

         //Log
         InsertarLogTransacciones('ASIGNAR ENTREGA');

        end;
      end;
    end;
  end
  else
  begin
    ShowMessage('Sin cambios.')
  end;
end;

procedure TFMSalidas.mniAsignarTrnsito1Click(Sender: TObject);
begin
  if QSalidasC.IsEmpty then
  begin
    ShowMessage('Seleccione primero una salida');
  end
  else
  begin
    if TSalidasL.FieldByName('ref_transitos_sl').AsString <> ''then
      ShowMessage('La salida ya esta asignada a un tr?nsito')
    else
      AsignarTransitoFD.AsignarTransito( TSalidasL );
  end;
end;

procedure TFMSalidas.btnFacturarClick(Sender: TObject);
begin
  if not QsalidasC.IsEmpty then
  begin
    UFProcFacturacion.ProcesoFacturacionAlb( empresa_sc.Text, centro_salida_sc.Text, cliente_fac_sc.Text, empresa_sc.Text, StrToDate( fecha_sc.Text), StrToint( n_albaran_sc.Text ) );
  end;
end;

procedure TFMSalidas.BuscarPrecioVenta;
begin
  precio_sl.Text := FloatToStr(ObtenerPrecioVenta(DSMaestro.DataSet.fieldByname('fecha_sc').AsString, DSMaestro.DataSet.fieldByname('cliente_sal_sc').AsString, envase_sl.Text));
  RecalcularUnidades( Self );
end;

procedure TFMSalidas.es_transito_scChange(Sender: TObject);
begin
  stxtTipoVenta.Caption := desTipoSalida( es_transito_sc.Text );
end;

end.
