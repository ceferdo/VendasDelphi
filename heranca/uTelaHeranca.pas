unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    qrylistagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    EstadoDoCadastro: TEstadoDoCadastro;
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
                              btnGravar, btnApagar: TBitBtn;
                              Navegador: TDBNavigator;
                              pgcPrincipal: TPageControl;
                              Flag: Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; i: Integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
  public
    { Public declarations }
    IndiceAtual: string;
    function Excluir: Boolean; virtual;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$region 'FUNCTIONS AND PROCEDURES'}

//Procedimento de Controle de Tela
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
                                          btnGravar, btnApagar: TBitBtn;
                                          Navegador: TDBNavigator;
                                          pgcPrincipal: TPageControl;
                                          Flag: Boolean);
begin
  btnNovo.Enabled                   := Flag;
  btnApagar.Enabled                 := Flag;
  btnAlterar.Enabled                := Flag;
  Navegador.Enabled                 := Flag;
  pgcPrincipal.Pages[0].TabVisible  := Flag;
  btnCancelar.Enabled               := not(Flag);
  btnGravar.Enabled                 := not(Flag);
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; i: Integer);
begin
  if (pgcPrincipal.Pages[i].TabVisible) then
    pgcPrincipal.TabIndex := i;
end;

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo: string): string;
var i: Integer;
begin
  for i := 0 to qryListagem.Fields.Count - 1 do
  begin
    if lowercase(qryListagem.Fields[i].FieldName) = lowercase(Campo) then
    begin
      Result := qryListagem.Fields[i].DisplayLabel;
      Break;
    end;

  end;

end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
var i: Integer;
begin
  Result := False;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 1) and
         (TLabeledEdit(Components[i]).Text = EmptyStr) then
         begin
           MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
                      ' � um campo obrigat�rio', mtInformation,[mbOK],0);
           TLabeledEdit(Components[i]).SetFocus;
           Result := true;
           Break;
         end;

    end;
  end;

end;

{$endregion}

procedure TfrmTelaHeranca.ExibirLabelIndice(Campo: string; aLabel: TLabel);
begin
  aLabel.Caption := RetornarCampoTraduzido(Campo);
end;

{$region 'M�TODOS VIRTUAIS'}
function TfrmTelaHeranca.Excluir: Boolean;
begin
  ShowMessage('Deletado');
  Result := True;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;
begin
  if (EstadoDoCadastro = ecInserir) then
    ShowMessage('Inserir')
  else
  if (EstadoDoCadastro = ecAlterar) then
    ShowMessage('Alterado');

  Result := true;
end;
{$endregion}

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro := ecInserir;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  if Excluir then
  begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                    btnNavigator, pgcPrincipal, true);
    ControlarIndiceTab(pgcPrincipal, 0);
    EstadoDoCadastro := ecNenhum;
  end;

end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal, true);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  if (ExisteCampoObrigatorio) then
  Abort;

  try
    if Gravar(EstadoDoCadastro) then
    begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                      btnNavigator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
    end;
  finally
    EstadoDoCadastro := ecNenhum;
  end;


end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection := dtmPrincipal.ConexaoDB;
  dtsListagem.DataSet := qryListagem;
  grdListagem.DataSource := dtsListagem;
  grdListagem.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,
                          dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,
                          dgCancelOnExit,dgTitleClick,dgTitleHotTrack]
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (qryListagem.SQL.Text <> EmptyStr) then
  begin
    qrylistagem.IndexFieldNames := IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    qryListagem.Open;
  end;
  ControlarIndiceTab(pgcPrincipal, 0);
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal, true);

end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  qryListagem.IndexFieldNames := IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  qryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
  //Posso usar o mskPesquisar mas se alterar o Name dele, n�o vai funcionar mais.
end;

end.
