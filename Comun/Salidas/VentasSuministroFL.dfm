object FLVentasSuministro: TFLVentasSuministro
  Left = 502
  Top = 283
  ActiveControl = edtEmpresa
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '    INFORME VENTAS POR SUMINISTRO'
  ClientHeight = 422
  ClientWidth = 591
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  DesignSize = (
    591
    422)
  PixelsPerInch = 96
  TextHeight = 13
  object lblEmpresa: TnbLabel
    Left = 32
    Top = 32
    Width = 97
    Height = 21
    Caption = 'Empresa'
    About = 'NB 0.1/20020725'
  end
  object etqEmpresa: TnbStaticText
    Left = 179
    Top = 32
    Width = 280
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object lblSumnistro: TnbLabel
    Left = 32
    Top = 82
    Width = 97
    Height = 21
    Caption = 'Centro Suministro'
    About = 'NB 0.1/20020725'
  end
  object etqSuministro: TnbStaticText
    Left = 179
    Top = 82
    Width = 280
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object lblCliente: TnbLabel
    Left = 32
    Top = 57
    Width = 97
    Height = 21
    Caption = 'Cliente'
    About = 'NB 0.1/20020725'
  end
  object etqCliente: TnbStaticText
    Left = 179
    Top = 57
    Width = 280
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object lblEspere: TLabel
    Left = 48
    Top = 350
    Width = 374
    Height = 13
    Caption = 'POR FAVOR ESPERE MIENTRAS SE REALIZAN LOS CALCULOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lblProducto: TnbLabel
    Left = 33
    Top = 108
    Width = 97
    Height = 21
    Caption = 'Producto'
    About = 'NB 0.1/20020725'
  end
  object etqProducto: TnbStaticText
    Left = 180
    Top = 108
    Width = 280
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object BGBEmpresa: TBGridButton
    Left = 165
    Top = 32
    Width = 13
    Height = 22
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
    OnClick = btnClick
    Control = edtEmpresa
    Grid = RejillaFlotante
    GridAlignment = taDownCenter
    GridWidth = 240
    GridHeigth = 130
  end
  object BGBCliente: TBGridButton
    Left = 165
    Top = 57
    Width = 13
    Height = 22
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
    OnClick = btnClick
    Control = edtCliente
    Grid = RejillaFlotante
    GridAlignment = taDownCenter
    GridWidth = 240
    GridHeigth = 130
  end
  object BGBProducto: TBGridButton
    Left = 165
    Top = 107
    Width = 13
    Height = 22
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
    OnClick = btnClick
    Control = edtProducto
    Grid = RejillaFlotante
    GridAlignment = taDownCenter
    GridWidth = 240
    GridHeigth = 130
  end
  object btnSuministro: TBGridButton
    Left = 165
    Top = 81
    Width = 13
    Height = 22
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
    OnClick = btnClick
    Control = edtSuministro
    Grid = RejillaFlotante
    GridAlignment = taDownCenter
    GridWidth = 240
    GridHeigth = 130
  end
  object lblEnvases: TnbLabel
    Left = 33
    Top = 134
    Width = 97
    Height = 21
    Caption = 'Art'#237'culo'
    About = 'NB 0.1/20020725'
  end
  object etqEnvases: TnbStaticText
    Left = 229
    Top = 134
    Width = 230
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object lblDDesde: TnbLabel
    Left = 52
    Top = 237
    Width = 110
    Height = 21
    Caption = 'Fecha  Desde'
    About = 'NB 0.1/20020725'
  end
  object lblDHasta: TnbLabel
    Left = 248
    Top = 237
    Width = 20
    Height = 21
    Caption = 'al'
    About = 'NB 0.1/20020725'
  end
  object lblADesde: TnbLabel
    Left = 52
    Top = 317
    Width = 110
    Height = 21
    Caption = 'A'#241'o Desde'
    About = 'NB 0.1/20020725'
  end
  object lblAHasta: TnbLabel
    Left = 248
    Top = 317
    Width = 20
    Height = 21
    Caption = 'al'
    About = 'NB 0.1/20020725'
  end
  object lblMDesde: TnbLabel
    Left = 52
    Top = 290
    Width = 110
    Height = 21
    Caption = 'A'#241'o/Mes Desde'
    About = 'NB 0.1/20020725'
  end
  object lblMHasta: TnbLabel
    Left = 248
    Top = 290
    Width = 20
    Height = 21
    Caption = 'al'
    About = 'NB 0.1/20020725'
  end
  object lblSDesde: TnbLabel
    Left = 52
    Top = 264
    Width = 110
    Height = 21
    Caption = 'A'#241'o/Semana Desde'
    About = 'NB 0.1/20020725'
  end
  object lblSHasta: TnbLabel
    Left = 248
    Top = 264
    Width = 20
    Height = 21
    Caption = 'al'
    About = 'NB 0.1/20020725'
  end
  object lbl1: TLabel
    Left = 340
    Top = 268
    Width = 78
    Height = 13
    Caption = 'Formato: aaaass'
  end
  object lbl2: TLabel
    Left = 340
    Top = 294
    Width = 84
    Height = 13
    Caption = 'Formato: aaaamm'
  end
  object lbl3: TLabel
    Left = 340
    Top = 321
    Width = 68
    Height = 13
    Caption = 'Formato: aaaa'
  end
  object btnAExcel: TSpeedButton
    Left = 302
    Top = 374
    Width = 88
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Guardar'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF007F7F
      7F00000000007F7F7F007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000BFBFBF007F7F
      7F00000000007F7F7F00000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF007F7F7F00000000007F7F7F00FF00FF0000000000000000000000
      00007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000007F7F7F00000000000000000000000000BFBFBF00BFBF
      BF007F7F7F0000000000000000007F7F7F00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF007F7F7F0000000000000000007F7F7F007F7F7F007F7F7F000000
      000000000000000000007F7F7F0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000007F7F7F007F7F7F00000000007F7F7F000000
      0000FF00FF007F7F7F00000000007F7F7F00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000BFBFBF00000000007F7F7F00000000000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000007F7F7F007F7F7F00BFBFBF0000000000BFBFBF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000BFBFBF00000000007F7F7F00000000007F7F
      7F00FF00FF00000000007F7F7F0000000000FF00FF007F7F7F00000000007F7F
      7F00FF00FF00FF00FF00000000007F7F7F00BFBFBF00000000007F7F7F000000
      000000000000000000007F7F7F000000000000000000000000007F7F7F000000
      0000FF00FF007F7F7F0000000000000000007F7F7F00BFBFBF00000000000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F
      7F00FF00FF00000000007F7F7F00000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000007F7F7F007F7F7F0000000000FF00
      FF00FF00FF007F7F7F00000000007F7F7F00FF00FF000000000000000000BFBF
      BF00000000007F7F7F007F7F7F007F7F7F00000000007F7F7F00000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000007F7F7F00BFBF
      BF0000000000BFBFBF00000000007F7F7F00000000007F7F7F007F7F7F007F7F
      7F0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000BFBF
      BF00000000007F7F7F00BFBFBF007F7F7F00000000007F7F7F00000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000007F7F
      7F00BFBFBF000000000000000000000000007F7F7F007F7F7F0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
    OnClick = btnAExcelClick
    ExplicitLeft = 209
  end
  object btnAceptar: TSpeedButton
    Left = 391
    Top = 374
    Width = 88
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Listado'
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
    OnClick = btnAceptarClick
    ExplicitLeft = 298
  end
  object btnCancelar: TSpeedButton
    Left = 480
    Top = 374
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar'
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
    OnClick = btnCancelarClick
    ExplicitLeft = 387
  end
  object lblDatosPor: TnbLabel
    Left = 33
    Top = 184
    Width = 97
    Height = 44
    Caption = ' Agrupar linea de'#13#10' datos por ...'
    About = 'NB 0.1/20020725'
  end
  object edtEmpresa: TBEdit
    Left = 132
    Top = 32
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 3
    TabOrder = 0
    OnChange = edtEmpresaChange
  end
  object edtSuministro: TBEdit
    Left = 132
    Top = 82
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 3
    TabOrder = 2
    OnChange = edtSuministroChange
  end
  object edtCliente: TBEdit
    Left = 132
    Top = 57
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 3
    TabOrder = 1
    OnChange = edtClienteChange
  end
  object edtProducto: TBEdit
    Left = 132
    Top = 108
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 3
    TabOrder = 3
    OnChange = edtProductoChange
  end
  object RejillaFlotante: TBGrid
    Left = 443
    Top = 255
    Width = 137
    Height = 135
    Color = clInfoBk
    FixedColor = clInfoText
    Options = [dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object chkCentro: TCheckBox
    Left = 462
    Top = 84
    Width = 109
    Height = 17
    TabStop = False
    Caption = 'Separar por centro'
    TabOrder = 8
  end
  object chkEnvase: TCheckBox
    Left = 465
    Top = 135
    Width = 105
    Height = 17
    TabStop = False
    Caption = 'Ver Art'#237'culo'
    TabOrder = 6
  end
  object edtDDesde: TBEdit
    Left = 165
    Top = 237
    Width = 65
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itDate
    TabOrder = 9
    OnChange = edtDDesdeChange
  end
  object edtDHasta: TBEdit
    Left = 275
    Top = 237
    Width = 65
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itDate
    TabOrder = 10
    OnChange = edtDHastaChange
  end
  object edtADesde: TBEdit
    Left = 165
    Top = 317
    Width = 52
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itInteger
    MaxLength = 4
    TabOrder = 11
    OnChange = edtADesdeChange
  end
  object edtAHasta: TBEdit
    Left = 275
    Top = 317
    Width = 52
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itInteger
    MaxLength = 4
    TabOrder = 12
    OnChange = edtAHastaChange
  end
  object edtMDesde: TBEdit
    Left = 165
    Top = 290
    Width = 52
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itInteger
    MaxLength = 6
    TabOrder = 13
    OnChange = edtMDesdeChange
  end
  object edtMHasta: TBEdit
    Left = 275
    Top = 290
    Width = 52
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itInteger
    MaxLength = 6
    TabOrder = 14
    OnChange = edtMHastaChange
  end
  object edtSDesde: TBEdit
    Left = 165
    Top = 264
    Width = 52
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itInteger
    MaxLength = 6
    TabOrder = 15
    OnChange = edtSDesdeChange
  end
  object edtSHasta: TBEdit
    Left = 275
    Top = 264
    Width = 52
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itInteger
    MaxLength = 6
    TabOrder = 16
    OnChange = edtSHastaChange
  end
  object rbFechas: TRadioButton
    Left = 33
    Top = 243
    Width = 17
    Height = 17
    Checked = True
    TabOrder = 17
    TabStop = True
    OnClick = rbFechasClick
  end
  object rbSemanas: TRadioButton
    Left = 33
    Top = 267
    Width = 17
    Height = 17
    TabOrder = 18
    OnClick = rbFechasClick
  end
  object rbMeses: TRadioButton
    Left = 33
    Top = 291
    Width = 17
    Height = 17
    TabOrder = 19
    OnClick = rbFechasClick
  end
  object rbAnyos: TRadioButton
    Left = 33
    Top = 315
    Width = 17
    Height = 17
    TabOrder = 20
    OnClick = rbFechasClick
  end
  object cbxComparativo: TCheckBox
    Left = 24
    Top = 374
    Width = 170
    Height = 17
    Caption = 'Comparar con el a'#241'o anterior.'
    Checked = True
    State = cbChecked
    TabOrder = 21
  end
  object chkCompactar: TCheckBox
    Left = 24
    Top = 390
    Width = 167
    Height = 17
    Caption = 'Compactar Listado'
    Checked = True
    State = cbChecked
    TabOrder = 22
    Visible = False
  end
  object rgDatosPor: TRadioGroup
    Left = 136
    Top = 182
    Width = 323
    Height = 48
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Periodo Total'
      'A'#241'o'
      'Mes'
      'Semana'
      'Dia')
    TabOrder = 23
  end
  object ssEnvase: TSimpleSearch
    Left = 207
    Top = 134
    Width = 21
    Height = 21
    TabOrder = 5
    TabStop = False
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'MoneyTwins'
    OptionsImage.ImageIndex = 2
    OptionsImage.Images = FDM.ilxImagenes
    Titulo = 'Busqueda de Art'#237'culos'
    Tabla = 'frf_envases'
    Campos = <
      item
        Etiqueta = 'Art'#237'culo'
        Campo = 'envase_e'
        Ancho = 100
        Tipo = ctCadena
      end
      item
        Etiqueta = 'Descripci'#243'n'
        Campo = 'descripcion_e'
        Ancho = 400
        Tipo = ctCadena
      end>
    Database = 'BDProyecto'
    CampoResultado = 'envase_e'
    Enlace = edtEnvase
    Tecla = 'F2'
    AntesEjecutar = ssEnvaseAntesEjecutar
    Concatenar = False
  end
  object edtEnvase: TcxTextEdit
    Left = 132
    Top = 134
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 9
    Properties.OnChange = cxTextEdit1PropertiesChange
    Style.BorderStyle = ebs3D
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    OnExit = edtEnvaseExit
    Width = 75
  end
end