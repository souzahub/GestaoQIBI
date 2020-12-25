object uformAlteraDados: TuformAlteraDados
  Left = 0
  Top = 0
  ClientHeight = 311
  ClientWidth = 225
  Caption = 'uformAlteraDados'
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pnAlteraSenha: TUniPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 311
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    LayoutConfig.Cls = 'borda'
    ExplicitLeft = 36
    ExplicitTop = 3
    ExplicitWidth = 222
    ExplicitHeight = 275
    DesignSize = (
      225
      311)
    object edAlteraUsuario: TUniEdit
      Left = 31
      Top = 86
      Width = 164
      Hint = ''
      CharCase = ecUpperCase
      MaxLength = 20
      Text = 'EDALTERAUSUARIO'
      TabOrder = 1
    end
    object edAlteraSenha: TUniEdit
      Left = 31
      Top = 138
      Width = 164
      Hint = ''
      MaxLength = 10
      Text = 'UniEdit1'
      TabOrder = 2
    end
    object UniLabel12: TUniLabel
      Left = 16
      Top = 16
      Width = 123
      Height = 28
      Hint = ''
      TextConversion = txtHTML
      Caption = 'Alterar Dados'
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = 16744448
      Font.Height = -20
      Font.Name = 'Yu Gothic UI'
      Font.Style = [fsBold]
      ParentColor = False
      Color = clWhite
      TabOrder = 3
    end
    object sbConectar: TUniFSButton
      Left = 25
      Top = 179
      Width = 170
      Height = 32
      Hint = ''
      StyleButton = GoogleBlueRound
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = 'Salvar'
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 4
      OnClick = sbConectarClick
    end
    object UniFSButton1: TUniFSButton
      Left = 25
      Top = 217
      Width = 170
      Height = 32
      Hint = ''
      StyleButton = GoogleBlueRound
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = 'Cancelar'
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 5
      OnClick = UniFSButton1Click
    end
    object UniLabel13: TUniLabel
      Left = 32
      Top = 67
      Width = 43
      Height = 13
      Hint = ''
      Caption = 'Usu'#225'rio'
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 6
    end
    object UniLabel14: TUniLabel
      Left = 32
      Top = 119
      Width = 35
      Height = 13
      Hint = ''
      Caption = 'Senha'
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 7
    end
  end
  object UniSweetAlert1: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ConfirmButtonColor = clMaroon
    CancelButtonColor = 6835774
    Padding = 20
    OnDismiss = UniSweetAlert1Dismiss
    OnConfirm = UniSweetAlert1Confirm
    Left = 13
    Top = 264
  end
end
