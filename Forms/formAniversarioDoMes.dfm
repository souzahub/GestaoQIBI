object forAnivMEs: TforAnivMEs
  Left = 0
  Top = 0
  ClientHeight = 471
  ClientWidth = 649
  Caption = 'ANIVERSARIANTES DO  M'#202'S'
  BorderStyle = bsNoneSizeable
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TUniPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 471
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 649
      Height = 41
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Height = -27
      Font.Name = 'Tempus Sans ITC'
      Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'ANIVERSARIANTES DO  M'#202'S'
      Color = clActiveCaption
      object UniFSButton1: TUniFSButton
        AlignWithMargins = True
        Left = 610
        Top = 2
        Width = 36
        Height = 36
        Hint = ''
        Margins.Left = 50
        StyleButton = Transparent
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'X'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -33
        Font.Style = [fsBold]
        TabOrder = 1
        IconAlign = iaCenter
        OnClick = UniFSButton1Click
      end
    end
    object pnlMes: TUniPanel
      AlignWithMargins = True
      Left = 180
      Top = 44
      Width = 289
      Height = 50
      Hint = ''
      Margins.Left = 180
      Margins.Right = 180
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -20
      Font.Style = [fsBold]
      TabOrder = 2
      Caption = ''
      Color = clNone
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 344
      Top = 408
      Width = 1
      Height = 137
      Hint = ''
      ParentColor = False
      TabOrder = 3
    end
    object UniDBGrid2: TUniDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 102
      Width = 428
      Height = 364
      Hint = ''
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      BodyRTL = False
      DataSource = dsAniversarioMes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      BorderStyle = ubsNone
      Align = alClient
      TabOrder = 4
      ParentColor = False
      Color = clWindow
      Columns = <
        item
          FieldName = 'DT_NASCIMENTO'
          Title.Caption = 'DT_NASCIMENTO'
          Width = 103
        end
        item
          FieldName = 'NOME'
          Title.Caption = 'NOME'
          Width = 268
        end>
    end
    object UniPanel2: TUniPanel
      Left = 433
      Top = 97
      Width = 216
      Height = 374
      Hint = ''
      Align = alRight
      TabOrder = 5
      Caption = ''
      object ComboBox1: TUniComboBox
        Left = 3
        Top = 5
        Width = 210
        Height = 38
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Mar'#231'o'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
        TabOrder = 1
        EmptyText = 'Selecione um M'#234's'
        IconItems = <>
        OnCloseUp = ComboBox1CloseUp
      end
    end
  end
  object dsAniversarioMes: TDataSource
    AutoEdit = False
    DataSet = FDQueryAniver
    Left = 64
    Top = 50
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 17
    Top = 56
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
  object FDQueryAniver: TFDQuery
    OnFilterRecord = FDQueryAniverFilterRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT DT_NASCIMENTO, NOME FROM CAD_MEMBROS;')
    Left = 104
    Top = 48
  end
end
