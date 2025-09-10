unit uUsuario;

interface

type TUsuario = class
private
nome: String;
idade: Integer;

public
Constructor Create(aNome : String; aIdade : Integer);



end;

implementation

{ TUsuario }

constructor TUsuario.Create(aNome: String; aIdade: Integer);
begin
  self.nome := aNome;
  self.idade := aIdade;
end;

end.
