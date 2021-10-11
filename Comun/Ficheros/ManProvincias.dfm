object FManProvincias: TFManProvincias
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'Mantenimiento de Provincias'
  ClientHeight = 383
  ClientWidth = 353
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpDetalle: TcxGroupBox
    Left = 0
    Top = 336
    Align = alBottom
    Style.BorderColor = clBtnFace
    Style.BorderStyle = ebsOffice11
    TabOrder = 3
    OnEnter = grpDetalleEnter
    OnExit = grpDetalleExit
    Height = 47
    Width = 353
    object edtCodigo: TcxDBTextEdit
      Left = 11
      Top = 15
      DataBinding.DataField = 'codigo_p'
      DataBinding.DataSource = dsQProvincias
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 2
      Properties.ReadOnly = False
      TabOrder = 0
      Width = 70
    end
    object edtDescripcion: TcxDBTextEdit
      Left = 88
      Top = 15
      DataBinding.DataField = 'nombre_p'
      DataBinding.DataSource = dsQProvincias
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      TabOrder = 1
      Width = 254
    end
  end
  object grpPrincipal1: TcxGroupBox
    Left = 0
    Top = 45
    Align = alClient
    TabOrder = 5
    Height = 291
    Width = 353
    object cxGrid: TcxGrid
      Left = 2
      Top = 5
      Width = 349
      Height = 284
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvRaised
      BorderStyle = cxcbsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LockedStateImageOptions.AssignedValues = [lsiavColor]
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Foggy'
      object cxProvinciasProvincia: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsQProvincias
        DataController.KeyFieldNames = 'codigo_p'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxcProNombreCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo_p'
          Options.AutoWidthSizable = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 85
        end
        object cxcProNombreDescripcion: TcxGridDBColumn
          Caption = 'Descripci'#243'n'
          DataBinding.FieldName = 'nombre_p'
          Width = 264
        end
      end
      object cxProvincia: TcxGridLevel
        GridView = cxProvinciasProvincia
      end
    end
  end
  object dsQProvincias: TDataSource
    OnStateChange = dsQProvinciasStateChange
    Left = 312
    Top = 15
  end
  object dxBarManager: TdxBarManager
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
    ImageOptions.Images = DMBaseDatos.ImgDev
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 168
    Top = 48
    DockControlHeights = (
      0
      0
      45
      0)
    object dxBarPrincipal: TdxBar
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Principal'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 392
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      IsMainMenu = True
      ItemLinks = <
        item
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
          Visible = True
          ItemName = 'dxBorrar'
        end
        item
          Visible = True
          ItemName = 'dxModificacion'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxImprimir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxSalir'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      Visible = True
      WholeRow = True
    end
    object dxBarDetalle: TdxBar
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Detalle'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 23
      DockingStyle = dsTop
      FloatLeft = 387
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxAceptar'
        end
        item
          Visible = True
          ItemName = 'dxCancelar'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxSalir: TdxBarButton
      Caption = 'Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      ImageIndex = 14
      OnClick = actSalirExecute
    end
    object dxPrimero: TdxBarButton
      Caption = 'Primero'
      Category = 0
      Hint = 'Primer Registro'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = dxPrimeroClick
    end
    object dxAnterior: TdxBarButton
      Caption = 'Anterior'
      Category = 0
      Hint = 'Registro Anterior'
      Visible = ivAlways
      ImageIndex = 8
      OnClick = dxAnteriorClick
    end
    object dxSiguiente: TdxBarButton
      Caption = 'Siguiente'
      Category = 0
      Hint = 'Registro Siguiente'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = dxSiguienteClick
    end
    object dxUltimo: TdxBarButton
      Caption = 'Ultimo'
      Category = 0
      Hint = 'Ultimo Registro'
      Visible = ivAlways
      ImageIndex = 6
      OnClick = dxUltimoClick
    end
    object dxAlta: TdxBarButton
      Action = actAlta
      Category = 0
    end
    object dxModificacion: TdxBarButton
      Action = actModificar
      Category = 0
    end
    object dxBorrar: TdxBarButton
      Action = actBaja
      Category = 0
    end
    object dxImprimir: TdxBarButton
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivAlways
      ImageIndex = 2
    end
    object dxAceptar: TdxBarButton
      Caption = 'Aceptar'
      Category = 0
      Hint = 'Aceptar'
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 112
      OnClick = actAceptarExecute
    end
    object dxCancelar: TdxBarButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      ImageIndex = 4
      OnClick = actCancelarExecute
    end
  end
  object ActionList: TActionList
    Images = DMBaseDatos.ImgDev
    Left = 314
    Top = 47
    object actAlta: TAction
      Caption = 'Alta'
      Hint = 'Alta Registro'
      ImageIndex = 12
      ShortCut = 187
      OnExecute = actAltaExecute
    end
    object actBaja: TAction
      Caption = 'actBaja'
      Hint = 'Baja Registro'
      ImageIndex = 13
      ShortCut = 111
      OnExecute = actBajaExecute
    end
    object actModificar: TAction
      Caption = 'actModificar'
      Hint = 'Modificar Registro'
      ImageIndex = 16
      ShortCut = 77
      OnExecute = actModificarExecute
    end
    object actImprimir: TAction
      Caption = 'Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 2
      ShortCut = 73
    end
  end
end
