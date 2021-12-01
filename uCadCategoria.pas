unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  cCadCategoria, uDTMConexao, uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    qrylistagemID_Categoria: TIntegerField;
    qrylistagemNM_Descricao: TWideStringField;
    edtID_Categoria: TLabeledEdit;
    edtNM_Descricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria:TCagegoria;
    function Apagar: Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

{$region 'Override'}

function TfrmCadCategoria.Apagar: Boolean;
begin
  if oCategoria.Selecionar(qrylistagem.FieldByName('ID_Categoria').AsInteger) then
  begin
    Result := oCategoria.Apagar;
  end;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if (edtID_Categoria.Text <> EmptyStr) then
    oCategoria.codigo := StrToInt(edtID_Categoria.Text)
  else
    oCategoria.codigo := 0;

  oCategoria.descricao := edtNM_Descricao.Text;

  if (EstadoDoCadastro = ecInserir) then
    Result := oCategoria.Inserir
  else
  if (EstadoDoCadastro = ecAlterar) then
    Result := oCategoria.Atualizar;
end;
{$endregion}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(qrylistagem.FieldByName('ID_Categoria').AsInteger) then
  begin
    edtID_Categoria.Text := IntToStr(oCategoria.codigo);
    edtNM_Descricao.Text := oCategoria.descricao;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria := TCagegoria.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual := 'NM_Descricao';
end;



end.
