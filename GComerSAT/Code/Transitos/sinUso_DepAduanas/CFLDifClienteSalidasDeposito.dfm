object FLDifClienteSalidasDeposito: TFLDifClienteSalidasDeposito
  Left = 647
  Top = 235
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '  DIFERENCIAS DESTINO DEP'#211'SITO/ALBAR'#193'N SALIDA'
  ClientHeight = 220
  ClientWidth = 444
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
  OnKeyDown = FormKeyDown
  DesignSize = (
    444
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 35
    Width = 77
    Height = 19
    AutoSize = False
    Caption = ' Empresa'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object BGBEmpresa: TBGridButton
    Left = 165
    Top = 34
    Width = 13
    Height = 21
    Action = ADesplegarRejilla
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
    Control = eEmpresa
    Grid = RejillaFlotante
    GridAlignment = taDownRight
    GridWidth = 280
    GridHeigth = 100
  end
  object BCBDesde: TBCalendarButton
    Left = 211
    Top = 82
    Width = 17
    Height = 21
    Action = ADesplegarRejilla
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
    Control = eFechaDesde
    Calendar = CalendarioFlotante
    CalendarAlignment = taCenterCenter
    CalendarWidth = 197
    CalendarHeigth = 153
  end
  object Desde: TLabel
    Left = 48
    Top = 83
    Width = 77
    Height = 19
    AutoSize = False
    Caption = ' Fecha Desde'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object Label14: TLabel
    Left = 245
    Top = 83
    Width = 55
    Height = 19
    AutoSize = False
    Caption = ' Hasta'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object BCBHasta: TBCalendarButton
    Left = 385
    Top = 82
    Width = 17
    Height = 21
    Action = ADesplegarRejilla
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
    Control = eFechaHasta
    Calendar = CalendarioFlotante
    CalendarAlignment = taCenterLeft
    CalendarWidth = 197
    CalendarHeigth = 153
  end
  object SpeedButton1: TSpeedButton
    Left = 230
    Top = 166
    Width = 89
    Height = 25
    Action = BAceptar
    Anchors = [akRight, akBottom]
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
    ParentShowHint = False
    ShowHint = True
  end
  object SpeedButton2: TSpeedButton
    Left = 327
    Top = 166
    Width = 89
    Height = 25
    Action = BCancelar
    Anchors = [akRight, akBottom]
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FFBFFF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FFFFFF00FF00FFBFFF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FFBFFF00FF00FF00
      FF00FF00FF00000000000000000000000000FFFFFF00FF00FFBFFF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FFBFFF00
      FF00FF00FF000000000000000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
      FFBF0000000000000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
      0000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
      FFBF00000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000000000000000000000000000FFFFFF00FF00FFBFFF00
      FF00FF00FF000000000000000000FFFFFF00FF00FFBFFF00FF00FF00FFBFFF00
      FF0000000000000000000000000000000000FFFFFF00FF00FFBFFF00FF00FF00
      FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FFBFFF00FF00FF00
      FF000000000000000000FFFFFF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
  end
  object lblNombre1: TLabel
    Left = 48
    Top = 59
    Width = 77
    Height = 19
    AutoSize = False
    Caption = ' Centro Tr'#225'nsito'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object BGBCentro: TBGridButton
    Left = 149
    Top = 58
    Width = 13
    Height = 21
    Action = ADesplegarRejilla
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
    Control = eCentro
    Grid = RejillaFlotante
    GridAlignment = taDownRight
    GridWidth = 280
    GridHeigth = 100
  end
  object CalendarioFlotante: TBCalendario
    Left = 416
    Top = 72
    Width = 201
    Height = 153
    Date = 36717.6884479398
    ShowToday = False
    TabOrder = 4
    Visible = False
    WeekNumbers = True
  end
  object eEmpresa: TBEdit
    Left = 129
    Top = 34
    Width = 34
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 3
    TabOrder = 0
    OnChange = PonNombre
  end
  object STEmpresa: TStaticText
    Left = 179
    Top = 36
    Width = 222
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 1
  end
  object eFechaDesde: TBEdit
    Left = 129
    Top = 82
    Width = 81
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itDate
    MaxLength = 10
    TabOrder = 5
  end
  object eFechaHasta: TBEdit
    Left = 304
    Top = 82
    Width = 81
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itDate
    MaxLength = 10
    TabOrder = 6
  end
  object eCentro: TBEdit
    Left = 129
    Top = 58
    Width = 18
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 1
    TabOrder = 2
    OnChange = PonNombre
  end
  object stCentro: TStaticText
    Left = 179
    Top = 60
    Width = 222
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 3
  end
  object chkSinFactura: TCheckBox
    Left = 48
    Top = 108
    Width = 361
    Height = 17
    Caption = 
      'Mostrar solo los que no tienen factura de alquiler plataforma as' +
      'ignada.'
    TabOrder = 7
  end
  object RejillaFlotante: TBGrid
    Left = 420
    Top = 207
    Width = 137
    Height = 135
    Color = clInfoBk
    FixedColor = clInfoText
    Options = [dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object ListaAcciones: TActionList
    Images = DMBaseDatos.ImgBotones
    Left = 8
    Top = 36
    object BAceptar: TAction
      Caption = 'Aceptar'
      ShortCut = 112
      OnExecute = BBAceptarClick
    end
    object BCancelar: TAction
      Caption = 'Cancelar'
      ShortCut = 27
      OnExecute = BBCancelarClick
    end
    object ADesplegarRejilla: TAction
      ImageIndex = 0
      ShortCut = 113
      OnExecute = ADesplegarRejillaExecute
    end
  end
end
