object FLListEntregas: TFLListEntregas
  Left = 597
  Top = 245
  ActiveControl = edtEmpresa
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '    LISTADO ENTREGAS'
  ClientHeight = 347
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  DesignSize = (
    526
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TSpeedButton
    Left = 324
    Top = 300
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
  end
  object btnCancelar: TSpeedButton
    Left = 415
    Top = 300
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
  end
  object lblEmpresa: TnbLabel
    Left = 44
    Top = 25
    Width = 97
    Height = 21
    Caption = 'Empresa'
    About = 'NB 0.1/20020725'
  end
  object lblFechaDesde: TnbLabel
    Left = 44
    Top = 141
    Width = 97
    Height = 21
    Caption = 'Llegada del'
    About = 'NB 0.1/20020725'
  end
  object etqEmpresa: TnbStaticText
    Left = 179
    Top = 25
    Width = 293
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object lblFechaHasta: TnbLabel
    Left = 230
    Top = 141
    Width = 32
    Height = 21
    Caption = 'al'
    About = 'NB 0.1/20020725'
  end
  object lblProveedor: TnbLabel
    Left = 44
    Top = 71
    Width = 97
    Height = 21
    Caption = 'Proveedor/OPP'
    About = 'NB 0.1/20020725'
  end
  object etqProveedor: TnbStaticText
    Left = 179
    Top = 71
    Width = 293
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object lblProducto: TnbLabel
    Left = 44
    Top = 117
    Width = 97
    Height = 21
    Caption = 'Producto'
    About = 'NB 0.1/20020725'
  end
  object etqProducto: TnbStaticText
    Left = 179
    Top = 117
    Width = 293
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object nbLabel1: TnbLabel
    Left = 44
    Top = 94
    Width = 97
    Height = 21
    Caption = 'Almac'#233'n/Productor'
    About = 'NB 0.1/20020725'
  end
  object etqAlmacen: TnbStaticText
    Left = 179
    Top = 94
    Width = 190
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object Label4: TLabel
    Left = 230
    Top = 168
    Width = 116
    Height = 13
    Caption = '(Optativo, vacio = todos)'
  end
  object nbLabel3: TnbLabel
    Left = 44
    Top = 48
    Width = 97
    Height = 21
    Caption = 'Centro LLegada'
    About = 'NB 0.1/20020725'
  end
  object etqCentro: TnbStaticText
    Left = 179
    Top = 48
    Width = 293
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object nbLabel4: TnbLabel
    Left = 44
    Top = 189
    Width = 97
    Height = 21
    Caption = 'Estado Entrega'
    About = 'NB 0.1/20020725'
  end
  object lblMercado: TnbLabel
    Left = 44
    Top = 214
    Width = 97
    Height = 21
    Caption = 'Tipo Mercado'
    About = 'NB 0.1/20020725'
  end
  object edtEmpresa: TBEdit
    Left = 144
    Top = 25
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 3
    TabOrder = 0
    OnChange = edtEmpresaChange
  end
  object edtFechaDesde: TBEdit
    Left = 144
    Top = 141
    Width = 75
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itDate
    TabOrder = 6
  end
  object edtFechaHasta: TBEdit
    Left = 271
    Top = 141
    Width = 75
    Height = 21
    ColorEdit = clMoneyGreen
    InputType = itDate
    TabOrder = 7
  end
  object edtProveedor: TBEdit
    Left = 144
    Top = 71
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 3
    TabOrder = 2
    OnChange = edtProveedorChange
  end
  object edtProducto: TBEdit
    Left = 144
    Top = 117
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 3
    TabOrder = 5
    OnChange = edtProductoChange
  end
  object cbxDetalle: TCheckBox
    Left = 44
    Top = 245
    Width = 269
    Height = 17
    Caption = 'Imprimir el detalle de la entrega'
    TabOrder = 12
  end
  object cbxObservacion: TCheckBox
    Left = 44
    Top = 260
    Width = 229
    Height = 17
    Caption = 'Imprimir las observaciones'
    TabOrder = 13
  end
  object edtAlmacen: TBEdit
    Left = 144
    Top = 94
    Width = 32
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 3
    TabOrder = 3
    OnChange = edtAlmacenChange
  end
  object edtAdjudicacion: TBEdit
    Left = 144
    Top = 164
    Width = 75
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 12
    TabOrder = 9
    OnChange = edtAlmacenChange
  end
  object edtCentro: TBEdit
    Left = 144
    Top = 48
    Width = 15
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 1
    TabOrder = 1
    OnChange = edtCentroChange
  end
  object cbxStatus: TComboBox
    Left = 144
    Top = 189
    Width = 232
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 10
    Text = 'TODAS LAS ENTREGAS'
    Items.Strings = (
      'TODAS LAS ENTREGAS'
      'PENDIENTE RECIBIR ALMACEN'
      'ENVIADA  AL ALMAC'#201'N'
      'FRUTA ENTREGA RECIBIDA'
      'ENTREGA DIRECTA')
  end
  object cbxPacking: TCheckBox
    Left = 44
    Top = 277
    Width = 269
    Height = 17
    Caption = 'Imprimir el Packing de la entrega'
    TabOrder = 14
    OnClick = cbxPackingClick
  end
  object cbxResumen: TCheckBox
    Left = 44
    Top = 292
    Width = 269
    Height = 17
    Caption = 'Imprimir el resumen del Packing'
    Enabled = False
    TabOrder = 15
  end
  object cbxBorrados: TCheckBox
    Left = 44
    Top = 308
    Width = 269
    Height = 17
    Caption = 'Imprimir palets borrados'
    Enabled = False
    TabOrder = 16
  end
  object cmbEntrega: TComboBox
    Left = 44
    Top = 164
    Width = 97
    Height = 21
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvSpace
    Style = csDropDownList
    Color = clSilver
    Ctl3D = False
    ItemHeight = 13
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 8
    TabStop = False
    Text = 'N'#186' Entrega'
    Items.Strings = (
      'N'#186' Entrega'
      'N'#186' Albar'#225'n'
      'Adjudicaci'#243'n')
  end
  object cbxMercado: TComboBox
    Left = 144
    Top = 214
    Width = 146
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 11
    Text = 'INDIFERENTE'
    Items.Strings = (
      'INDIFERENTE'
      'EXPORTACI'#211'N'
      'MERCADO LOCAL')
  end
  object chkAgruparAlmacen: TCheckBox
    Left = 371
    Top = 96
    Width = 101
    Height = 17
    Caption = 'Agrupar Almac'#233'n'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
