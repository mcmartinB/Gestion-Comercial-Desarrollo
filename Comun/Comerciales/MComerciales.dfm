object FMComerciales: TFMComerciales
  Left = 822
  Top = 226
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '  COMERCIALES'
  ClientHeight = 507
  ClientWidth = 443
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
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PMaestro: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 90
    Align = alTop
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblComercial: TLabel
      Left = 43
      Top = 38
      Width = 79
      Height = 19
      AutoSize = False
      Caption = ' C'#243'digo/Nombre'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object codigo_c: TBDEdit
      Left = 128
      Top = 37
      Width = 30
      Height = 21
      ColorEdit = clMoneyGreen
      Required = True
      OnRequiredTime = RequiredTime
      MaxLength = 3
      TabOrder = 0
      DataField = 'codigo_c'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object descripcion_c: TBDEdit
      Left = 162
      Top = 37
      Width = 235
      Height = 21
      ColorEdit = clMoneyGreen
      OnRequiredTime = RequiredTime
      MaxLength = 30
      TabOrder = 1
      DataField = 'descripcion_c'
      DataSource = DSMaestro
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 90
    Width = 443
    Height = 417
    ActivePage = tsClientes
    Align = alClient
    TabOrder = 2
    OnChange = PageControlChange
    object tsClientes: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 1
      object pnlClientes: TPanel
        Left = 0
        Top = 0
        Width = 435
        Height = 115
        Align = alTop
        TabOrder = 0
        Visible = False
        object lblEmpresa: TLabel
          Left = 7
          Top = 10
          Width = 69
          Height = 19
          AutoSize = False
          Caption = ' Empresa'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object lblCliente: TLabel
          Left = 7
          Top = 32
          Width = 69
          Height = 19
          AutoSize = False
          Caption = ' Cliente'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object btnEmpresa: TBGridButton
          Left = 110
          Top = 9
          Width = 13
          Height = 21
          Hint = 'Pulse F2 para ver una lista de valores validos. '
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
          OnClick = ARejillaFlotanteExecute
          Control = cod_empresa_cc
          Grid = RejillaFlotante
          GridAlignment = taDownRight
          GridWidth = 280
          GridHeigth = 160
        end
        object btnCliente: TBGridButton
          Left = 110
          Top = 31
          Width = 13
          Height = 21
          Hint = 'Pulse F2 para ver una lista de valores validos. '
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
          OnClick = ARejillaFlotanteExecute
          Control = cod_cliente_cc
          Grid = RejillaFlotante
          GridAlignment = taDownRight
          GridWidth = 280
          GridHeigth = 160
        end
        object Label1: TLabel
          Left = 7
          Top = 54
          Width = 69
          Height = 19
          AutoSize = False
          Caption = ' Producto'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object btnProducto: TBGridButton
          Left = 110
          Top = 53
          Width = 13
          Height = 21
          Hint = 'Pulse F2 para ver una lista de valores validos. '
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
          OnClick = ARejillaFlotanteExecute
          Control = cod_producto_cc
          Grid = RejillaFlotante
          GridAlignment = taDownRight
          GridWidth = 280
          GridHeigth = 160
        end
        object Label2: TLabel
          Left = 7
          Top = 78
          Width = 69
          Height = 19
          AutoSize = False
          Caption = ' Fecha Inicio'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object Label3: TLabel
          Left = 227
          Top = 78
          Width = 69
          Height = 19
          AutoSize = False
          Caption = ' Fecha Fin'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object cod_empresa_cc: TBDEdit
          Left = 79
          Top = 9
          Width = 30
          Height = 21
          Hint = 'El c'#243'digo del producto es obligatorio.'
          ColorEdit = clMoneyGreen
          Required = True
          OnRequiredTime = RequiredTime
          MaxLength = 3
          TabOrder = 0
          OnChange = cod_empresa_ccChange
          DataField = 'cod_empresa_cc'
          DataSource = DSClientes
          Modificable = False
          PrimaryKey = True
        end
        object cod_cliente_cc: TBDEdit
          Left = 79
          Top = 31
          Width = 30
          Height = 21
          ColorEdit = clMoneyGreen
          OnRequiredTime = RequiredTime
          MaxLength = 3
          TabOrder = 2
          OnChange = cod_cliente_ccChange
          DataField = 'cod_cliente_cc'
          DataSource = DSClientes
          Modificable = False
        end
        object txtEmpresa: TStaticText
          Left = 125
          Top = 11
          Width = 293
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 1
        end
        object txtCliente: TStaticText
          Left = 125
          Top = 33
          Width = 293
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 3
        end
        object cod_producto_cc: TBDEdit
          Left = 79
          Top = 53
          Width = 30
          Height = 21
          ColorEdit = clMoneyGreen
          OnRequiredTime = RequiredTime
          MaxLength = 3
          TabOrder = 4
          OnChange = cod_producto_ccChange
          DataField = 'cod_producto_cc'
          DataSource = DSClientes
          Modificable = False
        end
        object txtProducto: TStaticText
          Left = 125
          Top = 55
          Width = 293
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 5
        end
        object fecha_ini_cc: TcxDBDateEdit
          Left = 79
          Top = 76
          DataBinding.DataField = 'fecha_ini_cc'
          DataBinding.DataSource = DSClientes
          Style.LookAndFeel.Kind = lfStandard
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 6
          Width = 121
        end
        object fecha_fin_cc: TcxDBDateEdit
          Left = 297
          Top = 78
          DataBinding.DataField = 'fecha_fin_cc'
          DataBinding.DataSource = DSClientes
          Style.LookAndFeel.Kind = lfStandard
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 7
          Width = 121
        end
      end
      object RClientes: TDBGrid
        Left = 0
        Top = 115
        Width = 435
        Height = 274
        Align = alClient
        DataSource = DSClientes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'cod_cliente_cc'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cod_producto_cc'
            Title.Alignment = taCenter
            Title.Caption = 'Producto'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cod_empresa_cc'
            Title.Alignment = taCenter
            Title.Caption = 'Empresa'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_ini_cc'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Inicial'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_fin_cc'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Final'
            Width = 90
            Visible = True
          end>
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 115
        Width = 435
        Height = 274
        Align = alClient
        TabOrder = 2
        OnEnter = cxGrid1Enter
        OnExit = cxGrid1Exit
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.DisplayMode = fpdmAlways
          DataController.DataModeController.SmartRefresh = True
          DataController.DataSource = DSClientes
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnAddValueItems = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'cod_cliente_cc'
            HeaderGlyphAlignmentHorz = taCenter
            MinWidth = 62
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Width = 62
          end
          object cxGrid1DBTableView1Column2: TcxGridDBColumn
            Caption = 'Producto'
            DataBinding.FieldName = 'cod_producto_cc'
            HeaderGlyphAlignmentHorz = taCenter
            MinWidth = 75
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Width = 75
          end
          object cxGrid1DBTableView1Column3: TcxGridDBColumn
            Caption = 'Empresa'
            DataBinding.FieldName = 'cod_empresa_cc'
            HeaderGlyphAlignmentHorz = taCenter
            MinWidth = 120
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Width = 120
          end
          object cxGrid1DBTableView1Column4: TcxGridDBColumn
            Caption = 'Fecha inicio'
            DataBinding.FieldName = 'fecha_ini_cc'
            HeaderGlyphAlignmentHorz = taCenter
            MinWidth = 75
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Width = 75
          end
          object cxGrid1DBTableView1Column5: TcxGridDBColumn
            Caption = 'Fecha fin'
            DataBinding.FieldName = 'fecha_fin_cc'
            HeaderGlyphAlignmentHorz = taCenter
            MinWidth = 80
            Options.AutoWidthSizable = False
            Options.HorzSizing = False
            Width = 80
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object RejillaFlotante: TBGrid
    Left = 592
    Top = 16
    Width = 73
    Height = 97
    Color = clInfoBk
    DataSource = DMBaseDatos.DSQGeneral
    FixedColor = clInfoText
    Options = [dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    ColumnFind = 1
  end
  object DSMaestro: TDataSource
    DataSet = qryComerciales
    Left = 360
    Top = 16
  end
  object qryComerciales: TQuery
    AfterOpen = qryComercialesAfterOpen
    BeforeClose = qryComercialesBeforeClose
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 328
    Top = 16
  end
  object qryClientes: TQuery
    OnNewRecord = qryClientesNewRecord
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    RequestLive = True
    Left = 328
    Top = 48
  end
  object DSClientes: TDataSource
    DataSet = qryClientes
    Left = 360
    Top = 48
  end
  object qryClientesAux: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 402
    Top = 17
  end
  object AComerciales: TActionList
    Images = DMBaseDatos.ImgBotones
    Left = 123
    Top = 458
    object ARejillaFlotante: TAction
      Caption = 'ARejillaFlotante'
      Hint = 'Pulse F2 para ver una lista de valores validos. '
      ImageIndex = 0
      ShortCut = 113
      OnExecute = ARejillaFlotanteExecute
    end
    object ADModificar: TAction
      Caption = 'ADModificar'
      ShortCut = 77
    end
  end
end
