object FPSincroDiario: TFPSincroDiario
  Left = 490
  Top = 273
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = '    TITULO FORMULARIO LISTADO'
  ClientHeight = 260
  ClientWidth = 423
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
    423
    260)
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TSpeedButton
    Left = 222
    Top = 214
    Width = 88
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ejecutar'
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
    Left = 316
    Top = 214
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
  object pSincronizar: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 204
    BevelOuter = bvNone
    TabOrder = 0
    object lblEmpresa: TnbLabel
      Left = 44
      Top = 43
      Width = 97
      Height = 21
      Caption = 'Empresa'
      About = 'NB 0.1/20020725'
    end
    object etqEmpresa: TnbStaticText
      Left = 182
      Top = 43
      Width = 190
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object lblFechaDesde: TnbLabel
      Left = 44
      Top = 119
      Width = 97
      Height = 21
      Caption = 'Fecha '
      About = 'NB 0.1/20020725'
    end
    object lblFechaHasta: TnbLabel
      Left = 211
      Top = 119
      Width = 52
      Height = 21
      Caption = 'al'
      About = 'NB 0.1/20020725'
    end
    object lblEtiqueta: TLabel
      Left = 24
      Top = 16
      Width = 170
      Height = 13
      Caption = 'Sincronizar Datos - Formulario Base '
    end
    object lblCentro: TnbLabel
      Left = 45
      Top = 70
      Width = 97
      Height = 21
      Caption = 'Centro'
      About = 'NB 0.1/20020725'
    end
    object etqCentro: TnbStaticText
      Left = 182
      Top = 70
      Width = 190
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object lblCodigo: TnbLabel
      Left = 44
      Top = 146
      Width = 97
      Height = 21
      Caption = 'C'#243'digo'
      About = 'NB 0.1/20020725'
    end
    object lblDesCodigo: TLabel
      Left = 255
      Top = 150
      Width = 107
      Height = 13
      Caption = '(Optativo, vacio todos)'
    end
    object lblProducto: TnbLabel
      Left = 45
      Top = 94
      Width = 97
      Height = 21
      Caption = 'Producto'
      About = 'NB 0.1/20020725'
    end
    object txtProducto: TnbStaticText
      Left = 182
      Top = 94
      Width = 190
      Height = 21
      About = 'NB 0.1/20020725'
    end
    object edtEmpresa: TBEdit
      Left = 144
      Top = 43
      Width = 32
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 3
      TabOrder = 0
      OnChange = edtEmpresaChange
    end
    object edtFechaDesde: TBEdit
      Left = 144
      Top = 119
      Width = 65
      Height = 21
      ColorEdit = clMoneyGreen
      InputType = itDate
      TabOrder = 3
    end
    object edtFechaHasta: TBEdit
      Left = 255
      Top = 119
      Width = 65
      Height = 21
      ColorEdit = clMoneyGreen
      InputType = itDate
      TabOrder = 4
    end
    object BarraProgreso: TProgressBar
      Left = 44
      Top = 174
      Width = 330
      Height = 17
      Smooth = True
      TabOrder = 6
    end
    object edtCentro: TBEdit
      Left = 144
      Top = 70
      Width = 32
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 1
      TabOrder = 1
      OnChange = edtCentroChange
    end
    object edtCodigo: TBEdit
      Left = 144
      Top = 146
      Width = 107
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 15
      TabOrder = 5
      OnChange = edtCentroChange
    end
    object edtProducto: TBEdit
      Left = 144
      Top = 94
      Width = 32
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 3
      TabOrder = 2
      OnChange = edtProductoChange
    end
  end
  object QCentral: TQuery
    DatabaseName = 'BDCentral'
    Left = 120
    Top = 152
  end
  object QLocal: TQuery
    DatabaseName = 'BDProyecto'
    Left = 88
    Top = 152
  end
end
