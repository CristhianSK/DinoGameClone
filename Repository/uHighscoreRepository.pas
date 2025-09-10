unit uHighscoreRepository;

interface
uses uHighscoreModel, uConnectionRepository, System.SysUtils, System.Generics.Collections;


type
THighscoreRepository = class
  public
  procedure Inserir(highscore: THighscore);
  function Listar(): TObjectList<THighscore>;

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


function THighscoreRepository.Listar: TObjectList<THighscore>;
begin
 var listaHighscore := TObjectList<THighscore>.Create(True);
 var score : THighscore;

    dbConnection.FDQuery.SQL.Text := 'SELECT * FROM public.highscore ORDER BY score DESC';

    dbConnection.FDQuery.Open();

      while not dbConnection.FDQuery.Eof do begin
      score := THighscore.Create(dbConnection.FDQuery.FieldByName('username').AsString, dbConnection.FDQuery.FieldByName('score').AsInteger);
      listaHighscore.Add(score);
      dbConnection.FDQuery.Next;
      end;

    Result := listaHighscore;

end;

end.
