object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe aqui o T'#237'tulo'
  ClientHeight = 322
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 771
    Height = 281
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 763
        Height = 47
        Align = alTop
        TabOrder = 0
        object lblIndice: TLabel
          Left = 16
          Top = 0
          Width = 78
          Height = 13
          Caption = 'Campo Pesquisa'
        end
        object mskPesquisar: TMaskEdit
          Left = 16
          Top = 18
          Width = 218
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua pesquisa'
          OnChange = mskPesquisarChange
        end
        object btnPesquisar: TBitBtn
          Left = 240
          Top = 18
          Width = 113
          Height = 21
          Caption = '&PESQUISAR'
          TabOrder = 1
          Visible = False
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 47
        Width = 763
        Height = 206
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = grdListagemTitleClick
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 281
    Width = 771
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      771
      41)
    object btnNovo: TBitBtn
      Left = 20
      Top = 7
      Width = 75
      Height = 21
      Caption = '&NOVO'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 101
      Top = 7
      Width = 75
      Height = 21
      Caption = '&ALTERAR'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 182
      Top = 7
      Width = 75
      Height = 21
      Caption = '&CANCELAR'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 263
      Top = 7
      Width = 75
      Height = 21
      Caption = '&GRAVAR'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 344
      Top = 7
      Width = 75
      Height = 21
      Caption = 'APAGA&R'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 679
      Top = 7
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '&FECHAR'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnNavigator: TDBNavigator
      Left = 425
      Top = 7
      Width = 168
      Height = 21
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object qrylistagem: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Params = <>
    Left = 564
    Top = 24
  end
  object dtsListagem: TDataSource
    DataSet = qrylistagem
    Left = 628
    Top = 24
  end
end
