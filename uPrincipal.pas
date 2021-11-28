unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTES1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    mnuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE1: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  dtmPrincipal := TdtmPrincipal.Create(Self);
//  dtmPrincipal.ConexaoDB.Protocol := 'mssql';
//  dtmPrincipal.ConexaoDB.LibraryLocation := 'C:\ProjetoDelphi\ntwdblib.dll';
//  dtmPrincipal.ConexaoDB.HostName := '.\SQLEXPRESS';
//  dtmPrincipal.ConexaoDB.Port := 1433;
//  dtmPrincipal.ConexaoDB.User := 'sa';
//  dtmPrincipal.ConexaoDB.Password := 'bmb06081956';
//  dtmPrincipal.ConexaoDB.Database := 'Vendas';
//  dtmPrincipal.ConexaoDB.SQLHourGlass := True;
//  dtmPrincipal.ConexaoDB.Connected := True;

  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.ConexaoDB do
  begin
    SQLHourGlass := false;
    Protocol := 'mssql';
    LibraryLocation := 'C:\ProjetoDelphi\ntwdblib.dll';
    HostName := '.\SQLEXPRESS';
    Port := 1433;
    User := 'sa';
    Password := 'bmb06081956';
    Database := 'Vendas';
    Connected := true;
  end;

  TeclaEnter := TMREnter.Create(Self);
  TeclaEnter.FocusEnabled := true;
  TeclaEnter.FocusColor := clInfoBk;

end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
//  Close;
  Application.Terminate;
end;

end.
