object FDRiesgoClientes: TFDRiesgoClientes
  Left = 739
  Top = 258
  Caption = '    RIESGO CLIENTE'
  ClientHeight = 393
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TSpeedButton
    Left = 367
    Top = 348
    Width = 100
    Height = 26
    Caption = 'Aceptar (F1)'
    Enabled = False
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF000000FF0000000080FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF000000FF000000FF000000FF0000000000FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF000000FF000000FF000000FF0000000000FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF000000FF000000FF000000FF000000FF000000FF0000000080FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF000000FF000000FF000000FF000000FF000000FF000000FF0000000080FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF3F7F7F
      7F000000FF000000FF0000000080FF00FF000000FF000000FF000000FF000000
      0000FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF007F7F7F000000
      FF0000000080FF00FF00FF00FF80FF00FF00FF00FF000000FF000000FF000000
      0000FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF000000FF000000FF000000
      FF0000000080FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF000000FF000000
      FF0000000080FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF000000
      FF000000FF0000000000FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF007F7F7F000000FF0000000080FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF3F7F7F7F000000FF0000000000FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF000000FF000000FF0000000000FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00
      FF00FF00FF80FF00FF00FF00FF80FF00FF00FF00FF80FF00FF00}
    OnClick = btnAceptarClick
  end
  object btnCancelar: TSpeedButton
    Left = 469
    Top = 348
    Width = 100
    Height = 26
    Caption = 'Cerrar (Esc)'
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
    OnClick = btnCancelarClick
  end
  object nbLabel3: TnbLabel
    Left = 32
    Top = 50
    Width = 100
    Height = 21
    Caption = 'Empresa'
    About = 'NB 0.1/20020725'
  end
  object btnAnyadir: TSpeedButton
    Left = 500
    Top = 9
    Width = 34
    Height = 28
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
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000000000000000000000000000FF000000000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000000000000000000000000000FF000000000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = btnAnyadirClick
  end
  object btnBorrar: TSpeedButton
    Left = 535
    Top = 9
    Width = 34
    Height = 28
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
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = btnBorrarClick
  end
  object btnModificar: TSpeedButton
    Left = 465
    Top = 9
    Width = 34
    Height = 28
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000FF00FF0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF00FF00FF00FF007B7B7B007B7B7B0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF007B7B7B0000FFFF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000007B7B7B0000FFFF007B7B7B007B7B7B000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000007B7B7B0000FFFF007B7B7B000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000000000FFFF007B7B7B0000FFFF007B7B
      7B0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FFFF007B7B7B007B7B
      7B0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000007B0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000007B7B7B000000
      7B007B7B7B0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000007B007B7B
      7B0000007B0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = btnModificarClick
  end
  object lblProductor: TnbLabel
    Left = 33
    Top = 23
    Width = 100
    Height = 21
    Caption = 'Cliente'
    About = 'NB 0.1/20020725'
  end
  object lbl1: TnbLabel
    Left = 266
    Top = 76
    Width = 70
    Height = 21
    Caption = 'Fecha Fin'
    About = 'NB 0.1/20020725'
  end
  object lbl3: TnbLabel
    Left = 14
    Top = 105
    Width = 119
    Height = 21
    Caption = 'Maximo Riesgo (Euros)'
    About = 'NB 0.1/20020725'
  end
  object btnEmpresa: TBGridButton
    Left = 180
    Top = 51
    Width = 13
    Height = 22
    Hint = 'Pulse F2 para ver una lista de valores validos. '
    Enabled = False
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
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
    OnClick = btnEmpresaClick
    Control = empresa_cr
    Grid = RejillaFlotante
    GridAlignment = taDownCenter
    GridWidth = 320
    GridHeigth = 200
  end
  object nbLabel1: TnbLabel
    Left = 32
    Top = 135
    Width = 100
    Height = 21
    Caption = 'Seguro Cobertura'
    About = 'NB 0.1/20020725'
  end
  object nbLabel2: TnbLabel
    Left = 32
    Top = 76
    Width = 100
    Height = 21
    Caption = 'Fecha Inicio'
    About = 'NB 0.1/20020725'
  end
  object empresa_cr: TBDEdit
    Left = 138
    Top = 51
    Width = 41
    Height = 21
    ColorDisable = clWindow
    Enabled = False
    MaxLength = 3
    TabOrder = 2
    OnChange = empresa_crChange
    DataField = 'empresa_cr'
    DataSource = dsRiesgo
  end
  object DBGrid: TDBGrid
    Left = 33
    Top = 169
    Width = 536
    Height = 157
    DataSource = dsRiesgo
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'empresa_cr'
        Title.Alignment = taCenter
        Title.Caption = 'Empresa'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'max_riesgo_cr'
        Title.Alignment = taCenter
        Title.Caption = 'Maximo Riesgo'
        Width = 119
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha_riesgo_cr'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Inicio'
        Width = 114
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha_fin_cr'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Fin'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'seguro_cr'
        Title.Alignment = taCenter
        Title.Caption = 'Seguro'
        Width = 50
        Visible = True
      end>
  end
  object stProveedor: TStaticText
    Left = 186
    Top = 55
    Width = 4
    Height = 4
    TabOrder = 7
  end
  object stProductor: TStaticText
    Left = 186
    Top = 78
    Width = 4
    Height = 4
    TabOrder = 8
  end
  object cliente_cr: TBDEdit
    Left = 138
    Top = 23
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 3
    TabOrder = 0
    OnChange = cliente_crChange
    DataField = 'cliente_cr'
    DataSource = dsRiesgo
  end
  object max_riesgo_cr: TBDEdit
    Left = 138
    Top = 105
    Width = 129
    Height = 21
    ColorEdit = clMoneyGreen
    ColorDisable = clWindow
    Zeros = True
    InputType = itReal
    Enabled = False
    TabOrder = 6
    DataField = 'max_riesgo_cr'
    DataSource = dsRiesgo
  end
  object RejillaFlotante: TBGrid
    Left = 457
    Top = 40
    Width = 137
    Height = 135
    Color = clInfoBk
    FixedColor = clInfoText
    Options = [dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object stEmpresa: TStaticText
    Left = 196
    Top = 54
    Width = 245
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 3
  end
  object stCliente: TStaticText
    Left = 182
    Top = 25
    Width = 259
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 1
  end
  object seguro_cr: TDBCheckBox
    Left = 138
    Top = 136
    Width = 169
    Height = 17
    Caption = 'Marcado tiene Seguro'
    DataField = 'seguro_cr'
    DataSource = dsRiesgo
    Enabled = False
    TabOrder = 11
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object fecha_fin_cr: TnbDBCalendarCombo
    Left = 337
    Top = 77
    Width = 104
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 5
    DataField = 'fecha_fin_cr'
    DataSource = dsRiesgo
    DBLink = True
  end
  object fecha_riesgo_cr: TnbDBCalendarCombo
    Left = 138
    Top = 77
    Width = 104
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 4
    DataField = 'fecha_riesgo_cr'
    DataSource = dsRiesgo
    DBLink = True
  end
  object dsRiesgo: TDataSource
    DataSet = QRiesgo
    Left = 95
    Top = 236
  end
  object QRiesgoAux: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    SQL.Strings = (
      'select * from frf_clientes_rie')
    Left = 106
    Top = 209
  end
  object QRiesgo: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    SQL.Strings = (
      'Select *  from frf_clientes_rie')
    Left = 64
    Top = 200
  end
end
