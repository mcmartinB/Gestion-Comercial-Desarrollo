object FMarcaContable: TFMarcaContable
  Left = 257
  Top = 55
  BorderIcons = []
  Caption = 'Marcar / Desmarcar Factura Contabilizada'
  ClientHeight = 641
  ClientWidth = 995
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConsulta: TPanel
    Left = 0
    Top = 38
    Width = 995
    Height = 163
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object gbCriterios: TcxGroupBox
      Left = 19
      Top = 13
      Caption = 'Selecci'#243'n de Facturas'
      ParentColor = False
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Foggy'
      Style.Shadow = False
      Style.TextStyle = [fsBold]
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Foggy'
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Foggy'
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Foggy'
      TabOrder = 0
      Height = 132
      Width = 957
      object lbEmpresa: TcxLabel
        Left = 6
        Top = 34
        AutoSize = False
        Caption = 'Empresa'
        ParentColor = False
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 80
        AnchorX = 86
      end
      object lbCliente: TcxLabel
        Left = 484
        Top = 58
        AutoSize = False
        Caption = 'Cliente'
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 90
        AnchorX = 574
      end
      object lbFecFactura: TcxLabel
        Left = 222
        Top = 58
        AutoSize = False
        Caption = 'Fecha Factura'
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 90
        AnchorX = 312
      end
      object lbNumFactura: TcxLabel
        Left = 6
        Top = 58
        AutoSize = False
        Caption = 'N'#250'mero Factura'
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 80
        AnchorX = 86
      end
      object rgMarca: TcxRadioGroup
        Left = 746
        Top = 22
        Caption = 'Facturas'
        ParentFont = False
        Properties.DefaultValue = 1
        Properties.Items = <
          item
            Caption = 'Contabilizadas'
            Value = 1
          end
          item
            Caption = 'No Contabilizadas'
            Value = 0
          end>
        ItemIndex = 0
        Style.BorderColor = clMenuHighlight
        Style.BorderStyle = ebs3D
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 18
        Height = 82
        Width = 167
      end
      object lbImporteNeto: TcxLabel
        Left = 7
        Top = 82
        AutoSize = False
        Caption = 'Importe Neto'
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 80
        AnchorX = 87
      end
      object lbImporteTotal: TcxLabel
        Left = 222
        Top = 83
        AutoSize = False
        Caption = 'Importe Total'
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 90
        AnchorX = 312
      end
      object lbFecConta: TcxLabel
        Left = 452
        Top = 82
        AutoSize = False
        Caption = 'Fecha Contabilizaci'#243'n'
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 120
        AnchorX = 572
      end
      object SEEmpresa: TSQLExprStrEdit
        Left = 88
        Top = 33
        Properties.CharCase = ecUpperCase
        TabOrder = 1
        FieldName = 'cod_empresa_fac_fc'
        Width = 121
      end
      object SENumFactura: TSQLExprIntEdit
        Left = 88
        Top = 57
        Properties.CharCase = ecUpperCase
        TabOrder = 7
        FieldName = 'n_factura_fc'
        Width = 121
      end
      object SECliente: TSQLExprStrEdit
        Left = 576
        Top = 57
        Properties.CharCase = ecUpperCase
        TabOrder = 9
        FieldName = 'cod_cliente_fc'
        Width = 121
      end
      object SEFecFactura: TSQLExprDateEdit
        Left = 313
        Top = 57
        Properties.CharCase = ecUpperCase
        TabOrder = 8
        FieldName = 'fecha_factura_fc'
        Width = 121
      end
      object SEImporteNeto: TSQLExprIntEdit
        Left = 88
        Top = 81
        Properties.CharCase = ecUpperCase
        TabOrder = 10
        FieldName = 'importe_neto_fc'
        Width = 121
      end
      object SEImporteTotal: TSQLExprIntEdit
        Left = 313
        Top = 81
        Properties.CharCase = ecUpperCase
        TabOrder = 11
        FieldName = 'importe_total_fc'
        Width = 121
      end
      object SEFecConta: TSQLExprDateEdit
        Left = 576
        Top = 81
        Properties.CharCase = ecUpperCase
        TabOrder = 15
        FieldName = 'fecha_conta_fc'
        Width = 121
      end
      object cxLabel1: TcxLabel
        Left = 231
        Top = 34
        AutoSize = False
        Caption = 'Serie'
        ParentColor = False
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 80
        AnchorX = 311
      end
      object SESerie: TSQLExprStrEdit
        Left = 313
        Top = 33
        Properties.CharCase = ecUpperCase
        TabOrder = 3
        FieldName = 'cod_serie_fac_fc'
        Width = 121
      end
      object cxLabel40: TcxLabel
        Left = 492
        Top = 34
        Hint = 'C'#243'digo Factura'
        AutoSize = False
        Caption = 'C'#243'digo Factura'
        ParentColor = False
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 80
        AnchorX = 572
      end
      object SECodFactura: TSQLExprStrEdit
        Left = 576
        Top = 33
        Properties.CharCase = ecUpperCase
        TabOrder = 5
        FieldName = 'cod_factura_fc'
        Width = 121
      end
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 225
    Width = 995
    Height = 416
    Align = alClient
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Foggy'
    ExplicitLeft = 3
    object tvFacturas: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = dsQFacturas
      DataController.KeyFieldNames = 'cod_factura_fc'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object tvMarca: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.DisplayUnchecked = 'True'
        Properties.DisplayGrayed = 'False'
        Properties.ImmediatePost = True
        Properties.MultiLine = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueGrayed = 'False'
        Properties.OnChange = tvMarcaPropertiesChange
        MinWidth = 30
        Width = 30
      end
      object tvEmpresa: TcxGridDBColumn
        Caption = 'Empresa'
        DataBinding.FieldName = 'cod_empresa_fac_fc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 3
        HeaderAlignmentHorz = taCenter
        MinWidth = 50
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 50
      end
      object tvSerie: TcxGridDBColumn
        Caption = 'Serie'
        DataBinding.FieldName = 'cod_serie_fac_fc'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        MinWidth = 50
        Options.Editing = False
        Options.Filtering = False
        SortIndex = 1
        SortOrder = soAscending
      end
      object tvCliente: TcxGridDBColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'cod_cliente_fc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.MaxLength = 3
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 30
        Options.Editing = False
        Width = 30
      end
      object tvDesCliente: TcxGridDBColumn
        Caption = 'Descripci'#243'n'
        DataBinding.ValueType = 'String'
        OnGetDisplayText = tvDesClienteGetDisplayText
        Options.Editing = False
        Width = 200
      end
      object tvFecha: TcxGridDBColumn
        Caption = 'Fecha Factura'
        DataBinding.FieldName = 'fecha_factura_fc'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 80
        Options.Editing = False
        SortIndex = 3
        SortOrder = soAscending
        Width = 100
      end
      object tvNumero: TcxGridDBColumn
        Caption = 'N'#250'mero Factura'
        DataBinding.FieldName = 'n_factura_fc'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        SortIndex = 2
        SortOrder = soAscending
        Width = 100
      end
      object tvCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo Factura'
        DataBinding.FieldName = 'cod_factura_fc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.MaxLength = 15
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 120
      end
      object tvTipo: TcxGridDBColumn
        DataBinding.FieldName = 'tipo_factura_fc'
        Visible = False
      end
      object tvTipoFactura: TcxGridDBColumn
        Caption = 'Tipo Factura'
        DataBinding.ValueType = 'String'
        OnGetDisplayText = tvTipoFacturaGetDisplayText
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 80
      end
      object tvImpuesto: TcxGridDBColumn
        DataBinding.FieldName = 'impuesto_fc'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        MinWidth = 70
        Options.Editing = False
        IsCaptionAssigned = True
      end
      object tvDesImpuesto: TcxGridDBColumn
        Caption = 'Impuesto'
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        OnGetDisplayText = tvDesImpuestoGetDisplayText
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 40
        Options.Editing = False
      end
      object tvMoneda: TcxGridDBColumn
        Caption = 'Moneda'
        DataBinding.FieldName = 'moneda_fc'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.MaxLength = 3
        HeaderAlignmentHorz = taCenter
        MinWidth = 40
        Options.Editing = False
        Width = 80
      end
      object tvImporteNeto: TcxGridDBColumn
        Caption = 'Importe Neto'
        DataBinding.FieldName = 'importe_neto_fc'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 100
      end
      object tvImporteImpuesto: TcxGridDBColumn
        Caption = 'Importe Impuesto'
        DataBinding.FieldName = 'importe_impuesto_fc'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 100
      end
      object tvImporteTotal: TcxGridDBColumn
        Caption = 'Importe Total'
        DataBinding.FieldName = 'importe_total_fc'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        MinWidth = 80
        Options.Editing = False
        Width = 100
      end
    end
    object lvFacturas: TcxGridLevel
      GridView = tvFacturas
    end
  end
  object cxTabControl: TcxTabControl
    Left = 0
    Top = 201
    Width = 995
    Height = 24
    Align = alTop
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 7
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blueprint'
    ClientRectBottom = 23
    ClientRectLeft = 1
    ClientRectRight = 994
    ClientRectTop = 1
    object btnSeleccionar: TcxButton
      Left = 3
      Top = -1
      Width = 130
      Height = 25
      Hint = 'Seleccionar Todo'
      Caption = 'Seleccionar Todo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSeleccionarClick
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = 'Blueprint'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = DFactura.IFacturas
    end
    object btnCancelar: TcxButton
      Left = 132
      Top = -1
      Width = 130
      Height = 25
      Caption = 'Deseleccionar Todo'
      TabOrder = 1
      OnClick = btnCancelarClick
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = 'Blueprint'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = DFactura.IFacturas
    end
  end
  object ssCliente: TSimpleSearch
    Left = 715
    Top = 114
    Width = 21
    Height = 21
    TabOrder = 7
    TabStop = False
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'MoneyTwins'
    OptionsImage.ImageIndex = 2
    OptionsImage.Images = FDM.ilxImagenes
    Titulo = 'Busqueda de Clientes'
    Tabla = 'frf_clientes'
    Campos = <
      item
        Etiqueta = 'Cliente'
        Campo = 'cliente_c'
        Ancho = 100
        Tipo = ctCadena
      end
      item
        Etiqueta = 'Descripci'#243'n'
        Campo = 'nombre_c'
        Ancho = 400
        Tipo = ctCadena
      end>
    Database = 'BDProyecto'
    CampoResultado = 'empresa_c'
    Enlace = SECliente
    Tecla = 'F2'
    AntesEjecutar = ssClienteAntesEjecutar
    Concatenar = False
  end
  object dsQFacturas: TDataSource
    Left = 696
    Top = 1
  end
  object bmxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = DFactura.IFacturas
    ImageOptions.LargeImages = DFactura.IFacturas
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 600
    Top = 1
    DockControlHeights = (
      0
      0
      38
      0)
    object bmxPrincipal: TdxBar
      BorderStyle = bbsNone
      Caption = 'Principal'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 1
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 306
      FloatTop = 116
      FloatClientWidth = 51
      FloatClientHeight = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxLocalizar'
        end
        item
          Visible = True
          ItemName = 'dxMarca'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxSalir'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      UseOwnFont = True
      Visible = True
      WholeRow = False
    end
    object dxLocalizar: TdxBarLargeButton
      Caption = 'Localizar (F1)'
      Category = 0
      Hint = 'Localizar Facturas'
      Visible = ivAlways
      LargeImageIndex = 9
      ShortCut = 112
      OnClick = dxLocalizarClick
      SyncImageIndex = False
      ImageIndex = 9
    end
    object dxSalir: TdxBarLargeButton
      Caption = 'Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      LargeImageIndex = 4
      ShortCut = 27
      OnClick = dxSalirClick
    end
    object dxMarca: TdxBarLargeButton
      Caption = 'Marcar / Desmarcar'
      Category = 0
      Hint = 'Marcar / Desmarcar'
      Visible = ivAlways
      LargeImageIndex = 15
      OnClick = dxMarcaClick
    end
  end
end
