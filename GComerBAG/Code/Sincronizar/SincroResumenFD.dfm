object FDSincroResumen: TFDSincroResumen
  Left = 399
  Top = 332
  BorderStyle = bsDialog
  Caption = '    RESUMEN SINCRONIZACION'
  ClientHeight = 552
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  DesignSize = (
    507
    552)
  PixelsPerInch = 96
  TextHeight = 13
  object lblEstado: TLabel
    Left = 9
    Top = 7
    Width = 98
    Height = 13
    Caption = 'Mensajes de estado.'
  end
  object mmoResumen: TMemo
    Left = 0
    Top = 47
    Width = 507
    Height = 505
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object btnCerrar: TButton
    Left = 424
    Top = 10
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar'
    TabOrder = 2
    OnClick = btnCerrarClick
  end
  object btnEnviar: TButton
    Left = 267
    Top = 10
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Enviar'
    TabOrder = 0
    OnClick = btnEnviarClick
  end
  object btnImprimir: TButton
    Left = 346
    Top = 10
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Imprimir'
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object cbxPasados: TCheckBox
    Left = 9
    Top = 24
    Width = 67
    Height = 17
    Caption = 'Pasados'
    TabOrder = 3
    OnClick = cbxPasadosClick
  end
  object cbxErroneos: TCheckBox
    Left = 80
    Top = 24
    Width = 67
    Height = 17
    Caption = 'Erroneos'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = cbxPasadosClick
  end
  object cbxDuplicados: TCheckBox
    Left = 152
    Top = 24
    Width = 81
    Height = 17
    Caption = 'Duplicados'
    TabOrder = 5
    OnClick = cbxPasadosClick
  end
  object IdSMTP: TIdSMTP
    Host = 'smtp.e.telefonica.net'
    Password = 'sba111'
    SASLMechanisms = <>
    Left = 152
    Top = 513
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 184
    Top = 513
  end
end
