unit CUAMenuSalidas;

interface

uses CUAMenuUtils, CDAMenuUtils, Forms, Dialogs;

procedure EjecutarMenuSalidas( const AForm: TForm; const AOpcion: string );

implementation

uses
  UDMConfig, MSalidas,  LFSalidasCliente, LFSalidas, LFExpediciones, LServiciosTransporteSalidas,
  LFSalidasEnvases2, LFSalidasEnvases, LInformeVentasSemanal, LMercadonaVentasSemanal,
  LFVentas, LFVentasNetoSem, LVentasPorPais, LFVentasMensual,
  CFLComSemVen, AlbaranFacturaSimpleFL,  DAsigDua,
  LCuentasVentaFactura, LCuentasVenta, LFVentasPorCliente, EnvasesFOB, LFFobCalibres,
  ListadoSalidasPaletsForm, LFPromedioVentasNetoProduccion,
  SalidasPorFacturaFL, VentasSuministroFL, SalidasSuministroFL, LFSalidasCatCal,
  MInventarioEnvComerciales, MAjustesEnvComerciales, MEntradasEnvComerciales,
  MTransitosEnvComerciales, LFMovimientosEnvComerciales, LFFacturaLogifruit,
  UFLTablaSalidas, DatosExcelFOB, LFAlbaranesEnviados,
  DEnvioAlbSal, FacturasGastosSalidasFL, ResumenSalidasProductoFL,
  LFComprobacionGastosSalidasBAG, LVentasLineaProductoCliente,
  LSalidasResumenDinamico, UFSalidasLPR, UFMServicioVenta, UFDAsignarGastosServicioVenta, ArticuloDesgloseSal,
  LIntrastat, ListControlIntrasatFL;

//FDEnvioAlbSal := TFDEnvioAlbSal

procedure EjecutarMenuSalidas( const AForm: TForm; const AOpcion: string );
var
  aux: integer;
begin
  CDAMenuUtils.MenuLog( AOpcion );

  if ( AOpcion = 'mnuSalSalidas' ) or ( AOpcion = 'btnSalidas' ) then
  begin
    FMSalidas := TFMSalidas.create(AForm)
  end
  else
  if AOpcion = 'mnuDesgloseSalidas' then     CrearVentana ( AForm, TFArticuloDesgloseSal );
  if AOpcion = 'mnuSalLisAlbaranesEnviados' then CrearVentana( AForm, TFLAlbaranesEnviados ) else
  if AOpcion = 'mnuSalEnvioAlbaranes' then  FDEnvioAlbSal := TFDEnvioAlbSal.create(AForm) else
  if AOpcion = 'mnuTablaDinamicaSalidas' then CrearVentana( AForm, TFLTablaSalidas ) else
  if AOpcion = 'mnuSalLisSalidasClientes' then CrearVentana( AForm, TFLSalidasCliente ) else
  if AOpcion = 'mnuSalLisSalidasProductos' then FLSalidas := TFLSalidas.Create(AForm) else
  if AOpcion = 'mnuSalResumendeSalidasporProducto' then FLResumenSalidasProducto := TFLResumenSalidasProducto.Create(AForm) else
  if AOpcion = 'mnuSalLisSalidasCategoriaCalibre' then CrearVentana( AForm, TFLSalidasCatCal ) else
  if AOpcion = 'mnuSalLisSalidasPalet' then CrearVentana( AForm, TFListadoSalidasPaletsForm ) else

  if AOpcion = 'mnuSalServiciosTransporteImporte' then
  begin
    TFLServiciosTransporteSalidas.Create( AForm ).TipoImporte( 0 );
    //CrearVentana( AForm, TFLServiciosTransporteSalidas ) else
  end
  else
  if AOpcion = 'mnuSalServiciosTransporteTransporte' then
  begin
    TFLServiciosTransporteSalidas.Create( AForm ).TipoImporte( 1 );
    //CrearVentana( AForm, TFLServiciosTransporteSalidas ) else
  end
  else
  if AOpcion = 'mnuSalResSalidasEnvase' then CrearVentana( AForm, TFLSalidasEnvases2 ) else

  if AOpcion = 'mnuSalInventarioEnvComer' then CrearVentana( AForm, TFMInventarioEnvComerciales ) else
  if AOpcion = 'mnuSalAjustesInventarioEnvComer' then CrearVentana( AForm, TFMAjustesEnvComerciales ) else
  if AOpcion = 'mnuSalEntradasEnvComer' then CrearVentana( AForm, TFMEntradasEnvComerciales ) else
  if AOpcion = 'mnuSalTransitosEnvComer' then CrearVentana( AForm, TFMTransitosEnvComerciales ) else
  if AOpcion = 'mnuSalListadoEnvasesComerciales' then CrearVentana( AForm, TFLSalidasEnvases ) else
  if AOpcion = 'mnuSalMovimientosEnvasesComerciales' then CrearVentana( AForm, TFLMovimientosEnvComerciales ) else
  if AOpcion = 'mnuSalFacturaLogifruit' then CrearVentana( AForm, TFLFacturaLogifruit ) else

  if AOpcion = 'mnuSalVentasSemEnvases' then CrearVentana( AForm, TFLInformeVentasSemanal ) else
  if AOpcion = 'mnuSalVentasSemMercadona' then CrearVentana( AForm, TFLMercadonaVentasSemanal ) else
  if AOpcion = 'mnuSalVentasSuministro' then CrearVentana( AForm, TFLVentasSuministro ) else
  if AOpcion = 'mnuSalVentasBruto' then FLVentas := TFLVentas.Create(Application) else
  if AOpcion = 'mnuSalVentasSemanal' then CrearVentana( AForm, TFLVentasSem ) else
  if AOpcion = 'mnuSalVentasPais' then CrearVentana( AForm, TFLVentasPorPais ) else
  if AOpcion = 'mnuSalVentasMensuales' then CrearVentana( AForm, TFLVentasMensual ) else
  if AOpcion = 'mnuSalComparativaVentas' then CrearVentana( AForm, TDFLComSemVen ) else
  if AOpcion = 'mnuSalFacturasAlbaran' then CrearVentana( AForm, TFLAlbaranFacturaSimple ) else
  if AOpcion = 'mnuSalSalidasFactura' then CrearVentana( AForm, TFLSalidasPorFactura ) else
  if AOpcion = 'mnuSalCuentaVentasSinFacturar' then
  begin
    aux := AForm.Tag;
    AForm.Tag := 1; // 1 -> Por cliente
              // 0 -> Por factura
    TFLCuentasVenta.Create( AForm );
    AForm.Tag := aux;
  end
  else
  if AOpcion = 'mnuSalCuentaVentasFacturadas' then CrearVentana( AForm, TFLCuentasVentaFactura ) else
  if ( AOpcion = 'mnuSalFOBCliente' ) then FLventasporcliente := TFLventasporcliente.Create(Application) else
  if ( AOpcion = 'mnuSalFOBEnvases' )then CrearVentana( AForm, TFEnvasesFOB ) else
  if ( AOpcion = 'mnuSalFOBCalibres' ) then CrearVentana( AForm, TFFobCalibres ) else
  if AOpcion = 'mnuSalSemanalExpediciones' then CrearVentana( AForm, TFLExpediciones ) else
  if AOpcion = 'mnuSalInformeIntrastat' then CrearVentana( AForm, TFLIntrastat ) else
  if AOpcion = 'mnuSalControlIntrastat' then CrearVentana( AForm, TFLListControlIntrasat ) else
  if AOpcion = 'mnuSalAsignarDUA' then CrearVentana( AForm, TFDAsigDua ) else
  if AOpcion = 'mnuSalPromedioVentasProduccion' then CrearVentana( AForm, TFLPromedioVentasNetoProduccion ) else
  if AOpcion = 'mnuSalListadoMercadona' then CrearVentana( AForm, TFLSalidasSuministro ) else
  if AOpcion = 'mnuSalFOBTabla' then CrearVentana( AForm, TFDatosExcelFOB ) else
  if AOpcion = 'mnuSalFacGasVentas' then CrearVentana( AForm, TFLFacturasGastosSalidas ) else
  if AOpcion = 'mnuSalFacControlGasVentas' then CrearVentana( AForm, TFLComprobacionGastosSalidasBAG )else
  if AOpcion = 'mnuSalResumenFOB' then CrearVentana( AForm, TFLVentasLineaProductoCliente )else
  if AOpcion = 'mnuSalResumenSalidasDinamico' then CrearVentana( AForm, TFLSalidasResumenDinamico );
  if AOpcion = 'mnuSalSalidasLPR' then CrearVentana( AForm, TFSalidasLPR );
  if AOpcion = 'mnuSalGrabarGastosTransporte' then CrearVentana( AForm, TFMServicioVenta );
  if AOpcion = 'mnuSalAsignarGastosTransportes' then CrearVentana( AForm, TFDAsignarGastosServicioVenta ) else

end;

end.
