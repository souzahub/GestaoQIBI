object frameJovens: TframeJovens
  Left = 0
  Top = 0
  Width = 947
  Height = 566
  OnReady = UniFrameReady
  TabOrder = 0
  object PnUsuario: TUniPanel
    Left = 0
    Top = 0
    Width = 947
    Height = 566
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'PnUsuario'
    ExplicitLeft = -92
    ExplicitTop = -87
    ExplicitWidth = 1039
    ExplicitHeight = 653
    object PageCadastro: TUniPageControl
      Left = 1
      Top = 43
      Width = 945
      Height = 522
      Hint = ''
      ActivePage = Tab1
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 1037
      ExplicitHeight = 675
      object Tab1: TUniTabSheet
        Hint = ''
        Caption = 'Consulta'
        ExplicitWidth = 1029
        ExplicitHeight = 581
        object UniDBGrid1: TUniDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 922
          Height = 484
          Hint = ''
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 10
          Margins.Bottom = 5
          BodyRTL = False
          DataSource = dsJovens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          BorderStyle = ubsNone
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = clWindow
          Columns = <
            item
              FieldName = 'DT_NASCIMENTO'
              Title.Caption = 'Nascimento'
              Width = 134
            end
            item
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 805
            end>
        end
      end
    end
    object PnlCrud: TUniPanel
      Left = 1
      Top = 1
      Width = 945
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
      ExplicitWidth = 1037
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
      object cPanel1: TUniContainerPanel
        Left = 584
        Top = 0
        Width = 361
        Height = 42
        Hint = ''
        ParentColor = False
        Align = alRight
        TabOrder = 2
        ExplicitLeft = 676
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
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 8
        Width = 79
        Height = 24
        Hint = ''
        Margins.Top = 8
        Caption = 'JOVENS'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
  end
  object FDQueryJovens: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT DT_NASCIMENTO, DT_BATISMO, NOME, ENDERECO, NUMERO, BAIRRO' +
        ', CIDADE, EMAIL, UF, DATA_CADASTRO, STATUS, DATASTATUS_ATIVO, CL' +
        'ASSIFICACAO, TEL FROM CAD_MEMBROS Where STATUS = '#39'ativo'#39' and CLA' +
        'SSIFICACAO = '#39'JOVENS'#39'order by NOME  ;'
      ''
      ''
      '')
    Left = 56
    Top = 176
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 56
    Top = 272
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
  object dsJovens: TDataSource
    AutoEdit = False
    DataSet = FDQueryJovens
    Left = 60
    Top = 122
  end
end
