object FManRemesas: TFManRemesas
  Left = 442
  Top = 168
  BorderIcons = []
  Caption = 'Control de Cobros'
  ClientHeight = 582
  ClientWidth = 995
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbCabecera: TcxGroupBox
    Left = 0
    Top = 62
    Align = alTop
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Foggy'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Foggy'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Foggy'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Foggy'
    TabOrder = 0
    Height = 227
    Width = 995
    object cxLabel10: TcxLabel
      Left = 16
      Top = 10
      AutoSize = False
      Caption = 'Empresa'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 60
      AnchorX = 76
    end
    object txDesEmpresa: TcxTextEdit
      Left = 133
      Top = 8
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = ''
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 2
      Width = 246
    end
    object cxLabel11: TcxLabel
      Left = 414
      Top = 10
      AutoSize = False
      Caption = 'Referencia'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 70
      AnchorX = 484
    end
    object edtEmpresaRem: TcxDBTextEdit
      Left = 79
      Top = 8
      DataBinding.DataField = 'empresa_remesa_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 3
      Properties.OnChange = PonNombre
      StyleFocused.Color = clWindow
      TabOrder = 1
      OnExit = edtEmpresaRemExit
      Width = 30
    end
    object edtNumeroRem: TcxDBTextEdit
      Left = 486
      Top = 8
      TabStop = False
      DataBinding.DataField = 'n_remesa_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      StyleFocused.Color = clWindow
      TabOrder = 4
      Width = 109
    end
    object cxLabel12: TcxLabel
      Left = 385
      Top = 69
      AutoSize = False
      Caption = 'Fecha Vencimiento'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 100
      AnchorX = 485
    end
    object cxLabel13: TcxLabel
      Left = 16
      Top = 45
      AutoSize = False
      Caption = 'Cliente'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 60
      AnchorX = 76
    end
    object edtClienteRem: TcxDBTextEdit
      Left = 79
      Top = 43
      DataBinding.DataField = 'cod_cliente_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 3
      Properties.OnChange = PonNombre
      StyleFocused.Color = clWindow
      TabOrder = 6
      OnExit = edtClienteRemExit
      Width = 30
    end
    object txDesCliente: TcxTextEdit
      Left = 133
      Top = 43
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = ''
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 7
      Width = 246
    end
    object cxLabel14: TcxLabel
      Left = 16
      Top = 69
      AutoSize = False
      Caption = 'Banco'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 60
      AnchorX = 76
    end
    object txDesBanco: TcxTextEdit
      Left = 133
      Top = 67
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = ''
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 10
      Width = 246
    end
    object deFechaVtoRem: TcxDBDateEdit
      Left = 486
      Top = 66
      DataBinding.DataField = 'fecha_vencimiento_rc'
      DataBinding.DataSource = dsQRemesaCab
      TabOrder = 15
      Width = 110
    end
    object cxLabel15: TcxLabel
      Left = 20
      Top = 92
      AutoSize = False
      Caption = 'Moneda'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 60
      AnchorX = 80
    end
    object edtMonedaRem: TcxDBTextEdit
      Left = 79
      Top = 89
      DataBinding.DataField = 'moneda_cobro_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 3
      Properties.OnChange = PonNombre
      StyleFocused.Color = clWindow
      TabOrder = 12
      Width = 30
    end
    object txDesMoneda: TcxTextEdit
      Left = 133
      Top = 90
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = ''
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 13
      Width = 99
    end
    object cxLabel16: TcxLabel
      Left = 466
      Top = 185
      AutoSize = False
      Caption = 'Importe Remesa'
      ParentColor = False
      ParentFont = False
      Style.Color = clActiveCaption
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Height = 17
      Width = 132
      AnchorX = 532
    end
    object cxLabel17: TcxLabel
      Left = 596
      Top = 185
      AutoSize = False
      Caption = 'Importe (Euros)'
      ParentColor = False
      ParentFont = False
      Style.Color = clActiveCaption
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Height = 17
      Width = 131
      AnchorX = 662
    end
    object cxLabel18: TcxLabel
      Left = 725
      Top = 185
      AutoSize = False
      Caption = 'Gastos (Euros)'
      ParentColor = False
      ParentFont = False
      Style.Color = clActiveCaption
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Height = 17
      Width = 131
      AnchorX = 791
    end
    object cxLabel19: TcxLabel
      Left = 854
      Top = 185
      AutoSize = False
      Caption = 'Neto (Euros)'
      ParentColor = False
      ParentFont = False
      Style.Color = clActiveCaption
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Height = 17
      Width = 132
      AnchorX = 920
    end
    object ceImporteRem: TcxDBCurrencyEdit
      Left = 468
      Top = 199
      DataBinding.DataField = 'importe_cobro_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.Nullable = False
      Properties.ValidateOnEnter = False
      Properties.OnChange = ceImporteRemPropertiesChange
      TabOrder = 22
      OnExit = ceImporteRemExit
      Width = 129
    end
    object ceBrutoRem: TcxDBCurrencyEdit
      Left = 597
      Top = 199
      DataBinding.DataField = 'bruto_euros_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.AssignedValues.MinValue = True
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.OnChange = ceBrutoRemPropertiesChange
      TabOrder = 23
      OnExit = ceBrutoRemExit
      Width = 129
    end
    object ceGastosRem: TcxDBCurrencyEdit
      Left = 726
      Top = 199
      DataBinding.DataField = 'gastos_euros_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.AssignedValues.MinValue = True
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.UseDisplayFormatWhenEditing = True
      Properties.OnChange = ceGastosRemPropertiesChange
      TabOrder = 24
      OnExit = ceGastosRemExit
      Width = 129
    end
    object ceLiquidoRem: TcxDBCurrencyEdit
      Left = 855
      Top = 199
      DataBinding.DataField = 'liquido_euros_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.AssignedValues.MinValue = True
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
      Style.Color = clBtnFace
      TabOrder = 25
      Width = 129
    end
    object cxLabel5: TcxLabel
      Left = 237
      Top = 92
      AutoSize = False
      Caption = 'Cambio'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 50
      AnchorX = 287
    end
    object txCambio: TcxTextEdit
      Left = 289
      Top = 90
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = ''
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 27
      Width = 90
    end
    object mmxNotas: TcxDBMemo
      Left = 82
      Top = 120
      DataBinding.DataField = 'notas_rc'
      DataBinding.DataSource = dsQRemesaCab
      TabOrder = 17
      Height = 57
      Width = 513
    end
    object cxLabel6: TcxLabel
      Left = 29
      Top = 119
      AutoSize = False
      Caption = 'NOTAS'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 50
      AnchorX = 79
    end
    object ssCliente: TSimpleSearch
      Left = 109
      Top = 43
      Width = 21
      Height = 21
      TabOrder = 29
      TabStop = False
      OnClick = ssClienteClick
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
      Enlace = edtClienteRem
      Tecla = 'F2'
      Concatenar = False
    end
    object ssBanco: TSimpleSearch
      Left = 109
      Top = 67
      Width = 21
      Height = 21
      TabOrder = 30
      TabStop = False
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Bancos'
      Tabla = 'frf_bancos'
      Campos = <
        item
          Etiqueta = 'Banco'
          Campo = 'banco_b'
          Ancho = 100
          Tipo = ctCadena
        end
        item
          Etiqueta = 'Descripci'#243'n'
          Campo = 'descripcion_b'
          Ancho = 400
          Tipo = ctCadena
        end>
      Database = 'BDProyecto'
      CampoResultado = 'banco_b'
      Enlace = edtBancoRem
      Tecla = 'F2'
      AntesEjecutar = ssBancoAntesEjecutar
      Concatenar = False
    end
    object ssMoneda: TSimpleSearch
      Left = 109
      Top = 90
      Width = 21
      Height = 21
      TabOrder = 31
      TabStop = False
      OnClick = ssMonedaClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Moneda'
      Tabla = 'frf_monedas'
      Campos = <
        item
          Etiqueta = 'Moneda'
          Campo = 'moneda_m'
          Ancho = 100
          Tipo = ctCadena
        end
        item
          Etiqueta = 'Descripci'#243'n'
          Campo = 'descripcion_m'
          Ancho = 400
          Tipo = ctCadena
        end>
      Database = 'BDProyecto'
      CampoResultado = 'moneda_m'
      Enlace = edtMonedaRem
      Tecla = 'F2'
      Concatenar = False
    end
    object edtBancoRem: TcxDBTextEdit
      Left = 79
      Top = 66
      DataBinding.DataField = 'cod_banco_rc'
      DataBinding.DataSource = dsQRemesaCab
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 3
      Properties.OnChange = PonNombre
      StyleFocused.Color = clWindow
      TabOrder = 9
      Width = 30
    end
    object ssEmpresa: TSimpleSearch
      Left = 109
      Top = 8
      Width = 21
      Height = 21
      TabOrder = 33
      TabStop = False
      OnClick = ssEmpresaClick
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'MoneyTwins'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = FDM.ilxImagenes
      Titulo = 'Busqueda de Empresa'
      Tabla = 'tempresas'
      Campos = <
        item
          Etiqueta = 'Empresa'
          Campo = 'empresa_emp'
          Ancho = 100
          Tipo = ctCadena
        end
        item
          Etiqueta = 'Descripci'#243'n'
          Campo = 'nombre_emp'
          Ancho = 400
          Tipo = ctCadena
        end>
      Database = 'BDProyecto'
      CampoResultado = 'empresa_emp'
      Enlace = edtEmpresaRem
      Tecla = 'F2'
      AntesEjecutar = ssEmpresaAntesEjecutar
      Concatenar = False
    end
    object cxLabelSit: TcxLabel
      Left = 792
      Top = 10
      AutoSize = False
      Caption = 'Situaci'#243'n Remesa'
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clSkyBlue
      Style.Font.Charset = EASTEUROPE_CHARSET
      Style.Font.Color = clMenuBar
      Style.Font.Height = -19
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.Shadow = True
      Style.TextStyle = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.LineOptions.OuterColor = clBtnText
      Height = 38
      Width = 179
      AnchorX = 882
      AnchorY = 29
    end
    object deFechaRemesa: TcxDBDateEdit
      Left = 486
      Top = 43
      DataBinding.DataField = 'fecha_remesa_rc'
      DataBinding.DataSource = dsQRemesaCab
      TabOrder = 14
      Width = 110
    end
    object cxLabel9: TcxLabel
      Left = 385
      Top = 44
      AutoSize = False
      Caption = 'Fecha Remesa'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 100
      AnchorX = 485
    end
    object cxSituacion: TcxLabel
      Left = 783
      Top = 50
      AutoSize = False
      Caption = 'Situacion'
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clSkyBlue
      Style.Font.Charset = EASTEUROPE_CHARSET
      Style.Font.Color = clMenuBar
      Style.Font.Height = -15
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.Shadow = True
      Style.TextStyle = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.LineOptions.OuterColor = clBtnText
      Height = 24
      Width = 201
      AnchorX = 884
      AnchorY = 62
    end
  end
  object gbDetalle: TcxGroupBox
    Left = 0
    Top = 289
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Foggy'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Foggy'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Foggy'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Foggy'
    TabOrder = 1
    Height = 293
    Width = 995
    object cxTabControl1: TcxTabControl
      Left = 2
      Top = 2
      Width = 991
      Height = 24
      Align = alTop
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 7
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Blueprint'
      ClientRectBottom = 23
      ClientRectLeft = 1
      ClientRectRight = 990
      ClientRectTop = 1
      object btnAltaLinea: TcxButton
        Left = -1
        Top = -1
        Width = 24
        Height = 25
        Hint = 'Alta Linea'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnAltaLineaClick
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'Blueprint'
        OptionsImage.ImageIndex = 12
        OptionsImage.Images = DFactura.IFacturas
      end
      object btnBajaLinea: TcxButton
        Left = 21
        Top = -1
        Width = 24
        Height = 25
        Hint = 'Borrar Linea'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnBajaLineaClick
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'Blueprint'
        OptionsImage.ImageIndex = 13
        OptionsImage.Images = DFactura.IFacturas
      end
      object btnAceptarLinea: TcxButton
        Left = 53
        Top = -1
        Width = 22
        Height = 25
        Hint = 'Aceptar (F1)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnAceptarLineaClick
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'Blueprint'
        OptionsImage.ImageIndex = 10
        OptionsImage.Images = DFactura.IFacturas
      end
      object btnCancelarLinea: TcxButton
        Left = 73
        Top = -1
        Width = 24
        Height = 25
        Hint = 'Cancelar (ESC)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnCancelarLineaClick
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'Blueprint'
        OptionsImage.ImageIndex = 4
        OptionsImage.Images = DFactura.IFacturas
      end
      object txImpFacturas: TcxTextEdit
        Left = 362
        Top = 1
        TabStop = False
        BeepOnEnter = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 3
        Properties.ReadOnly = True
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = True
        Style.LookAndFeel.SkinName = 'Foggy'
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.SkinName = 'Foggy'
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.SkinName = 'Foggy'
        StyleHot.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.SkinName = 'Foggy'
        TabOrder = 4
        Width = 130
      end
      object cxLabel7: TcxLabel
        Left = 258
        Top = 4
        AutoSize = False
        Caption = 'Total  Facturas'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 100
        AnchorX = 358
      end
      object cxLabel8: TcxLabel
        Left = 96
        Top = 4
        AutoSize = False
        Caption = 'N'#186' Facturas'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 100
        AnchorX = 196
      end
      object txNumFacturas: TcxTextEdit
        Left = 202
        Top = 1
        TabStop = False
        BeepOnEnter = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 3
        Properties.ReadOnly = True
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 7
        Width = 40
      end
      object cxDiferencia: TcxLabel
        Left = 498
        Top = 3
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Height = 17
        Width = 80
      end
    end
    object pnlAltaLineas: TPanel
      Left = 2
      Top = 26
      Width = 991
      Height = 41
      Align = alTop
      TabOrder = 1
      OnEnter = pnlAltaLineasEnter
      OnExit = pnlAltaLineasExit
      object cxlb9: TcxLabel
        Left = 139
        Top = 11
        AutoSize = False
        Caption = 'Cod. Factura'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 69
        AnchorX = 208
      end
      object edtCodigoFac: TcxDBTextEdit
        Left = 210
        Top = 9
        DataBinding.DataField = 'cod_factura_rf'
        DataBinding.DataSource = dsQRemesaFac
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 15
        Properties.OnChange = edtCodigoFacPropertiesChange
        TabOrder = 3
        OnExit = edtCodigoFacExit
        Width = 100
      end
      object cxLabel1: TcxLabel
        Left = 331
        Top = 11
        AutoSize = False
        Caption = 'Fecha Factura'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 77
        AnchorX = 408
      end
      object cxLabel2: TcxLabel
        Left = 497
        Top = 11
        AutoSize = False
        Caption = 'Importe Factura'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 80
        AnchorX = 577
      end
      object cxLabel3: TcxLabel
        Left = 651
        Top = 11
        AutoSize = False
        Caption = 'Importe a Cobrar'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 102
        AnchorX = 753
      end
      object btnSelFactura: TcxButton
        Left = 311
        Top = 9
        Width = 19
        Height = 21
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TabStop = False
        OnClick = btnSelFacturaClick
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'MoneyTwins'
        OptionsImage.ImageIndex = 11
        OptionsImage.Images = DFactura.IFacturas
      end
      object ceImporteCobro: TcxDBCurrencyEdit
        Left = 752
        Top = 9
        DataBinding.DataField = 'importe_cobrado_rf'
        DataBinding.DataSource = dsQRemesaFac
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 7
        OnExit = ceImporteCobroExit
        Width = 70
      end
      object ceImporteFactura: TcxDBCurrencyEdit
        Left = 579
        Top = 9
        TabStop = False
        DataBinding.DataField = 'importeTotal'
        DataBinding.DataSource = dsQRemesaFac
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.ReadOnly = True
        Style.Color = clBtnFace
        TabOrder = 8
        Width = 70
      end
      object edtFechaFactura: TcxDBTextEdit
        Left = 410
        Top = 9
        TabStop = False
        DataBinding.DataField = 'fechaFactura'
        DataBinding.DataSource = dsQRemesaFac
        Properties.ReadOnly = True
        Style.Color = clBtnFace
        TabOrder = 10
        Width = 80
      end
      object lb1: TcxLabel
        Left = 4
        Top = 11
        AutoSize = False
        Caption = 'N'#250'm. Factura'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Height = 17
        Width = 69
        AnchorX = 73
      end
      object txNumeroFac: TcxTextEdit
        Left = 79
        Top = 9
        TabOrder = 1
        OnExit = txNumeroFacExit
        Width = 63
      end
      object cxlbl1: TcxLabel
        Left = 827
        Top = 11
        AutoSize = False
        Caption = 'Cliente:'
        ParentColor = False
        ParentFont = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Height = 17
        Width = 38
      end
      object ceCodCliente: TcxDBTextEdit
        Left = 868
        Top = 9
        TabStop = False
        DataBinding.DataField = 'clienteFactura'
        DataBinding.DataSource = dsQRemesaFac
        Properties.ReadOnly = True
        Style.Color = clBtnFace
        TabOrder = 12
        Width = 34
      end
    end
    object cxDetalle: TcxGrid
      Left = 2
      Top = 67
      Width = 991
      Height = 224
      Align = alClient
      TabOrder = 2
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Foggy'
      object tvRemesaFac: TcxGridDBTableView
        OnDblClick = tvRemesaFacDblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsQRemesaFac
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvCodFactura: TcxGridDBColumn
          Caption = 'C'#243'digo Factura'
          DataBinding.FieldName = 'cod_factura_rf'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.MaxLength = 15
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 120
        end
        object tvCodCliente: TcxGridDBColumn
          Caption = 'Cliente'
          DataBinding.FieldName = 'clienteFactura'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
        end
        object tvFechaFactura: TcxGridDBColumn
          Caption = 'Fecha Factura'
          DataBinding.FieldName = 'fechaFactura'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 100
        end
        object tvTipoFactura: TcxGridDBColumn
          Caption = 'Tipo Factura'
          DataBinding.FieldName = 'tipoFactura'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 11
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 100
        end
        object tvMonedaFactura: TcxGridDBColumn
          DataBinding.FieldName = 'monedaFactura'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
        end
        object tvImporteTotal: TcxGridDBColumn
          Caption = 'Importe Factura'
          DataBinding.FieldName = 'importeTotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 120
        end
        object tvTotalCobrado: TcxGridDBColumn
          Caption = 'Total Cobrado'
          DataBinding.FieldName = 'totalCobrado'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 120
        end
        object tvCobradoRem: TcxGridDBColumn
          Caption = 'Cobrado Remesa'
          DataBinding.FieldName = 'importe_cobrado_rf'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 120
        end
      end
      object lvRemesaFac: TcxGridLevel
        GridView = tvRemesaFac
      end
    end
  end
  object cxTabControl2: TcxTabControl
    Left = 0
    Top = 38
    Width = 995
    Height = 24
    Align = alTop
    Color = clBtnFace
    ParentColor = False
    TabOrder = 6
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 7
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blueprint'
    ClientRectBottom = 23
    ClientRectLeft = 1
    ClientRectRight = 994
    ClientRectTop = 1
    object btnAceptar: TcxButton
      Left = 1
      Top = -1
      Width = 22
      Height = 25
      Hint = 'Aceptar Remesa (F1)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnAceptarClick
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = 'Blueprint'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = DFactura.IFacturas
    end
    object btnCancelar: TcxButton
      Left = 21
      Top = -1
      Width = 23
      Height = 25
      Hint = 'Cancelar Remesa (ESC)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelarClick
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = 'Blueprint'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = DFactura.IFacturas
    end
    object lb3: TcxLabel
      Left = 510
      Top = 3
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Height = 17
      Width = 80
    end
  end
  object bmx1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'Cambio Sit')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = DFactura.IFacturas
    ImageOptions.LargeImages = DFactura.IFacturas
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 680
    Top = 48
    DockControlHeights = (
      0
      0
      38
      0)
    object bmx1Bar1: TdxBar
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Principal'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 145
      FloatTop = 152
      FloatClientWidth = 0
      FloatClientHeight = 0
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
          BeginGroup = True
          Visible = True
          ItemName = 'dxPrimero'
        end
        item
          Visible = True
          ItemName = 'dxAnterior'
        end
        item
          Visible = True
          ItemName = 'dxSiguiente'
        end
        item
          Visible = True
          ItemName = 'dxUltimo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxAlta'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBaja'
        end
        item
          Visible = True
          ItemName = 'dxModificar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxImprimir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxCambioSit'
        end
        item
          Visible = True
          ItemName = 'dxManFactura'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxSalir'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      Visible = True
      WholeRow = False
    end
    object dxLocalizar: TdxBarLargeButton
      Caption = 'Localizar'
      Category = 0
      Hint = 'Localizar'
      Visible = ivAlways
      LargeImageIndex = 9
      OnClick = dxLocalizarClick
    end
    object dxPrimero: TdxBarLargeButton
      Caption = 'Primero'
      Category = 0
      Hint = 'Primero'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = dxPrimeroClick
      SyncImageIndex = False
      ImageIndex = 5
    end
    object dxAnterior: TdxBarLargeButton
      Caption = 'Anterior'
      Category = 0
      Hint = 'Anterior'
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = dxAnteriorClick
    end
    object dxSiguiente: TdxBarLargeButton
      Caption = 'Siguiente'
      Category = 0
      Hint = 'Siguiente'
      Visible = ivAlways
      LargeImageIndex = 7
      OnClick = dxSiguienteClick
    end
    object dxUltimo: TdxBarLargeButton
      Caption = 'Ultimo'
      Category = 0
      Hint = 'Ultimo'
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = dxUltimoClick
    end
    object dxAlta: TdxBarLargeButton
      Caption = 'Alta'
      Category = 0
      Hint = 'Alta'
      Visible = ivAlways
      LargeImageIndex = 12
      OnClick = dxAltaClick
      SyncImageIndex = False
      ImageIndex = 12
    end
    object dxBaja: TdxBarLargeButton
      Caption = 'Borrar'
      Category = 0
      Hint = 'Borrar Remesa'
      Visible = ivAlways
      LargeImageIndex = 13
      OnClick = dxBajaClick
    end
    object dxModificar: TdxBarLargeButton
      Caption = 'Modificar Cab.'
      Category = 0
      Hint = 'Modificar Cab.'
      Visible = ivAlways
      LargeImageIndex = 16
      OnClick = dxModificarClick
    end
    object dxImprimir: TdxBarLargeButton
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir Remesa'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = dxImprimirClick
    end
    object dxCambioSit: TdxBarLargeButton
      Caption = 'Sit Remesa'
      Category = 0
      Hint = 'Sit Remesa'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarCambioSit
      LargeImageIndex = 18
      OnClick = dxCambioSitClick
    end
    object dxManFactura: TdxBarLargeButton
      Caption = 'Mant. Factura'
      Category = 0
      Hint = 'Mant. Factura'
      Visible = ivAlways
      LargeImageIndex = 19
      OnClick = dxManFacturaClick
    end
    object dxSalir: TdxBarLargeButton
      Caption = 'Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      LargeImageIndex = 14
      OnClick = dxSalirClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Pasar a Finalizada'
      Category = 0
      Hint = 'Pasar a Finalizada'
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = 'Pasar a Pdte. Contabilizar'
      Category = 0
      Hint = 'Pasar a Pdte. Contabilizar'
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxPasarAIntroducida: TdxBarButton
      Caption = 'Pasar a Introducida'
      Category = 0
      Hint = 'Pasar a Introducida'
      Visible = ivAlways
      OnClick = dxPasarAIntroducidaClick
    end
    object dxPasarAPdteContabilizar: TdxBarButton
      Caption = 'Pasar a Pdte. contabilizar'
      Category = 0
      Hint = 'Pasar a Pdte. contabilizar'
      Visible = ivAlways
      OnClick = dxPasarAPdteContabilizarClick
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Pasar a Finalizada'
      Category = 1
      Hint = 'Pasar a Finalizada'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Pasar a Pdte. Contabilizar'
      Category = 1
      Hint = 'Pasar a Pdte. Contabilizar'
      Visible = ivAlways
    end
  end
  object dsQRemesaCab: TDataSource
    OnStateChange = dsQRemesaCabStateChange
    OnDataChange = dsQRemesaCabDataChange
    Left = 712
    Top = 47
  end
  object dsQRemesaFac: TDataSource
    OnStateChange = dsQRemesaFacStateChange
    Left = 744
    Top = 46
  end
  object ActionList: TActionList
    Left = 781
    Top = 46
    object actCancelar: TAction
      Caption = 'Cancelar'
      ShortCut = 27
      OnExecute = actCancelarExecute
    end
    object actAceptar: TAction
      Caption = 'Aceptar'
      OnExecute = actAceptarExecute
    end
    object actLocalizar: TAction
      Caption = 'Localizar'
      OnExecute = actLocalizarExecute
    end
  end
  object ReRemesas: TRejilla
    Titulo = 'Control de Cobrosl'
    Columnas = <
      item
        Etiqueta = 'Empresa'
        Campo = 'empresa_remesa_rc'
        Ancho = 100
        Tipo = ctCadena
      end
      item
        Etiqueta = 'Cliente'
        Campo = 'cod_cliente_rc'
        Ancho = 100
        Tipo = ctCadena
      end
      item
        Etiqueta = 'Numero Remesa'
        Campo = 'n_remesa_rc'
        Ancho = 100
        Tipo = ctNumero
      end
      item
        Etiqueta = 'Fecha Vencimiento'
        Campo = 'fecha_vencimiento_rc'
        Ancho = 100
        Tipo = ctFecha
      end
      item
        Etiqueta = 'Fecha Descuento'
        Campo = 'fecha_descuento_rc'
        Ancho = 100
        Tipo = ctFecha
      end
      item
        Etiqueta = 'Banco'
        Campo = 'cod_banco_rc'
        Ancho = 100
        Tipo = ctCadena
      end
      item
        Etiqueta = 'Importe Remesa'
        Campo = 'importe_cobro_rc'
        Ancho = 100
        Tipo = ctNumero
      end>
    Left = 684
    Top = 158
  end
  object BERemesas: TBusquedaExperta
    Titulo = 'Mantenimiento de Remesas '
    Tablas = 
      'tremesas_cab left join tremesas_fac on empresa_remesa_rf = empre' +
      'sa_remesa_rc and fecha_remesa_rf = fecha_remesa_rc and n_remesa_' +
      'rf = n_remesa_rc'
    Campos = <
      item
        Etiqueta = 'Empresa'
        Campo = 'empresa_remesa_rc'
        Tipo = ctCadena
        Lupa = True
        SSTitulo = 'Busqueda de Empresas'
        SSTabla = 'tempresas'
        SSJoin = 'contabilizar_emp = 1'
        SSCampoResultado = 'empresa_emp'
        SSCampos = <
          item
            Etiqueta = 'Empresa'
            Campo = 'empresa_emp'
            Ancho = 100
            Tipo = ctCadena
          end
          item
            Etiqueta = 'Nombre'
            Campo = 'nombre_emp'
            Ancho = 400
            Tipo = ctCadena
          end>
        SSReferencias = <>
        SSConcatenar = True
      end
      item
        Etiqueta = 'Cliente'
        Campo = 'cod_cliente_rc'
        Tipo = ctCadena
        Lupa = True
        SSTitulo = 'B'#250'squeda de Clientes'
        SSTabla = 'frf_clientes'
        SSCampos = <
          item
            Etiqueta = 'Cliente'
            Campo = 'cliente_c'
            Ancho = 100
            Tipo = ctCadena
          end
          item
            Etiqueta = 'Nombre'
            Campo = 'nombre_c'
            Ancho = 400
            Tipo = ctCadena
          end>
        SSReferencias = <>
        SSConcatenar = True
      end
      item
        Etiqueta = 'Numero Remesa'
        Campo = 'n_remesa_rc'
        Tipo = ctNumero
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end
      item
        Etiqueta = 'Fecha Remesa'
        Campo = 'fecha_remesa_rc'
        Tipo = ctFecha
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end
      item
        Etiqueta = 'Fecha Vencimiento'
        Campo = 'fecha_vencimiento_rc'
        Tipo = ctFecha
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end
      item
        Etiqueta = 'Banco'
        Campo = 'cod_banco_rc'
        Tipo = ctCadena
        Lupa = True
        SSTitulo = 'B'#250'squeda de Bancos'
        SSTabla = 'frf_bancos'
        SSCampoResultado = 'banco_b'
        SSCampos = <
          item
            Etiqueta = 'Banco'
            Campo = 'banco_b'
            Ancho = 100
            Tipo = ctCadena
          end
          item
            Etiqueta = 'Descripcion'
            Campo = 'descripcion_b'
            Ancho = 400
            Tipo = ctCadena
          end>
        SSReferencias = <
          item
            ReferenciaBE = 'empresa_remesa_rc'
            ReferenciaSS = 'empresa_b'
          end>
        SSConcatenar = False
      end
      item
        Etiqueta = 'Importe Remesa'
        Campo = 'importe_cobro_rc'
        Tipo = ctNumero
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end
      item
        Etiqueta = 'Codigo Factura'
        Campo = 'cod_factura_rf'
        Tipo = ctCadena
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end
      item
        Etiqueta = 'Situacion Remesa'
        Campo = 'situacion_rc'
        Tipo = ctNumero
        Lupa = False
        SSCampos = <>
        SSReferencias = <>
        SSConcatenar = False
      end>
    Restringido = True
    Left = 712
    Top = 160
  end
  object dxBarCambioSit: TdxBarPopupMenu
    BarManager = bmx1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxPasarAIntroducida'
      end
      item
        Visible = True
        ItemName = 'dxPasarAPdteContabilizar'
      end>
    UseOwnFont = False
    Left = 768
    Top = 160
  end
end
