object FPrincipal: TFPrincipal
  Left = 102
  Top = 305
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Principal'
  ClientHeight = 681
  ClientWidth = 1008
  Color = 4210816
  Constraints.MaxHeight = 864
  Constraints.MaxWidth = 1152
  Constraints.MinHeight = 640
  Constraints.MinWidth = 800
  ParentFont = True
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MenuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CBControlBarras: TControlBar
    Left = 0
    Top = 0
    Width = 1008
    Height = 57
    Align = alTop
    Anchors = [akTop, akRight]
    AutoDrag = False
    BevelEdges = []
    Color = clBtnFace
    DockSite = False
    ParentColor = False
    RowSnap = False
    TabOrder = 0
    object TBBarraMaestro: TToolBar
      Left = 11
      Top = 2
      Width = 414
      Height = 22
      ButtonWidth = 24
      Caption = 'TBBarraMaestro'
      Images = DMBaseDatos.ImgBarraHerramientas
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      object TBMaestroLocalizar: TToolButton
        Left = 0
        Top = 0
        Action = AMLocalizar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroModificar: TToolButton
        Left = 24
        Top = 0
        Action = AMModificar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroBorrar: TToolButton
        Left = 48
        Top = 0
        Action = AMBorrar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroAltas: TToolButton
        Left = 72
        Top = 0
        Action = AMAltas
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroSeparador1: TToolButton
        Left = 96
        Top = 0
        Width = 24
        Caption = 'TBMaestroSeparador1'
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object ToolButton3: TToolButton
        Left = 120
        Top = 0
        Action = AIPrevisualizar
      end
      object ToolButton1: TToolButton
        Left = 144
        Top = 0
        Width = 24
        Caption = 'ToolButton1'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object TBMaestroPrimero: TToolButton
        Left = 168
        Top = 0
        Action = AMPrimero
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroAnterior: TToolButton
        Left = 192
        Top = 0
        Action = AMAnterior
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroSiguiente: TToolButton
        Left = 216
        Top = 0
        Action = AMSiguiente
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroUltimo: TToolButton
        Left = 240
        Top = 0
        Action = AMUltimo
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroSeparador2: TToolButton
        Left = 264
        Top = 0
        Width = 24
        Caption = 'TBMaestroSeparador2'
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object TBMaestroAceptar: TToolButton
        Left = 279
        Top = 0
        Action = AMDAceptar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroCancelar: TToolButton
        Left = 312
        Top = 0
        Action = AMDCancelar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroSeparador3: TToolButton
        Left = 336
        Top = 0
        Width = 24
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object TBMaestroSalir: TToolButton
        Left = 360
        Top = 0
        Action = AMDSalir
        ParentShowHint = False
        ShowHint = True
      end
    end
    object TBBarraMaestroDetalle: TToolBar
      Left = 12
      Top = 28
      Width = 585
      Height = 22
      ButtonWidth = 24
      Caption = 'TBBarraMaestroDetalle'
      Images = DMBaseDatos.ImgBarraHerramientas
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Wrapable = False
      object TBMaestroDetalleLocalizarMaestro: TToolButton
        Left = 0
        Top = 0
        Action = AMLocalizar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleModificarMaestro: TToolButton
        Left = 24
        Top = 0
        Action = AMModificar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleBorrarMaestro: TToolButton
        Left = 48
        Top = 0
        Action = AMBorrar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleAltasMaestro: TToolButton
        Left = 72
        Top = 0
        Action = AMAltas
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleSeparador3: TToolButton
        Left = 96
        Top = 0
        Width = 24
        Caption = 'TBMaestroDetalleSeparador3'
        ImageIndex = 25
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object TBMaestroDetalleModificarDetalle: TToolButton
        Left = 120
        Top = 0
        Action = ADModificar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleBorrarDetalle: TToolButton
        Left = 144
        Top = 0
        Action = ADBorrar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleAltasDetalle: TToolButton
        Left = 168
        Top = 0
        Action = ADAltas
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleSeparador1: TToolButton
        Left = 192
        Top = 0
        Width = 24
        Caption = 'TBMaestroDetalleSeparador1'
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object ToolButton6: TToolButton
        Left = 216
        Top = 0
        Action = AIPrevisualizar
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 240
        Top = 0
        Width = 24
        Caption = 'ToolButton4'
        ImageIndex = 19
        Style = tbsDivider
      end
      object TBMaestroDetallePrimero: TToolButton
        Left = 264
        Top = 0
        Action = AMPrimero
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleAnterior: TToolButton
        Left = 288
        Top = 0
        Action = AMAnterior
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleSiguiente: TToolButton
        Left = 312
        Top = 0
        Action = AMSiguiente
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleUltimo: TToolButton
        Left = 336
        Top = 0
        Action = AMUltimo
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleSeparador5: TToolButton
        Left = 360
        Top = 0
        Width = 24
        Caption = 'TBMaestroDetalleSeparador5'
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object TBMaestroDetalleSeparador2: TToolButton
        Left = 384
        Top = 0
        Width = 24
        Caption = 'TBMaestroDetalleSeparador2'
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object TBMaestroDetalleArriba: TToolButton
        Left = 408
        Top = 0
        Action = ADAnterior
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleAbajo: TToolButton
        Left = 432
        Top = 0
        Action = ADSiguiente
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleSeparador4: TToolButton
        Left = 456
        Top = 0
        Width = 24
        Caption = 'TBMaestroDetalleSeparador4'
        ParentShowHint = False
        ShowHint = True
        Style = tbsDivider
      end
      object TBMaestroDetalleAceptar: TToolButton
        Left = 480
        Top = 0
        Action = AMDAceptar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleCancelar: TToolButton
        Left = 504
        Top = 0
        Action = AMDCancelar
        ParentShowHint = False
        ShowHint = True
      end
      object TBMaestroDetalleSalir: TToolButton
        Left = 528
        Top = 0
        Action = AMDSalir
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object PEstado: TPanel
    Left = 0
    Top = 659
    Width = 1008
    Height = 22
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 56
      Height = 22
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 56
        Height = 33
        Caption = 'ToolBar1'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object ToolButton7: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object ToolButton2: TToolButton
          Left = 8
          Top = 0
          Hint = 'Calculadora'
          Caption = 'Calculadora'
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          OnClick = ACalculadoraExecute
        end
        object ToolButton5: TToolButton
          Left = 31
          Top = 0
          Hint = 'Euroconversor'
          Caption = 'Euro Conversor'
          ImageIndex = 8
          OnClick = AEuroConversorExecute
        end
      end
    end
    object Panel3: TPanel
      Left = 56
      Top = 0
      Width = 952
      Height = 22
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object SBBarraEstado: TStatusBar
        Left = 0
        Top = 0
        Width = 952
        Height = 22
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Panels = <
          item
            Alignment = taCenter
            Width = 140
          end
          item
            Alignment = taCenter
            Width = 80
          end
          item
            Width = 18
          end>
        UseSystemFont = False
      end
    end
  end
  object barAplicaciones: TToolBar
    Left = 0
    Top = 57
    Width = 59
    Height = 602
    Align = alLeft
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 51
    Caption = 'barAplicaciones'
    Color = clBtnFace
    Images = DMBaseDatos.ImgBotones
    ParentColor = False
    ShowCaptions = True
    TabOrder = 1
    Transparent = False
    Visible = False
    object btnEntradas: TToolButton
      Left = 0
      Top = 0
      Caption = 'Entradas'
      ImageIndex = 13
      Wrap = True
      OnClick = mnuEntradasClick
    end
    object btnEntregas: TToolButton
      Left = 0
      Top = 36
      Caption = 'Entregas'
      ImageIndex = 13
      Wrap = True
      OnClick = mnuComprasClick
    end
    object btnTransitos: TToolButton
      Left = 0
      Top = 72
      Caption = 'Tr'#225'nsitos'
      ImageIndex = 11
      Wrap = True
      OnClick = mnuTransitosClick
    end
    object btnSalidas: TToolButton
      Left = 0
      Top = 108
      Caption = 'Salidas'
      ImageIndex = 12
      OnClick = mnuSalidasClick
    end
    object ToolButton10: TToolButton
      Left = 0
      Top = 108
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 6
      Wrap = True
      Style = tbsSeparator
    end
  end
  object MenuPrincipal: TMainMenu
    AutoLineReduction = maManual
    BiDiMode = bdLeftToRight
    Images = DMBaseDatos.ImgBarraHerramientas
    OwnerDraw = True
    ParentBiDiMode = False
    Left = 80
    Top = 168
    object mnuFicheros: TMenuItem
      Caption = 'Fi&cheros'
      object mnuFchSep: TMenuItem
        Caption = '-'
        Hint = 'Ficheros Maestros'
      end
      object mnuFchAduanasPuertos: TMenuItem
        Caption = 'Aduanas/Puertos'
        OnClick = mnuFicherosClick
      end
      object mnuFchBancos: TMenuItem
        Caption = 'Bancos'
        OnClick = mnuFicherosClick
      end
      object mnuFchCentros: TMenuItem
        Caption = 'Centros'
        OnClick = mnuFicherosClick
      end
      object mnuFchSubClientes: TMenuItem
        Caption = 'Clientes'
        object mnuFchClientes: TMenuItem
          Caption = 'Clientes'
          OnClick = mnuFicherosClick
        end
        object mnuFchTipoCliente: TMenuItem
          Caption = 'Tipo Cliente'
          OnClick = mnuFicherosClick
        end
        object mnuFchRepresentantes: TMenuItem
          Caption = 'Representantes'
          OnClick = mnuFicherosClick
        end
        object mnuFchClientesEDI: TMenuItem
          Caption = 'C'#243'digos EDI de Clientes'
          OnClick = mnuFicherosClick
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object mnuFchListadoComisiones: TMenuItem
          Caption = 'Listado Descuentos y Comisones'
          OnClick = mnuFicherosClick
        end
        object mnuFchListadoDatosCobroCliente: TMenuItem
          Caption = 'Listado Datos Cobro Cliente'
          OnClick = mnuFicherosClick
        end
      end
      object mnuFchComerciales: TMenuItem
        Caption = 'Comerciales'
        OnClick = mnuFicherosClick
      end
      object mnuFchCosecheros: TMenuItem
        Caption = 'Cosecheros'
        Hint = 'Mantenimiento de los cosecheros.'
        OnClick = mnuFicherosClick
      end
      object mnuFchEmpresas: TMenuItem
        Caption = 'Empresas'
        Hint = 'Mantenimiento de las empresas.'
        OnClick = mnuFicherosClick
      end
      object Envases1: TMenuItem
        Caption = 'Art'#237'culos'
        object mnuFchEnvases: TMenuItem
          Caption = 'Art'#237'culos'
          OnClick = mnuFicherosClick
        end
        object mnuFchEnvasesComerciales: TMenuItem
          Caption = 'Envases Comerciales'
          OnClick = mnuFicherosClick
        end
        object mnuFchTiposdeCaja: TMenuItem
          Caption = 'Tipos de Cajas'
          OnClick = mnuFicherosClick
        end
        object mnuFchEan13: TMenuItem
          Caption = 'C'#243'digos EAN13'
          OnClick = mnuFicherosClick
        end
        object mnuFchAgrupacionesComerciales: TMenuItem
          Caption = 'Agrupaciones Comerciales'
          OnClick = mnuFicherosClick
        end
        object mnuFchAgrupacionesEnvase: TMenuItem
          Caption = 'Agrupaciones Art'#237'culo'
          OnClick = mnuFicherosClick
        end
        object mnuFchUnidadesConsumo: TMenuItem
          Caption = 'Unidades de Consumo'
          OnClick = mnuFicherosClick
        end
        object mnuFchTipoPalets: TMenuItem
          Caption = 'Tipo de Palets'
          OnClick = mnuFicherosClick
        end
        object mnuFchFormatosPalet: TMenuItem
          Caption = 'Formatos Palet'
          OnClick = mnuFicherosClick
        end
        object mnuFchPesosCentro: TMenuItem
          Caption = 'Pesos de Cajas y Palets'
          OnClick = mnuFicherosClick
        end
      end
      object mnuFchFederaciones: TMenuItem
        Caption = 'Federaciones'
        OnClick = mnuFicherosClick
      end
      object mnuFchFlotaCamiones: TMenuItem
        Caption = 'Flota de Camiones'
        OnClick = mnuFicherosClick
      end
      object mnuFchFormasPago: TMenuItem
        Caption = 'Formas de Pago'
        OnClick = mnuFicherosClick
      end
      object mnuFchImpuestos: TMenuItem
        Caption = 'Gesti'#243'n de Impuestos'
        OnClick = mnuFicherosClick
      end
      object mnuFchMarcas: TMenuItem
        Caption = 'Marcas'
        OnClick = mnuFicherosClick
      end
      object mnuFchMonedas: TMenuItem
        Caption = 'Monedas'
        OnClick = mnuFicherosClick
      end
      object mnuFchPaises: TMenuItem
        Caption = 'Pa'#237'ses'
        OnClick = mnuFicherosClick
      end
      object mnuFchPlantaciones: TMenuItem
        Caption = 'Plantaciones'
        OnClick = mnuFicherosClick
      end
      object mnuFchProductos: TMenuItem
        Caption = 'Productos'
        OnClick = mnuFicherosClick
      end
      object mnuFchProveedores: TMenuItem
        Caption = 'Proveedores'
        OnClick = mnuFicherosClick
      end
      object mnuFchProvincias: TMenuItem
        Caption = 'Provincias'
        OnClick = mnuFicherosClick
      end
      object mnuFchSeccionesContables: TMenuItem
        Caption = 'Secciones Contables'
        OnClick = mnuFicherosClick
      end
      object mnuFchTipoGastos: TMenuItem
        Caption = 'Tipo de Gastos'
        OnClick = mnuFicherosClick
      end
      object mnuFchTiposVia: TMenuItem
        Caption = 'Tipo de V'#237'as'
        Hint = 'Mantenimiento de los tipos de v'#237'a.'
        OnClick = mnuFicherosClick
      end
      object mnuFchTransportistasMante: TMenuItem
        Caption = 'Transportistas - Mantenimiento'
        OnClick = mnuFicherosClick
      end
    end
    object mnuEntradas: TMenuItem
      Caption = '&Entradas'
      OnClick = mnuEntradasClick
      object mnuEntSepEntradas: TMenuItem
        Caption = '-'
        Hint = 'Entradas'
      end
      object mnuEntEntradas: TMenuItem
        Caption = 'Entradas de Fruta'
        OnClick = mnuEntradasClick
      end
      object mnuEntDetalleEntradas: TMenuItem
        Caption = 'Detalle Entradas'
        OnClick = mnuEntradasClick
      end
      object mnuEntLstEntradasCosecheros: TMenuItem
        Caption = 'Listado Entradas por Cosecheros'
        OnClick = mnuEntradasClick
      end
      object mnuEntResEntradasCosecheros: TMenuItem
        Caption = 'Resumen por Cosechero'
        OnClick = mnuEntradasClick
      end
      object mnuEntResEntradasTransportistas: TMenuItem
        Caption = 'Resumen por Transporte'
        OnClick = mnuEntradasClick
      end
      object mnuEntresServiciosTransportistas: TMenuItem
        Caption = 'Resumen Servicios por Transportista'
        OnClick = mnuEntradasClick
      end
      object mnuEntEntradasRecoleccion: TMenuItem
        Caption = 'Resumen de Entradas en Recolecci'#243'n'
        OnClick = mnuEntradasClick
      end
      object mnuEntResProductividad: TMenuItem
        Caption = 'Resumen Productividad'
        OnClick = mnuEntradasClick
      end
      object mnuEntResProductividadProducto: TMenuItem
        Caption = 'Resumen Productividad por Producto'
        OnClick = mnuEntradasClick
      end
      object mnuEntSepSGP: TMenuItem
        Caption = '-'
      end
      object mnuEntTransferirSGP: TMenuItem
        Caption = 'Transferir Entradas SGP'
        OnClick = mnuEntradasClick
      end
      object mnuEntSepEscandallos: TMenuItem
        Caption = '-'
      end
      object mnuEntResumenProduccion: TMenuItem
        Caption = 'Resumen Producci'#243'n'
        OnClick = mnuEntradasClick
      end
      object mnuEntEscandallos: TMenuItem
        Caption = 'Mantenimiento de Escandallos'
        OnClick = mnuEntradasClick
      end
      object mnuEntListEscandallos: TMenuItem
        Caption = 'Listado de Escandallos'
        OnClick = mnuEntradasClick
      end
      object mnuEntVerificarEscandallos: TMenuItem
        Caption = 'Verificar Grabaci'#243'n de Escandallos'
        OnClick = mnuEntradasClick
      end
    end
    object mnuComprasProveedor: TMenuItem
      Caption = '&Compras'
      object mnuEntSepCompas: TMenuItem
        Caption = '-'
      end
      object mnuEntFacturasPlatano: TMenuItem
        Caption = 'Facturas Pl'#225'tano'
        OnClick = mnuComprasClick
      end
      object mnuEntEntregas_SAT: TMenuItem
        Caption = 'Compras con Entradas asociadas'
        OnClick = mnuComprasClick
      end
      object mnuEntSepComprasEntregas: TMenuItem
        Caption = '-'
      end
      object mnuEntEntregas: TMenuItem
        Caption = 'Entregas de Proveedor'
        OnClick = mnuComprasClick
      end
      object mnuEntLstEntregas: TMenuItem
        Caption = 'Listado Entregas Proveedor'
        OnClick = mnuComprasClick
      end
      object mnuEntLstControlEntregas: TMenuItem
        Caption = 'Listado Control de Entregas'
        OnClick = mnuComprasClick
      end
      object mnuEntResEntregas: TMenuItem
        Caption = 'Resumen Entregas Proveedor'
        OnClick = mnuComprasClick
      end
      object mnuEntResPesosEntregas: TMenuItem
        Caption = 'Resumen Pesos Entregas'
        OnClick = mnuComprasClick
      end
      object mnuEntLstGastosEntregas: TMenuItem
        Caption = 'Listado Gastos de Entregas'
        OnClick = mnuComprasClick
      end
      object mnuEntLstControlGastosEntregas: TMenuItem
        Caption = 'Listado de Entregas sin Gastos'
        OnClick = mnuComprasClick
      end
      object mnuEntResumenCosteProductoBonde: TMenuItem
        Caption = 'Resumen Coste Entregas por Producto (Bondelicious)'
        OnClick = mnuComprasClick
      end
      object mnuEntResumenCosteProveedorBonde: TMenuItem
        Caption = 'Resumen Coste Entregas por Proveedor (Bondelicious)'
        OnClick = mnuComprasClick
      end
      object mnuEntServiciosTransportes: TMenuItem
        Caption = 'Resumen Servicios por Transportista'
        OnClick = mnuComprasClick
      end
      object mnuEntSepStockAlmacen: TMenuItem
        Caption = '-'
      end
      object mnuEntPendientesDescarga: TMenuItem
        Caption = 'Entregas Pendientes de Descargar'
        OnClick = mnuComprasClick
      end
      object mnuEntStockActualProveedor: TMenuItem
        Caption = 'Stock Actual Proveedor'
        OnClick = mnuComprasClick
      end
      object mnuEntValorFrutaPlantaProveedor: TMenuItem
        Caption = 'Valorar Fruta Proveedor en Planta'
        OnClick = mnuComprasClick
      end
      object mnuStockFrutaConfeccionadaFormatos: TMenuItem
        Caption = 'Stock Fruta Confeccionada Por Formatos'
        OnClick = mnuComprasClick
      end
      object mnuStockFrutaConfeccionadaEnvases: TMenuItem
        Caption = 'Stock Fruta Confeccionada Por Envases'
        OnClick = mnuComprasClick
      end
      object mnuEntSepFacturasCompras: TMenuItem
        Caption = '-'
      end
      object mnuEntLstFacturasProveedorNew: TMenuItem
        Caption = 'Listado Facturas Proveedor'
        OnClick = mnuComprasClick
      end
      object mnuEntEntregasSinFacturar: TMenuItem
        Caption = 'Entregas Sin Facturar'
        OnClick = mnuComprasClick
      end
      object mnuEntControlImportesFacturasLineas: TMenuItem
        Caption = 'Control Importes Facturas / Lineas'
        OnClick = mnuComprasClick
      end
      object mnuEntResumenCosteProducto: TMenuItem
        Caption = 'Resumen Coste Entregas por Producto (La font)'
        OnClick = mnuComprasClick
      end
      object mnuEntResumenCosteProveedor: TMenuItem
        Caption = 'Resumen Coste Entregas por Proveedor (La font)'
        OnClick = mnuComprasClick
      end
      object mnuEntComprasProductoProveedor: TMenuItem
        Caption = 'Resumen Compras Producto/Proveedor'
        OnClick = mnuComprasClick
      end
      object mnuEntSepIntrastat: TMenuItem
        Caption = '-'
      end
      object mnuEntControlIntrastat: TMenuItem
        Caption = 'Control Intrastat'
        OnClick = mnuComprasClick
      end
      object mnuEntIntrasat: TMenuItem
        Caption = 'Intrastat'
        OnClick = mnuComprasClick
      end
      object mnuEntSepLiquidacion: TMenuItem
        Caption = '-'
      end
      object mnuEntValorarStockProveedor: TMenuItem
        Caption = 'Valorar Stock Proveedor'
        OnClick = mnuComprasClick
      end
      object mnuEntValorarStockConfeccionado: TMenuItem
        Caption = 'Valorar Stock Confeccionado'
        OnClick = mnuComprasClick
      end
      object mnuEntSepRecepcion: TMenuItem
        Caption = '-'
      end
      object mnuEntRecibirEntregas: TMenuItem
        Caption = 'Recepci'#243'n Entregas Pendientes'
        OnClick = mnuComprasClick
      end
    end
    object mnuTransitos: TMenuItem
      Caption = '&Tr'#225'nsitos'
      OnClick = mnuTransitosClick
      object mnuTraSepTransistos: TMenuItem
        Caption = '-'
        Hint = 'Gesti'#243'n de Tr'#225'nsitos'
      end
      object mnuTraTransitos: TMenuItem
        Caption = 'Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
      object mnuTraLisTransitos: TMenuItem
        Caption = 'Listado de Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
      object mnuTraLisEnvasesTransitos: TMenuItem
        Caption = 'Resumen de Art'#237'culos de Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
      object mnuTraListEntradaTransitos: TMenuItem
        Caption = 'Listado Entrada Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
      object mnuTraConsultaTransitos: TMenuItem
        Caption = 'Consulta de Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
      object mnuTraAsignarKilosTransitos: TMenuItem
        Caption = 'Asignar Kilos de Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
      object mnuTraLisControlTransitos: TMenuItem
        Caption = 'Listado Control de Tr'#225'nsito'
        OnClick = mnuTransitosClick
      end
      object mnuTraServiciosTransportistas: TMenuItem
        Caption = 'Resumen Servicios por Transportista'
        OnClick = mnuTransitosClick
      end
      object mnuTraListadoFacturasdeGastosTransitos: TMenuItem
        Caption = 'Listado Facturas de Gastos Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
      object mnuTraSepDeposito: TMenuItem
        Caption = '-'
        Hint = 'Dep'#243'sito de Aduanas'
      end
      object mnuTraListadoDepositoAduanas: TMenuItem
        Caption = 'Listado Dep'#243'sito Aduanas'
        OnClick = mnuTransitosClick
      end
      object mnuTraLFacturasTransportesDeposito: TMenuItem
        Caption = 'Listado Facturas Transportes Dep'#243'sito Aduanas'
        OnClick = mnuTransitosClick
      end
      object mnuTraCrearFicherosAplicacionAtlantis: TMenuItem
        Caption = 'Crear Ficheros Aplicaci'#243'n Atlantis'
        OnClick = mnuTransitosClick
      end
      object mnuTraSepPOSEI: TMenuItem
        Caption = '-'
      end
      object mnuTraCalculoAyudaPOSEI: TMenuItem
        Caption = 'Calculo Ayuda POSEI'
        OnClick = mnuTransitosClick
      end
      object mnuTraInformeAyudaPOSEI: TMenuItem
        Caption = 'Informe Ayuda POSEI'
        OnClick = mnuTransitosClick
      end
      object mnuTraSepRecepcionTransitos: TMenuItem
        Caption = '-'
        Hint = 'Recepci'#243'n de Tr'#225'nsitos'
      end
      object mnuTraRecepcionTransitos: TMenuItem
        Caption = 'Recepci'#243'n de Tr'#225'nsitos'
        OnClick = mnuTransitosClick
      end
    end
    object mnuAlmacen: TMenuItem
      Caption = '&Almac'#233'n'
      OnClick = mnuAlmacenClick
      object mnuAlmSepPreciosDiarios: TMenuItem
        Caption = '-'
        Hint = 'Precios Diarios'
      end
      object mnuAlmPrecioVentaCliente: TMenuItem
        Caption = 'Precio Venta por Cliente y Articulo'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmPreciosDiariosrEnvases: TMenuItem
        Caption = 'Precios Diarios por Envase'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmSepAlmacen: TMenuItem
        Caption = '-'
        Hint = 'Gesti'#243'n del Inventario'
      end
      object mnuAlmInventario: TMenuItem
        Caption = 'Inventario de Almac'#233'n'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmResumenInventario: TMenuItem
        Caption = 'Resumen de Inventarios'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmConfeccionadoEnvases: TMenuItem
        Caption = 'Confeccionado por Art'#237'culos'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmConfeccionadoAgrupacion: TMenuItem
        Caption = 'Confeccionado por Agrupaci'#243'n'
        OnClick = mnuAlmacenClick
      end
      object mnuParteProduccion: TMenuItem
        Caption = 'Parte de Producci'#243'n'
        OnClick = mnuAlmacenClick
      end
      object mnuLiqAjusteEntradas: TMenuItem
        Caption = 'V2 .- Calculo merma y ajustes entradas'
        OnClick = mnuAlmacenClick
      end
      object mnuLiqAprovechaEntradas: TMenuItem
        Caption = 'V2 .- Aprovechamientos Entradas'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmSepCosteEnvase: TMenuItem
        Caption = '-'
        Hint = 'Coste Envases'
      end
      object mnuAlmCostesEnvase: TMenuItem
        Caption = 'Costes del Art'#237'culo'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmVerificarCosteEnvases: TMenuItem
        Caption = 'Verificar Grabaci'#243'n Costes Envase'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmLstCosteEnvase: TMenuItem
        Caption = 'Listado Importes Costes de Envasado'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmLstCosteEnvaseKg: TMenuItem
        Caption = 'Listado Costes Estadisticos de Envasado por KG'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmTablaCostesEnvasado: TMenuItem
        Caption = 'Tabla Anual Costes Envasados'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmSepPesosCIndirectos: TMenuItem
        Caption = '-'
      end
      object mnuAlmTipoEntregas: TMenuItem
        Caption = 'Tipo de Entradas'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmCostesIndirectos: TMenuItem
        Caption = 'Costes Indirectos'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmSepSobrepesos: TMenuItem
        Caption = '-'
        Hint = 'Sobrepeso Envases'
      end
      object mnuAlmSobrepesoEnvase: TMenuItem
        Caption = 'Sobrepeso del Envase'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmVerificarGrabacionEnvasado: TMenuItem
        Caption = 'Verificar la Grabaci'#243'n del Sobrepeso'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmSopresesosActuales: TMenuItem
        Caption = 'Sopresesos Actuales'
        OnClick = mnuAlmacenClick
      end
      object mnuAlmSobrepesosPeriodo: TMenuItem
        Caption = 'Sobrepesos Periodo'
        OnClick = mnuAlmacenClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuExistenciasPuntoLame: TMenuItem
        Caption = 'Listado Existencias Punto LAME'
        OnClick = mnuAlmacenClick
      end
    end
    object mnuLiquidacion: TMenuItem
      Caption = '&Liquidaci'#243'n'
      OnClick = mnuLiquidacionClick
      object mnuLiqSepLiquidacion: TMenuItem
        Caption = '-'
      end
      object mnuProcesoLiquidacion: TMenuItem
        Caption = 'V2 .- C'#225'lculo Semanal Liquidaci'#243'n '
        OnClick = mnuLiquidacionClick
      end
      object mnuInformesLiquidacion: TMenuItem
        Caption = 'Detalle Liquidaci'#243'n'
        OnClick = mnuLiquidacionClick
      end
      object mnuLiquidacionMensual: TMenuItem
        Caption = 'Resumen Liquidaci'#243'n'
        OnClick = mnuLiquidacionClick
      end
      object mnuLiquidacionMensual2: TMenuItem
        Caption = 'V2 .- NEW -> Proceso Liquidaci'#243'n Mensual'
        OnClick = mnuLiquidacionClick
      end
    end
    object mnuPedidos: TMenuItem
      Caption = '&Pedidos'
      object mnuPedSepPedidos: TMenuItem
        Caption = '-'
        Hint = 'Gesti'#243'n de Pedidos'
      end
      object mnuPedAccesoWeb: TMenuItem
        Caption = 'Proceso de Pedidos Aplicaci'#243'n WEB'
        OnClick = mnuPedidosClick
      end
      object mnuPedConfirmaRecepcion: TMenuItem
        Caption = 'Confirmaci'#243'n de Recepci'#243'n de Mercanc'#237'as En Mercadona'
        OnClick = mnuPedidosClick
      end
    end
    object mnuSalidas: TMenuItem
      Caption = '&Salidas'
      OnClick = mnuSalidasClick
      object mnuSalSepSalidas: TMenuItem
        Caption = '-'
        Hint = 'Gesti'#243'n Salidas'
      end
      object mnuSalSalidas: TMenuItem
        Caption = 'Salidas'
        OnClick = mnuSalidasClick
      end
      object mnuDesgloseSalidas: TMenuItem
        Caption = 'Desglose Articulo / Salida'
        OnClick = mnuSalidasClick
      end
      object mnuSalTablaSalidas: TMenuItem
        Caption = 'Listado Tabular de Salidas'
        OnClick = mnuSalidasClick
      end
      object mnuSalResumenSalidasDinamico: TMenuItem
        Caption = 'Resumen Salidas Dinamico'
        OnClick = mnuSalidasClick
      end
      object mnuSalEnvioAlbaranes: TMenuItem
        Caption = 'Env'#237'o de Albaranes por Correo Electr'#243'nico'
        OnClick = mnuSalidasClick
      end
      object mnuSalLisAlbaranesEnviados: TMenuItem
        Caption = 'Listado de Albaranes Enviados'
        OnClick = mnuSalidasClick
      end
      object mnuSalLisSalidasClientes: TMenuItem
        Caption = 'Listado de Salidas por Cliente'
        OnClick = mnuSalidasClick
      end
      object mnuSalLisSalidasProductos: TMenuItem
        Caption = 'Listado de Salidas por Producto'
        OnClick = mnuSalidasClick
      end
      object mnuSalLisSalidasCategoria: TMenuItem
        Caption = 'Listado Salidas por Categoria y Calibre'
        OnClick = mnuSalidasClick
      end
      object mnuSalLisSalidasPalet: TMenuItem
        Caption = 'Listado de Salidas por Palet'
        OnClick = mnuSalidasClick
      end
      object mnuSalResumenAlmacen: TMenuItem
        Caption = 'Resumen de Almac'#233'n'
        OnClick = mnuSalidasClick
      end
      object Gastos1: TMenuItem
        Caption = 'Gastos Transporte'
        object mnuSalGrabarGastosTransportes: TMenuItem
          Caption = 'Grabar Gastos Transportes'
          OnClick = mnuSalidasClick
        end
        object mnuSalAsignarGastosTransportes: TMenuItem
          Caption = 'Asignar Gastos Transportes'
          OnClick = mnuSalidasClick
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object mnuSalListadoFacturasdeGastosVentas1: TMenuItem
          Caption = 'Listado Facturas de Gastos Ventas'
          OnClick = mnuSalidasClick
        end
      end
      object mnuSalSepSalidasPlus: TMenuItem
        Caption = '-'
      end
      object mnuSalResSalidasEnvase: TMenuItem
        Caption = 'Resumen de Salidas por Art'#237'culo'
        OnClick = mnuSalidasClick
      end
      object mnuSalVentasSemMercadona: TMenuItem
        Caption = 'Informe de Ventas Semanal Mercadona'
        OnClick = mnuSalidasClick
      end
      object mnuSalVentasSuministro: TMenuItem
        Caption = 'Informe de Ventas Suministro'
        OnClick = mnuSalidasClick
      end
      object mnuSalVentasBruto: TMenuItem
        Caption = 'Listado de Ventas Bruto'
        OnClick = mnuSalidasClick
      end
      object mnuSalVentasSemanal: TMenuItem
        Caption = 'Listado de Ventas Semanal'
        OnClick = mnuSalidasClick
      end
      object mnuSalSepFOB: TMenuItem
        Caption = '-'
        Hint = 'Listados FOB'
      end
      object mnuSalListadoFOBSalidas: TMenuItem
        Caption = 'Listado Salidas FOB por Art'#237'culos'
        OnClick = mnuSalidasClick
      end
      object mnuSalResumenFOB: TMenuItem
        Caption = 'Resumen Salidas FOB'
        ShortCut = 116
        OnClick = mnuSalidasClick
      end
      object mnuSalFOBCliente: TMenuItem
        Caption = 'Resumen Semanal de Ventas FOB por Cliente'
        OnClick = mnuSalidasClick
      end
      object mnuSalFOBClientes: TMenuItem
        Caption = 'FOB Clientes - En Desarrollo'
        OnClick = mnuSalidasClick
      end
      object mnuSalSepFederacion: TMenuItem
        Caption = '-'
        Hint = 'Asignar Federaci'#243'n'
      end
      object EnvasesComerciales1: TMenuItem
        Caption = 'Envases Comerciales/Retornables'
        object mnuSalInventarioEnvComer: TMenuItem
          Caption = 'Inventario'
          OnClick = mnuSalidasClick
        end
        object mnuSalAjustesInventarioEnvComer: TMenuItem
          Caption = 'Ajustes Inventario'
          OnClick = mnuSalidasClick
        end
        object mnuSalEntradasEnvComer: TMenuItem
          Caption = 'Entradas'
          OnClick = mnuSalidasClick
        end
        object mnuSalTransitosEnvComer: TMenuItem
          Caption = 'Tr'#225'nsitos'
          OnClick = mnuSalidasClick
        end
        object mnuSalSepEnvasesComerciales: TMenuItem
          Caption = '-'
        end
        object mnuSalMovimientosEnvasesComerciales: TMenuItem
          Caption = 'Listado Movimientos Envases Comerciales'
          OnClick = mnuSalidasClick
        end
        object mnuSalListadoEnvasesComerciales: TMenuItem
          Caption = 'Salidas por Envase Comerciales/Retornables'
          OnClick = mnuSalidasClick
        end
        object mnuSalFacturaLogifruit: TMenuItem
          Caption = 'Factura Logifruit'
          OnClick = mnuSalidasClick
        end
      end
      object mnuSalSubFederacion: TMenuItem
        Caption = 'Asignar Federacion'
        object mnuSalSemanalExpediciones: TMenuItem
          Caption = 'Declaraci'#243'n Semanal de Expediciones'
          OnClick = mnuSalidasClick
        end
        object mnuSalPorcentajesFederacion: TMenuItem
          Caption = 'Porcentajes Federaci'#243'n'
          OnClick = mnuSalidasClick
        end
        object mnuSalAsignarFederacion: TMenuItem
          Caption = 'Asignaci'#243'n de Federaciones'
          OnClick = mnuSalidasClick
        end
        object mnuSalModificacionFederacion: TMenuItem
          Caption = 'Modificaci'#243'n Federaci'#243'n'
          OnClick = mnuSalidasClick
        end
        object mnuSalLisSalidasFederacion: TMenuItem
          Caption = 'Resumen Salidas por Federaci'#243'n'
          OnClick = mnuSalidasClick
        end
      end
      object mnuSalSubIntrastat: TMenuItem
        Caption = 'Intrastat'
        object mnuSalInformeIntrastat: TMenuItem
          Caption = 'Informe Intrastat'
          OnClick = mnuSalidasClick
        end
        object mnuSalControlIntrastat: TMenuItem
          Caption = 'Listado Control Intrastat'
          OnClick = mnuSalidasClick
        end
      end
      object mnuSalSalidasLPR: TMenuItem
        Caption = 'Generar Fichero LPR'
        OnClick = mnuSalidasClick
      end
    end
    object mnuFacturacion: TMenuItem
      Caption = '&Facturaci'#243'n'
      OnClick = mnuFacturacionClick
      object mnuFacSepFacturas: TMenuItem
        Caption = '-'
        Hint = 'Facturas y Abonos'
      end
      object mnuManFacturas: TMenuItem
        Caption = 'Mantenimiento Facturas'
        OnClick = mnuFacturacionClick
      end
      object mnuProformaFac: TMenuItem
        Caption = 'Factura Informativa/Proforma'
        OnClick = mnuFacturacionClick
      end
      object mnuProcFacturacion: TMenuItem
        Caption = 'Facturaci'#243'n Automatica'
        OnClick = mnuFacturacionClick
      end
      object mnuRepFacturacion: TMenuItem
        Caption = 'Repetici'#243'n Facturas'
        OnClick = mnuFacturacionClick
      end
      object mnuRepFacturacionCont: TMenuItem
        Caption = 'Repetici'#243'n Facturas Contabilizadas'
        OnClick = mnuFacturacionClick
      end
      object mnuAnuFacturas: TMenuItem
        Caption = 'Anulaci'#243'n de Facturas'
        OnClick = mnuFacturacionClick
      end
      object mnuFacturarEdi: TMenuItem
        Caption = 'Fichero Facturas/Abonos EDI'
        OnClick = mnuFacturacionClick
      end
      object mnuMarcaContable: TMenuItem
        Caption = 'Marcar / Desmarcar Contabilizadas'
        OnClick = mnuFacturacionClick
      end
      object mnuContFacturas: TMenuItem
        Caption = 'Contabilizaci'#243'n de Facturas'
        OnClick = mnuFacturacionClick
      end
      object mnuFacSinContablizarX3: TMenuItem
        Caption = 'Facturas Pendientes de Contablizar en X3'
        OnClick = mnuFacturacionClick
      end
      object mnuImprimirFactura: TMenuItem
        Caption = 'Impresi'#243'n de Facturas'
        OnClick = mnuFacturacionClick
      end
      object mnuFacSepFacturasPlus: TMenuItem
        Caption = '-'
      end
      object mnuListadoVentasPorPeriodo: TMenuItem
        Caption = 'Listado Ventas Por Periodo'
        OnClick = mnuFacturacionClick
      end
      object mnuFacLisFacturas: TMenuItem
        Caption = 'Listado Facturas'
        OnClick = mnuFacturacionClick
      end
      object mnuFacLisAbonosDetalle: TMenuItem
        Caption = 'Listado Detalle Abonos'
        OnClick = mnuFacturacionClick
      end
      object mnuFacAlbaranesFactura: TMenuItem
        Caption = 'Albaranes Factura'
        OnClick = mnuFacturacionClick
      end
      object mnuFacFacturasCliente: TMenuItem
        Caption = 'Facturas por Cliente'
        OnClick = mnuFacturacionClick
      end
      object mnuFacNotificacinVentasCredito: TMenuItem
        Caption = 'Notificaci'#243'n de Ventas a Credito'
        OnClick = mnuFacturacionClick
      end
      object mnuFacImporteFacturadoClienteBanco: TMenuItem
        Caption = 'Importe Facturado Cliente - Banco'
        OnClick = mnuFacturacionClick
      end
      object mnuFacFacturasSuministro: TMenuItem
        Caption = 'Facturaci'#243'n por Centros de Suministros'
        OnClick = mnuFacturacionClick
      end
      object mnuFacFacturasTomate: TMenuItem
        Caption = 'Facturas Tomate'
        OnClick = mnuFacturacionClick
      end
      object mnuFacAlbaranesSinFacturar: TMenuItem
        Caption = 'Albaranes Pendientes de Facturar'
        OnClick = mnuFacturacionClick
      end
      object mnuFacProductoSinFacturar: TMenuItem
        Caption = 'Producto Pendiente de Facturar'
        OnClick = mnuFacturacionClick
      end
      object mnuFacAlbaranesFacturadosEn: TMenuItem
        Caption = 'Albaranes Facturados en'
        OnClick = mnuFacturacionClick
      end
      object mnuFacFacturasParaAnticipar: TMenuItem
        Caption = 'Facturas Para Anticipar'
        OnClick = mnuFacturacionClick
      end
      object mnuFacFacturasSinCobrar: TMenuItem
        Caption = 'Facturas Pendientes Cobro'
        OnClick = mnuFacturacionClick
      end
      object mnuFacAging: TMenuItem
        Caption = 'Aging'
        OnClick = mnuFacturacionClick
      end
      object mnuFacSepRemesas: TMenuItem
        Caption = '-'
        Hint = 'Remesas de Cobro'
      end
      object mnuManRemesas: TMenuItem
        Caption = 'Control de Cobros'
        OnClick = mnuFacturacionClick
      end
      object mnuFacListadoRemesas: TMenuItem
        Caption = 'Resumen Cobros'
        OnClick = mnuFacturacionClick
      end
      object mnuFacListadoResemasBanco: TMenuItem
        Caption = 'Listado de Cobros por Banco'
        OnClick = mnuFacturacionClick
      end
      object mnuFacRiesgoCliente: TMenuItem
        Caption = 'Riesgo del Cliente'
        OnClick = mnuFacturacionClick
      end
      object mnuFacEstadoCobroCliente: TMenuItem
        Caption = 'Estado de Cobro de Clientes'
        OnClick = mnuFacturacionClick
      end
      object mnuFacDiasMediosPagoClientes: TMenuItem
        Caption = 'D'#237'as Medios de Pago de Clientes'
        OnClick = mnuFacturacionClick
      end
      object mnuFacSaldoClientes: TMenuItem
        Caption = 'Saldo Clientes'
        OnClick = mnuFacturacionClick
      end
    end
    object mnuDatosTransmision: TMenuItem
      Caption = 'Tra&nsmisi'#243'n'
      object mnuDatSepDiario: TMenuItem
        Caption = '-'
      end
      object mnuDatDiarioTodo: TMenuItem
        Caption = 'Todo'
        OnClick = mnuTransmisionClick
      end
      object mnuDatSepDiarioTodo: TMenuItem
        Caption = '-'
      end
      object mnuDatDiarioEntradas: TMenuItem
        Caption = 'Entradas'
        OnClick = mnuTransmisionClick
      end
      object mnuDatDiarioEscandallos: TMenuItem
        Caption = 'Escandallo'
        OnClick = mnuTransmisionClick
      end
      object mnuDatDiarioInventarios: TMenuItem
        Caption = 'Inventarios'
        OnClick = mnuTransmisionClick
      end
      object mnuDatDiarioSalidas: TMenuItem
        Caption = 'Salidas'
        OnClick = mnuTransmisionClick
      end
      object mnuDatDiarioTransitos: TMenuItem
        Caption = 'Tr'#225'nsitos'
        OnClick = mnuTransmisionClick
      end
      object mnuDatSepSemanal: TMenuItem
        Caption = '-'
      end
      object mnuDatMensualSobrepesos: TMenuItem
        Caption = 'Sobrepresos'
        OnClick = mnuTransmisionClick
      end
      object mnuDatSemanalEscandallo: TMenuItem
        Caption = 'Escandallos'
        OnClick = mnuTransmisionClick
      end
      object mnuDatOtrosPedidos: TMenuItem
        Caption = 'Pedidos'
        OnClick = mnuTransmisionClick
      end
      object mnuDatOtrosEntregas: TMenuItem
        Caption = 'Entregas'
        OnClick = mnuTransmisionClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuDatDiarioDesgloseSal: TMenuItem
        Caption = 'Desglose Salidas'
        OnClick = mnuTransmisionClick
      end
    end
    object mnuUtilidades: TMenuItem
      Caption = '&Utilidades'
      object mniCierre: TMenuItem
        Caption = 'Cierre'
        object mniInventario: TMenuItem
          Caption = 'Inventario'
          OnClick = mnuCierreClick
        end
        object mniGastosCompras: TMenuItem
          Caption = 'Gastos Compras'
          OnClick = mnuCierreClick
        end
        object mniGastosTransitos: TMenuItem
          Caption = 'Gastos Tr'#225'nsitos'
          OnClick = mnuCierreClick
        end
        object mniGastosSalidas: TMenuItem
          Caption = 'Gastos Salidas'
          OnClick = mnuCierreClick
        end
        object mniVentasPendientesFacturar: TMenuItem
          Caption = 'Ventas pendientes de facturar'
          OnClick = mnuCierreClick
        end
      end
      object mnuUtiSepUtilidades: TMenuItem
        Caption = '-'
        Hint = 'Utilidades Varias'
      end
      object mnuUtiCalculadora: TMenuItem
        Caption = 'Calculadora'
        ShortCut = 116
        OnClick = ACalculadoraExecute
      end
      object mnuUtiCambioDivisas: TMenuItem
        Caption = 'Cambio Divisas'
        OnClick = mnuUtilidadesClick
      end
      object mnuUtiConversionDivisa: TMenuItem
        Tag = 1
        Caption = 'Conversi'#243'n Divisas'
        ShortCut = 118
        OnClick = AConversionDivisasExecute
      end
      object mnuUtiEuroConversor: TMenuItem
        Caption = 'Euro Conversor'
        ShortCut = 119
        OnClick = AEuroConversorExecute
      end
      object mnuUtiCompruebaGastos: TMenuItem
        Caption = 'Comprobaci'#243'n de Gastos'
        OnClick = mnuUtilidadesClick
      end
      object mnuUtiSelectImpresoras: TMenuItem
        Caption = 'Selecci'#243'n de impresoras'
        OnClick = mnuUtilidadesClick
      end
      object mnuUtiSelectCuentaCorreo: TMenuItem
        Caption = 'Selecci'#243'n Cuenta de Correo'
        OnClick = mnuUtilidadesClick
      end
      object mnuUtiAdministracion: TMenuItem
        Caption = 'Administraci'#243'n'
        OnClick = mnuUtilidadesClick
      end
      object mnuUtiAcercaDe: TMenuItem
        Caption = 'Acerca de ...'
        OnClick = mnuUtilidadesClick
      end
      object mnuUtiAux: TMenuItem
        Caption = 'Programa Auxiliar'
        OnClick = mnuUtilidadesClick
      end
      object mnuSalListadoMercadona: TMenuItem
        Caption = 'Listado Mercadona'
        OnClick = mnuSalidasClick
      end
      object mnuUtiKilosComercializadosMes: TMenuItem
        Caption = 'Kilos Comercializados Mes'
        OnClick = mnuUtilidadesClick
      end
      object mnuSincronizacion: TMenuItem
        Caption = 'Sincronizacion Web'
        OnClick = mnuUtilidadesClick
      end
    end
    object Salir1: TMenuItem
      Action = ACerrar
    end
  end
  object Reloj: TTimer
    Enabled = False
    OnTimer = RelojTimer
    Left = 80
    Top = 136
  end
  object AAcciones: TActionList
    Left = 80
    Top = 104
    object AMPrimero: TAction
      Category = 'MaestroMovimiento'
      Caption = '&Primero'
      Hint = 'Primero'
      ImageIndex = 0
      ShortCut = 36
      OnExecute = AMPrimeroExecute
    end
    object ACerrar: TAction
      Category = 'Varios'
      Caption = '&Salir '
      ShortCut = 27
      OnExecute = ACerrarExecute
    end
    object AMSiguiente: TAction
      Category = 'MaestroMovimiento'
      Caption = '&Siguiente'
      Hint = 'Siguiente'
      ImageIndex = 2
      ShortCut = 39
      OnExecute = AMSiguienteExecute
    end
    object AMAnterior: TAction
      Category = 'MaestroMovimiento'
      Caption = 'A&nterior'
      Hint = 'Anterior'
      ImageIndex = 1
      ShortCut = 37
      OnExecute = AMAnteriorExecute
    end
    object AMUltimo: TAction
      Category = 'MaestroMovimiento'
      Caption = '&Ultimo'
      Hint = #218'ltimo'
      ImageIndex = 3
      ShortCut = 35
      OnExecute = AMUltimoExecute
    end
    object ADAnterior: TAction
      Category = 'DetalleMovimiento'
      Caption = 'A&rriba'
      Hint = 'Linea arriba'
      ImageIndex = 5
      ShortCut = 38
      OnExecute = ADAnteriorExecute
    end
    object ADSiguiente: TAction
      Category = 'DetalleMovimiento'
      Caption = 'A&bajo'
      Hint = 'Linea abajo'
      ImageIndex = 6
      ShortCut = 40
      OnExecute = ADSiguienteExecute
    end
    object ADAltas: TAction
      Category = 'DetalleAccion'
      Caption = '&Altas'
      Hint = 'A'#241'adir linea'
      ImageIndex = 15
      OnExecute = ADAltasExecute
    end
    object ADModificar: TAction
      Category = 'DetalleAccion'
      Caption = '&Modificar'
      Hint = 'Modificar linea'
      ImageIndex = 13
      OnExecute = ADModificarExecute
    end
    object ADBorrar: TAction
      Category = 'DetalleAccion'
      Caption = '&Borrar'
      Hint = 'Borrar linea'
      ImageIndex = 14
      OnExecute = ADBorrarExecute
    end
    object AMAltas: TAction
      Category = 'MaestroAccion'
      Caption = '&Altas'
      Hint = 'A'#241'adir'
      ImageIndex = 11
      OnExecute = AMAltasExecute
    end
    object AMBorrar: TAction
      Category = 'MaestroAccion'
      Caption = '&Borrar'
      Hint = 'Borrar'
      ImageIndex = 10
      OnExecute = AMBorrarExecute
    end
    object AMModificar: TAction
      Category = 'MaestroAccion'
      Caption = '&Modificar'
      Hint = 'Modificar'
      ImageIndex = 9
      ShortCut = 77
      OnExecute = AMModificarExecute
    end
    object AMLocalizar: TAction
      Category = 'MaestroAccion'
      Caption = '&Localizar'
      Hint = 'Localizar'
      ImageIndex = 8
      ShortCut = 76
      OnExecute = AMLocalizarExecute
    end
    object AMDCancelar: TAction
      Category = 'Decision'
      Caption = '&Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 17
      OnExecute = AMDCancelarExecute
    end
    object AMDAceptar: TAction
      Category = 'Decision'
      Caption = '&Aceptar'
      Hint = 'Aceptar'
      ImageIndex = 16
      ShortCut = 112
      OnExecute = AMDAceptarExecute
    end
    object AIPrevisualizar: TAction
      Category = 'Impresion'
      Caption = '&Vista previa'
      Hint = 'Previsualizar listado'
      ImageIndex = 19
      ShortCut = 73
      OnExecute = AIPrevisualizarExecute
    end
    object AMDSalir: TAction
      Category = 'Decision'
      Caption = '&Salir'
      Hint = 'Cerrar'
      ImageIndex = 18
      OnExecute = AMDSalirExecute
    end
    object ACalculadora: TAction
      Category = 'mnuUtiles'
      Caption = 'ACalculadora'
      ShortCut = 116
      OnExecute = ACalculadoraExecute
    end
    object AConversionDivisas: TAction
      Category = 'mnuUtiles'
      Caption = 'AConversionDivisas'
      ShortCut = 118
      OnExecute = AConversionDivisasExecute
    end
    object AEuroConversor: TAction
      Category = 'mnuUtiles'
      Caption = 'AEuroConversor'
      ShortCut = 119
      OnExecute = AEuroConversorExecute
    end
  end
end
