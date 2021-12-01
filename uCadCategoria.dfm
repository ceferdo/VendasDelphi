inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        DataSource = dtsListagem
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_Categoria'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_Descricao'
            Width = 252
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object edtID_Categoria: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNM_Descricao: TLabeledEdit
        Tag = 2
        Left = 16
        Top = 80
        Width = 361
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qrylistagem: TZQuery
    SQL.Strings = (
      'SELECT ID_Categoria'
      '      ,NM_Descricao'
      'FROM dbo.CATEGORIAS WITH (NOLOCK)')
    Left = 684
    object qrylistagemID_Categoria: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_Categoria'
      ReadOnly = True
    end
    object qrylistagemNM_Descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_Descricao'
      Size = 30
    end
  end
  inherited dtsListagem: TDataSource
    Left = 724
  end
end
