object FTablaAnualCosteKgEnvasado: TFTablaAnualCosteKgEnvasado
  Left = 514
  Top = 276
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '    COSTES DE ENVASADO ESTADISTICO POR KG'
  ClientHeight = 279
  ClientWidth = 475
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
    475
    279)
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TSpeedButton
    Left = 289
    Top = 242
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
    Left = 380
    Top = 242
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
  object nbLabel1: TnbLabel
    Left = 44
    Top = 27
    Width = 77
    Height = 21
    Caption = 'Empresa'
    About = 'NB 0.1/20020725'
  end
  object des_empresa: TnbStaticText
    Left = 165
    Top = 27
    Width = 249
    Height = 21
    Caption = 'des_empresa'
    About = 'NB 0.1/20020725'
  end
  object nbLabel4: TnbLabel
    Left = 44
    Top = 51
    Width = 77
    Height = 21
    Caption = 'Centro salida'
    About = 'NB 0.1/20020725'
  end
  object des_centro: TnbStaticText
    Left = 165
    Top = 51
    Width = 249
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object nbLabel2: TnbLabel
    Left = 44
    Top = 149
    Width = 77
    Height = 21
    Caption = 'Fecha hasta'
    About = 'NB 0.1/20020725'
  end
  object nbLabel5: TnbLabel
    Left = 44
    Top = 75
    Width = 77
    Height = 21
    Caption = 'Producto'
    About = 'NB 0.1/20020725'
  end
  object des_producto: TnbStaticText
    Left = 165
    Top = 75
    Width = 249
    Height = 21
    About = 'NB 0.1/20020725'
  end
  object lblEnvase: TnbLabel
    Left = 44
    Top = 125
    Width = 77
    Height = 21
    Caption = 'Art'#237'culo'
    About = 'NB 0.1/20020725'
  end
  object stEnvase: TnbStaticText
    Left = 226
    Top = 125
    Width = 190
    Height = 21
    Caption = 'des_articulo'
    About = 'NB 0.1/20020725'
  end
  object lblCodigo1: TnbLabel
    Left = 44
    Top = 174
    Width = 77
    Height = 21
    Caption = 'Ver Costes'
    About = 'NB 0.1/20020725'
  end
  object lblCliente: TnbLabel
    Left = 44
    Top = 100
    Width = 77
    Height = 21
    Caption = 'Cliente'
    About = 'NB 0.1/20020725'
  end
  object stCliente: TnbStaticText
    Left = 167
    Top = 100
    Width = 249
    Height = 21
    Caption = 'des_cliente'
    About = 'NB 0.1/20020725'
  end
  object empresa: TBEdit
    Left = 125
    Top = 27
    Width = 36
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 3
    TabOrder = 0
    OnChange = empresaChange
  end
  object fechaHasta: TnbDBCalendarCombo
    Left = 125
    Top = 149
    Width = 90
    Height = 21
    About = 'NB 0.1/20020725'
    CharCase = ecUpperCase
    Text = '26/01/2004'
    TabOrder = 3
  end
  object producto: TBEdit
    Left = 125
    Top = 75
    Width = 36
    Height = 21
    ColorEdit = clMoneyGreen
    MaxLength = 3
    TabOrder = 2
    OnChange = productoChange
  end
  object centro: TBEdit
    Left = 125
    Top = 51
    Width = 17
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 1
    TabOrder = 1
    OnChange = centroChange
  end
  object cbbTipo: TComboBox
    Left = 125
    Top = 174
    Width = 140
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 4
    Text = 'Envasado y Secciones'
    Items.Strings = (
      'Envasado'
      'Secciones'
      'Envasado y Secciones'
      'Envasado + Secciones')
  end
  object edtCliente: TBEdit
    Left = 125
    Top = 100
    Width = 36
    Height = 21
    ColorEdit = clMoneyGreen
    Zeros = True
    MaxLength = 3
    TabOrder = 5
    OnChange = edtClienteChange
  end
  object chkPromedios: TCheckBox
    Left = 44
    Top = 198
    Width = 161
    Height = 17
    Caption = 'Usar costes promedios.'
    TabOrder = 6
  end
  object edtEnvase: TcxTextEdit
    Left = 124
    Top = 125
    BeepOnEnter = False
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 9
    Properties.OnChange = edtEnvaseChange
    Style.BorderStyle = ebs3D
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = False
    Style.TextStyle = []
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    OnExit = edtEnvaseExit
    Width = 75
  end
  object ssEnvase: TSimpleSearch
    Left = 199
    Top = 125
    Width = 21
    Height = 21
    TabOrder = 8
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
end
