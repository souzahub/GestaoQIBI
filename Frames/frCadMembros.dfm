object frameCadMembros: TframeCadMembros
  Left = 0
  Top = 0
  Width = 1125
  Height = 692
  OnCreate = UniFrameCreate
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 1125
    Height = 692
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    object PageCadastro: TUniPageControl
      Left = 1
      Top = 43
      Width = 1123
      Height = 648
      Hint = ''
      ActivePage = Tab1
      Align = alClient
      TabOrder = 1
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
        OnBeforeActivate = Tab1BeforeActivate
        object UniDBGrid1: TUniDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 1100
          Height = 610
          Hint = ''
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 10
          Margins.Bottom = 5
          BodyRTL = False
          DataSource = DataSourceMembros
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = clWindow
          OnCellClick = UniDBGrid1CellClick
          Columns = <
            item
              FieldName = 'NOME'
              Title.Caption = 'NOME'
              Width = 340
            end
            item
              FieldName = 'ATIVO'
              Title.Alignment = taCenter
              Title.Caption = 'Ativar'
              Width = 100
            end
            item
              FieldName = 'AUSENTE'
              Title.Alignment = taCenter
              Title.Caption = 'Ausentar'
              Width = 110
            end
            item
              FieldName = 'EXCLUIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Excluir'
              Width = 100
            end
            item
              FieldName = 'OBITO'
              Title.Alignment = taCenter
              Title.Caption = 'Obito'
              Width = 100
            end
            item
              FieldName = 'STATUS'
              Title.Alignment = taCenter
              Title.Caption = 'STATUS'
              Width = 100
              Alignment = taCenter
            end>
        end
      end
      object Tab2: TUniTabSheet
        Hint = ''
        Caption = 'Ficha'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 1115
          Height = 620
          Hint = ''
          AutoScroll = True
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsNone
          Caption = ''
          ScrollHeight = 620
          ScrollWidth = 1115
          object UniPanel1: TUniPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1109
            Height = 597
            Hint = ''
            Margins.Bottom = 20
            AutoScroll = True
            Align = alClient
            TabOrder = 1
            Caption = ''
            ScrollHeight = 597
            ScrollWidth = 1109
            object edNome: TUniEdit
              Left = 16
              Top = 96
              Width = 713
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 50
              Text = 'EDNOME'
              TabOrder = 3
              ClearButton = True
            end
            object edEndereco: TUniEdit
              Left = 16
              Top = 168
              Width = 466
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 50
              Text = 'EDENDERECO'
              TabOrder = 4
              ClearButton = True
            end
            object lbBaiiro: TUniLabel
              Left = 16
              Top = 221
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'BAIRRO'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 11
            end
            object edBairro: TUniEdit
              Left = 16
              Top = 240
              Width = 297
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 30
              Text = 'EDBAIRRO'
              TabOrder = 7
              ClearButton = True
            end
            object UniLabel4: TUniLabel
              Left = 16
              Top = 293
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'EMAIL'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 12
            end
            object edEmail: TUniEdit
              Left = 16
              Top = 312
              Width = 713
              Height = 29
              Hint = ''
              Text = 'UniEdit3'
              TabOrder = 10
              ClearButton = True
            end
            object UniLabel7: TUniLabel
              Left = 673
              Top = 221
              Width = 14
              Height = 13
              Hint = ''
              Caption = 'UF'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 13
            end
            object lbNumero: TUniLabel
              Left = 499
              Top = 149
              Width = 47
              Height = 13
              Hint = ''
              Caption = 'NUMERO'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 14
            end
            object edCidade: TUniEdit
              Left = 345
              Top = 240
              Width = 298
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 30
              Text = 'EDCIDADE'
              TabOrder = 8
              ClearButton = True
            end
            object dtBatismo: TUniDateTimePicker
              Left = 193
              Top = 32
              Width = 120
              Hint = ''
              DateTime = 44134.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 2
            end
            object dtNascimento: TUniDateTimePicker
              Left = 16
              Top = 32
              Width = 120
              Hint = ''
              DateTime = 44134.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 1
            end
            object lbDataNascimento: TUniLabel
              Left = 16
              Top = 13
              Width = 113
              Height = 13
              Hint = ''
              Caption = 'Data do Nascimento'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 15
            end
            object UniLabel8: TUniLabel
              Left = 193
              Top = 13
              Width = 93
              Height = 13
              Hint = ''
              Caption = 'Data do Batismo'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 16
            end
            object lbCidade: TUniLabel
              Left = 345
              Top = 221
              Width = 42
              Height = 13
              Hint = ''
              Caption = 'CIDADE'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 17
            end
            object lbEndereco: TUniLabel
              Left = 16
              Top = 149
              Width = 56
              Height = 13
              Hint = ''
              Caption = 'ENDERE'#199'O'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 18
            end
            object lbNome: TUniLabel
              Left = 16
              Top = 77
              Width = 31
              Height = 13
              Hint = ''
              Caption = 'NOME'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 19
            end
            object edUf: TUniEdit
              Left = 673
              Top = 240
              Width = 56
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 2
              Text = 'UNINOME'
              TabOrder = 9
              InputMask.Mask = 'aa'
              InputMask.MaskChar = ' '
              InputMask.UnmaskText = True
            end
            object edNumero: TUniEdit
              Left = 499
              Top = 168
              Width = 56
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 10
              Text = 'UNINOME'
              TabOrder = 5
              InputMask.Mask = '9999999999'
              InputMask.MaskChar = ' '
              InputMask.UnmaskText = True
            end
            object cbClassificacao: TUniComboBox
              Left = 528
              Top = 32
              Width = 201
              Hint = ''
              Style = csDropDownList
              MaxLength = 20
              Text = ''
              Items.Strings = (
                'ADOLESCENTE'
                'ADULTOS'
                'INFANTIL'
                'JOVENS')
              ParentFont = False
              Font.Color = clBlack
              TabOrder = 20
              CharCase = ecUpperCase
              IconItems = <>
            end
            object UniLabel2: TUniLabel
              Left = 528
              Top = 13
              Width = 72
              Height = 13
              Hint = ''
              Caption = 'Classifica'#231#227'o'
              ParentFont = False
              Font.Color = clBlack
              Font.Style = [fsBold]
              TabOrder = 21
            end
            object edTel: TUniEdit
              Left = 568
              Top = 168
              Width = 161
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 30
              Text = 'EDCIDADE'
              TabOrder = 6
              ClearButton = True
              InputMask.Mask = '999999999999'
              InputMask.MaskChar = #0
            end
            object UniLabel3: TUniLabel
              Left = 568
              Top = 149
              Width = 52
              Height = 13
              Hint = ''
              Caption = 'TELEFONE'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 22
            end
          end
        end
      end
    end
    object PnlCrud: TUniPanel
      Left = 1
      Top = 1
      Width = 1123
      Height = 42
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -20
      Font.Style = [fsBold]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      Color = clNone
      object UniLabel1: TUniLabel
        Left = 784
        Top = 24
        Width = 6
        Height = 24
        Hint = ''
        Visible = False
        Caption = '.'
        TabOrder = 1
      end
      object BtCan: TUniFSButton
        AlignWithMargins = True
        Left = 171
        Top = 3
        Width = 36
        Height = 36
        Hint = ''
        StyleButton = GoogleBlueRound
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = '<i class="fas fa-sync"></i>'
        Align = alLeft
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 2
        OnClick = BtCanClick
      end
      object BtGrv: TUniFSButton
        AlignWithMargins = True
        Left = 129
        Top = 3
        Width = 36
        Height = 36
        Hint = ''
        StyleButton = GoogleBlueRound
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = '<i class="fas fa-save"></i>'
        Align = alLeft
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 3
        OnClick = BtGrvClick
      end
      object BtExc: TUniFSButton
        AlignWithMargins = True
        Left = 87
        Top = 3
        Width = 36
        Height = 36
        Hint = ''
        StyleButton = GoogleBlueRound
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = '<i class="far fa-trash-alt"></i>'
        Align = alLeft
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 4
        OnClick = BtExcClick
      end
      object BtInc: TUniFSButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 36
        Height = 36
        Hint = ''
        StyleButton = GoogleBlueRound
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = '<i class="fas fa-plus "></i>'
        Align = alLeft
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 5
        OnClick = BtIncClick
      end
      object BtAlt: TUniFSButton
        AlignWithMargins = True
        Left = 45
        Top = 3
        Width = 36
        Height = 36
        Hint = ''
        StyleButton = GoogleBlueRound
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = '<i class="far fa-edit"></i>'
        Align = alLeft
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 6
        OnClick = BtAltClick
      end
      object cPanel1: TUniContainerPanel
        Left = 762
        Top = 0
        Width = 361
        Height = 42
        Hint = ''
        ParentColor = False
        Align = alRight
        TabOrder = 7
        object EdPesquisar: TUniEdit
          AlignWithMargins = True
          Left = 3
          Top = 2
          Width = 226
          Height = 38
          Hint = ''
          Margins.Top = 2
          Margins.Right = 20
          Margins.Bottom = 2
          ParentShowHint = False
          CharCase = ecUpperCase
          MaxLength = 40
          Text = ''
          ParentFont = False
          Font.Color = clBlack
          Font.Style = [fsBold]
          TabOrder = 1
          EmptyText = 'PESQUISAR'
          ClearButton = True
          FieldLabel = '<i class="fas fa-search"></i>'
          FieldLabelWidth = 20
          FieldLabelSeparator = ' '
          FieldLabelFont.Height = -19
          FieldLabelFont.Style = [fsBold]
          OnChange = EdPesquisarChange
        end
        object smLimpar: TUniFSButton
          AlignWithMargins = True
          Left = 269
          Top = 6
          Width = 77
          Height = 28
          Hint = ''
          Margins.Left = 4
          Margins.Top = 6
          Margins.Right = 4
          Margins.Bottom = 6
          ParentShowHint = False
          StyleButton = Primary
          BadgeText.Text = '2'
          BadgeText.TextColor = '#FFFFFF'
          BadgeText.TextSize = 10
          BadgeText.TextStyle = 'bold'
          BadgeText.BackgroundColor = '#D50000'
          Caption = 'Limpar'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Yu Gothic UI'
          Font.Style = [fsBold]
          TabOrder = 2
          LayoutConfig.Margin = '0 0 0 0'
          OnClick = smLimparClick
        end
      end
      object UniLabel5: TUniLabel
        AlignWithMargins = True
        Left = 213
        Top = 8
        Width = 219
        Height = 24
        Hint = ''
        Margins.Top = 8
        Caption = 'Cadastro de Membros'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 8
      end
    end
  end
  object DataSourceMembros: TDataSource
    AutoEdit = False
    DataSet = dmDados.FDCadMembros
    Left = 860
    Top = 146
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 1000
    Top = 216
    Images = {
      1400000000000000060600000073613B66613B00000000060B0000006465736B
      746F703B66613B000000000608000000656469743B66613B0000000006090000
      0074726173683B66613B000000000608000000736176653B66613B0000000006
      0B000000726574776565743B66613B0000000006090000006864642D6F3B6661
      3B0000000006070000006375743B66613B00000000060D0000006261722D6368
      6172743B66613B00000000060D0000007069652D63686172743B66613B000000
      00060C000000626F6F6B6D61726B3B66613B00000000060C00000063616C656E
      6461723B66613B000000000608000000666565643B66613B00000000060A0000
      007365617263683B66613B000000000609000000696D6167653B66613B000000
      000609000000696E626F783B66613B0000000006090000006864642D6F3B6661
      3B00000000060E0000004E657749636F6E436C733B66613B0000000006080000
      00706C75733B66613B00000000061100000070656E63696C2D7371756172653B
      66613B}
  end
  object UniScreenMask1: TUniScreenMask
    Enabled = True
    DisplayMessage = ' Buscando . . .'
    Left = 1000
    Top = 80
  end
  object UniSweetAlert1: TUniSweetAlert
    AllowOutsideClick = False
    Title = 'Title'
    ConfirmButtonText = 'Sim'
    CancelButtonText = 'N'#227'o'
    ConfirmButtonColor = 6835774
    CancelButtonColor = clMaroon
    Width = 500
    Padding = 20
    OnDismiss = UniSweetAlert1Dismiss
    OnConfirm = UniSweetAlert1Confirm
    Left = 860
    Top = 90
  end
  object UniSweetAlertUpdate: TUniSweetAlert
    AllowOutsideClick = False
    Title = 'Title'
    ConfirmButtonText = 'Sim'
    CancelButtonText = 'N'#227'o'
    ConfirmButtonColor = 6835774
    CancelButtonColor = clMaroon
    Width = 500
    Padding = 20
    OnDismiss = UniSweetAlertUpdateDismiss
    OnConfirm = UniSweetAlertUpdateConfirm
    Left = 996
    Top = 146
  end
  object Toast: TUniFSToast
    TitleSize = 15
    TitleLineHeight = 0
    MsgSize = 14
    MsgLineHeight = 0
    Theme = Dark
    ImageWidth = 0
    MaxWidth = 0
    zIndex = 99999
    Layout = SmallInt
    Balloon = False
    Close = True
    CloseOnEscape = False
    CloseOnClick = False
    RTL = False
    Position = bottomRight
    TimeOut = 5000
    Drag = True
    Overlay = False
    ToastOnce = False
    PauseOnHover = True
    ResetOnHover = False
    ProgressBar = True
    ProgressBarColor = 'rgb(0, 255, 184)'
    ScreenMask.Enabled = False
    Animateinside = True
    TransitionIn = fadeInUp
    TransitionOut = fadeOut
    TransitionInMobile = fadeInUp
    TransitionOutMobile = fadeOutDown
    ButtonTextYes = 'Confirma'
    ButtonTextNo = 'Cancela'
    Left = 856
    Top = 219
  end
end
