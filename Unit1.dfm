object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 474
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCriarPessoa: TButton
    Left = 304
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Criar'
    TabOrder = 0
    OnClick = btnCriarPessoaClick
  end
  object edNome: TEdit
    Left = 280
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Nome'
  end
  object edIdade: TEdit
    Left = 280
    Top = 144
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = 'Idade'
  end
end
