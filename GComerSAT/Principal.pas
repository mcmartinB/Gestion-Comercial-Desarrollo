unit Principal;
            
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Menus, ExtCtrls, ToolWin, ComCtrls, ActnList, StdCtrls,
  Buttons;


type
  TFPrincipal = class(TForm)

    // =============================  VARIABLES  ==============================

    // -------------------------  CONTROL DE BARRAS  --------------------------
    CBControlBarras: TControlBar;

    // ---------------------------  BARRA MAESTRO  ----------------------------
    TBBarraMaestro: TToolBar;
    TBMaestroPrimero: TToolButton;
    TBMaestroAnterior: TToolButton;
    TBMaestroSiguiente: TToolButton;
    TBMaestroUltimo: TToolButton;
    TBMaestroSeparador1: TToolButton;
    TBMaestroLocalizar: TToolButton;
    TBMaestroModificar: TToolButton;
    TBMaestroBorrar: TToolButton;
    TBMaestroAltas: TToolButton;
    TBMaestroSeparador2: TToolButton;
    TBMaestroAceptar: TToolButton;
    TBMaestroCancelar: TToolButton;
    TBMaestroSeparador3: TToolButton;

    // -----------------------  BARRA MAESTRO/DETALLE  ------------------------
    TBBarraMaestroDetalle: TToolBar;
    TBMaestroDetallePrimero: TToolButton;
    TBMaestroDetalleAnterior: TToolButton;
    TBMaestroDetalleSiguiente: TToolButton;
    TBMaestroDetalleUltimo: TToolButton;
    TBMaestroDetalleSeparador1: TToolButton;
    TBMaestroDetalleArriba: TToolButton;
    TBMaestroDetalleAbajo: TToolButton;
    TBMaestroDetalleSeparador2: TToolButton;
    TBMaestroDetalleLocalizarMaestro: TToolButton;
    TBMaestroDetalleModificarMaestro: TToolButton;
    TBMaestroDetalleBorrarMaestro: TToolButton;
    TBMaestroDetalleAltasMaestro: TToolButton;
    TBMaestroDetalleSeparador3: TToolButton;
    TBMaestroDetalleModificarDetalle: TToolButton;
    TBMaestroDetalleBorrarDetalle: TToolButton;
    TBMaestroDetalleAltasDetalle: TToolButton;
    TBMaestroDetalleSeparador4: TToolButton;
    TBMaestroDetalleAceptar: TToolButton;
    TBMaestroDetalleCancelar: TToolButton;
    TBMaestroDetalleSeparador5: TToolButton;
    MenuPrincipal: TMainMenu;
    TBMaestroSalir: TToolButton;
    TBMaestroDetalleSalir: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    mnuFicheros: TMenuItem;
    mnuFchEmpresas: TMenuItem;
    mnuFchCosecheros: TMenuItem;
    mnuFchTiposVia: TMenuItem;
    mnuFchPlantaciones: TMenuItem;
    mnuFchProductos: TMenuItem;
    mnuFchTransportistasMante: TMenuItem;
    mnuEntradas: TMenuItem;
    mnuAlmacen: TMenuItem;
    mnuSalidas: TMenuItem;
    mnuFacturacion: TMenuItem;
    Salir1: TMenuItem;
    mnuUtilidades: TMenuItem;
    mnuUtiCalculadora: TMenuItem;
    mnuFchCentros: TMenuItem;
    mnuFchClientes: TMenuItem;
    mnuFchEnvases: TMenuItem;
    mnuFchMarcas: TMenuItem;
    mnuFchMonedas: TMenuItem;
    mnuFchPaises: TMenuItem;
    mnuFchPesosCentro: TMenuItem;
    mnuFchProvincias: TMenuItem;
    mnuFchRepresentantes: TMenuItem;
    mnuEntEntradas: TMenuItem;
    mnuEntResEntradasCosecheros: TMenuItem;
    mnuEntResEntradasTransportistas: TMenuItem;
    mnuSalSalidas: TMenuItem;
    mnuSalResumenAlmacen: TMenuItem;
    mnuUtiSelectImpresoras: TMenuItem;
    mnuUtiAdministracion: TMenuItem;
    mnuUtiAcercaDe: TMenuItem;
    Reloj: TTimer;
    mnuFchImpuestos: TMenuItem;
    mnuSalLisSalidasProductos: TMenuItem;
    mnuFacEstadoCobroCliente: TMenuItem;
    mnuFchTipoPalets: TMenuItem;
    mnuFchTipoGastos: TMenuItem;
    mnuSalVentasBruto: TMenuItem;
    mnuFchClientesEDI: TMenuItem;
    mnuTraTransitos: TMenuItem;
    mnuTraConsultaTransitos: TMenuItem;
    mnuSalModificacionFederacion: TMenuItem;
    mnuSalSepFOB: TMenuItem;
    mnuSalLisSalidasFederacion: TMenuItem;
    mnuSalSepFederacion: TMenuItem;
    mnuUtiCambioDivisas: TMenuItem;
    mnuSalSemanalExpediciones: TMenuItem;
    mnuFchSeccionesContables: TMenuItem;
    mnuSalInformeIntrastat: TMenuItem;
    mnuFacListadoResemasBanco: TMenuItem;
    mnuFacLisFacturas: TMenuItem;
    mnuFchFederaciones: TMenuItem;
    mnuSalFOBCliente: TMenuItem;
    mnuSalListadoEnvasesComerciales: TMenuItem;
    mnuEntEntradasRecoleccion: TMenuItem;
    mnuSalResSalidasEnvase: TMenuItem;
    mnuSalSepSalidasPlus: TMenuItem;
    mnuSalLisSalidasClientes: TMenuItem;
    mnuTransitos: TMenuItem;
    mnuUtiConversionDivisa: TMenuItem;
    mnuUtiEuroConversor: TMenuItem;
    mnuSalEnvioAlbaranes: TMenuItem;
    mnuSalLisAlbaranesEnviados: TMenuItem;
    mnuFacFacturasCliente: TMenuItem;
    mnuSalVentasSemanal: TMenuItem;
    mnuFacFacturasSuministro: TMenuItem;
    mnuSalLisSalidasCategoria: TMenuItem;
    mnuEntResProductividad: TMenuItem;
    mnuFchUnidadesConsumo: TMenuItem;
    mnuEntEscandallos: TMenuItem;
    mnuAlmInventario: TMenuItem;
    mnuEntSepEscandallos: TMenuItem;
    mnuEntVerificarEscandallos: TMenuItem;
    mnuAlmSepSobrepesos: TMenuItem;
    mnuAlmVerificarCosteEnvases: TMenuItem;
    mnuAlmSobrepesoEnvase: TMenuItem;
    mnuAlmVerificarGrabacionEnvasado: TMenuItem;
    mnuAlmLstCosteEnvase: TMenuItem;
    mnuFacListadoRemesas: TMenuItem;
    mnuEntLstEntradasCosecheros: TMenuItem;
    mnuSalVentasSemMercadona: TMenuItem;
    mnuFacAlbaranesSinFacturar: TMenuItem;
    mnuAlmConfeccionadoEnvases: TMenuItem;
    mnuFchProveedores: TMenuItem;
    mnuEntEntregas: TMenuItem;
    mnuAlmCostesEnvase: TMenuItem;
    mnuLiquidacion: TMenuItem;
    mnuAlmSepAlmacen: TMenuItem;
    mnuTraLisTransitos: TMenuItem;
    mnuEntLstEntregas: TMenuItem;
    mnuFacSepRemesas: TMenuItem;
    mnuFacFacturasTomate: TMenuItem;
    mnuFacRiesgoCliente: TMenuItem;
    mnuEntSepStockAlmacen: TMenuItem;
    mnuEntLstControlGastosEntregas: TMenuItem;
    mnuFacProductoSinFacturar: TMenuItem;
    mnuSalControlIntrastat: TMenuItem;
    PEstado: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SBBarraEstado: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    mnuSalVentasSuministro: TMenuItem;
    barAplicaciones: TToolBar;
    btnEntradas: TToolButton;
    btnSalidas: TToolButton;
    btnTransitos: TToolButton;
    ToolButton10: TToolButton;
    mnuDatDiarioEntradas: TMenuItem;
    mnuDatDiarioEscandallos: TMenuItem;
    mnuDatDiarioSalidas: TMenuItem;
    mnuDatDiarioTransitos: TMenuItem;
    mnuDatDiarioInventarios: TMenuItem;
    mnuDatDiarioTodo: TMenuItem;
    mnuDatOtrosEntregas: TMenuItem;
    mnuEntListEscandallos: TMenuItem;
    mnuUtiSelectCuentaCorreo: TMenuItem;
    mnuUtiCompruebaGastos: TMenuItem;
    mnuTraLisEnvasesTransitos: TMenuItem;
    mnuEntResEntregas: TMenuItem;
    mnuSalPorcentajesFederacion: TMenuItem;
    mnuFchAduanasPuertos: TMenuItem;
    mnuSalAsignarFederacion: TMenuItem;
    mnuEntSepEntradas: TMenuItem;
    mnuFchSep: TMenuItem;
    mnuPedidos: TMenuItem;
    mnuAlmSepCosteEnvase: TMenuItem;
    mnuUtiSepUtilidades: TMenuItem;
    mnuFacSepFacturas: TMenuItem;
    mnuFacSepFacturasPlus: TMenuItem;
    mnuTraSepTransistos: TMenuItem;
    mnuSalSepSalidas: TMenuItem;
    mnuFchEan13: TMenuItem;
    mnuEntTransferirSGP: TMenuItem;
    mnuEntSepSGP: TMenuItem;
    mnuComprasProveedor: TMenuItem;
    mnuEntLstControlEntregas: TMenuItem;
    mnuDatosTransmision: TMenuItem;
    mnuTraSepRecepcionTransitos: TMenuItem;
    mnuTraRecepcionTransitos: TMenuItem;
    mnuDatSepDiarioTodo: TMenuItem;
    mnuDatSepSemanal: TMenuItem;
    mnuDatSemanalEscandallo: TMenuItem;
    mnuFacLisAbonosDetalle: TMenuItem;
    mnuFacFacturasSinCobrar: TMenuItem;
    mnuSalLisSalidasPalet: TMenuItem;
    mnuSalSubIntrastat: TMenuItem;
    mnuSalSubFederacion: TMenuItem;
    mnuTraAsignarKilosTransitos: TMenuItem;
    mnuUtiAux: TMenuItem;
    mnuDatOtrosPedidos: TMenuItem;
    mnuAlmSepPesosCIndirectos: TMenuItem;
    mnuAlmCostesIndirectos: TMenuItem;
    mnuEntPendientesDescarga: TMenuItem;
    mnuEntStockActualProveedor: TMenuItem;
    mnuEntSepComprasEntregas: TMenuItem;
    mnuTraServiciosTransportistas: TMenuItem;
    mnuSalListadoMercadona: TMenuItem;
    btnEntregas: TToolButton;
    mnuDatMensualSobrepesos: TMenuItem;
    mnuFacNotificacinVentasCredito: TMenuItem;
    mnuTraSepDeposito: TMenuItem;
    mnuEntDetalleEntradas: TMenuItem;
    mnuAlmSepPreciosDiarios: TMenuItem;
    mnuAlmPreciosDiariosrEnvases: TMenuItem;
    mnuSalListadoFOBSalidas: TMenuItem;
    mnuUtiKilosComercializadosMes: TMenuItem;
    mnuAlmConfeccionadoAgrupacion: TMenuItem;
    mnuTraCrearFicherosAplicacionAtlantis: TMenuItem;
    mnuSalGrabarGastosTransportes: TMenuItem;
    mnuSalAsignarGastosTransportes: TMenuItem;
    mnuSalFOBClientes: TMenuItem;
    mnuFchAgrupacionesEnvase: TMenuItem;
    mnuAlmSopresesosActuales: TMenuItem;
    mnuTraListadoDepositoAduanas: TMenuItem;
    mnuAlmLstCosteEnvaseKg: TMenuItem;
    mnuAlmTablaCostesEnvasado: TMenuItem;
    mnuFchSubClientes: TMenuItem;
    N1: TMenuItem;
    mnuFchListadoComisiones: TMenuItem;
    mnuFchListadoDatosCobroCliente: TMenuItem;
    Envases1: TMenuItem;
    mnuFchTiposdeCaja: TMenuItem;
    mnuFchEnvasesComerciales: TMenuItem;
    EnvasesComerciales1: TMenuItem;
    mnuSalAjustesInventarioEnvComer: TMenuItem;
    mnuSalInventarioEnvComer: TMenuItem;
    mnuSalEntradasEnvComer: TMenuItem;
    mnuSalTransitosEnvComer: TMenuItem;
    mnuSalMovimientosEnvasesComerciales: TMenuItem;
    mnuSalSepEnvasesComerciales: TMenuItem;
    mnuSalFacturaLogifruit: TMenuItem;
    mnuSalTablaSalidas: TMenuItem;
    mnuFchFormasPago: TMenuItem;
    mnuFacAging: TMenuItem;
    mnuFacImporteFacturadoClienteBanco: TMenuItem;
    mnuFchAgrupacionesComerciales: TMenuItem;
    mnuTraListadoFacturasdeGastosTransitos: TMenuItem;
    mnuSalListadoFacturasdeGastosVentas1: TMenuItem;
    mnuFacDiasMediosPagoClientes: TMenuItem;
    mnuManFacturas: TMenuItem;
    mnuRepFacturacion: TMenuItem;
    mnuFacturarEdi: TMenuItem;
    mnuContFacturas: TMenuItem;
    mnuFchTipoCliente: TMenuItem;
    mnuMarcaContable: TMenuItem;
    mnuAnuFacturas: TMenuItem;
    mnuManRemesas: TMenuItem;
    mnuFchComerciales: TMenuItem;
    mnuAlmResumenInventario: TMenuItem;
    mnuFacAlbaranesFacturadosEn: TMenuItem;
    mnuProformaFac: TMenuItem;
    mnuFacFacturasParaAnticipar: TMenuItem;
    mnuSalResumenFOB: TMenuItem;
    mnuFacAlbaranesFactura: TMenuItem;
    mnuAlmSobrepesosPeriodo: TMenuItem;
    mnuListadoVentasPorPeriodo: TMenuItem;
    mnuProcesoLiquidacion: TMenuItem;
    mnuInformesLiquidacion: TMenuItem;
    mnuLiqSepLiquidacion: TMenuItem;
    mnuLiquidacionMensual: TMenuItem;
    mniCierre: TMenuItem;
    mniInventario: TMenuItem;
    mniGastosSalidas: TMenuItem;
    mniGastosCompras: TMenuItem;
    mniGastosTransitos: TMenuItem;
    mniVentasPendientesFacturar: TMenuItem;
    mnuParteProduccion: TMenuItem;
    mnuTraLFacturasTransportesDeposito: TMenuItem;
    mnuLiqAprovechaEntradas: TMenuItem;
    mnuLiqAjusteEntradas: TMenuItem;
    mnuSalResumenSalidasDinamico: TMenuItem;
    mnuFacSaldoClientes: TMenuItem;
    mnuLiquidacionMensual2: TMenuItem;
    mnuProcFacturacion: TMenuItem;
    mnuFacSinContablizarX3: TMenuItem;
    mnuFchBancos: TMenuItem;
    mnuPedAccesoWeb: TMenuItem;
    mnuSalSalidasLPR: TMenuItem;
    mnuImprimirFactura: TMenuItem;
    Gastos1: TMenuItem;
    N2: TMenuItem;
    mnuAlmPrecioVentaCliente: TMenuItem;
    mnuDesgloseSalidas: TMenuItem;
    mnuDatDiarioDesgloseSal: TMenuItem;
    N3: TMenuItem;
    mnuPedConfirmaRecepcion: TMenuItem;
    mnuRepFacturacionCont: TMenuItem;
    N4: TMenuItem;
    mnuExistenciasPuntoLame: TMenuItem;
    mnuTraSepPOSEI: TMenuItem;
    mnuTraCalculoAyudaPOSEI: TMenuItem;
    mnuTraInformeAyudaPOSEI: TMenuItem;
    mnuFchFlotaCamiones: TMenuItem;
    mnuSincronizacion: TMenuItem;
    mnuEntLstGastosEntregas: TMenuItem;
    mnuEntValorFrutaPlantaProveedor: TMenuItem;
    mnuEntResumenCosteProductoBonde: TMenuItem;
    mnuEntResumenCosteProveedorBonde: TMenuItem;
    mnuStockFrutaConfeccionadaFormatos: TMenuItem;
    mnuStockFrutaConfeccionadaEnvases: TMenuItem;
    mnuEntSepFacturasCompras: TMenuItem;
    mnuEntLstFacturasProveedorNew: TMenuItem;
    mnuEntEntregasSinFacturar: TMenuItem;
    mnuEntControlImportesFacturasLineas: TMenuItem;
    mnuEntResumenCosteProducto: TMenuItem;
    mnuEntResumenCosteProveedor: TMenuItem;
    mnuEntComprasProductoProveedor: TMenuItem;
    mnuEntSepIntrastat: TMenuItem;
    mnuEntControlIntrastat: TMenuItem;
    mnuEntIntrasat: TMenuItem;
    mnuEntSepLiquidacion: TMenuItem;
    mnuEntValorarStockProveedor: TMenuItem;
    mnuEntValorarStockConfeccionado: TMenuItem;
    mnuEntSepRecepcion: TMenuItem;
    mnuEntRecibirEntregas: TMenuItem;
    mnuEntFacturasPlatano: TMenuItem;
    mnuEntSepCompas: TMenuItem;
    mnuEntResPesosEntregas: TMenuItem;
    mnuEntServiciosTransportes: TMenuItem;
    mnuEntEntregas_SAT: TMenuItem;
    AAcciones: TActionList;
    AMPrimero: TAction;
    ACerrar: TAction;
    AMSiguiente: TAction;
    AMAnterior: TAction;
    AMUltimo: TAction;
    ADAnterior: TAction;
    ADSiguiente: TAction;
    ADAltas: TAction;
    ADModificar: TAction;
    ADBorrar: TAction;
    AMAltas: TAction;
    AMBorrar: TAction;
    AMModificar: TAction;
    AMLocalizar: TAction;
    AMDCancelar: TAction;
    AMDAceptar: TAction;
    AIPrevisualizar: TAction;
    AMDSalir: TAction;
    ACalculadora: TAction;
    AConversionDivisas: TAction;
    AEuroConversor: TAction;

    // ======================  FUNCIONES/PROCEDIMIENTOS  ======================

    // --------------------------------  FORM  --------------------------------
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADAltasExecute(Sender: TObject);
    procedure ADModificarExecute(Sender: TObject);
    procedure ADBorrarExecute(Sender: TObject);
    procedure ADAnteriorExecute(Sender: TObject);
    procedure ADSiguienteExecute(Sender: TObject);
    procedure AMAltasExecute(Sender: TObject);
    procedure AMBorrarExecute(Sender: TObject);
    procedure AMModificarExecute(Sender: TObject);
    procedure AMLocalizarExecute(Sender: TObject);
    procedure AMPrimeroExecute(Sender: TObject);
    procedure AMSiguienteExecute(Sender: TObject);
    procedure AMAnteriorExecute(Sender: TObject);
    procedure AMUltimoExecute(Sender: TObject);
    procedure AMDCancelarExecute(Sender: TObject);
    procedure AMDSalirExecute(Sender: TObject);
    procedure AMDAceptarExecute(Sender: TObject);
    procedure ACerrarExecute(Sender: TObject);
    procedure AIPrevisualizarExecute(Sender: TObject);

    procedure RelojTimer(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;

    // ----------------------  PROCEDIMIENTOS GENERALES  ----------------------
    //Habilitar barra de menu
    procedure HabilitarMenu(Habilitar: boolean);

    procedure ConfigurarMenuFicheros;
    procedure mnuFicherosClick(Sender: TObject);

    procedure ConfigurarMenuEntradas;
    procedure mnuEntradasClick(Sender: TObject);

    procedure ConfigurarMenuCompras;
    procedure mnuComprasClick(Sender: TObject);

    procedure ConfigurarMenuAlmacen;
    procedure mnuAlmacenClick(Sender: TObject);

    procedure ConfigurarMenuLiquidacion;
    procedure mnuLiquidacionClick(Sender: TObject);

    procedure ConfigurarMenuTransitos;
    procedure mnuTransitosClick(Sender: TObject);

    procedure ConfigurarMenuPedidos;
    procedure mnuPedidosClick(Sender: TObject);

    procedure ConfigurarMenuSalidas;
    procedure mnuSalidasClick(Sender: TObject);

    procedure ConfigurarMenuFacturacion;
    procedure mnuFacturacionClick(Sender: TObject);

    procedure ConfigurarMenuTransmision;
    procedure mnuTransmisionClick(Sender: TObject);

    procedure ConfigurarMenuUtilidades;
    procedure mnuUtilidadesClick(Sender: TObject);
    procedure ACalculadoraExecute(Sender: TObject);
    procedure AConversionDivisasExecute(Sender: TObject);
    procedure AEuroConversorExecute(Sender: TObject);
    procedure mnuCierreClick(Sender: TObject);

  private
    function FechaPanel: string;
    function GetUsuarioContable: Boolean;

  public

  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  UDMBaseDatos, UDMConfig, CVariables, CGestionPrincipal, CMaestro,
  CMaestroDetalle, bDialogs, bFileUtils, BEdit, DError,

  CUAMenuFicheros, CUAMenuEntradas, CUAMenuCompras, CUAMenuAlmacen,
  CUAMenuLiquidacion, CUAMenuTransitos, CUAMenuPedidos, CUAMenuSalidas,
  CUAMenuFacturacion, CUAMenuTransmision, CUAMenuUtiles,

  bCalculadora, DNoEuro, DConversor, BonnyQuery, CGlobal,
  SincronizacionBonny;


{$R *.DFM}

//Prevenir la ejecucion de dos instancias de la aplicacion

procedure TFPrincipal.CreateParams(var Params: TCreateParams);
var
  sAux: string;
  x: Integer;
begin
  //Para eso usamos la descripcion de la BD a la que nos conectamos
  inherited CreateParams(Params);
  if gProgramVersion = pvBAG then
    sAux:= 'GComerBAG' + arDataConexion[iBDDataConexion].sDescripcion
  else
    sAux:= 'GComerBSA' + arDataConexion[iBDDataConexion].sDescripcion;
  for x:=length( sAux ) downto 1 do
    Params.WinClassName[x-1]:= sAux[x];
end;

// ==================================  FORM  ==================================

// ---------------------------------  INICIO  ---------------------------------

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  DMConfig.Logon;
  Application.Title:= UpperCase( arDataConexion[ iBDDataConexion ].sDescripcion );

  //Teclas para las altas y bajas
  AMAltas.ShortCut := vk_add; //mas numerico
  AMBorrar.ShortCut := VK_SUBTRACT; //menos numerico
  ADAltas.ShortCut := ShortCut(VK_ADD, [ssAlt]); //mas numerico
  ADBorrar.ShortCut := ShortCut(VK_SUBTRACT, [ssAlt]); //menos numerico
  ADModificar.ShortCut := ShortCut(Word('M'), [ssAlt]); //M

  //Titulo del formulario
  Caption := UpperCase( 'GESTI?N COMERCIAL ' + gsAplicVersion + ' (' +  gsNombre + ' - ' + arDataConexion[iBDDataConexion].sDescripcion + ') ' );

  //Tama?o de la zona para barras
  CBControlBarras.Height := 26;

  //Tipo formulario
  FormType := tfDirector;
  //Barra de herramientas
  BHFormulario;

  //Barra estado
  Reloj.Enabled := true;
  Reloj.Interval := 60000; //1 minuto
  SBBarraEstado.Panels[0].Text := FechaPanel;

  //Inicializar Numeros aleatorios
  Randomize;
  //Borrar temporales de la sesion anterior del usuario actual
  if Trim(gsCodigo) <> '' then
    DeleteFiles(gsDirActual + '\temp\' + gsCodigo + '*.*');

  ConfigurarMenuFicheros;
  ConfigurarMenuEntradas;
  ConfigurarMenuCompras;
  ConfigurarMenuAlmacen;
  ConfigurarMenuLiquidacion;
  ConfigurarMenuTransitos;
  ConfigurarMenuPedidos;
  ConfigurarMenuSalidas;
  ConfigurarMenuAlmacen;
  ConfigurarMenuFacturacion;
  ConfigurarMenuTransmision;
  ConfigurarMenuUtilidades;
end;

// ----------------------------------  FIN  -----------------------------------

procedure TFPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //S?lo podemos salir si el formulario activo es el principal
  if FormType <> tfDirector then
  begin
    CanClose := False;
    Exit;
  end;

  //Si la Base de Datos esta cerrada salimos sin preguntar
  if not DMBaseDatos.DBBaseDatos.Connected then
  begin
    CanClose := True;
    Exit;
  end;

  // Aviso
  if UPPERCASE(gsCodigo) <> 'PRUEBA' then
  begin
    if Preguntar('? Desea salir del programa ?') then
      CanClose := True
    else
      CanClose := False;
  end
  else
  begin
    CanClose := True;
  end;

end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMConfig.Logoff;

  // Cierre de las Bases de Datos
  with DMBaseDatos.DBBaseDatos do
  begin
    Close;
    Params.Clear;
  end;

  SincroBonnyAurora.Fin;
  SincroBonnyAurora.Free;

  Action := caFree;
end;

// ================================  ACCIONES ===================================
// -----------------------------  DESPLAZAMIENTO  -----------------------------

procedure TFPrincipal.AMPrimeroExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Primero;
end;

procedure TFPrincipal.AMSiguienteExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Siguiente;
end;

procedure TFPrincipal.AMAnteriorExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Anterior;
end;

procedure TFPrincipal.AMUltimoExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Ultimo;
end;

procedure TFPrincipal.ADAnteriorExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestroDetalle) then
    with ActiveMDIChild as TMaestroDetalle do
      DetalleAnterior;

end;

procedure TFPrincipal.ADSiguienteExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestroDetalle) then
    with ActiveMDIChild as TMaestroDetalle do
      DetalleSiguiente;

end;

// ------------------------------  OPERACIONES  -------------------------------

procedure TFPrincipal.AMAltasExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Altas;
end;

procedure TFPrincipal.AMBorrarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Borrar;
end;

procedure TFPrincipal.AMModificarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Modificar;
end;

procedure TFPrincipal.AMLocalizarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
      Localizar;
end;

procedure TFPrincipal.ADAltasExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestroDetalle) then
    with ActiveMDIChild as TMaestroDetalle do
      DetalleAltas;
end;

procedure TFPrincipal.ADModificarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestroDetalle) then
    with ActiveMDIChild as TMaestroDetalle do
      DetalleModificar;
end;

procedure TFPrincipal.ADBorrarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestroDetalle) then
    with ActiveMDIChild as TMaestroDetalle do
      DetalleBorrar;
end;

// --------------------------------  ACEPTAR  ---------------------------------

procedure TFPrincipal.AMDAceptarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    {with ActiveMDIChild as TMaestro do}
    with TMaestro(ActiveMDIChild) do
    begin
      if (gRF <> nil) then
        if esVisible( gRF ) then
          Exit;
      if (gCF <> nil) then
        if esVisible( gCF ) then
          Exit;
      Aceptar;
    end;
end;

// --------------------------------  CANCELAR  --------------------------------

procedure TFPrincipal.AMDCancelarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
    begin
      if (gRF <> nil) then
        if esVisible( gRF ) then
        begin
          gRF.DoExit;
          Exit;
        end;
      if (gCF <> nil) then
        if esVisible( gCF ) then
        begin
          gCF.DoExit;
          Exit;
        end;
      Cancelar;
    end;
end;

// ---------------------------------  SALIR  ----------------------------------

procedure TFPrincipal.AMDSalirExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
    begin
      Salir;
    end;
  (*if UPPERCASE( gsCodigo ) = 'PRUEBA' then
     close
  *)
end;

// ==============================  IMPRESION ===================================
// --------------------------     Vista Previa  ---------------------------

procedure TFPrincipal.AIPrevisualizarExecute(Sender: TObject);
begin
  if (ActiveMDIChild is TMaestro) then
    with ActiveMDIChild as TMaestro do
    begin
      Previsualizar;
    end;
end;

//******************* MENU SALIR *************************
//***************** SALIR DE LA APLICACION******************

procedure TFPrincipal.ACerrarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPrincipal.RelojTimer(Sender: TObject);
begin
  SBBarraEstado.Panels[0].Text := FechaPanel;
end;

function TFPrincipal.FechaPanel: string;
var
  ano, mes, dia: Word;
  fecha, des: string;
begin
  DecodeDate(Date, ano, mes, dia);
  fecha := copy(timeTostr(time), 1, 5);
  if copy(fecha, 5, 1) = ':' then
    fecha := copy(fecha, 1, 4);
  case DayOfWeek(Date) of
    1: des := ' Domingo ';
    2: des := ' Lunes ';
    3: des := ' Martes ';
    4: des := ' Miercoles ';
    5: des := ' Jueves ';
    6: des := ' Viernes ';
    7: des := ' Sabado ';
  end;
  FechaPanel := des + IntToStr(dia) + '/' +
    IntToStr(mes) + '/' +
    IntToStr(ano) + ' ' +
    fecha;
end;

function TFPrincipal.GetUsuarioContable: boolean;
var QUsuario : TBonnyQuery;
begin
  QUsuario := TBonnyQuery.Create(Self);
  with QUsuario do
  try
    SQL.Add('select * from cnf_usuarios ');
    SQL.Add(' where usuario_cu = :usuario ');
    SQL.Add('   and enlace_contable_cu = 1 ');
    ParamByName('usuario').AsString:= gsCodigo;

    Open;
    result := not IsEmpty;
  finally
    Free;
  end;
end;

procedure TFPrincipal.HabilitarMenu(Habilitar: boolean);
var
  i: Integer;
begin
  if Menu = nil then
    Exit;
  for i := 0 to Menu.Items.Count - 1 do
  begin
    Menu.Items[i].Enabled := Habilitar;
  end;
  barAplicaciones.Visible:= Habilitar;
(*
  if Habilitar then
  begin
    mnuEuroConversor.ShortCut:= vk_f8;
    mnuCalculadora.ShortCut:= vk_f5;
  end
  else
  begin
    mnuEuroConversor.ShortCut:= 0;
    mnuCalculadora.ShortCut:= 0;
  end;
  Utilidades1.Enabled := True;
  for i := 4 to Utilidades1.Count - 1 do
  begin
    Utilidades1.Items[i].Visible := Habilitar;
  end;

  if (habilitar) and (gCentro <> 0) then
  begin
    MenuCambiodeDivisas.Visible := not habilitar;
    smTransmisionCentral.Visible := not Habilitar;
    MComprobaciondeGastos.Visible := not Habilitar;
  end;
*)
end;


//**********************************************************************************
//**********************************************************************************
//**********************************************************************************

procedure ConfigurarOpcion( AOpcion: TMenuItem; const AActiva: boolean = true;
                            const ACaption: string = ''; const AHint: string = '');
begin
  //AOpcion.Tag:= ATag;
  AOpcion.Enabled:= AActiva;
  AOpcion.Visible:= AActiva;
  AOpcion.Caption:= ACaption;
  AOpcion.Hint:= AHint;
end;

procedure TFPrincipal.ConfigurarMenuFicheros;
begin
  ConfigurarOpcion(  mnuFicheros, True, 'Fi&cheros', '');

  ConfigurarOpcion(  mnuFchsep, True, '-', 'Ficheros Maestros');
  ConfigurarOpcion(  mnuFchAduanasPuertos, True, 'Aduanas/Puertos', '');
  ConfigurarOpcion(  mnuFchAgrupacionesComerciales, True, 'Agrupaciones Comerciales', '');
  ConfigurarOpcion(  mnuFchAgrupacionesEnvase, True, 'Agrupaciones Envase', '');
  ConfigurarOpcion(  mnuFchTiposdeCaja, True, 'Tipos Caja', '');
  ConfigurarOpcion(  mnuFchBancos, True, 'Bancos', '');
  ConfigurarOpcion(  mnuFchCentros, True, 'Centros', '');

  ConfigurarOpcion(  mnuFchSubClientes, True, 'Clientes', '');
  ConfigurarOpcion(  mnuFchClientes, True, 'Clientes', '');
  ConfigurarOpcion(  mnuFchRepresentantes, True, 'Representantes', '');
  ConfigurarOpcion(  mnuFchClientesEDI, True , 'C?digos EDI de Clientes', '');
//  ConfigurarOpcion(  mnuFchProductoEDI, True , 'C?digos Facturaci?n EDI', '');
  ConfigurarOpcion(  mnuFchTipoCliente, True , 'Tipos de Clientes', '');
  ConfigurarOpcion(  mnuFchListadoComisiones, True, 'Listado de Descuentos y Comisiones', '');
  ConfigurarOpcion(  mnuFchListadoDatosCobroCliente, True, 'Listado Datos Cobro Cliente', '');

  ConfigurarOpcion(  mnuFchEan13, True, 'C?digos EAN13 de Articulos', '');

  ConfigurarOpcion(  mnuFchComerciales, True, 'Comerciales', '');
  //Cosecheros -->  True
  ConfigurarOpcion(  mnuFchCosecheros, True, 'Cosecheros', '');
  ConfigurarOpcion(  mnuFchEmpresas, True, 'Empresas', '');
  ConfigurarOpcion(  mnuFchEnvases, True, 'Art?culos ', '');
  ConfigurarOpcion(  mnuFchEnvasesComerciales, True, 'Envases Comerciales/Retornables', '');
  //Env Transitos -->  True
  ConfigurarOpcion(  mnuFchFederaciones, True, 'Federaciones', '');
  ConfigurarOpcion(  mnuFchFlotaCamiones, True , 'Flota de Camiones', '');
  ConfigurarOpcion(  mnuFchFormasPago, True , 'Formas de Pago', '');

  ConfigurarOpcion(  mnuFchImpuestos, True, 'Impuestos', '');
  ConfigurarOpcion(  mnuFchMarcas, True, 'Marcas', '');
  ConfigurarOpcion(  mnuFchMonedas, True, 'Monedas', '');
  ConfigurarOpcion(  mnuFchPaises, True, 'Pa?ses', '');
  ConfigurarOpcion(  mnuFchPesosCentro, True, 'Pesos de Cajas y Palets', '');
  ConfigurarOpcion(  mnuFchPlantaciones, True, 'Plantaciones', '');
  ConfigurarOpcion(  mnuFchProductos, True, 'Productos', '');
  ConfigurarOpcion(  mnuFchProveedores, True, 'Proveedores', '');
  ConfigurarOpcion(  mnuFchProvincias, True, 'Provincias', '');
  ConfigurarOpcion(  mnuFchSeccionesContables, True , 'Secciones Contables', '');
  ConfigurarOpcion(  mnuFchTipoGastos, True, 'Tipo de Gastos', '');
  ConfigurarOpcion(  mnuFchTipoPalets, True, 'Tipo de Palets', '');
  ConfigurarOpcion(  mnuFchTiposVia, True, 'Tipo de V?as', '');
  ConfigurarOpcion(  mnuFchTransportistasMante, True, 'Transportistas - Mantenimiento', '');
  ConfigurarOpcion(  mnuFchUnidadesConsumo, True, 'Unidades de Consumo', '');
end;

procedure TFPrincipal.mnuFicherosClick(Sender: TObject);
begin
  CUAMenuFicheros.EjecutarMenuFicheros( self, TMenuItem( Sender ).Name );
end;


procedure TFPrincipal.ConfigurarMenuEntradas;
begin
  ConfigurarOpcion(  mnuEntradas, True, '&Entradas', '');

  ConfigurarOpcion(  mnuEntSepEntradas, True, '-', 'Entradas Cosecheros');
  ConfigurarOpcion(  mnuEntEntradas, True, 'Entradas de Campo', '');
  ConfigurarOpcion(  mnuEntLstEntradasCosecheros, True, 'Listado Entradas Cosechero', '');
  ConfigurarOpcion(  mnuEntDetalleEntradas, True, 'Listado Detalle Entradas', '');
  ConfigurarOpcion(  mnuEntResEntradasCosecheros, True, 'Resumen Entradas Cosechero', '');
  ConfigurarOpcion(  mnuEntResEntradasTransportistas, True, 'Resumen Entradas Transporte', '');
  ConfigurarOpcion(  mnuEntEntradasRecoleccion, True, 'Resumen Entradas por Plantaci?n', '');
  ConfigurarOpcion(  mnuEntResProductividad, True, 'Resumen Productividad', '');

  ConfigurarOpcion(  mnuEntSepSGP, DMConfig.EsLosLLanos, '-', 'Entradas SGP');
  ConfigurarOpcion(  mnuEntTransferirSGP, DMConfig.EsLosLLanos, 'Transferir Entradas SGP', '');

  ConfigurarOpcion(  mnuEntSepEscandallos, True, '-', 'Escandallos');
  ConfigurarOpcion(  mnuEntEscandallos, True, 'Mantenimiento de Escandallos', '');
  ConfigurarOpcion(  mnuEntListEscandallos, True, 'Listado de Escandallos', '');
  ConfigurarOpcion(  mnuEntVerificarEscandallos, True, 'Verificar Grabaci?n de Escandallos', '');
end;


procedure TFPrincipal.mnuEntradasClick(Sender: TObject);
begin
  CUAMenuEntradas.EjecutarMenuEntradas( self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuCompras;
begin
  ConfigurarOpcion(  mnuComprasProveedor, True, '&Compras', '');

  ConfigurarOpcion(  mnuEntSepCompas, True, '-', 'Compras Proveedor');
  ConfigurarOpcion(  mnuEntFacturasPlatano, DMConfig.EsLaFont, 'Facturas Despacho Pl?tano Canario', '');
  ConfigurarOpcion(  mnuEntEntregas, True, 'Compras con Entradas asociadas', '');

  ConfigurarOpcion(  mnuEntSepComprasEntregas, true, '-', '');
  ConfigurarOpcion(  mnuEntEntregas, True, 'Entregas de Proveedor', '');
  ConfigurarOpcion(  mnuEntLstEntregas, True, 'Listado Entregas Proveedor', '');
  ConfigurarOpcion(  mnuEntLstControlEntregas, True, 'Listado Control de Entregas', '');
  ConfigurarOpcion(  mnuEntResEntregas, True, 'Resumen Entregas Proveedor', '');
  ConfigurarOpcion(  mnuEntResPesosEntregas, DMConfig.EsMaset, 'Resumen Pesos Entregas', '' );
  ConfigurarOpcion(  mnuEntLstGastosEntregas, True, 'Listado Gastos de Entregas', '');
  ConfigurarOpcion(  mnuEntLstControlGastosEntregas, True, 'Listado de Entregas sin Gastos ', '');
  ConfigurarOpcion(  mnuEntServiciosTransportes, True, 'Resumen Servicios por Transportista', '');

  ConfigurarOpcion(  mnuEntSepStockAlmacen,  not DMConfig.EsLaFont, '-', 'Confeccionado Almac?n');
  ConfigurarOpcion(  mnuEntPendientesDescarga, not DMConfig.EsLaFont, 'Entregas Pendientes de Descargar' );
  ConfigurarOpcion(  mnuEntStockActualProveedor,  not DMConfig.EsLaFont , 'Stock Fruta Proveedor', '');
  (*TODO*)(*NO SE PUEDE VALORAR EN EL ALMACEN POR QUE NO HAY IMPORTES COMPRA GRABADOS*)
  //ConfigurarOpcion(  mnuEntValorFrutaPlantaProveedor, not DMConfig.EsLaFont, 'Valorar Fruta en Planta', '');
  ConfigurarOpcion(  mnuEntValorFrutaPlantaProveedor, False, 'Valorar Fruta en Planta', '');
//  ConfigurarOpcion(  mnuEntPaletsProveedorVolcados,  not DMConfig.EsLaFont, 'Palets Volcados', '');
  ConfigurarOpcion(  mnuStockFrutaConfeccionadaFormatos,  not DMConfig.EsLaFont, 'Stock Fruta Confeccionada por Formatos', '');
  ConfigurarOpcion(  mnuStockFrutaConfeccionadaEnvases,  not DMConfig.EsLaFont, 'Stock Fruta Confeccionada por Art?culos', '');
//  ConfigurarOpcion(  mnuEntPaletsConfeccionados,  not DMConfig.EsLaFont, 'Palets Confeccionados', '');
//  ConfigurarOpcion(  mnuEntListadoDestrioFrutaRF,  not DMConfig.EsLaFont, 'Listado Destrio Fruta RF', '');

  ConfigurarOpcion(  mnuEntSepFacturasCompras, DMConfig.EsLaFont, '-', 'Facturas Compras Proveedor');
  ConfigurarOpcion(  mnuEntLstFacturasProveedorNew, DMConfig.EsLaFont, 'Listado Facturas Proveedor', '');
  ConfigurarOpcion(  mnuEntEntregasSinFacturar, DMConfig.EsLaFont, 'Entregas Pendientes de Facturar', '');
  ConfigurarOpcion(  mnuEntControlImportesFacturasLineas, DMConfig.EsLaFont, 'Control Importes Facturas / Lineas', '');
  //Mismo lisatdo, pero diferente posicion en el menu
  ConfigurarOpcion(  mnuEntResumenCosteProveedor, DMConfig.EsLaFont, 'Resumen Coste Entregas Por Proveedor', '');
  ConfigurarOpcion(  mnuEntResumenCosteProducto, DMConfig.EsLaFont, 'Resumen Coste Entregas Por Producto', '');
  ConfigurarOpcion(  mnuEntComprasProductoProveedor, DMConfig.EsLaFont, 'Resumen Compras Producto/Proveedor', '');
//  ConfigurarOpcion(  mnuEntBeneficioProducto, DMConfig.EsLaFont, 'Beneficio Producto', '');
  ConfigurarOpcion(  mnuEntResumenCosteProveedorBonde, not DMConfig.EsLaFont, 'Resumen Coste Entregas Por Proveedor', '');
  ConfigurarOpcion(  mnuEntResumenCosteProductoBonde, not DMConfig.EsLaFont, 'Resumen Coste Entregas Por Producto', '');

  ConfigurarOpcion(  mnuEntSepIntrastat, DMConfig.EsLaFont, '-', 'Intrastat');
  ConfigurarOpcion(  mnuEntControlIntrastat, DMConfig.EsLaFont, 'Control Intrastat', '');
  ConfigurarOpcion(  mnuEntIntrasat, DMConfig.EsLaFont, 'Intrastat', '');

  ConfigurarOpcion(  mnuEntSepRecepcion, not DMConfig.EsLaFont, '-', 'Recibir Entregas' );
  ConfigurarOpcion(  mnuEntRecibirEntregas, not DMConfig.EsLaFont , 'Recibir Entregas Pendientes' );

  ConfigurarOpcion(  mnuEntSepLiquidacion, True, '-', 'Liquidaci?n' );
//  ConfigurarOpcion(  mnuEntDifKilosComerRF, not DMConfig.EsLaFont, 'Diferencias Kilos/Cajas Comercial-Radiofrecuencia' );
//  ConfigurarOpcion(  mnuEntDifFechasComerRF, not DMConfig.EsLaFont, 'Diferencias Fechas Comercial-Radiofrecuencia' );
//  ConfigurarOpcion(  mnuEntLiquidacionEntrega, DMConfig.EsLaFont, 'Liquidaci?n Entrega' );
//  ConfigurarOpcion(  mnuEntPrevisionCostesProducto, DMConfig.EsLaFont, 'Previsi?n Costes Producto' );

//  if DMConfig.EsLaFont then
//    ConfigurarOpcion(  mniEntMargenBeneficio, True , 'Margen Beneficio', '')
//  else
//    ConfigurarOpcion(  mniEntMargenBeneficio, True , 'Parte confecci?n', '');

//  ConfigurarOpcion(  mnuEntMargenPeriodo, DMConfig.EsLaFont, 'OLD - Margen Beneficio Periodo' );
//  ConfigurarOpcion(  mnuEntMargenSemanal, DMConfig.EsLaFont, 'OLD - Margen Beneficio Semanal' );
  ConfigurarOpcion(  mnuEntValorarStockProveedor, DMConfig.EsLaFont , 'Valorar Stock Proveedor', '');
  ConfigurarOpcion(  mnuEntValorarStockConfeccionado, DMConfig.EsLaFont , 'Valorar Stock Confeccionado', '');


  //not DMConfig.EsLaFont
//  ConfigurarOpcion(  mnuEntCuadreSemanalRFAlmacen, True, 'Cuadre Semanal RF Almac?n' );

//Los menus que habian antes en ComerSAT / Compras
{
  ConfigurarOpcion(  mnuEntSepComprasEntregas, True, '-', '');
  ConfigurarOpcion(  mnuEntEntregas, True, 'Entregas de Proveedor', '');
  ConfigurarOpcion(  mnuEntLstEntregas, True, 'Listado Entregas', '');
  ConfigurarOpcion(  mnuEntLstControlEntregas, True, 'Listado Control de Entregas', '');
  ConfigurarOpcion(  mnuEntResEntregas, True, 'Resumen Entregas', '');
  ConfigurarOpcion(  mnuEntEntregasSinAsociar, True, 'Entregas Sin Entrada Asociada', '');

  ConfigurarOpcion(  mnuEntInventarioMaterialProveedor, True, 'Existencias Material ', '');
  ConfigurarOpcion(  mnuEntMovimentosMaterialProveedor, True, 'Listado Movimentos Material ', '');


  ConfigurarOpcion(  mnuEntSepFacturasCompras, DMConfig.EsLaFont, '-', 'Facturas Compras Proveedor');
  ConfigurarOpcion(  mnuEntLstFacturasProveedorNew, DMConfig.EsLaFont, 'Listado Facturas Proveedor', '');
  ConfigurarOpcion(  mnuEntLstFacturasGastosEntregas, DMConfig.EsLaFont, 'Listado Facturas Gastos de Entregas', '');
  ConfigurarOpcion(  mnuEntEntregasSinFacturar, DMConfig.EsLaFont, 'Entregas Pendientes de Facturar', '');
}
end;

procedure TFPrincipal.mnuComprasClick(Sender: TObject);
begin
  CUAMenuCompras.EjecutarMenuCompras( self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuAlmacen;
begin
  ConfigurarOpcion(  mnuAlmacen, True, '&Almac?n', '');

  ConfigurarOpcion(  mnuAlmSepAlmacen, True, '-', 'Gesti?n del Inventario');
  ConfigurarOpcion(  mnuAlmInventario, True, 'Inventario de Almac?n', '');
  ConfigurarOpcion(  mnuAlmResumenInventario, True, 'Resumen de Inventarios', '');
  ConfigurarOpcion(  mnuAlmConfeccionadoEnvases, True, 'Confeccionado por Art?culos', '');
  ConfigurarOpcion(  mnuAlmConfeccionadoAgrupacion, True, 'Confeccionado por Agrupaci?n', '');
  ConfigurarOpcion(  mnuParteProduccion, True, 'V2.- Parte Producci?n', '');
  ConfigurarOpcion(  mnuLiqAjusteEntradas, True, 'V2.- Aplicar Merma y Ajustes Entradas', '');
  ConfigurarOpcion(  mnuLiqAprovechaEntradas, True, 'V2 .- Aprovechamientos Entradas', '');

  ConfigurarOpcion(  mnuAlmSepSobrepesos, True, '-', 'Sobrepeso del Art?culo');
  ConfigurarOpcion(  mnuAlmSobrepesoEnvase, True, 'Sobrepeso del Art?culo', '');
  ConfigurarOpcion(  mnuAlmVerificarGrabacionEnvasado, True, 'Verificar la Grabaci?n del Sobrepeso', '');
  ConfigurarOpcion(  mnuAlmSopresesosActuales, True, 'Sobrepesos Actuales', '');
  ConfigurarOpcion(  mnuAlmSobrepesosPeriodo, True, 'Sobrepesos Periodo', '');

  ConfigurarOpcion(  mnuAlmSepCosteEnvase, True, '-', 'Costes del Art?culo');
  ConfigurarOpcion(  mnuAlmCostesEnvase, True, 'Costes por KG Art?culo (Mensual)', '');
  ConfigurarOpcion(  mnuAlmVerificarCosteEnvases, True, 'Verificar Grabaci?n Costes Art?culo', '');
  ConfigurarOpcion(  mnuAlmLstCosteEnvase, True, 'Importes Costes de Envasado', '');
  ConfigurarOpcion(  mnuAlmLstCosteEnvaseKg, True, 'Costes por KG de Envasado (Media mensual)', '');
  ConfigurarOpcion(  mnuAlmTablaCostesEnvasado, True, 'Tabla Anual Costes Envasados', '');

  ConfigurarOpcion(  mnuAlmSepPesosCIndirectos, True, '-', 'Costes Indirectos');
  ConfigurarOpcion(  mnuAlmCostesIndirectos, True, 'Costes Indirectos', '');

  ConfigurarOpcion(  mnuAlmSepPreciosDiarios, DMConfig.EsLaFont, '-', 'Precios Diarios');
  ConfigurarOpcion(  mnuAlmPreciosDiariosrEnvases, false, 'Precios Diarios por Art?culos', '');
  ConfigurarOpcion(  mnuAlmPrecioVentaCliente, DMConfig.EsLaFont, 'Precio Venta por Cliente y Art?culo', '');
end;

procedure TFPrincipal.mnuAlmacenClick(Sender: TObject);
begin
  CUAMenuAlmacen.EjecutarMenuAlmacen( self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuLiquidacion;
begin
  ConfigurarOpcion(  mnuLiquidacion, DMConfig.EsLaFont, '&Liquidaci?n', '');

  ConfigurarOpcion(  mnuLiqSepLiquidacion, DMConfig.EsLaFont, '-', 'Liquidaci?n a Cosecheros');

  ConfigurarOpcion(  mnuProcesoLiquidacion, DMConfig.EsLaFont, 'V2.- C?lculo Liquidaci?n Semanal', '');
  ConfigurarOpcion(  mnuInformesLiquidacion, DMConfig.EsLaFont, 'V2.- Detalle Liquidaci?n', '');
  ConfigurarOpcion(  mnuLiquidacionMensual, False, 'V2.- ->> OLD <<- Liquidaci?n Mensual', '');
  ConfigurarOpcion(  mnuLiquidacionMensual2, DMConfig.EsLaFont, 'V2.- Resumen Liquidaci?n', '');
end;

procedure TFPrincipal.mnuLiquidacionClick(Sender: TObject);
begin
  CUAMenuLiquidacion.EjecutarMenuLiquidacion( self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuTransitos;
begin
  ConfigurarOpcion(  mnuTransitos, True, '&Tr?nsitos', '');

  ConfigurarOpcion(  mnuTraSepTransistos, True, '-', 'Gesti?n de Tr?nsitos');
  ConfigurarOpcion(  mnuTraTransitos, True, 'Tr?nsitos', '');
  ConfigurarOpcion(  mnuTraLisTransitos, True, 'Listado Tr?nsitos', '');
  ConfigurarOpcion(  mnuTraConsultaTransitos, True, 'Consulta de Tr?nsitos', '');
  ConfigurarOpcion(  mnuTraAsignarKilosTransitos, DMConfig.EsLaFont, 'Asignar Kilos de Tr?nsitos', '');
  ConfigurarOpcion(  mnuTraLisEnvasesTransitos, True, 'Resumen de Art?culos de Tr?nsitos', '');
  ConfigurarOpcion(  mnuTraServiciosTransportistas, True, 'Resumen Servicios por Transportista', '');
  ConfigurarOpcion(  mnuTraListadoFacturasdeGastosTransitos, True, 'Listado Facturas de Gastos Tr?nsitos', '');

  ConfigurarOpcion(  mnuTraSepDeposito, DMConfig.EsLaFont, '-', 'Dep?sito de Aduanas');
  ConfigurarOpcion(  mnuTraListadoDepositoAduanas, DMConfig.EsLaFont, 'Listado Dep?sito de Aduanas', '');
  ConfigurarOpcion(  mnuTraLFacturasTransportesDeposito, DMConfig.EsLaFont, 'Listado Facturas de Transporte Dep?sito de Aduanas', '');
  ConfigurarOpcion(  mnuTraCrearFicherosAplicacionAtlantis, DMConfig.EsLaFont, 'Crear Ficheros Aplicaci?n Atlantis', '');

  ConfigurarOpcion(  mnuTraSepPOSEI, DMConfig.EsLaFont, '-', 'Ayuda POSEI');
  ConfigurarOpcion(  mnuTraCalculoAyudaPOSEI, DMConfig.EsLaFont, 'C?lculo Ayuda POSEI', '');
  ConfigurarOpcion(  mnuTraInformeAyudaPOSEI, DMConfig.EsLaFont, 'Informe Ayuda POSEI', '');

  ConfigurarOpcion(  mnuTraSepRecepcionTransitos, not DMConfig.EsLaFont, '-', 'Recepci?n de Tr?nsitos');
  ConfigurarOpcion(  mnuTraRecepcionTransitos, not DMConfig.EsLaFont, 'Recepci?n de Tr?nsitos', '');
end;

procedure TFPrincipal.mnuTransitosClick(Sender: TObject);
begin
  CUAMenuTransitos.EjecutarMenuTransitos( self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuPedidos;
begin
  ConfigurarOpcion(  mnuPedidos, True, '&Pedidos', '');
  ConfigurarOpcion(  mnuPedAccesoWeb, True, 'Proceso de Pedidos Aplicaci?n WEB', '');
  ConfigurarOpcion(  mnuPedConfirmaRecepcion, True, 'Confirmaci?n de Recepci?n de Mercanc?as En Mercadona', '');
end;

procedure TFPrincipal.mnuPedidosClick(Sender: TObject);
begin
  CUAMenuPedidos.EjecutarMenuPedidos( Self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuSalidas;
begin
  ConfigurarOpcion(  mnuSalidas, True, '&Salidas', '');

  ConfigurarOpcion(  mnuSalSepSalidas, True, '-', 'Gesti?n Salidas');
  ConfigurarOpcion(  mnuSalTablaSalidas, True, 'Tabla Din?mica de Salidas', '');
  ConfigurarOpcion(  mnuSalResumenSalidasDinamico, True, 'Resumen Salidas Din?mico', '');
  ConfigurarOpcion(  mnuSalSalidas, True, 'Salidas', '');
  ConfigurarOpcion(  mnuSalEnvioAlbaranes, True, 'Env?o de Albaranes por Correo Electr?nico', '');
  ConfigurarOpcion(  mnuSalLisAlbaranesEnviados, True, 'Listado de Albaranes Enviados', '');
  ConfigurarOpcion(  mnuSalLisSalidasClientes, True, 'Listado de Salidas por Clientes', '');
  ConfigurarOpcion(  mnuSalLisSalidasProductos, True, 'Resumen de Salidas por Producto', '');
  ConfigurarOpcion(  mnuSalLisSalidasCategoria, True, 'Listado de Salidas por Categoria y Calibre', '');
  ConfigurarOpcion(  mnuSalLisSalidasPalet, True, 'Listado de Salidas por Palet', '');
  ConfigurarOpcion(  mnuSalResumenAlmacen, True, 'Resumen de Almac?n / Salidas por Periodo', '');

  ConfigurarOpcion(  mnuSalSepSalidasPlus, True, '-', '');

  ConfigurarOpcion(  mnuSalListadoFacturasdeGastosVentas1, True, 'Listado Facturas de Gastos Ventas', '');
  ConfigurarOpcion(  mnuSalGrabarGastosTransportes, DMConfig.EsLaFont, 'Grabar Gastos de Transportes', '');
  ConfigurarOpcion(  mnuSalAsignarGastosTransportes, DMConfig.EsLaFont, 'Asignar Gastos de Transportes', '');

  ConfigurarOpcion(  mnuSalResSalidasEnvase, True, 'Listado de Salidas por Art?culo', '');

  ConfigurarOpcion(  mnuSalInventarioEnvComer, True, 'Inventario Envases Comerciales', '');
  ConfigurarOpcion(  mnuSalAjustesInventarioEnvComer, True, 'Ajustes Inventario', '');
  ConfigurarOpcion(  mnuSalEntradasEnvComer, True, 'Entradas Envases Comerciales', '');
  ConfigurarOpcion(  mnuSalTransitosEnvComer, True, 'Tr?nsitos Envases Comerciales', '');
  ConfigurarOpcion(  mnuSalSepEnvasesComerciales, True, '-', '');
  ConfigurarOpcion(  mnuSalMovimientosEnvasesComerciales, True, 'Listado Movimientos Envases Comerciales', '');
  ConfigurarOpcion(  mnuSalListadoEnvasesComerciales, True, 'Salidas por Envases Comerciales/Retornables', '');
  ConfigurarOpcion(  mnuSalFacturaLogifruit, True, 'Factura Logifruit', '');
  ConfigurarOpcion(  mnuSalVentasSemMercadona, True, 'Informe de Ventas Semanal Mercadona', '');
  ConfigurarOpcion(  mnuSalVentasSuministro, DMConfig.EsLaFont , 'Informe de Ventas Suministro', '');
  ConfigurarOpcion(  mnuSalVentasBruto, DMConfig.EsLaFont, 'Listado de Ventas Bruto', '');
  ConfigurarOpcion(  mnuSalVentasSemanal, DMConfig.EsLaFont, 'Listado de Ventas Semanal', '');

  ConfigurarOpcion(  mnuSalSepFOB, DMConfig.EsLaFont, '-', 'Listados FOB');
  ConfigurarOpcion(  mnuSalListadoFOBSalidas, DMConfig.EsLaFont, 'Listado Salidas FOB por Art?culos', '');
  ConfigurarOpcion(  mnuSalResumenFOB, DMConfig.EsLaFont, 'Resumen Salidas FOB', '');

  ConfigurarOpcion(  mnuSalFOBCliente, DMConfig.EsLaFont, 'Resumen Semanal de Ventas FOB por Cliente', '');
  ConfigurarOpcion(  mnuSalFOBClientes,DMConfig.EsLaFont, 'FOB Facturaci?n Clientes', '');

  ConfigurarOpcion(  mnuSalSepFederacion, DMConfig.EsLaFontEx, '-', 'Asignar Federaci?n');
  ConfigurarOpcion(  mnuSalSemanalExpediciones, DMConfig.EsLaFontEx, 'Declaraci?n Semanal de Expediciones', '');
  ConfigurarOpcion(  mnuSalSubFederacion, DMConfig.EsLaFontEx, 'Asignar Federaci?n', '');
  ConfigurarOpcion(  mnuSalPorcentajesFederacion, DMConfig.EsLaFontEx, 'Porcentajes Federaci?n', '');
  ConfigurarOpcion(  mnuSalAsignarFederacion, DMConfig.EsLaFontEx, 'Asignar Federaci?n', '');
  ConfigurarOpcion(  mnuSalModificacionFederacion, DMConfig.EsLaFontEx, 'Modificaci?n Federaci?n', '');
  ConfigurarOpcion(  mnuSalLisSalidasFederacion, DMConfig.EsLaFontEx, 'Resumen Salidas por Federaci?n', '');

  ConfigurarOpcion(  mnuSalSubIntrastat, DMConfig.EsLaFont, 'Intrastat', '');
  ConfigurarOpcion(  mnuSalInformeIntrastat, DMConfig.EsLaFont, 'Informe Intrastat', '');
  ConfigurarOpcion(  mnuSalControlIntrastat, DMConfig.EsLaFont, 'Listado Control Intrastat', '');

//  ConfigurarOpcion(  mnuSalAsignarDUA, DMConfig.EsLaFont or DMConfig.EsLosLLanos, 'Asignar D.U.A.', '');

  ConfigurarOpcion(  mnuSalListadoMercadona, DMConfig.EsLaFont , 'Listado Mercadona', '');
                                                                  
end;

procedure TFPrincipal.mnuSalidasClick(Sender: TObject);
begin
  CUAMenuSalidas.EjecutarMenuSalidas( Self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuFacturacion;
var
  bPuedoFacturar: Boolean;
  bPuedoContabilizar: Boolean;
begin
  bPuedoFacturar:= DMConfig.EsLaFont and ( not gbAlmacen );
  bPuedoContabilizar := GetUsuarioContable;
  ConfigurarOpcion(  mnuFacturacion, bPuedoFacturar, '&Facturaci?n', '');

  ConfigurarOpcion(  mnuFacSepFacturas, bPuedoFacturar, '-', 'Facturas y Abonos');

  ConfigurarOpcion(  mnuManFacturas, bPuedoFacturar , 'Mantenimiento de Facturas ', '');
  ConfigurarOpcion(  mnuProformaFac, bPuedoFacturar , 'Factura Informativa/Proforma ', '');
  ConfigurarOpcion(  mnuProcFacturacion, bPuedoFacturar , 'Facturaci?n Autom?tica ', '');
  ConfigurarOpcion(  mnuRepFacturacion, bPuedoFacturar , 'Repetici?n Facturas ', '');
  ConfigurarOpcion(  mnuFacturarEdi, bPuedoFacturar , 'Fichero Facturas/Abonos EDI ', '');
  ConfigurarOpcion(  mnuContFacturas, bPuedoFacturar and bPuedoContabilizar and gbEscritura, 'Contabilizaci?n de Facturas ', '');
  ConfigurarOpcion(  mnuMarcaContable, bPuedoFacturar and bPuedoContabilizar and gbEscritura , 'Marcar / Desmarcar Contabilizadas ', '');
  ConfigurarOpcion(  mnuFacSinContablizarX3, bPuedoFacturar, 'Facturas Pendientes de Contablizar en X3 ', '');
  ConfigurarOpcion(  mnuAnuFacturas, bPuedoFacturar , 'Anulaci?n de Facturas ', '');

  ConfigurarOpcion(  mnuFacSepFacturasPlus, bPuedoFacturar, '-', '');
  ConfigurarOpcion(  mnuListadoVentasPorPeriodo, bPuedoFacturar, 'Listado Ventas Por Periodo', '');
  ConfigurarOpcion(  mnuFacLisFacturas, bPuedoFacturar, 'Listado Facturas', '');
  ConfigurarOpcion(  mnuFacLisAbonosDetalle, bPuedoFacturar, 'Listado Detalle Abonos', '');
  ConfigurarOpcion(  mnuFacAlbaranesFactura, bPuedoFacturar, 'Albaranes Factura', '');
  ConfigurarOpcion(  mnuFacFacturasCliente, bPuedoFacturar, 'Facturas Por Cliente', '');
  ConfigurarOpcion(  mnuFacNotificacinVentasCredito, bPuedoFacturar, 'Notificaci?n de Ventas a Cr?dito', '');
  ConfigurarOpcion(  mnuFacImporteFacturadoClienteBanco, bPuedoFacturar, 'Importe Facturado Cliente - Banco', '');
  ConfigurarOpcion(  mnuFacFacturasSuministro, bPuedoFacturar, 'Facturacion por Centros de Suministro', '');
  ConfigurarOpcion(  mnuFacFacturasTomate, DMConfig.EsLaFont, 'Facturas por Producto', '');
  ConfigurarOpcion(  mnuFacAlbaranesSinFacturar, bPuedoFacturar, 'Albaranes Pendientes de Facturar / Valorar', '');
  ConfigurarOpcion(  mnuFacProductoSinFacturar, DMConfig.EsLaFont, 'Producto Pendiente de Facturar ', '');
  ConfigurarOpcion(  mnuFacAlbaranesFacturadosEn, bPuedoFacturar, 'Albaranes Pendientes de Facturar a Fecha ', '');
  ConfigurarOpcion(  mnuFacFacturasParaAnticipar, bPuedoFacturar, 'Facturas Para Anticipar', '');
  ConfigurarOpcion(  mnuFacFacturasSinCobrar, bPuedoFacturar, 'Facturas Pendientes de Cobrar', '');
  ConfigurarOpcion(  mnuFacAging, bPuedoFacturar, 'Aging', '');

  ConfigurarOpcion(  mnuFacSepRemesas, bPuedoFacturar, '-', 'Control Remesas de Cobro');
  ConfigurarOpcion(  mnuManRemesas, bPuedoFacturar , 'Control de Cobros ', '');
  ConfigurarOpcion(  mnuFacListadoRemesas, bPuedoFacturar, 'Resumen de Cobros', '');
  ConfigurarOpcion(  mnuFacListadoResemasBanco, bPuedoFacturar, 'Listado Cobros por Banco', '');
  ConfigurarOpcion(  mnuFacRiesgoCliente, bPuedoFacturar, 'Riesgo del Cliente', '');
  ConfigurarOpcion(  mnuFacEstadoCobroCliente, bPuedoFacturar, 'Estado de Cobro de Clientes', '');
  ConfigurarOpcion(  mnuFacDiasMediosPagoClientes, bPuedoFacturar, 'D?as Medios de Pago de Clientes', '');
  ConfigurarOpcion(  mnuFacSaldoClientes, bPuedoFacturar, 'Saldo Clientes - Pendiente de cobro', '');
end;

procedure TFPrincipal.mnuFacturacionClick(Sender: TObject);
begin
  CUAMenuFacturacion.EjecutarMenuFacturacion( Self, TMenuItem( Sender ).Name );
end;


procedure TFPrincipal.ConfigurarMenuTransmision;
begin
  ConfigurarOpcion(  mnuDatosTransmision, not DMConfig.EsLaFont, 'Tra&nsmisi?n', '');

  ConfigurarOpcion(  mnuDatDiarioTodo, True, 'Todo', '');
  ConfigurarOpcion(  mnuDatSepDiarioTodo, True, '-', '');
  ConfigurarOpcion(  mnuDatDiarioEntradas, True, 'Entradas', '');
  ConfigurarOpcion(  mnuDatDiarioEscandallos, tRUE, 'Escandallos', '');
  ConfigurarOpcion(  mnuDatDiarioInventarios, not DMConfig.EsLaFont, 'Inventarios', '');
  ConfigurarOpcion(  mnuDatDiarioSalidas, True, 'Salidas', '');
  ConfigurarOpcion(  mnuDatDiarioTransitos, True, 'Tr?nsitos', '');
  ConfigurarOpcion(  mnuDatDiarioDesgloseSal, True, 'Desglose Salidas', '');

  ConfigurarOpcion(  mnuDatSepSemanal, DMConfig.EsLosLLanos, '-', 'Semanal');
  ConfigurarOpcion(  mnuDatSemanalEscandallo, DMConfig.EsLosLLanos, 'Escandallo', '');

  ConfigurarOpcion(  mnuDatOtrosEntregas, True, 'Entregas Proveedor', '');
  ConfigurarOpcion(  mnuDatOtrosPedidos, True, 'Pedidos', '');
end;



procedure TFPrincipal.mnuTransmisionClick(Sender: TObject);
begin
  CUAMenuTransmision.EjecutarMenuTransmision( Self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ConfigurarMenuUtilidades;
begin
  ConfigurarOpcion(  mnuUtilidades, True, '&Utilidades', '');

  ConfigurarOpcion(  mnuUtiSepUtilidades, True, '-', 'Utilidades Varias');
  ConfigurarOpcion(  mnuUtiCalculadora, True, 'Calculadora', '');
  ConfigurarOpcion(  mnuUtiCambioDivisas, DMConfig.EsLaFont, 'Cambio Divisas', '');
  ConfigurarOpcion(  mnuUtiConversionDivisa, DMConfig.EsLaFont, 'Conversi?n Divisas', '');
  ConfigurarOpcion(  mnuUtiEuroConversor, DMConfig.EsLaFont, 'Euro Conversor', '');
  ConfigurarOpcion(  mnuUtiCompruebaGastos, DMConfig.EsLaFont, 'Comprobaci?n de Gastos', '');
  ConfigurarOpcion(  mnuUtiSelectImpresoras, True, 'Seleccion de Impresoras', '');
  ConfigurarOpcion(  mnuUtiSelectCuentaCorreo, DMConfig.EsLaFont, 'Selecci?n Cuenta de Correo', '');
  ConfigurarOpcion(  mnuUtiAdministracion, UpperCase( Copy( gsCodigo, 1, 4 ) ) = 'INFO', 'Administraci?n (INFO)', '');
  ConfigurarOpcion(  mnuUtiAcercaDe, True, 'Acerca de ...', '');
  ConfigurarOpcion(  mnuUtiKilosComercializadosMes, DMConfig.EsLaFont, 'Kilos Comercializados Mes', '');
  ConfigurarOpcion(  mnuUtiAux, UpperCase( Copy( gsCodigo, 1, 4 ) ) = 'INFO', 'Programa Auxiliar (INFO) ...', '');
end;


procedure TFPrincipal.mnuCierreClick(Sender: TObject);
begin
  //Comprobar EXCEL
  if TMenuItem( Sender ).Name = 'mniInventario' then
  begin
    CUAMenuAlmacen.EjecutarMenuAlmacen( self, 'mnuAlmResumenInventario' );
  end
  else
  if TMenuItem( Sender ).Name = 'mniGastosCompras' then
  begin
    //SIN FACTURA, Dos listados
    //110 -> coste de la fruta
    //Resto de costes
    CUAMenuCompras.EjecutarMenuCompras( self, 'mnuEntLstFacturasGastosEntregas' );
  end
  else
  if TMenuItem( Sender ).Name = 'mniGastosTransitos' then
  begin
    //SIN FACTURA
    CUAMenuTransitos.EjecutarMenuTransitos( self, 'mnuTraListadoFacturasdeGastosTransitos' );
  end
  else
  if TMenuItem( Sender ).Name = 'mniGastosSalidas' then
  begin
    //SIN FACTURA - TRANSPORTE
    CUAMenuSalidas.EjecutarMenuSalidas( self, 'mnuSalListadoFacturasdeGastosVentas1' );
  end
  else
  if TMenuItem( Sender ).Name = 'mniVentasPendientesFacturar' then
  begin
    CUAMenuFacturacion.EjecutarMenuFacturacion( Self, 'mnuFacAlbaranesFacturadosEn' );
  end;
end;

procedure TFPrincipal.mnuUtilidadesClick(Sender: TObject);

begin
  CUAMenuUtiles.EjecutarMenuUtiles( Self, TMenuItem( Sender ).Name );
end;

procedure TFPrincipal.ACalculadoraExecute(Sender: TObject);
var
  valor: Double;
begin
  ACalculadora.Enabled := false;
  //Se pulso el boton OK
  if (CalculadoraExecute( Valor, Self.Left + 21 , Self.Top + ( Self.Height - 220)  )) then
    //Hay un formulario hijo activo
    if (ActiveMDIChild <> nil) then
      //Hay algun control activo
      if (ActiveMDIChild.ActiveControl <> nil) then
        //Es de texto
        if (ActiveMDIChild.ActiveControl is TBEdit) then
          //Es de Format numerico (Pendiente mejorar componentes)
          if (ActiveMDIChild.ActiveControl as TBEdit).InputType in [itInteger,
            itReal] then
          begin
            if (ActiveMDIChild.ActiveControl as TBEdit).InputType in [itInteger]
              then
              (ActiveMDIChild.ActiveControl as TBEdit).Text := FormatFloat('#0',
                Valor)
            else
              (ActiveMDIChild.ActiveControl as TBEdit).Text :=
                FloatToStr(Valor);
          end;
  ACalculadora.Enabled := true;
end;

procedure TFPrincipal.AConversionDivisasExecute(Sender: TObject);
begin
  with TFDNoEuro.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end
end;

procedure TFPrincipal.AEuroConversorExecute(Sender: TObject);
var
  aux: string;
begin
  aux := DConversor.Execute(self, Date, 'EUR', 'GBP');
  if ActiveMDIChild <> nil then
  begin
    if ActiveMDIChild.ActiveControl is TBEdit then
    begin
      if Trim(aux) <> '' then
        TBEdit(ActiveMDIChild.ActiveControl).Text := aux;
    end;
  end;
end;

end.
