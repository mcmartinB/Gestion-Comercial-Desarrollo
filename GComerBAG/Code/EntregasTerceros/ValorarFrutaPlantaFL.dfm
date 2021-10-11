object FLValorarFrutaPlanta: TFLValorarFrutaPlanta
  Left = 526
  Top = 175
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '    Informe de la Valoracion de la Fruta en Planta'
  ClientHeight = 243
  ClientWidth = 418
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
    418
    243)
  PixelsPerInch = 96
  TextHeight = 13
  object lblEmpresa: TnbLabel
    Left = 32
    Top = 32
    Width = 100
    Height = 21
    Caption = 'Empresa'
    About = 'NB 0.1/20020725'
  end
  object stEmpresa: TLabel
    Left = 192
    Top = 36
    Width = 133
    Height = 13
    Caption = '(Falta c'#243'digo de la empresa)'
  end
  object Label3: TLabel
    Left = 6
    Top = 155
    Width = 408
    Height = 13
    Caption = 'POR FAVOR ESPERE MIENTRAS SE EXTRAEN LOS DATOS PEDIDOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object nbLabel1: TnbLabel
    Left = 32
    Top = 81
    Width = 100
    Height = 21
    Caption = 'Producto'
    About = 'NB 0.1/20020725'
  end
  object stProducto: TLabel
    Left = 192
    Top = 85
    Width = 138
    Height = 13
    Caption = '(Vacio =Todos los productos)'
  end
  object nbLabel3: TnbLabel
    Left = 32
    Top = 57
    Width = 100
    Height = 21
    Caption = 'Entrega Desde'
    About = 'NB 0.1/20020725'
  end
  object nbLabel4: TnbLabel
    Left = 219
    Top = 57
    Width = 42
    Height = 21
    Caption = 'Hasta'
    About = 'NB 0.1/20020725'
  end
  object lblStatus: TLabel
    Left = 12
    Top = 203
    Width = 380
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 
      'No se contabilizan los palets con status R (Regularizado) o B (B' +
      'orrado)'
  end
  object lblTipoFacturas: TLabel
    Left = 12
    Top = 217
    Width = 380
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 
      'No se tienen en cuenta las facturas con codigo 001, 005, 021 y 0' +
      '22'
  end
  object btnCerrar: TBitBtn
    Left = 302
    Top = 173
    Width = 90
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar (Esc)'
    TabOrder = 0
    TabStop = False
    OnClick = btnCerrarClick
    Kind = bkCancel
  end
  object btnImprimir: TBitBtn
    Left = 205
    Top = 173
    Width = 90
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Imprimir (F1)'
    ModalResult = 1
    TabOrder = 1
    TabStop = False
    OnClick = btnImprimirClick
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
  object eEmpresa: TnbDBSQLCombo
    Left = 136
    Top = 32
    Width = 54
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    OnChange = eEmpresaChange
    TabOrder = 2
    SQL.Strings = (
      'select empresa_e, nombre_e '
      'from frf_empresas'
      'order by empresa_e')
    DatabaseName = 'BDProyecto'
    FillAuto = True
    OnlyNumbers = False
    NumChars = 3
  end
  object cbxVariedad: TCheckBox
    Left = 32
    Top = 112
    Width = 145
    Height = 17
    Caption = 'Agrupar por variedad.'
    TabOrder = 6
    OnClick = cbxVariedadClick
  end
  object cbxCalibre: TCheckBox
    Left = 49
    Top = 132
    Width = 145
    Height = 17
    Caption = 'Agrupar por calibre.'
    Enabled = False
    TabOrder = 7
  end
  object eProducto: TnbDBSQLCombo
    Left = 136
    Top = 81
    Width = 54
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    OnChange = eProductoChange
    TabOrder = 5
    DatabaseName = 'BDProyecto'
    OnGetSQL = eProductoGetSQL
    OnlyNumbers = False
    NumChars = 3
  end
  object eEntregaDesde: TBEdit
    Left = 136
    Top = 57
    Width = 80
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 12
    TabOrder = 3
  end
  object eEntregaHasta: TBEdit
    Left = 265
    Top = 57
    Width = 80
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 12
    TabOrder = 4
  end
end
