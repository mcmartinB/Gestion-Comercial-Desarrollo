object FLLiquidacionProvedores: TFLLiquidacionProvedores
  Left = 804
  Top = 188
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '    LIQUIDACI'#211'N A TERCEROS'
  ClientHeight = 307
  ClientWidth = 527
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 307
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      527
      307)
    object Bevel: TBevel
      Left = 49
      Top = 19
      Width = 425
      Height = 220
    end
    object SpeedButton1: TSpeedButton
      Left = 292
      Top = 252
      Width = 88
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
      Left = 386
      Top = 252
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
    object BGBCentro: TBGridButton
      Left = 211
      Top = 61
      Width = 13
      Height = 22
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
      Control = ECentro
      Grid = RejillaFlotante
      GridAlignment = taDownCenter
      GridWidth = 240
      GridHeigth = 130
    end
    object LCentro: TLabel
      Left = 77
      Top = 63
      Width = 90
      Height = 19
      AutoSize = False
      Caption = ' Centro Origen'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object BGBEmpresa: TBGridButton
      Left = 211
      Top = 37
      Width = 13
      Height = 22
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
      Control = EEmpresa
      Grid = RejillaFlotante
      GridAlignment = taDownCenter
      GridWidth = 240
      GridHeigth = 130
    end
    object LEmpresa: TLabel
      Left = 77
      Top = 39
      Width = 90
      Height = 19
      AutoSize = False
      Caption = ' Empresa'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object LProducto: TLabel
      Left = 77
      Top = 87
      Width = 90
      Height = 19
      AutoSize = False
      Caption = ' Producto'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object BGBProducto: TBGridButton
      Left = 211
      Top = 85
      Width = 13
      Height = 22
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
      Control = EProducto
      Grid = RejillaFlotante
      GridAlignment = taDownCenter
      GridWidth = 240
      GridHeigth = 130
    end
    object Label6: TLabel
      Left = 77
      Top = 111
      Width = 90
      Height = 19
      AutoSize = False
      Caption = ' Productor'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object BGBProductor: TBGridButton
      Left = 211
      Top = 109
      Width = 13
      Height = 22
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
      Control = EProductor
      Grid = RejillaFlotante
      GridAlignment = taDownCenter
      GridWidth = 240
      GridHeigth = 130
    end
    object Label9: TLabel
      Left = 49
      Top = 255
      Width = 98
      Height = 19
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = ' Aprovechamiento'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 76
      Top = 137
      Width = 373
      Height = 60
      Caption = ' Periodo '
      TabOrder = 8
      object Label1: TLabel
        Left = 24
        Top = 23
        Width = 57
        Height = 19
        AutoSize = False
        Caption = ' Desde'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object Label2: TLabel
        Left = 193
        Top = 23
        Width = 58
        Height = 19
        AutoSize = False
        Caption = ' Hasta'
        Color = cl3DLight
        ParentColor = False
        Layout = tlCenter
      end
      object BCBDesde: TBCalendarButton
        Left = 166
        Top = 22
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
        Control = MEDesde
        Calendar = CalendarioFlotante
        CalendarAlignment = taCenterLeft
        CalendarWidth = 197
        CalendarHeigth = 153
      end
      object BCBHasta: TBCalendarButton
        Left = 336
        Top = 22
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
        Control = MEHasta
        Calendar = CalendarioFlotante
        CalendarAlignment = taCenterLeft
        CalendarWidth = 197
        CalendarHeigth = 153
      end
      object MEDesde: TBEdit
        Left = 85
        Top = 22
        Width = 81
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itDate
        MaxLength = 10
        TabOrder = 0
        OnChange = MEDesdeChange
      end
      object MEHasta: TBEdit
        Left = 255
        Top = 22
        Width = 81
        Height = 21
        ColorEdit = clMoneyGreen
        InputType = itDate
        MaxLength = 10
        TabOrder = 1
      end
    end
    object STCentro: TStaticText
      Left = 227
      Top = 64
      Width = 221
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 3
    end
    object STProducto: TStaticText
      Left = 227
      Top = 88
      Width = 221
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 5
    end
    object STEmpresa: TStaticText
      Left = 227
      Top = 40
      Width = 221
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 1
    end
    object EEmpresa: TBEdit
      Left = 173
      Top = 38
      Width = 38
      Height = 21
      ColorEdit = clMoneyGreen
      Zeros = True
      MaxLength = 3
      TabOrder = 0
      OnChange = PonNombre
    end
    object ECentro: TBEdit
      Left = 173
      Top = 62
      Width = 18
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 1
      TabOrder = 2
      OnChange = PonNombre
    end
    object EProducto: TBEdit
      Left = 173
      Top = 86
      Width = 38
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 3
      TabOrder = 4
      OnChange = EProductoChange
    end
    object EProductor: TBEdit
      Left = 173
      Top = 110
      Width = 36
      Height = 21
      ColorEdit = clMoneyGreen
      InputType = itInteger
      MaxLength = 3
      TabOrder = 6
      OnChange = EProductorChange
    end
    object STProductor: TStaticText
      Left = 227
      Top = 112
      Width = 221
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 7
    end
    object rbtSimulacion: TRadioButton
      Left = 76
      Top = 202
      Width = 113
      Height = 17
      Anchors = []
      Caption = 'Simulaci'#243'n'
      Checked = True
      TabOrder = 9
      TabStop = True
    end
    object rbtFinal: TRadioButton
      Left = 164
      Top = 202
      Width = 113
      Height = 17
      Anchors = []
      Caption = 'Definitivo'
      TabOrder = 10
    end
    object cbAprovechamiento: TComboBox
      Left = 150
      Top = 253
      Width = 97
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akRight, akBottom]
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 13
      Text = 'Escandallo'
      Visible = False
      Items.Strings = (
        'Salidas'
        'Escandallo')
    end
    object cbxAbonos: TCheckBox
      Left = 256
      Top = 202
      Width = 193
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aplicar Abonos y Facturas Manuales'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object cbxComision: TCheckBox
      Left = 48
      Top = 280
      Width = 97
      Height = 17
      Caption = 'Comision'
      Checked = True
      State = cbChecked
      TabOrder = 14
      Visible = False
    end
    object cbxGastos: TCheckBox
      Left = 128
      Top = 280
      Width = 97
      Height = 17
      Caption = 'Gastos'
      Checked = True
      State = cbChecked
      TabOrder = 15
      Visible = False
    end
    object cbxAjustes: TCheckBox
      Left = 359
      Top = 219
      Width = 90
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aplicar Ajustes'
      Checked = True
      State = cbChecked
      TabOrder = 12
    end
    object cbxEnvases: TCheckBox
      Left = 299
      Top = 280
      Width = 97
      Height = 17
      Caption = 'Envase'
      Checked = True
      State = cbChecked
      TabOrder = 16
      Visible = False
    end
    object cbxSecciones: TCheckBox
      Left = 379
      Top = 280
      Width = 97
      Height = 17
      Caption = 'Secciones'
      Checked = True
      State = cbChecked
      TabOrder = 17
      Visible = False
    end
  end
  object CalendarioFlotante: TBCalendario
    Left = 504
    Top = 16
    Width = 193
    Height = 153
    Date = 36823.501271678240000000
    ShowToday = False
    TabOrder = 1
    Visible = False
    WeekNumbers = True
  end
  object RejillaFlotante: TBGrid
    Left = 471
    Top = 170
    Width = 137
    Height = 135
    Color = clInfoBk
    FixedColor = clInfoText
    Options = [dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object ListaAcciones: TActionList
    Images = DMBaseDatos.ImgBotones
    Left = 16
    Top = 4
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