program DinoGame;

uses
  Vcl.Forms,
  uMainView in 'View\uMainView.pas' {FMain},
  uDerrotaView in 'View\uDerrotaView.pas' {FDerrota},
  uConnectionRepository in 'Repository\uConnectionRepository.pas' {dbConnection: TDataModule},
  uHighscoreController in 'Controller\uHighscoreController.pas',
  uHighscoreModel in 'Model\uHighscoreModel.pas',
  uHighscoreRepository in 'Repository\uHighscoreRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TdbConnection, dbConnection);
  Application.Run;
end.
