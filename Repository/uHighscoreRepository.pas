unit uHighscoreRepository;

interface
uses uHighscoreModel, uConnectionRepository, System.SysUtils;


type
THighscoreRepository = class
  public
  procedure Inserir(highscore: THighscore);

end;

implementation


{ THighscoreRepository }

procedure THighscoreRepository.Inserir(highscore: THighscore);
begin
    dbConnection.FDQuery.SQL.Text := 'INSERT INTO public.highscore (username, score, data_registro) VALUES (:username, :score, now())';

    dbConnection.FDQuery.ParamByName('username').AsString := highscore.getUsername;
    dbConnection.FDQuery.ParamByName('score').AsInteger   := highscore.getPontos;

    dbConnection.FDQuery.ExecSQL;
end;

end.
