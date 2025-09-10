unit uMainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, uDerrota, uConnectionRepository,
  Vcl.StdCtrls;

type
  TFMain = class(TForm)
    timerPontos: TTimer;
    lblPontos: TLabel;
    timerRolagem: TTimer;
    imgInimigo: TImage;
    timerPulo: TTimer;
    timerSprites: TTimer;
    imgHornet: TImage;
    lblVelocidade: TLabel;
    imgFundo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure timerSpritesTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure timerPuloTimer(Sender: TObject);
    procedure timerRolagemTimer(Sender: TObject);
    procedure timerPontosTimer(Sender: TObject);
    procedure ResetarJogo;
  private
    var
    urlSpriteHornet: array[0..4] of String;
    spriteAtual, pontos, pontosNovos, velocidade: Integer;
    pulo, subindo, descendo, jogoPausado: Boolean;

  public
    { Public declarations }
  end;

var
  FMain : TFMain;
  FDerrota : TFDerrota;

implementation

{$R *.dfm}


procedure TFMain.FormCreate(Sender: TObject);
begin
  velocidade := 15;
    jogoPausado := False;

    spriteAtual := 0;

    //andando
    urlSpriteHornet[0] := 'C:\Users\User\Desktop\spritesHornet\ahornet1.png';
    urlSpriteHornet[1] := 'C:\Users\User\Desktop\spritesHornet\ahornet2.png';
    urlSpriteHornet[2] := 'C:\Users\User\Desktop\spritesHornet\ahornet3.png';
    urlSpriteHornet[3] := 'C:\Users\User\Desktop\spritesHornet\ahornet4.png';
    urlSpriteHornet[4] := 'C:\Users\User\Desktop\spritesHornet\ahornet5.png';
    //pulando
end;

procedure TFMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
    VK_UP: begin
      if pulo = false then begin
        subindo := True;
        pulo := True;
      end else exit;

    end;
end;

end;



procedure TFMain.ResetarJogo;
begin
    pontos := 0;
    pontosNovos := 0;
    jogoPausado := False;
    imgInimigo.Left := 700;
    imgHornet.Top := 300;
    imgHornet.Width := 113;
    velocidade := 15;
    imgFundo.Left := 0;
end;

procedure TFMain.timerPontosTimer(Sender: TObject);
begin
  if jogoPausado then exit;

  pontos := pontos + 1;
  pontosNovos := pontosNovos +1;
  lblPontos.Caption := 'Pontuação: ' + (pontos).ToString;
end;

procedure TFMain.timerPuloTimer(Sender: TObject);
begin
  if jogoPausado then exit;

  if (imgHornet.Top <= 165) then begin
    subindo := false;
    descendo := true;
  end else if (imgHornet.Top >= 300) and descendo then begin
   descendo := false;
   pulo := false;
   imgHornet.Top := 300;
   exit;
  end;

  if subindo then imgHornet.top := imgHornet.Top - velocidade;
  if descendo then imgHornet.top := imgHornet.Top + velocidade;

end;

procedure TFMain.timerRolagemTimer(Sender: TObject);
begin
  if jogoPausado then exit;


  imgInimigo.Left := imgInimigo.Left - velocidade - 5;
  if imgInimigo.Left <= -50 then imgInimigo.Left := 700;

end;

procedure TFMain.timerSpritesTimer(Sender: TObject);
begin

  if jogoPausado then exit;

  if imgFundo.left <= -600 then imgFundo.left := 0;

  imgFundo.Left := imgFundo.Left - velocidade;


  lblVelocidade.Caption := 'Velocidade: ' + velocidade.ToString;

  // voltando animação pro 1 sprite
  if spriteAtual = 3 then begin
    spriteAtual := 0;
  end else begin
    spriteAtual := spriteAtual + 1;
  end;

  // mudando sprite da corrida
  try
    imgHornet.Picture.LoadFromFile(urlSpriteHornet[spriteAtual]);
  except
    ShowMessage('Foto não existe');
    Close;
  end;

  //colisao encostou

  if (imgInimigo.Left <= 70) and (imgInimigo.Left >= -50) then begin
    if imgHornet.Top >= 260 then begin

        try
          imgHornet.Picture.LoadFromFile(urlSpriteHornet[4]);
          imgHornet.Width :=160;
          imgHornet.Top := 340;
          imgHornet.Left := 0;
        except
          ShowMessage('Foto não existe');
          Exit;
        end;


      FDerrota := TFDerrota.Create(FMain);
      jogoPausado := True;
      FDerrota.pontos := pontos;
      FDerrota.ShowModal;
      try
        if FDerrota.opcao = 1 then begin
          ResetarJogo();
        end else if FDerrota.opcao = 2 then begin
          Close;
        end;
      finally
        FDerrota.Free;
      end;

    end;

    // aumentando velocidade do jogo
    if pontosNovos > 50 then begin
      velocidade := velocidade + 10;
      pontosNovos := 0;
    end;

  end;

  if pulo then timerPulo.Enabled := true;
end;

end.
