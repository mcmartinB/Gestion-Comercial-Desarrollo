object FLCuadreAlmacenSemanal: TFLCuadreAlmacenSemanal
  Left = 789
  Top = 222
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '    CUADRE SEMANAL RF ALMAC'#201'N - EN DESARROLLO, NO FINAL'
  ClientHeight = 228
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  DesignSize = (
    446
    228)
  PixelsPerInch = 96
  TextHeight = 13
  object lblNombre1: TLabel
    Left = 33
    Top = 39
    Width = 107
    Height = 19
    AutoSize = False
    Caption = ' Planta'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object btnEmpresa: TBGridButton
    Left = 187
    Top = 38
    Width = 13
    Height = 21
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
      00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = botonClick
    Control = eEmpresa
    Grid = RejillaFlotante
    GridAlignment = taDownRight
    GridWidth = 223
    GridHeigth = 100
  end
  object Desde: TLabel
    Left = 33
    Top = 63
    Width = 115
    Height = 19
    AutoSize = False
    Caption = ' Fecha Ini. Orden Carga'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object btnFechaDesde: TBCalendarButton
    Left = 232
    Top = 62
    Width = 17
    Height = 21
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000000000007F000000000000007F0000007F000000000000007F00
      000000000000000000007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      0000BFBFBF00FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF0000000000FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
      0000BFBFBF00FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00FFFFFF007F0000007F7F7F00FF00FF007F7F7F00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF007F7F7F00}
    OnClick = botonClick
    Control = eLunes
    Calendar = CalendarioFlotante
    CalendarAlignment = taCenterCenter
    CalendarWidth = 197
    CalendarHeigth = 153
  end
  object lblSemana: TLabel
    Left = 252
    Top = 63
    Width = 157
    Height = 19
    AutoSize = False
    Caption = '(La fecha debe ser un lunes)'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object lblNombre3: TLabel
    Left = 33
    Top = 88
    Width = 107
    Height = 19
    AutoSize = False
    Caption = ' Producto'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object btnProducto: TBGridButton
    Left = 187
    Top = 87
    Width = 13
    Height = 21
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
      00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
      FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = botonClick
    Control = eProducto
    Grid = RejillaFlotante
    GridAlignment = taDownRight
    GridWidth = 223
    GridHeigth = 100
  end
  object btnCerrar: TBitBtn
    Left = 337
    Top = 156
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar (Esc)'
    TabOrder = 10
    TabStop = False
    OnClick = btnCerrarClick
    Kind = bkCancel
  end
  object btnAceptar: TBitBtn
    Left = 231
    Top = 156
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Aceptar (F1)'
    ModalResult = 1
    TabOrder = 9
    TabStop = False
    OnClick = btnAceptarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object eEmpresa: TBEdit
    Left = 151
    Top = 38
    Width = 34
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 3
    TabOrder = 2
    OnChange = PonNombreEmpresa
  end
  object lEmpresa: TStaticText
    Left = 201
    Top = 40
    Width = 208
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 3
  end
  object eLunes: TBEdit
    Left = 151
    Top = 62
    Width = 81
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itDate
    MaxLength = 10
    TabOrder = 4
    OnChange = eLunesChange
  end
  object eProducto: TBEdit
    Left = 151
    Top = 87
    Width = 34
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 3
    TabOrder = 5
    OnChange = PonNombreProducto
  end
  object lProducto: TStaticText
    Left = 201
    Top = 89
    Width = 208
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 6
  end
  object chkPaletsEntrada: TCheckBox
    Left = 151
    Top = 114
    Width = 122
    Height = 17
    Caption = 'Ver Palets Entrada'
    Enabled = False
    TabOrder = 7
  end
  object chkPaletsSalida: TCheckBox
    Left = 279
    Top = 114
    Width = 122
    Height = 17
    Caption = 'Ver Palets Salida'
    Enabled = False
    TabOrder = 8
  end
  object mmo1: TMemo
    Left = 0
    Top = 192
    Width = 445
    Height = 37
    Lines.Strings = (
      
        'Cargados -> palets RF confeccionados con status C (cargados) o S' +
        ' (stock)'
      
        'Consumidos -> palets RF proveedor con status V (volcados), R (re' +
        'gularizados) o D (destrio)')
    TabOrder = 11
  end
  object CalendarioFlotante: TBCalendario
    Left = 421
    Top = 32
    Width = 197
    Height = 153
    Date = 36717.4547141898
    ShowToday = False
    TabOrder = 1
    Visible = False
    WeekNumbers = True
  end
  object RejillaFlotante: TBGrid
    Left = 423
    Top = -6
    Width = 223
    Height = 100
    Color = clInfoBk
    FixedColor = clInfoText
    Options = [dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
end