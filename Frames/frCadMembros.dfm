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
      ActivePage = Tab2
      Align = alClient
      TabOrder = 1
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
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
              Title.Caption = 'ATIVO'
              Width = 39
            end
            item
              FieldName = 'AUSENTE'
              Title.Alignment = taCenter
              Title.Caption = 'AUSENTE'
              Width = 51
            end
            item
              FieldName = 'EXCLUIDO'
              Title.Alignment = taCenter
              Title.Caption = 'EXCLUIDO'
              Width = 57
            end
            item
              FieldName = 'OBITO'
              Title.Alignment = taCenter
              Title.Caption = 'OBITO'
              Width = 38
            end
            item
              FieldName = 'STATUS'
              Title.Alignment = taCenter
              Title.Caption = 'STATUS'
              Width = 49
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
              Width = 539
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
              Width = 39
              Height = 13
              Hint = ''
              Caption = 'BAIRRO'
              TabOrder = 10
            end
            object edBairro: TUniEdit
              Left = 16
              Top = 240
              Width = 225
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 30
              Text = 'EDBAIRRO'
              TabOrder = 6
              ClearButton = True
            end
            object UniLabel4: TUniLabel
              Left = 16
              Top = 293
              Width = 30
              Height = 13
              Hint = ''
              Caption = 'EMAIL'
              TabOrder = 11
            end
            object edEmail: TUniEdit
              Left = 16
              Top = 312
              Width = 539
              Height = 29
              Hint = ''
              Text = 'UniEdit3'
              TabOrder = 9
              ClearButton = True
            end
            object UniLabel7: TUniLabel
              Left = 499
              Top = 221
              Width = 13
              Height = 13
              Hint = ''
              Caption = 'UF'
              TabOrder = 12
            end
            object lbNumero: TUniLabel
              Left = 499
              Top = 149
              Width = 43
              Height = 13
              Hint = ''
              Caption = 'NUMERO'
              TabOrder = 13
            end
            object edCidade: TUniEdit
              Left = 257
              Top = 240
              Width = 225
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 30
              Text = 'EDCIDADE'
              TabOrder = 7
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
              Width = 96
              Height = 13
              Hint = ''
              Caption = 'Data do Nascimento'
              TabOrder = 14
            end
            object UniLabel8: TUniLabel
              Left = 193
              Top = 13
              Width = 78
              Height = 13
              Hint = ''
              Caption = 'Data do Batismo'
              TabOrder = 15
            end
            object lbCidade: TUniLabel
              Left = 257
              Top = 221
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'CIDADE'
              TabOrder = 16
            end
            object lbEndereco: TUniLabel
              Left = 16
              Top = 149
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Endere'#231'o'
              TabOrder = 17
            end
            object lbNome: TUniLabel
              Left = 16
              Top = 77
              Width = 29
              Height = 13
              Hint = ''
              Caption = 'NOME'
              TabOrder = 18
            end
            object edUf: TUniEdit
              Left = 499
              Top = 240
              Width = 56
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 2
              Text = 'UNINOME'
              TabOrder = 8
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
      Caption = 'Cadastro de Membros'
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
      object EdPesquisar: TUniEdit
        AlignWithMargins = True
        Left = 933
        Top = 2
        Width = 170
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
        Align = alRight
        TabOrder = 7
        EmptyText = 'PESQUISAR'
        ClearButton = True
        FieldLabel = '<i class="fas fa-search"></i>'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Height = -19
        FieldLabelFont.Style = [fsBold]
        OnChange = EdPesquisarChange
      end
    end
  end
  object DataSourceMembros: TDataSource
    AutoEdit = False
    DataSet = dmDados.FDCadMembros
    Left = 612
    Top = 122
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 824
    Top = 120
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
    Left = 888
    Top = 120
  end
  object UniSweetAlert1: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'Sim'
    CancelButtonText = 'N'#227'o'
    ConfirmButtonColor = 6835774
    CancelButtonColor = clMaroon
    Width = 500
    Padding = 20
    OnDismiss = UniSweetAlert1Dismiss
    OnConfirm = UniSweetAlert1Confirm
    Left = 724
    Top = 122
  end
  object UniSweetAlertUpdate: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'Sim'
    CancelButtonText = 'N'#227'o'
    ConfirmButtonColor = 6835774
    CancelButtonColor = clMaroon
    Width = 500
    Padding = 20
    OnDismiss = UniSweetAlertUpdateDismiss
    OnConfirm = UniSweetAlertUpdateConfirm
    Left = 724
    Top = 218
  end
end
