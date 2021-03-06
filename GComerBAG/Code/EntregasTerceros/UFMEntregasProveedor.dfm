object FMEntregasProveedor: TFMEntregasProveedor
  Left = 239
  Top = 144
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '  ENTREGAS DE PROVEEDORES'
  ClientHeight = 754
  ClientWidth = 1204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PMaestro: TPanel
    Left = 0
    Top = 0
    Width = 1204
    Height = 313
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object bvl1: TBevel
      Left = 780
      Top = 235
      Width = 215
      Height = 73
    end
    object Bevel1: TBevel
      Left = 780
      Top = 235
      Width = 215
      Height = 33
    end
    object nbLabel24: TnbLabel
      Left = 503
      Top = 7
      Width = 100
      Height = 21
      Caption = 'C'#243'digo Entrega'
      About = 'NB 0.1/20020725'
    end
    object lObservacion: TnbLabel
      Left = 33
      Top = 235
      Width = 100
      Height = 21
      Caption = 'Observaciones'
      About = 'NB 0.1/20020725'
    end
    object nbLabel1: TnbLabel
      Left = 33
      Top = 7
      Width = 100
      Height = 21
      Caption = 'Empresa'
      About = 'NB 0.1/20020725'
    end
    object nbLabel2: TnbLabel
      Left = 33
      Top = 76
      Width = 100
      Height = 21
      Caption = 'Proveedor'
      About = 'NB 0.1/20020725'
    end
    object nbLabel5: TnbLabel
      Left = 33
      Top = 144
      Width = 100
      Height = 21
      Caption = 'Matricula'
      About = 'NB 0.1/20020725'
    end
    object nbLabel19: TnbLabel
      Left = 503
      Top = 53
      Width = 100
      Height = 21
      Caption = 'Fecha Carga'
      About = 'NB 0.1/20020725'
    end
    object lblProveedor: TnbStaticText
      Left = 187
      Top = 76
      Width = 270
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object lblEmpresa: TnbStaticText
      Left = 187
      Top = 7
      Width = 270
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object btnFecha_llegada: TBCalendarButton
      Left = 212
      Top = 53
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnFecha_llegadaClick
      Control = fecha_llegada_ec
      Calendar = Calendario
      CalendarAlignment = taDownRight
      CalendarWidth = 197
      CalendarHeigth = 153
    end
    object btnEmpresa_ec: TBGridButton
      Left = 172
      Top = 7
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnEmpresa_ecClick
      Control = empresa_ec
      Grid = RejillaFlotante
      GridAlignment = taDownRight
      GridWidth = 280
      GridHeigth = 200
    end
    object btnProveedor_ec: TBGridButton
      Left = 172
      Top = 76
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnProveedor_ecClick
      Control = proveedor_ec
      Grid = RejillaFlotante
      GridAlignment = taDownRight
      GridWidth = 280
      GridHeigth = 200
    end
    object nbLabel4: TnbLabel
      Left = 33
      Top = 99
      Width = 100
      Height = 21
      Caption = 'Albaran Proveedor'
      About = 'NB 0.1/20020725'
    end
    object nbLabel30: TnbLabel
      Left = 33
      Top = 30
      Width = 100
      Height = 21
      Caption = 'Centro Llegada'
      About = 'NB 0.1/20020725'
    end
    object btnCentroDestino: TBGridButton
      Left = 172
      Top = 30
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnCentroDestinoClick
      Control = centro_llegada_ec
      Grid = RejillaFlotante
      GridAlignment = taDownRight
      GridWidth = 280
      GridHeigth = 200
    end
    object lblCentroDestino: TnbStaticText
      Left = 187
      Top = 30
      Width = 270
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object nbLabel31: TnbLabel
      Left = 33
      Top = 167
      Width = 100
      Height = 21
      Caption = 'Transporte'
      About = 'NB 0.1/20020725'
    end
    object nbLabel32: TnbLabel
      Left = 33
      Top = 212
      Width = 100
      Height = 21
      Caption = 'Puerto Descarga'
      About = 'NB 0.1/20020725'
    end
    object nbLabel33: TnbLabel
      Left = 33
      Top = 190
      Width = 100
      Height = 21
      Caption = 'Barco'
      About = 'NB 0.1/20020725'
    end
    object btnTransporte: TBGridButton
      Left = 172
      Top = 167
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnTransporteClick
      Control = transporte_ec
      Grid = RejillaFlotante
      GridAlignment = taDownRight
      GridWidth = 280
      GridHeigth = 200
    end
    object lblTransporte: TnbStaticText
      Left = 187
      Top = 167
      Width = 270
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object btnAduana: TBGridButton
      Left = 172
      Top = 212
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnAduanaClick
      Control = aduana_ec
      Grid = RejillaFlotante
      GridAlignment = taDownRight
      GridWidth = 280
      GridHeigth = 200
    end
    object lblAduana: TnbStaticText
      Left = 187
      Top = 212
      Width = 270
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object nbLabel3: TnbLabel
      Left = 503
      Top = 212
      Width = 100
      Height = 21
      Caption = 'Estado'
      About = 'NB 0.1/20020725'
    end
    object nbLabel20: TnbLabel
      Left = 33
      Top = 53
      Width = 100
      Height = 21
      Caption = 'Fecha Llegada'
      About = 'NB 0.1/20020725'
    end
    object nbLabel21: TnbLabel
      Left = 265
      Top = 99
      Width = 100
      Height = 21
      Caption = 'Factura Conduce'
      About = 'NB 0.1/20020725'
    end
    object nbLabel23: TnbLabel
      Left = 33
      Top = 263
      Width = 100
      Height = 21
      Caption = 'Term'#243'grafo'
      About = 'NB 0.1/20020725'
    end
    object nbLabel12: TnbLabel
      Left = 503
      Top = 121
      Width = 100
      Height = 21
      Caption = 'Peso Entrada'
      About = 'NB 0.1/20020725'
    end
    object nbLabel6: TnbLabel
      Left = 685
      Top = 121
      Width = 100
      Height = 21
      Caption = 'Peso Salida'
      About = 'NB 0.1/20020725'
    end
    object peso_carga_ec: TLabel
      Left = 867
      Top = 125
      Width = 74
      Height = 13
      AutoSize = False
      Caption = '0,00'
    end
    object lblNombre1: TLabel
      Left = 854
      Top = 238
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'PALETS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 854
      Top = 253
      Width = 66
      Height = 17
      Alignment = taRightJustify
      DataField = 'palets'
      DataSource = DSDetalleTotales
    end
    object lblNombre2: TLabel
      Left = 786
      Top = 238
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CAJAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 786
      Top = 253
      Width = 66
      Height = 17
      Alignment = taRightJustify
      DataField = 'cajas'
      DataSource = DSDetalleTotales
    end
    object lblNombre3: TLabel
      Left = 922
      Top = 238
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'KILOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 922
      Top = 253
      Width = 66
      Height = 17
      Alignment = taRightJustify
      DataField = 'kilos'
      DataSource = DSDetalleTotales
    end
    object lblNombre4: TLabel
      Left = 786
      Top = 279
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LINEA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 786
      Top = 291
      Width = 66
      Height = 17
      Alignment = taRightJustify
      DataField = 'importe'
      DataSource = DSDetalleTotales
    end
    object nbLabel18: TnbLabel
      Left = 503
      Top = 167
      Width = 100
      Height = 21
      Caption = 'Portes'
      About = 'NB 0.1/20020725'
    end
    object nbLabel36: TnbLabel
      Left = 503
      Top = 30
      Width = 100
      Height = 21
      Caption = 'Fecha Grabaci'#243'n'
      About = 'NB 0.1/20020725'
    end
    object lblTipo: TnbLabel
      Left = 503
      Top = 190
      Width = 100
      Height = 21
      Caption = 'Tipo Entrada'
      About = 'NB 0.1/20020725'
    end
    object lblPesoDestrio: TnbLabel
      Left = 503
      Top = 144
      Width = 100
      Height = 21
      Caption = 'Peso Destrio'
      About = 'NB 0.1/20020725'
    end
    object lblSemana: TLabel
      Left = 698
      Top = 34
      Width = 63
      Height = 13
      Caption = 'Sem: 201101'
    end
    object lblProducto_: TnbLabel
      Left = 33
      Top = 121
      Width = 100
      Height = 21
      Caption = 'Producto'
      About = 'NB 0.1/20020725'
    end
    object btnProducto: TBGridButton
      Left = 171
      Top = 121
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnProductoClick
      Control = producto_ec
      Grid = RejillaFlotante
      GridAlignment = taDownRight
      GridWidth = 280
      GridHeigth = 200
    end
    object stProducto: TnbStaticText
      Left = 186
      Top = 121
      Width = 270
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object lblFechaHasta: TnbLabel
      Left = 225
      Top = 53
      Width = 50
      Height = 21
      Caption = 'hasta el'
      Visible = False
      About = 'NB 0.1/20020725'
    end
    object btnFechaHasta: TBCalendarButton
      Left = 354
      Top = 53
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      Visible = False
      OnClick = btnFechaHastaClick
      Control = edtFechaHasta
      Calendar = Calendario
      CalendarAlignment = taDownRight
      CalendarWidth = 197
      CalendarHeigth = 153
    end
    object btnFechaCarga: TBCalendarButton
      Left = 682
      Top = 53
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnFechaCargaClick
      Control = fecha_carga_ec
      Calendar = Calendario
      CalendarAlignment = taDownRight
      CalendarWidth = 197
      CalendarHeigth = 153
    end
    object btnFechaGrabacion: TBCalendarButton
      Left = 682
      Top = 30
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnFechaGrabacionClick
      Control = fecha_origen_ec
      Calendar = Calendario
      CalendarAlignment = taDownRight
      CalendarWidth = 197
      CalendarHeigth = 153
    end
    object lblAnyoSemana: TnbLabel
      Left = 503
      Top = 99
      Width = 100
      Height = 21
      Caption = 'A'#241'o/Semana Fruta'
      About = 'NB 0.1/20020725'
    end
    object lblFechaCorte: TnbLabel
      Left = 503
      Top = 76
      Width = 100
      Height = 21
      Caption = 'Fecha Corte'
      About = 'NB 0.1/20020725'
    end
    object btnFechaCorte: TBCalendarButton
      Left = 682
      Top = 76
      Width = 13
      Height = 21
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
        0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
        0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
        0000FFFFFFFFFF000000}
      OnClick = btnFechaCargaClick
      Control = fecha_corte_ec
      Calendar = Calendario
      CalendarAlignment = taDownRight
      CalendarWidth = 197
      CalendarHeigth = 153
    end
    object lblZona: TnbLabel
      Left = 685
      Top = 99
      Width = 100
      Height = 21
      Caption = 'Zona Producci'#243'n'
      About = 'NB 0.1/20020725'
    end
    object lbl1: TLabel
      Left = 854
      Top = 279
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'COMPRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dlbl1: TDBText
      Left = 854
      Top = 290
      Width = 66
      Height = 17
      Alignment = taRightJustify
      DataField = 'importe'
      DataSource = dsTotalCompra
    end
    object lblImporte: TLabel
      Left = 782
      Top = 266
      Width = 66
      Height = 12
      AutoSize = False
      Caption = 'Importes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 922
      Top = 279
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'DIFF.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDiff: TLabel
      Left = 922
      Top = 292
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'COMPRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object observaciones_ec: TDBMemo
      Left = 136
      Top = 235
      Width = 634
      Height = 73
      DataField = 'observaciones_ec'
      DataSource = DSMaestro
      TabOrder = 30
    end
    object codigo_ec: TBDEdit
      Left = 607
      Top = 7
      Width = 89
      Height = 21
      ColorEdit = clMoneyGreen
      ColorNormal = clSkyBlue
      MaxLength = 12
      TabOrder = 1
      DataField = 'codigo_ec'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object termografo_ec: TBDEdit
      Left = 40
      Top = 287
      Width = 73
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 10
      TabOrder = 31
      DataField = 'termografo_ec'
      DataSource = DSMaestro
    end
    object empresa_ec: TBDEdit
      Left = 136
      Top = 7
      Width = 33
      Height = 21
      ColorEdit = clMoneyGreen
      Zeros = True
      Required = True
      RequiredMsg = 'El c'#243'digo de la empresa es de obligada inserci'#243'n.'
      OnRequiredTime = empresa_ecRequiredTime
      MaxLength = 3
      TabOrder = 0
      OnChange = empresa_ecChange
      DataField = 'empresa_ec'
      DataSource = DSMaestro
      Modificable = False
    end
    object proveedor_ec: TBDEdit
      Left = 136
      Top = 76
      Width = 33
      Height = 21
      ColorEdit = clMoneyGreen
      Zeros = True
      Required = True
      RequiredMsg = 'El c'#243'digo del proveedor es de obligada inserci'#243'n.'
      OnRequiredTime = empresa_ecRequiredTime
      MaxLength = 3
      TabOrder = 9
      OnChange = proveedor_ecChange
      DataField = 'proveedor_ec'
      DataSource = DSMaestro
    end
    object vehiculo_ec: TBDEdit
      Left = 136
      Top = 144
      Width = 250
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 30
      TabOrder = 19
      DataField = 'vehiculo_ec'
      DataSource = DSMaestro
    end
    object fecha_carga_ec: TBDEdit
      Left = 607
      Top = 53
      Width = 74
      Height = 21
      TabStop = False
      ColorEdit = clMoneyGreen
      Required = True
      RequiredMsg = 'La fecha de carga de la mercanc'#237'a es de obligada inserci'#243'n.'
      OnRequiredTime = empresa_ecRequiredTime
      InputType = itDate
      MaxLength = 10
      TabOrder = 6
      DataField = 'fecha_carga_ec'
      DataSource = DSMaestro
    end
    object albaran_ec: TBDEdit
      Left = 136
      Top = 99
      Width = 110
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 
        'El c'#243'digo del albar'#225'n es de obligada inserci'#243'n ( Si se desconoce' +
        ' ponga '#39'?'#39' ).'
      OnRequiredTime = empresa_ecRequiredTime
      MaxLength = 15
      TabOrder = 11
      DataField = 'albaran_ec'
      DataSource = DSMaestro
    end
    object centro_llegada_ec: TBDEdit
      Left = 136
      Top = 30
      Width = 22
      Height = 21
      ColorEdit = clMoneyGreen
      Required = True
      RequiredMsg = 'El c'#243'digo del cenro destino es de obligada inserci'#243'n.'
      OnRequiredTime = empresa_ecRequiredTime
      MaxLength = 1
      TabOrder = 3
      OnChange = centro_llegada_ecChange
      DataField = 'centro_llegada_ec'
      DataSource = DSMaestro
    end
    object barco_ec: TBDEdit
      Left = 136
      Top = 190
      Width = 250
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 20
      TabOrder = 24
      DataField = 'barco_ec'
      DataSource = DSMaestro
    end
    object aduana_ec: TBDEdit
      Left = 136
      Top = 212
      Width = 33
      Height = 21
      ColorEdit = clMoneyGreen
      InputType = itInteger
      MaxLength = 3
      TabOrder = 27
      OnChange = aduana_ecChange
      DataField = 'aduana_ec'
      DataSource = DSMaestro
    end
    object transporte_ec: TBDEdit
      Left = 136
      Top = 167
      Width = 33
      Height = 21
      ColorEdit = clMoneyGreen
      InputType = itInteger
      MaxLength = 4
      TabOrder = 21
      OnChange = transporte_ecChange
      DataField = 'transporte_ec'
      DataSource = DSMaestro
    end
    object fecha_llegada_ec: TBDEdit
      Left = 136
      Top = 53
      Width = 74
      Height = 21
      Hint = 'Rellenar en destino.'
      ColorEdit = clMoneyGreen
      RequiredMsg = 'La fecha de descarga de la mercanc'#237'a es de obligada inserci'#243'n.'
      OnRequiredTime = empresa_ecRequiredTime
      InputType = itDate
      MaxLength = 10
      TabOrder = 5
      DataField = 'fecha_llegada_ec'
      DataSource = DSMaestro
    end
    object adjudicacion_ec: TBDEdit
      Left = 368
      Top = 99
      Width = 89
      Height = 21
      ColorEdit = clMoneyGreen
      OnRequiredTime = empresa_ecRequiredTime
      MaxLength = 10
      TabOrder = 12
      DataField = 'adjudicacion_ec'
      DataSource = DSMaestro
    end
    object peso_entrada_ec: TBDEdit
      Left = 607
      Top = 121
      Width = 73
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 10
      TabOrder = 17
      OnChange = PutPesoCarga
      DataField = 'peso_entrada_ec'
      DataSource = DSMaestro
    end
    object peso_salida_ec: TBDEdit
      Left = 789
      Top = 121
      Width = 73
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 10
      TabOrder = 18
      OnChange = PutPesoCarga
      DataField = 'peso_salida_ec'
      DataSource = DSMaestro
    end
    object portes_pagados_ec: TDBCheckBox
      Left = 607
      Top = 169
      Width = 165
      Height = 17
      TabStop = False
      Caption = '(Marcado pagamos nosotros)'
      DataField = 'portes_pagados_ec'
      DataSource = DSMaestro
      TabOrder = 22
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object fecha_origen_ec: TBDEdit
      Left = 607
      Top = 30
      Width = 74
      Height = 21
      TabStop = False
      ColorEdit = clMoneyGreen
      Required = True
      OnRequiredTime = empresa_ecRequiredTime
      InputType = itDate
      MaxLength = 12
      TabOrder = 4
      OnChange = fecha_origen_ecChange
      DataField = 'fecha_origen_ec'
      DataSource = DSMaestro
    end
    object mercado_local_ec: TDBCheckBox
      Left = 780
      Top = 169
      Width = 152
      Height = 17
      TabStop = False
      Caption = '(Marcado = Mercado Local)'
      DataField = 'mercado_local_ec'
      DataSource = DSMaestro
      TabOrder = 23
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object compra_ec: TDBCheckBox
      Left = 698
      Top = 9
      Width = 152
      Height = 17
      Hint = '(Marcado = COMPRA)'
      Caption = 'COMPRA (Marcar si es compra)'
      DataField = 'compra_ec'
      DataSource = DSMaestro
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object intrastat_ec: TBDEdit
      Left = 607
      Top = 190
      Width = 22
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 'El c'#243'digo del almac'#233'n del proveedor de obligada inserci'#243'n.'
      MaxLength = 1
      TabOrder = 25
      OnChange = intrastat_ecChange
      DataField = 'intrastat_ec'
      DataSource = DSMaestro
    end
    object cbbIntrastat: TComboBox
      Left = 632
      Top = 190
      Width = 138
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 26
      TabStop = False
      OnChange = cbbIntrastatChange
      Items.Strings = (
        'ASIMILADA'
        'COMUNITARIA'
        'IMPORTACI'#211'N'
        'NACIONAL'
        'ISP')
    end
    object status_ec: TBDEdit
      Left = 607
      Top = 212
      Width = 22
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 'El c'#243'digo del almac'#233'n del proveedor de obligada inserci'#243'n.'
      InputType = itInteger
      Enabled = False
      MaxLength = 1
      TabOrder = 28
      OnChange = status_ecChange
      DataField = 'status_ec'
      DataSource = DSMaestro
    end
    object cbbstatus_ec: TComboBox
      Left = 632
      Top = 212
      Width = 300
      Height = 21
      Style = csDropDownList
      Color = clSilver
      Enabled = False
      ItemHeight = 13
      TabOrder = 29
      TabStop = False
      OnChange = cbbstatus_ecChange
      Items.Strings = (
        'INICIAL - PENDIENTE RECIBIR ALMACEN'
        'DOCUMENTO RECIBIDO EN EL ALMACEN'
        'ENTREGA DESCARGADA EN EL ALMACEN'
        'ENTREGA DIRECTA AL CLIENTE')
    end
    object peso_destrio_ec: TBDEdit
      Left = 607
      Top = 144
      Width = 73
      Height = 21
      HelpType = htKeyword
      ColorEdit = clMoneyGreen
      MaxLength = 10
      TabOrder = 20
      OnChange = PutPesoCarga
      DataField = 'peso_destrio_ec'
      DataSource = DSMaestro
    end
    object producto_ec: TBDEdit
      Left = 136
      Top = 121
      Width = 33
      Height = 21
      ColorEdit = clMoneyGreen
      Required = True
      RequiredMsg = 'El c'#243'digo del producto es de obligada inserci'#243'n.'
      OnRequiredTime = empresa_ecRequiredTime
      MaxLength = 3
      TabOrder = 16
      OnChange = producto_ecChange
      DataField = 'producto_ec'
      DataSource = DSMaestro
      Modificable = False
    end
    object edtFechaHasta: TBEdit
      Left = 279
      Top = 53
      Width = 74
      Height = 21
      InputType = itDate
      Visible = False
      TabOrder = 7
    end
    object fecha_llegada_definitiva_ec: TDBCheckBox
      Left = 379
      Top = 55
      Width = 78
      Height = 17
      TabStop = False
      Caption = 'Es definitiva'
      DataField = 'fecha_llegada_definitiva_ec'
      DataSource = DSMaestro
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object anyo_semana_ec: TBDEdit
      Left = 607
      Top = 99
      Width = 74
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 
        'El c'#243'digo del albar'#225'n es de obligada inserci'#243'n ( Si se desconoce' +
        ' ponga '#39'?'#39' ).'
      OnRequiredTime = empresa_ecRequiredTime
      InputType = itInteger
      MaxLength = 6
      TabOrder = 13
      DataField = 'anyo_semana_ec'
      DataSource = DSMaestro
    end
    object fecha_corte_ec: TBDEdit
      Left = 607
      Top = 76
      Width = 74
      Height = 21
      TabStop = False
      ColorEdit = clMoneyGreen
      RequiredMsg = 'La fecha de carga de la mercanc'#237'a es de obligada inserci'#243'n.'
      OnRequiredTime = empresa_ecRequiredTime
      InputType = itDate
      MaxLength = 10
      TabOrder = 10
      DataField = 'fecha_corte_ec'
      DataSource = DSMaestro
    end
    object zona_produccion_ec: TBDEdit
      Left = 789
      Top = 99
      Width = 27
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 'El c'#243'digo del almac'#233'n del proveedor de obligada inserci'#243'n.'
      MaxLength = 2
      TabOrder = 14
      OnChange = zona_produccion_ecChange
      DataField = 'zona_produccion_ec'
      DataSource = DSMaestro
    end
    object cbbzona_produccion_ec: TComboBox
      Left = 818
      Top = 99
      Width = 132
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 15
      TabStop = False
      OnChange = cbbzona_produccion_ecChange
      Items.Strings = (
        'TENERIFE NORTE (TN)'
        'TENERIFE SUR (TS)'
        'GRAN CANARIA (GC)'
        'LA PALMA (LP)')
    end
  end
  object PDetalle: TPanel
    Left = 0
    Top = 313
    Width = 1204
    Height = 306
    Align = alClient
    TabOrder = 4
    object PDetalle1: TPanel
      Left = 1
      Top = 1
      Width = 1202
      Height = 115
      Align = alTop
      BevelInner = bvLowered
      Enabled = False
      TabOrder = 0
      Visible = False
      object nbLabel10: TnbLabel
        Left = 351
        Top = 35
        Width = 100
        Height = 21
        Caption = 'N'#186' Palets'
        About = 'NB 0.1/20020725'
      end
      object nbLabelCajas: TnbLabel
        Left = 502
        Top = 35
        Width = 100
        Height = 21
        Caption = 'N'#186' Cajas'
        About = 'NB 0.1/20020725'
      end
      object nbLabelKilos: TnbLabel
        Left = 674
        Top = 35
        Width = 100
        Height = 21
        Caption = 'Kilos Albar'#225'n'
        About = 'NB 0.1/20020725'
      end
      object nbLabel8: TnbLabel
        Left = 502
        Top = 12
        Width = 102
        Height = 21
        Caption = 'C'#243'digo Proveedor'
        About = 'NB 0.1/20020725'
      end
      object lblVariedad: TLabel
        Left = 674
        Top = 16
        Width = 52
        Height = 13
        Caption = 'lblVariedad'
      end
      object btnProductoProveedor: TBGridButton
        Left = 653
        Top = 12
        Width = 13
        Height = 21
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        OnClick = btnProductoProveedorClick
        Control = variedad_el
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object nbLabel9: TnbLabel
        Left = 25
        Top = 35
        Width = 100
        Height = 21
        Caption = 'Categor'#237'a'
        About = 'NB 0.1/20020725'
      end
      object nbLabel14: TnbLabel
        Left = 176
        Top = 35
        Width = 100
        Height = 21
        Caption = 'Calibre'
        About = 'NB 0.1/20020725'
      end
      object btnCategoria: TBGridButton
        Left = 164
        Top = 35
        Width = 13
        Height = 21
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        OnClick = btnCategoriaClick
        Control = categoria_el
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object btnCalibre: TBGridButton
        Left = 330
        Top = 35
        Width = 13
        Height = 21
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        OnClick = btnCalibreClick
        Control = calibre_el
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object lblUnidadPrecio: TnbLabel
        Left = 674
        Top = 59
        Width = 100
        Height = 21
        Caption = 'Precio '
        About = 'NB 0.1/20020725'
      end
      object nbLabel15: TnbLabel
        Left = 502
        Top = 59
        Width = 100
        Height = 21
        Caption = 'Unidades'
        About = 'NB 0.1/20020725'
      end
      object lblPesoBruto: TLabel
        Left = 195
        Top = 63
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Peso Bruto 0 Kgs.'
      end
      object lblAprovecha: TnbLabel
        Left = 25
        Top = 82
        Width = 100
        Height = 21
        Caption = 'Aprovechamiento'
        About = 'NB 0.1/20020725'
      end
      object lblPorcenAprovecha: TLabel
        Left = 195
        Top = 86
        Width = 96
        Height = 13
        Caption = 'lblPorcenAprovecha'
      end
      object nbLabel11: TnbLabel
        Left = 25
        Top = 59
        Width = 100
        Height = 21
        Caption = 'Peso Real'
        About = 'NB 0.1/20020725'
      end
      object nbLabel25: TnbLabel
        Left = 25
        Top = 12
        Width = 100
        Height = 21
        Caption = 'Almac'#233'n Proveedor'
        About = 'NB 0.1/20020725'
      end
      object btnAlmacen: TBGridButton
        Left = 164
        Top = 12
        Width = 13
        Height = 21
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        OnClick = btnAlmacenClick
        Control = almacen_el
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object lblAlmacen: TnbStaticText
        Left = 179
        Top = 12
        Width = 312
        Height = 21
        About = 'NB 0.1/20020725'
      end
      object lblPesoCaja: TLabel
        Left = 836
        Top = 38
        Width = 48
        Height = 13
        Caption = 'Peso Caja'
      end
      object cajas_el: TBDEdit
        Left = 608
        Top = 35
        Width = 39
        Height = 21
        ColorEdit = clMoneyGreen
        Required = True
        RequiredMsg = 'El n'#250'mero de cajas es obligatorio'
        InputType = itInteger
        MaxLength = 12
        TabOrder = 6
        OnChange = cajas_elChange
        DataField = 'cajas_el'
        DataSource = DSDetalle1
      end
      object palets_el: TBDEdit
        Left = 454
        Top = 35
        Width = 35
        Height = 21
        ColorEdit = clMoneyGreen
        Required = True
        RequiredMsg = 'El n'#250'mero de palets es obligatorio'
        InputType = itInteger
        TabOrder = 5
        OnChange = palets_elChange
        DataField = 'palets_el'
        DataSource = DSDetalle1
      end
      object kilos_el: TBDEdit
        Left = 779
        Top = 35
        Width = 57
        Height = 21
        ColorEdit = clMoneyGreen
        Required = True
        RequiredMsg = 'El n'#250'mero de kilos es obligatorio'
        InputType = itReal
        MaxDecimals = 2
        MaxLength = 12
        TabOrder = 7
        OnChange = kilos_elChange
        DataField = 'kilos_el'
        DataSource = DSDetalle1
      end
      object variedad_el: TBDEdit
        Left = 608
        Top = 12
        Width = 43
        Height = 21
        ColorEdit = clMoneyGreen
        Required = True
        RequiredMsg = 'El producto del proveedor es de obligada inserci'#243'n.'
        OnRequiredTime = empresa_ecRequiredTime
        InputType = itInteger
        MaxLength = 3
        TabOrder = 2
        OnChange = variedad_elChange
        DataField = 'variedad_el'
        DataSource = DSDetalle1
      end
      object categoria_el: TBDEdit
        Left = 129
        Top = 35
        Width = 23
        Height = 21
        ColorEdit = clMoneyGreen
        Required = True
        RequiredMsg = 'La categor'#237'a es obligatoria.'
        OnRequiredTime = empresa_ecRequiredTime
        MaxLength = 2
        TabOrder = 3
        DataField = 'categoria_el'
        DataSource = DSDetalle1
      end
      object calibre_el: TBDEdit
        Left = 280
        Top = 35
        Width = 49
        Height = 21
        ColorEdit = clMoneyGreen
        Required = True
        RequiredMsg = 'El calibre es obligatorio.'
        OnRequiredTime = empresa_ecRequiredTime
        MaxLength = 6
        TabOrder = 4
        OnChange = calibre_elChange
        DataField = 'calibre_el'
        DataSource = DSDetalle1
      end
      object precio_el: TBDEdit
        Left = 779
        Top = 59
        Width = 56
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itReal
        MaxDecimals = 5
        MaxLength = 10
        TabOrder = 10
        DataField = 'precio_el'
        DataSource = DSDetalle1
      end
      object cbxUnidad_precio_el: TComboBox
        Left = 836
        Top = 59
        Width = 81
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        Color = clInactiveBorder
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 11
        Text = 'KILOS'
        OnChange = cbxUnidad_precio_elChange
        Items.Strings = (
          'KILOS'
          'CAJAS'
          'UNIDADES')
      end
      object unidad_precio_el: TBDEdit
        Left = 9
        Top = 1
        Width = 26
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itInteger
        Enabled = False
        Visible = False
        ReadOnly = True
        MaxLength = 3
        TabOrder = 0
        OnChange = unidad_precio_elChange
        DataField = 'unidad_precio_el'
        DataSource = DSDetalle1
      end
      object unidades_el: TBDEdit
        Left = 608
        Top = 59
        Width = 43
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itInteger
        TabOrder = 9
        DataField = 'unidades_el'
        DataSource = DSDetalle1
      end
      object aprovechados_el: TBDEdit
        Left = 129
        Top = 82
        Width = 57
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itReal
        MaxDecimals = 2
        MaxLength = 12
        TabOrder = 12
        OnChange = aprovechados_elChange
        DataField = 'aprovechados_el'
        DataSource = DSDetalle1
      end
      object peso_el: TBDEdit
        Left = 129
        Top = 59
        Width = 57
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itReal
        MaxDecimals = 2
        MaxLength = 12
        TabOrder = 8
        OnChange = aprovechados_elChange
        DataField = 'peso_el'
        DataSource = DSDetalle1
      end
      object almacen_el: TBDEdit
        Left = 128
        Top = 12
        Width = 33
        Height = 21
        ColorEdit = clMoneyGreen
        Required = True
        RequiredMsg = 'El c'#243'digo del almac'#233'n del proveedor de obligada inserci'#243'n.'
        OnRequiredTime = empresa_ecRequiredTime
        InputType = itInteger
        MaxLength = 3
        TabOrder = 1
        OnChange = almacen_elChange
        DataField = 'almacen_el'
        DataSource = DSDetalle1
      end
    end
    object RVisualizacion1: TDBGrid
      Left = 1
      Top = 116
      Width = 1202
      Height = 189
      TabStop = False
      Align = alClient
      DataSource = DSDetalle1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = RVisualizacion1DrawColumnCell
      OnDblClick = RVisualizacion1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Almacen_el'
          Title.Caption = 'Almacen'
          Width = 184
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'producto_el'
          Title.Alignment = taCenter
          Title.Caption = 'Prod.'
          Width = 41
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'categoria_el'
          Title.Alignment = taCenter
          Title.Caption = 'Cat.'
          Width = 35
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'calibre_el'
          Title.Alignment = taCenter
          Title.Caption = 'Calibre'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'variedad_el'
          Title.Caption = 'Variedad'
          Width = 179
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'palets_el'
          Title.Caption = 'Palets'
          Width = 54
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'cajas_el'
          Title.Caption = 'Cajas'
          Width = 50
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'kilos_el'
          Title.Caption = 'Kgs Albar'#225'n'
          Width = 60
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'peso_el'
          Title.Caption = 'Peso Real'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aprovechados_el'
          Title.Caption = 'Aprovecha.'
          Width = 60
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'unidades_el'
          Title.Caption = 'Unidades'
          Width = 51
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'precio_el'
          Title.Caption = 'Precio'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unidad_precio_el'
          Title.Caption = 'Fact. Por'
          Width = 50
          Visible = True
        end>
    end
  end
  object pnlAlmacen: TPanel
    Left = 782
    Top = 5
    Width = 187
    Height = 88
    TabOrder = 1
    object btnPesos: TButton
      Left = 4
      Top = 0
      Width = 179
      Height = 26
      Caption = 'Distribuir Peso Cami'#243'n'
      Enabled = False
      TabOrder = 0
      OnClick = btnPesosClick
    end
    object btnFinalizar: TButton
      Left = 4
      Top = 32
      Width = 179
      Height = 26
      Caption = 'Des/Finalizar Descarga'
      Enabled = False
      TabOrder = 1
      OnClick = btnFinalizarClick
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 619
    Width = 1204
    Height = 135
    Align = alBottom
    TabOrder = 5
    object pnlDerecho: TPanel
      Left = 1018
      Top = 1
      Width = 185
      Height = 133
      Align = alRight
      TabOrder = 1
      object dbtxtn_factura_fpl: TDBText
        Left = 135
        Top = 49
        Width = 29
        Height = 16
        DataField = 'n_factura_fpl'
        DataSource = DSFacturaPlatano
      end
      object dbtxtempresa_fpl: TDBText
        Left = 110
        Top = 29
        Width = 21
        Height = 16
        DataField = 'empresa_fpl'
        DataSource = DSFacturaPlatano
      end
      object lblFacturaPlatano: TLabel
        Left = 23
        Top = 29
        Width = 84
        Height = 13
        Caption = 'Factura Dep'#243'sito:'
      end
      object btnFacturas: TButton
        Left = 5
        Top = 4
        Width = 179
        Height = 21
        Caption = 'Facturas Asociadas (Alt+G)'
        Enabled = False
        TabOrder = 0
        OnClick = btnFacturasClick
      end
      object btnEnvio: TButton
        Left = 3
        Top = 48
        Width = 179
        Height = 21
        Caption = 'Enviada al almac'#233'n - Marcar/Des'
        Enabled = False
        TabOrder = 1
        OnClick = btnEnvioClick
      end
      object btnEntegaDirecta: TButton
        Left = 3
        Top = 70
        Width = 179
        Height = 21
        Caption = 'Entrega Directa - Marcar/Des'
        Enabled = False
        TabOrder = 2
        OnClick = btnEntegaDirectaClick
      end
      object btnCambiarPlanta: TButton
        Left = 3
        Top = 92
        Width = 179
        Height = 21
        Caption = 'Cambiar Planta'
        Enabled = False
        TabOrder = 3
        OnClick = btnCambiarPlantaClick
      end
    end
    object pnlIzquierdo: TPanel
      Left = 1
      Top = 1
      Width = 1017
      Height = 133
      Align = alClient
      TabOrder = 0
      object pgcInferior: TPageControl
        Left = 1
        Top = 1
        Width = 1015
        Height = 131
        ActivePage = tsFacturas
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object tsFacturas: TTabSheet
          Caption = 'Facturas'
          object dbgrejilla: TDBGrid
            Left = 0
            Top = 0
            Width = 988
            Height = 123
            TabStop = False
            Align = alClient
            DataSource = DSGastosEntregas
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'tipo_ge'
                Title.Alignment = taCenter
                Title.Caption = 'Tipo'
                Title.Color = cl3DLight
                Width = 34
                Visible = True
              end
              item
                Alignment = taRightJustify
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'importe_ge'
                Title.Alignment = taCenter
                Title.Caption = 'Importe'
                Title.Color = cl3DLight
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ref_fac_ge'
                Title.Caption = 'Factura'
                Title.Color = cl3DLight
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'fecha_fac_ge'
                Title.Caption = 'Fecha'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nota_ge'
                Title.Caption = 'Nota'
                Width = 258
                Visible = True
              end>
          end
        end
      end
    end
  end
  object RejillaFlotante: TBGrid
    Left = 926
    Top = 168
    Width = 41
    Height = 57
    Color = clInfoBk
    DataSource = DMBaseDatos.DSQDespegables
    FixedColor = clInfoText
    Options = [dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object Calendario: TBCalendario
    Left = 1005
    Top = 37
    Width = 182
    Height = 158
    Date = 36864.672991030090000000
    TabOrder = 2
    Visible = False
    WeekNumbers = True
  end
  object DSMaestro: TDataSource
    DataSet = MDEntregas.QEntregasC
    Left = 8
    Top = 8
  end
  object DSDetalleTotales: TDataSource
    AutoEdit = False
    DataSet = MDEntregas.QTotalLineas
    OnDataChange = DSDetalleTotalesDataChange
    Left = 1016
    Top = 269
  end
  object DSDetalle1: TDataSource
    DataSet = MDEntregas.TEntregasL
    Left = 8
    Top = 304
  end
  object DSCompras: TDataSource
    Left = 754
    Top = 4
  end
  object DSGastosEntregas: TDataSource
    DataSet = MDEntregas.QGastosEntregas
    Left = 64
    Top = 624
  end
  object DSFacturaPlatano: TDataSource
    DataSet = MDEntregas.QFacturaPlatano
    Left = 792
    Top = 496
  end
  object dsTotalCompra: TDataSource
    AutoEdit = False
    DataSet = MDEntregas.QTotalFacturaCompra
    OnDataChange = dsTotalCompraDataChange
    Left = 1016
    Top = 301
  end
end
