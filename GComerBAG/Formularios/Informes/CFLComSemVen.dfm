object DFLComSemVen: TDFLComSemVen
  Left = 360
  Top = 373
  BorderIcons = []
  Caption = '   COMPARATIVO SEMANAL DE VENTAS (BRUTO)'
  ClientHeight = 434
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 434
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      458
      434)
    object SBAceptar: TSpeedButton
      Left = 239
      Top = 389
      Width = 90
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF000000FFBF0000FF00000000BFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF000000FFBF0000FF00000000BFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000FF000000FF000000FFBF0000FF000000FFBF00000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FFBF0000FF000000FFBF0000FF000000FFBF00000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007F7F
        7F000000FF3F0000FFBF00000000FF00FF000000FF000000FFBF0000FF000000
        00BFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007F7F7F000000
        FF3F00000000FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
        00BFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
        FFBF00000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
        FFBF00000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF00000000BFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F7F7F000000FF3F00000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF007F7F7F000000FF3F000000BFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000FF000000FF00000000BFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = SBAceptarClick
    end
    object SBCancelar: TSpeedButton
      Left = 351
      Top = 390
      Width = 90
      Height = 22
      Action = Cancelar
      Anchors = [akRight, akBottom]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00E3E3E3E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E300FFE3E3E3E300FF
        E3E3E3E3E3E3E3E3E3E3E3E3E3000000FFE3E3E3E3E3E300FFE3E3E3E3000000
        FFE3E3E3E3E300FFE3E3E3E3E3E3000000FFE3E3E30000FFE3E3E3E3E3E3E300
        0000FFE30000FFE3E3E3E3E3E3E3E3E30000000000FFE3E3E3E3E3E3E3E3E3E3
        E3000000FFE3E3E3E3E3E3E3E3E3E3E30000000000FFE3E3E3E3E3E3E3E3E300
        0000FFE300FFE3E3E3E3E3E3E300000000FFE3E3E30000FFE3E3E3E300000000
        FFE3E3E3E3E30000FFE3E3E30000FFE3E3E3E3E3E3E3E30000FFE3E3E3E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3}
    end
    object Label8: TLabel
      Left = 52
      Top = 336
      Width = 360
      Height = 13
      Caption = 
        'Los datos obtenidos con este informe son superiores al 1/1/2001,' +
        ' para a'#241'os'
    end
    object Label9: TLabel
      Left = 52
      Top = 352
      Width = 162
      Height = 13
      Caption = 'anteriores usar el informe historico.'
    end
    object grupo: TGroupBox
      Left = 26
      Top = 31
      Width = 417
      Height = 294
      TabOrder = 0
      object Bevel1: TBevel
        Left = 27
        Top = 147
        Width = 354
        Height = 128
      end
      object Label1: TLabel
        Left = 27
        Top = 32
        Width = 86
        Height = 19
        AutoSize = False
        Caption = ' Empresa'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object Label2: TLabel
        Left = 27
        Top = 60
        Width = 86
        Height = 19
        AutoSize = False
        Caption = ' Producto'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object BGBEmpresa: TBGridButton
        Left = 152
        Top = 31
        Width = 13
        Height = 21
        Action = DesplegarRejilla
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        Control = Empresa
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object BGBProducto: TBGridButton
        Left = 152
        Top = 59
        Width = 13
        Height = 21
        Action = DesplegarRejilla
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        Control = Producto
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object BGBCliente: TBGridButton
        Left = 164
        Top = 187
        Width = 13
        Height = 21
        Action = DesplegarRejilla
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        Control = Cliente
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object BCBHasta: TBCalendarButton
        Left = 357
        Top = 88
        Width = 23
        Height = 21
        Action = DesplegarRejilla
        Glyph.Data = {
          E2020000424DE20200000000000042000000280000001C0000000C0000000100
          100003000000A002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
          EF3D1F7C1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F7C
          1F7C000000000F0000000F000F0000000F00000000000F00EF3D1F7CEF3DEF3D
          EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F1F7C1F7CFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F1F7CFF7FFF7FFF7F
          1F7CFF7FFF7FFF7F1F7CEF3DFF7F1F7C1F7CFF7F000000000000FF7F00000000
          0000F75EFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DEF3D1F7CEF3DEF3DEF3D1F7C
          FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7FF75EFF7FF75E0000FF7F0F00
          EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C1F7C1F7C1F7CEF3DFF7FEF3DFF7F1F7C
          1F7CFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F0F00EF3D1F7CEF3DFF7F
          1F7CEF3DFF7F1F7C1F7CFF7FFF7FEF3D1F7CEF3DFF7F1F7C1F7CFF7FFF7F0000
          FF7FFF7F000000000000F75EFF7F0F00EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C
          EF3DEF3DEF3D1F7C1F7CEF3DFF7F1F7C1F7CFF7F00000000FF7FFF7F0000FF7F
          FF7FFF7FFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DFF7F1F7CEF3DFF7FFF7FFF7F
          FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7F0000000000000000FF7F0F00
          EF3D1F7CEF3DFF7F1F7CEF3D1F7C1F7CEF3DEF3DEF3DEF3D1F7CEF3DFF7F1F7C
          1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DFF7F1F7C1F7CFF7FF75EF75E
          F75EF75EF75EF75EF75EF75EFF7F0F00EF3D1F7CEF3DFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FEF3DFF7F1F7C1F7C0000000000000000000000000000
          0000000000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
          EF3DEF3D1F7C}
        NumGlyphs = 2
        Control = Hasta
        Calendar = CalendarioFlotante
        CalendarAlignment = taUpLeft
        CalendarWidth = 197
        CalendarHeigth = 153
      end
      object BCBDesde: TBCalendarButton
        Left = 191
        Top = 88
        Width = 23
        Height = 21
        Action = DesplegarRejilla
        Glyph.Data = {
          E2020000424DE20200000000000042000000280000001C0000000C0000000100
          100003000000A002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
          EF3D1F7C1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F7C
          1F7C000000000F0000000F000F0000000F00000000000F00EF3D1F7CEF3DEF3D
          EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F1F7C1F7CFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F1F7CFF7FFF7FFF7F
          1F7CFF7FFF7FFF7F1F7CEF3DFF7F1F7C1F7CFF7F000000000000FF7F00000000
          0000F75EFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DEF3D1F7CEF3DEF3DEF3D1F7C
          FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7FF75EFF7FF75E0000FF7F0F00
          EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C1F7C1F7C1F7CEF3DFF7FEF3DFF7F1F7C
          1F7CFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F0F00EF3D1F7CEF3DFF7F
          1F7CEF3DFF7F1F7C1F7CFF7FFF7FEF3D1F7CEF3DFF7F1F7C1F7CFF7FFF7F0000
          FF7FFF7F000000000000F75EFF7F0F00EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C
          EF3DEF3DEF3D1F7C1F7CEF3DFF7F1F7C1F7CFF7F00000000FF7FFF7F0000FF7F
          FF7FFF7FFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DFF7F1F7CEF3DFF7FFF7FFF7F
          FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7F0000000000000000FF7F0F00
          EF3D1F7CEF3DFF7F1F7CEF3D1F7C1F7CEF3DEF3DEF3DEF3D1F7CEF3DFF7F1F7C
          1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DFF7F1F7C1F7CFF7FF75EF75E
          F75EF75EF75EF75EF75EF75EFF7F0F00EF3D1F7CEF3DFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FEF3DFF7F1F7C1F7C0000000000000000000000000000
          0000000000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
          EF3DEF3D1F7C}
        NumGlyphs = 2
        Control = Desde
        Calendar = CalendarioFlotante
        CalendarAlignment = taUpCenter
        CalendarWidth = 197
        CalendarHeigth = 153
      end
      object Label3: TLabel
        Left = 27
        Top = 89
        Width = 86
        Height = 19
        AutoSize = False
        Caption = ' FechaDesde'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 39
        Top = 217
        Width = 86
        Height = 19
        AutoSize = False
        Caption = ' Categoria'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 219
        Top = 89
        Width = 55
        Height = 19
        AutoSize = False
        Caption = ' Hasta'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object Label7: TLabel
        Left = 39
        Top = 246
        Width = 86
        Height = 19
        AutoSize = False
        Caption = ' Art'#237'culo'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object BGBCentro: TBGridButton
        Left = 164
        Top = 158
        Width = 13
        Height = 21
        Action = DesplegarRejilla
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          0400000000005000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          0000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFF0FFFFF00
          0000FFF000FFFF000000FF00000FFF000000F0000000FF000000FFFFFFFFFF00
          0000FFFFFFFFFF000000}
        Control = ECentro
        Grid = RejillaFlotante
        GridAlignment = taDownRight
        GridWidth = 280
        GridHeigth = 200
      end
      object Label6: TLabel
        Left = 39
        Top = 135
        Width = 45
        Height = 13
        Caption = 'Opcional '
      end
      object ECategoria: TBEdit
        Left = 127
        Top = 216
        Width = 25
        Height = 21
        ColorEdit = clMoneyGreen
        MaxLength = 3
        TabOrder = 12
        OnChange = PonNombre
      end
      object EEnvase: TBEdit
        Left = 127
        Top = 245
        Width = 65
        Height = 21
        ColorEdit = clMoneyGreen
        MaxLength = 9
        TabOrder = 13
        OnChange = PonNombre
      end
      object Empresa: TBEdit
        Left = 115
        Top = 31
        Width = 36
        Height = 21
        ColorEdit = clMoneyGreen
        MaxLength = 3
        TabOrder = 0
        OnChange = PonNombre
      end
      object Producto: TBEdit
        Left = 115
        Top = 59
        Width = 36
        Height = 21
        ColorEdit = clMoneyGreen
        MaxLength = 3
        TabOrder = 2
        OnChange = PonNombre
      end
      object Cliente: TBEdit
        Left = 127
        Top = 187
        Width = 36
        Height = 21
        ColorEdit = clMoneyGreen
        MaxLength = 3
        TabOrder = 10
        OnChange = PonNombre
      end
      object STEmpresa: TStaticText
        Left = 180
        Top = 33
        Width = 200
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 1
      end
      object STProducto: TStaticText
        Left = 180
        Top = 61
        Width = 200
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 3
      end
      object STCliente: TStaticText
        Left = 179
        Top = 189
        Width = 190
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 11
      end
      object cbClienteSalida: TComboBox
        Left = 39
        Top = 187
        Width = 86
        Height = 21
        Style = csDropDownList
        Color = cl3DLight
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 9
        TabStop = False
        Text = 'Cliente Salida'
        OnChange = cbClienteSalidaChange
        Items.Strings = (
          'Cliente Salida'
          'Pais')
      end
      object Hasta: TBEdit
        Left = 277
        Top = 88
        Width = 77
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itDate
        TabOrder = 5
      end
      object Desde: TBEdit
        Left = 115
        Top = 88
        Width = 77
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itDate
        ReadOnly = True
        TabOrder = 4
      end
      object cbCentroSalida: TComboBox
        Left = 39
        Top = 158
        Width = 86
        Height = 21
        Style = csDropDownList
        Color = cl3DLight
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 6
        TabStop = False
        Text = 'Centro Salida'
        OnChange = cbClienteSalidaChange
        Items.Strings = (
          'Centro Salida'
          'Centro Origen')
      end
      object ECentro: TBEdit
        Left = 127
        Top = 158
        Width = 36
        Height = 21
        ColorEdit = clMoneyGreen
        MaxLength = 3
        TabOrder = 7
        OnChange = PonNombre
      end
      object STCentro: TStaticText
        Left = 179
        Top = 160
        Width = 190
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 8
      end
    end
  end
  object RejillaFlotante: TBGrid
    Left = 441
    Top = 64
    Width = 89
    Height = 105
    Color = clInfoBk
    Options = [dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object CalendarioFlotante: TBCalendario
    Left = 441
    Top = 112
    Width = 201
    Height = 153
    Date = 36942.906570509260000000
    ShowToday = False
    TabOrder = 2
    Visible = False
    WeekNumbers = True
  end
  object ActionList1: TActionList
    Left = 8
    Top = 8
    object Aceptar: TAction
      Caption = 'Aceptar'
      ShortCut = 112
    end
    object Cancelar: TAction
      Caption = 'Cancelar'
      ShortCut = 27
      OnExecute = CancelarExecute
    end
    object DesplegarRejilla: TAction
      ShortCut = 113
      OnExecute = DesplegarRejillaExecute
    end
  end
end
