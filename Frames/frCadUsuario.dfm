object frameCadUsuario: TframeCadUsuario
  Left = 0
  Top = 0
  Width = 1145
  Height = 660
  OnCreate = UniFrameCreate
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 1145
    Height = 660
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    object PageCadastro: TUniPageControl
      Left = 1
      Top = 43
      Width = 1143
      Height = 616
      Hint = ''
      ActivePage = Tab1
      Align = alClient
      TabOrder = 1
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
        object UniDBGrid1: TUniDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 1120
          Height = 578
          Hint = ''
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 10
          Margins.Bottom = 5
          BodyRTL = False
          DataSource = DataSourceUsuario
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = clWindow
          Columns = <
            item
              FieldName = 'ID'
              Title.Caption = 'ID'
              Width = 64
            end
            item
              FieldName = 'PERFIL'
              Title.Caption = 'PERFIL'
              Width = 94
            end
            item
              FieldName = 'NOME'
              Title.Caption = 'NOME'
              Width = 364
            end
            item
              FieldName = 'LOGIN'
              Title.Caption = 'LOGIN'
              Width = 124
            end>
        end
      end
      object Tab2: TUniTabSheet
        Hint = ''
        Caption = 'Ficha'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 1135
          Height = 588
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsNone
          Caption = ''
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 1135
            Height = 588
            Hint = ''
            Align = alClient
            Color = clBtnHighlight
            TabOrder = 1
            object UniPanel3: TUniPanel
              Left = 0
              Top = 0
              Width = 1133
              Height = 586
              Hint = ''
              AutoScroll = True
              Align = alClient
              ParentFont = False
              Font.Color = clMenu
              TabOrder = 0
              Caption = ''
              Color = clNone
              LayoutConfig.Cls = 'cor1'
              ScrollHeight = 586
              ScrollWidth = 1133
              object UniLabel2: TUniLabel
                Left = 41
                Top = 40
                Width = 29
                Height = 13
                Hint = ''
                Caption = 'Perfil'
                ParentFont = False
                Font.Color = clMenu
                Font.Style = [fsBold]
                TabOrder = 5
              end
              object UniLabel4: TUniLabel
                Left = 42
                Top = 240
                Width = 35
                Height = 13
                Hint = ''
                Caption = 'Senha'
                ParentFont = False
                Font.Color = clMenu
                Font.Style = [fsBold]
                TabOrder = 6
              end
              object UniLabel6: TUniLabel
                Left = 42
                Top = 109
                Width = 32
                Height = 13
                Hint = ''
                Caption = 'Nome'
                ParentFont = False
                Font.Color = clMenu
                Font.Style = [fsBold]
                TabOrder = 7
              end
              object UniLabel3: TUniLabel
                Left = 42
                Top = 173
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'Login'
                ParentFont = False
                Font.Color = clMenu
                Font.Style = [fsBold]
                TabOrder = 8
              end
              object edNome: TUniEdit
                Left = 40
                Top = 128
                Width = 289
                Height = 29
                Hint = ''
                CharCase = ecUpperCase
                MaxLength = 60
                Text = 'UNINOME'
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 2
                ClearButton = True
              end
              object edLogin: TUniEdit
                Left = 41
                Top = 192
                Width = 289
                Height = 29
                Hint = ''
                BodyRTL = False
                CharCase = ecUpperCase
                MaxLength = 30
                Text = 'UNIEDIT1'
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 3
                ClearButton = True
              end
              object edSenha: TUniEdit
                Left = 41
                Top = 259
                Width = 177
                Height = 29
                Hint = ''
                MaxLength = 20
                Text = 'UniEdit1'
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 4
                ClearButton = True
              end
              object cbPerfil: TUniComboBox
                Left = 41
                Top = 59
                Width = 154
                Hint = ''
                Style = csDropDownList
                MaxLength = 20
                Text = ''
                Items.Strings = (
                  'ADMINISTRADOR'
                  'USU'#193'RIO')
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 1
                CharCase = ecUpperCase
                IconItems = <>
              end
            end
          end
        end
      end
    end
    object PnlCrud: TUniPanel
      Left = 1
      Top = 1
      Width = 1143
      Height = 42
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -20
      Font.Style = [fsBold]
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = 'Cadastro de Usu'#225'rios'
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
        Left = 953
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
  object DataSourceUsuario: TDataSource
    DataSet = dmDados.FDUsuario
    Left = 668
    Top = 10
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 888
    Top = 8
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
    Left = 960
    Top = 8
  end
  object UniSweetAlert1: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'Sim'
    CancelButtonText = 'N'#227'o'
    ConfirmButtonColor = clMaroon
    CancelButtonColor = 6835774
    Width = 400
    Padding = 20
    OnDismiss = UniSweetAlert1Dismiss
    OnConfirm = UniSweetAlert1Confirm
    Left = 732
    Top = 10
  end
end
