unit uHighscoreModel;

interface

type THighscore = class
  private
  username : String;
  pontos : Integer;

  public
  constructor Create (aUsername : String; aPontos : Integer);

  function getUsername : String;
  function getPontos : Integer;

end;

implementation

{ THighscore }

constructor THighscore.Create(aUsername: String; aPontos: Integer);
begin
  self.username := aUsername;
  self.pontos := aPontos;
end;

function THighscore.getPontos: Integer;
begin
  Result := self.pontos;
end;

function THighscore.getUsername: String;
begin
  Result := self.username;
end;

end.
