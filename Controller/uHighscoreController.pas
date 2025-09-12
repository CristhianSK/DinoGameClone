unit uHighscoreController;

interface
uses
uHighscoreModel, uHighscoreRepository, System.Generics.Collections;

type
THighscoreController = class
  public
  function salvarHighscore(highscore: THighscore) : String;


end;

implementation

{ THighscoreController }

function THighscoreController.salvarHighscore(highscore: THighscore) : String;
  var uHsRepo : THighscoreRepository;
begin
    uHsRepo := THighscoreRepository.Create;

    if Length(highscore.getUsername) < 3 then begin
      Result := 'Falha - Username precisa ter no minimo 3 digitos.';
      uHsRepo.Free;
      exit;
    end;
    if Length(highscore.getUsername) > 8 then begin
      Result := 'Falha - Username só pode ter até 8 digitos.';
      uHsRepo.Free;
      exit;
    end;


    uHsRepo.Inserir(highscore);
    Result := 'Highscore cadastrado com sucesso!';
    uHsRepo.Free;
end;

end.
