unit cCadCategoria;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  ZAbstractConnection,
  ZConnection,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
  System.SysUtils;

type
  TCagegoria = class
  private
    ConexaoDB: TZConnection;

    F_ID_Categoria: Integer; //Int
    F_NM_Descricao: String; //Varchar(30)

    function getCodigo: Integer;
    function getDescricao: String;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: String);
  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Apagar: Boolean;
    function Selecionar(id:Integer): Boolean;
  published
    property codigo: Integer    read getCodigo    write setCodigo;
    property descricao: String  read getDescricao write setDescricao;
  end;

implementation

{ TCagegoria }

{$region 'Constructor and Destructor'}
constructor TCagegoria.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TCagegoria.Destroy;
begin

  inherited;
end;
{$endregion}

{$region 'CRUD'}
function TCagegoria.Apagar: Boolean;
var qry: TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+ IntToStr(F_ID_Categoria) +#13+
                'Descricao: ' + F_NM_Descricao, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Result := false;
    Abort;
  end;

  try
    Result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add(' DELETE FROM CATEGORIAS ' +
                ' WHERE ID_Categoria = :ID_Categoria');
    qry.ParamByName('ID_Categoria').AsInteger := F_ID_Categoria;
    try
      qry.ExecSQL;
    except
       Result := false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;

end;

function TCagegoria.Atualizar: Boolean;
var qry: TZQuery;
begin
  try
    Result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE dbo.CATEGORIAS ' +
                '   SET NM_Descricao = :NM_Descricao '+
                ' WHERE ID_Categoria = :ID_Categoria ');
    qry.ParamByName('ID_Categoria').AsInteger := Self.F_ID_Categoria;
    qry.ParamByName('NM_Descricao').AsString := Self.F_NM_Descricao;
    try
      qry.ExecSQL;
    except
      Result := false;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);

  end;
end;

function TCagegoria.Inserir: Boolean;
var qry: TZQuery;
begin
  try
    Result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO CATEGORIAS (NM_Descricao) VALUES (:NM_Descricao)');
    qry.ParamByName('NM_Descricao').AsString := Self.F_NM_Descricao;
    try
      qry.ExecSQL;
    except
      Result := false;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);

  end;
end;

function TCagegoria.Selecionar(id: Integer): Boolean;
var qry: TZQuery;
begin
  try
    Result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add(' SELECT ID_Categoria, NM_Descricao '+
                ' FROM CATEGORIAS WITH (NOLOCK) ' +
                ' WHERE ID_Categoria = :ID_Categoria');
    qry.ParamByName('ID_Categoria').AsInteger := id;
    try
      qry.Open;

      Self.F_ID_Categoria := qry.FieldByName('ID_Categoria').AsInteger;
      Self.F_NM_Descricao := qry.FieldByName('NM_Descricao').AsString;
    except
      Result := false;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);

  end;
end;
{$endregion}

{$region 'GETS'}
function TCagegoria.getCodigo: Integer;
begin
  Result := Self.F_ID_Categoria;
end;

function TCagegoria.getDescricao: String;
begin
  Result := Self.F_NM_Descricao;
end;
{$endregion}

{$region 'SETS'}
procedure TCagegoria.setCodigo(const Value: Integer);
begin
  Self.F_ID_Categoria := Value;
end;

procedure TCagegoria.setDescricao(const Value: String);
begin
  Self.F_NM_Descricao := Value;
end;
{$endregion}



end.