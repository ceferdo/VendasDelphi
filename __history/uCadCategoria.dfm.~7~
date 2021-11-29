inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
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
    Left = 420
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
    Left = 460
  end
end
