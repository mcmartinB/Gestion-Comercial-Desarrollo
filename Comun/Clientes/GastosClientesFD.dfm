object FDGastosClientes: TFDGastosClientes
  Left = 739
  Top = 258
  Caption = '    GASTOS FIJOS DE CLIENTE'
  ClientHeight = 385
  ClientWidth = 498
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
    Left = 239
    Top = 332
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
    Left = 341
    Top = 332
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
  object nbLabel2: TnbLabel
    Left = 33
    Top = 79
    Width = 100
    Height = 21
    Caption = 'Fecha Inicial'
    About = 'NB 0.1/20020725'
  end
  object nbLabel3: TnbLabel
    Left = 33
    Top = 53
    Width = 100
    Height = 21
    Caption = 'Empresa'
    About = 'NB 0.1/20020725'
  end
  object btnAnyadir: TSpeedButton
    Left = 372
    Top = 8
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
    Left = 407
    Top = 8
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
  object lblFechaFinal: TnbLabel
    Left = 242
    Top = 79
    Width = 95
    Height = 21
    Caption = 'Fecha Final'
    About = 'NB 0.1/20020725'
  end
  object btnModificar: TSpeedButton
    Left = 341
    Top = 8
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
    Top = 28
    Width = 100
    Height = 21
    Caption = 'Cliente'
    About = 'NB 0.1/20020725'
  end
  object lbl3: TnbLabel
    Left = 33
    Top = 104
    Width = 100
    Height = 21
    Caption = #8364'/Kg No Fact.'
    About = 'NB 0.1/20020725'
  end
  object btnEmpresa: TBGridButton
    Left = 181
    Top = 52
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
    Control = empresa_gc
    Grid = RejillaFlotante
    GridAlignment = taDownCenter
    GridWidth = 320
    GridHeigth = 200
  end
  object empresa_gc: TBDEdit
    Left = 138
    Top = 53
    Width = 41
    Height = 21
    ColorDisable = clWindow
    Enabled = False
    MaxLength = 3
    TabOrder = 1
    OnChange = empresa_gcChange
    DataField = 'empresa_gc'
    DataSource = DSGastos
  end
  object fecha_ini_gc: TnbDBCalendarCombo
    Left = 138
    Top = 79
    Width = 100
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 5
    DataField = 'fecha_ini_gc'
    DataSource = DSGastos
    DBLink = True
  end
  object DBGrid: TDBGrid
    Left = 33
    Top = 150
    Width = 432
    Height = 157
    DataSource = DSGastos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'empresa_gc'
        Title.Caption = 'Empresa'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_ini_gc'
        Title.Caption = 'Fecha Ini'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_fin_gc'
        Title.Caption = 'Fecha Fin'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'no_facturable_gc'
        Title.Alignment = taCenter
        Title.Caption = #8364'/Kg No Fact.'
        Title.Color = clMenuHighlight
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object fecha_fin_gc: TnbDBCalendarCombo
    Left = 339
    Top = 79
    Width = 100
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 6
    DataField = 'fecha_fin_gc'
    DataSource = DSGastos
    DBLink = True
  end
  object stPlanta: TStaticText
    Left = 186
    Top = 32
    Width = 4
    Height = 4
    TabOrder = 2
  end
  object stProveedor: TStaticText
    Left = 186
    Top = 55
    Width = 4
    Height = 4
    TabOrder = 3
  end
  object stProductor: TStaticText
    Left = 186
    Top = 78
    Width = 4
    Height = 4
    TabOrder = 4
  end
  object cliente_gc: TBDEdit
    Left = 138
    Top = 28
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 3
    TabOrder = 0
    OnChange = empresa_gcChange
    DataField = 'cliente_gc'
    DataSource = DSGastos
  end
  object no_facturable_gc: TnbDBNumeric
    Left = 138
    Top = 104
    Width = 49
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 7
    DataField = 'no_facturable_gc'
    DataSource = DSGastos
    DBLink = True
    NumIntegers = 3
    NumDecimals = 3
  end
  object stEmpresa: TStaticText
    Left = 196
    Top = 55
    Width = 245
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 9
  end
  object RejillaFlotante: TBGrid
    Left = 372
    Top = 172
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
  object DSGastos: TDataSource
    DataSet = QGastos
    Left = 95
    Top = 236
  end
  object QGastos: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    SQL.Strings = (
      'select * '
      ' from frf_gastos_cliente')
    Left = 58
    Top = 233
  end
  object QGastosAux: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    SQL.Strings = (
      'select * '
      ' from frf_gastos_cliente')
    Left = 58
    Top = 265
  end
end