unit uDerrotaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uConnection, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList,
  uHighscoreController, uHighscoreModel;

type
  TFDerrota = class(TForm)
    Panel1: TPanel;
    lblTitulo: TLabel;
    btnReiniciar: TButton;
    btnFechar: TButton;
    btnSalvar: TButton;
    lblPontos: TLabel;
    inputUsername: TEdit;
    lblNome: TLabel;
    ltbxHighscore: TListBox;
    procedure btnReiniciarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    opcao, pontos : Integer;
  end;

var
  FDerrota: TFDerrota;

implementation

{$R *.dfm}

procedure TFDerrota.btnReiniciarClick(Sender: TObject);
begin
  opcao := 1;
  Self.Close;
end;

procedure TFDerrota.btnSalvarClick(Sender: TObject);
var controller : THighscoreController;
var score : THighscore;
var resultado : String;

begin

  try
    score := THighscore.Create((inputUsername.Text), pontos);
    controller := THighscoreController.Create;

    resultado := controller.salvarHighscore(score);
    ShowMessage(resultado);

    controller.Free;
    score.Free;
  except
    on E: Exception do ShowMessage('Erro ao salvar pontuação: ' + E.Message);
  end;

end;

procedure TFDerrota.FormActivate(Sender: TObject);
begin
  lblPontos.Caption := 'Pontuação: ' + pontos.ToString;
  btnSalvar.Enabled := True;
end;

procedure TFDerrota.FormCreate(Sender: TObject);
begin
  opcao := 2;
end;

procedure TFDerrota.btnFecharClick(Sender: TObject);
begin
  opcao:= 2;
  Close;
end;

end.
