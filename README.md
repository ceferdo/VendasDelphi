# VendasDelphi
Projeto para aprendizagem Delphi

Exemplo de uma classe no Delphi:

unit cCadCategoria; //Nome da classe

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs; //lista de Units

type
  TCagegoria = class //Declaração do tipo da Classe
  private
    //Variaveis Privadas somente dentro da classe
  public
    constructor Create; //Construtor da Classe
    destructor Destroy; override; //Destrou a Classe, usar o Override por causa
                                  // de Sobrescrita
    //Variaveis Publicas que podem ser trabalhadas fora da classe
  published
    //Variaveis Publicas utilizadas para propruedades da classe
    // para forneccer informações em runtime
  end;

implementation

end.
