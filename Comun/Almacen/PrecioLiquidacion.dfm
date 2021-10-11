object FPrecioLiquidacion: TFPrecioLiquidacion
  Left = 605
  Top = 218
  ActiveControl = empresa_pl
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 
    '    GRABACION PRECIO COMPRA PARA ENTREGAS DE PROVEEDOR A LIQUIDA' +
    'R'
  ClientHeight = 617
  ClientWidth = 568
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
  PixelsPerInch = 96
  TextHeight = 13
  object PMaestro: TPanel
    Left = 0
    Top = 0
    Width = 568
    Height = 250
    Align = alTop
    TabOrder = 0
    object lblNombre1: TLabel
      Left = 53
      Top = 174
      Width = 100
      Height = 19
      AutoSize = False
      Caption = 'Coste de Personal'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblCoste: TLabel
      Left = 53
      Top = 196
      Width = 100
      Height = 19
      AutoSize = False
      Caption = 'Coste de Material'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblAnyoSemana: TLabel
      Left = 53
      Top = 67
      Width = 100
      Height = 19
      AutoSize = False
      Caption = 'A'#241'o / Semana'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblEmpresa: TLabel
      Left = 53
      Top = 23
      Width = 100
      Height = 19
      AutoSize = False
      Caption = 'Empresa'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblProducto: TLabel
      Left = 53
      Top = 152
      Width = 100
      Height = 19
      AutoSize = False
      Caption = 'Producto'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblProveedor: TLabel
      Left = 53
      Top = 45
      Width = 100
      Height = 19
      AutoSize = False
      Caption = 'Proveedor'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object des_empresa: TnbStaticText
      Left = 208
      Top = 23
      Width = 190
      Height = 19
      About = 'NB 0.1/20020725'
    end
    object des_producto: TnbStaticText
      Left = 208
      Top = 152
      Width = 190
      Height = 19
      About = 'NB 0.1/20020725'
    end
    object lblGeneral: TLabel
      Left = 53
      Top = 219
      Width = 100
      Height = 19
      AutoSize = False
      Caption = 'Coste Generales'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblEuroKg: TLabel
      Left = 213
      Top = 177
      Width = 45
      Height = 13
      Caption = 'Euros/Kg'
    end
    object lbl1: TLabel
      Left = 213
      Top = 199
      Width = 45
      Height = 13
      Caption = 'Euros/Kg'
    end
    object lbl2: TLabel
      Left = 213
      Top = 222
      Width = 45
      Height = 13
      Caption = 'Euros/Kg'
    end
    object des_proveedor: TnbStaticText
      Left = 208
      Top = 45
      Width = 190
      Height = 19
      About = 'NB 0.1/20020725'
    end
    object personal_ec: TBDEdit
      Left = 156
      Top = 173
      Width = 50
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 'Introduce el coste del personal.'
      OnRequiredTime = RequiredTime
      InputType = itReal
      MaxDecimals = 4
      ShowDecimals = True
      MaxLength = 7
      TabOrder = 4
      DataField = 'personal_ec'
      DataSource = DSMaestro
    end
    object empresa_pl: TBDEdit
      Left = 156
      Top = 22
      Width = 40
      Height = 21
      ColorEdit = clMoneyGreen
      Zeros = True
      Required = True
      RequiredMsg = 'Ingtroduce el c'#243'digo de la empresa.'
      OnRequiredTime = RequiredTime
      MaxLength = 3
      TabOrder = 0
      OnChange = empresa_plChange
      DataField = 'empresa_pl'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object proveedor_pl: TBDEdit
      Tag = 1
      Left = 156
      Top = 44
      Width = 40
      Height = 21
      ColorEdit = clMoneyGreen
      Required = True
      RequiredMsg = 'Introduce el a'#241'o.'
      OnRequiredTime = RequiredTime
      InputType = itInteger
      MaxLength = 4
      TabOrder = 1
      OnChange = proveedor_plChange
      DataField = 'proveedor_pl'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object anyo_semana_pl: TBDEdit
      Tag = 1
      Left = 156
      Top = 66
      Width = 68
      Height = 21
      ColorEdit = clMoneyGreen
      Required = True
      RequiredMsg = 'Introduce el mes.'
      OnRequiredTime = RequiredTime
      InputType = itInteger
      MaxLength = 2
      TabOrder = 2
      DataField = 'anyo_semana_pl'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object producto_pl: TBDEdit
      Left = 156
      Top = 151
      Width = 40
      Height = 21
      ColorEdit = clMoneyGreen
      Zeros = True
      Required = True
      RequiredMsg = 'INtroduce el c'#243'digo del envase.'
      OnRequiredTime = RequiredTime
      MaxLength = 3
      TabOrder = 3
      DataField = 'producto_pl'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object material_ec: TBDEdit
      Left = 156
      Top = 195
      Width = 50
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 'Introduce el coste del material.'
      OnRequiredTime = RequiredTime
      InputType = itReal
      MaxDecimals = 4
      ShowDecimals = True
      MaxLength = 7
      TabOrder = 5
      DataField = 'material_ec'
      DataSource = DSMaestro
    end
    object general_ec: TBDEdit
      Left = 156
      Top = 218
      Width = 50
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 'Introduce el coste general.'
      OnRequiredTime = RequiredTime
      InputType = itReal
      MaxDecimals = 4
      ShowDecimals = True
      MaxLength = 7
      TabOrder = 6
      DataField = 'general_ec'
      DataSource = DSMaestro
    end
  end
  object dbgEnvasado: TDBGrid
    Left = 0
    Top = 250
    Width = 568
    Height = 367
    Align = alClient
    DataSource = DSMaestro
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'envase_ec'
        Title.Alignment = taCenter
        Title.Caption = 'Envase'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'des_envase'
        Title.Alignment = taCenter
        Title.Caption = 'Descripci'#243'n'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'personal_ec'
        Title.Alignment = taCenter
        Title.Caption = 'Personal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'material_ec'
        Title.Alignment = taCenter
        Title.Caption = 'Material'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'general_ec'
        Title.Alignment = taCenter
        Title.Caption = 'General'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'coste_total'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Visible = True
      end>
  end
  object DSMaestro: TDataSource
    DataSet = QPrecioLiquidacion
    Left = 88
    Top = 328
  end
  object QPrecioLiquidacion: TQuery
    OnCalcFields = QPrecioLiquidacionCalcFields
    DatabaseName = 'BDProyecto'
    DataSource = dsGuia
    RequestLive = True
    SQL.Strings = (
      'select * '
      'from frf_precio_liquidacion')
    Left = 56
    Top = 329
    object QPrecioLiquidacionanyo_ec: TSmallintField
      FieldName = 'anyo_ec'
      Origin = '"COMER.DESARROLLO".frf_envase_costes.anyo_ec'
    end
    object QPrecioLiquidacionmes_ec: TSmallintField
      FieldName = 'mes_ec'
      Origin = '"COMER.DESARROLLO".frf_envase_costes.mes_ec'
    end
    object QPrecioLiquidacionempresa_ec: TStringField
      FieldName = 'empresa_ec'
      Origin = '"COMER.DESARROLLO".frf_envase_costes.empresa_ec'
      FixedChar = True
      Size = 3
    end
    object QPrecioLiquidacioncentro_ec: TStringField
      FieldName = 'centro_ec'
      Origin = 'COMERCIALIZACION.frf_env_costes.centro_ec'
      FixedChar = True
      Size = 1
    end
    object QPrecioLiquidacionenvase_ec: TStringField
      FieldName = 'envase_ec'
      Origin = '"COMER.DESARROLLO".frf_envase_costes.envase_ec'
      FixedChar = True
      Size = 3
    end
    object QPrecioLiquidacionproducto_base_ec: TSmallintField
      FieldName = 'producto_base_ec'
      Origin = '"COMER.DESARROLLO".frf_envase_costes.producto_base_ec'
    end
    object QPrecioLiquidaciondes_envase: TStringField
      FieldKind = fkCalculated
      FieldName = 'des_envase'
      Size = 30
      Calculated = True
    end
    object QPrecioLiquidacioncoste_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'coste_total'
      Calculated = True
    end
    object QPrecioLiquidacionformato_ec: TStringField
      FieldName = 'formato_ec'
      Origin = 'BDPROYECTO.frf_env_costes.formato_ec'
      FixedChar = True
      Size = 5
    end
    object QPrecioLiquidacionmaterial_ec: TFloatField
      FieldName = 'material_ec'
      Origin = 'BDPROYECTO.frf_env_costes.material_ec'
    end
    object QPrecioLiquidacionpersonal_ec: TFloatField
      FieldName = 'personal_ec'
      Origin = 'BDPROYECTO.frf_env_costes.personal_ec'
    end
    object QPrecioLiquidaciongeneral_ec: TFloatField
      FieldName = 'general_ec'
      Origin = 'BDPROYECTO.frf_env_costes.general_ec'
    end
  end
  object qGuia: TQuery
    CachedUpdates = True
    AfterOpen = qGuiaAfterOpen
    BeforeClose = qGuiaBeforeClose
    DatabaseName = 'BDProyecto'
    SQL.Strings = (
      
        'SELECT empresa_pl, proveedor_pl, anyo_semana_pl FROM frf_precio_' +
        'liquidacion'
      'ORDER BY  empresa_pl, proveedor_pl, anyo_semana_p')
    UpdateObject = sqluGuia
    Left = 56
    Top = 287
  end
  object dsGuia: TDataSource
    DataSet = qGuia
    Left = 88
    Top = 286
  end
  object sqluGuia: TUpdateSQL
    Left = 120
    Top = 288
  end
end
