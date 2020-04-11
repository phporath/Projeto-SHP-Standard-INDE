object fMenuPrincipal: TfMenuPrincipal
  Left = 606
  Top = 263
  Width = 286
  Height = 360
  BorderIcons = []
  Caption = 'SHP Standard INDE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbNome: TLabel
    Left = 8
    Top = 280
    Width = 190
    Height = 13
    Caption = 'Autor: Pedro Henrique Machado Porath '
  end
  object lnEmail: TLabel
    Left = 8
    Top = 296
    Width = 134
    Height = 13
    Caption = 'E-mail: phporath@gmail.com'
  end
  object btPadronizar: TButton
    Left = 44
    Top = 83
    Width = 185
    Height = 40
    Caption = 'Padronizar Shapefile'
    TabOrder = 0
    OnClick = btPadronizarClick
  end
  object btSair: TButton
    Left = 44
    Top = 196
    Width = 185
    Height = 40
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btSairClick
  end
  object btCamada: TButton
    Left = 44
    Top = 30
    Width = 185
    Height = 40
    Caption = 'Criar ou editar padr'#227'o de camada'
    TabOrder = 2
    OnClick = btCampoClick
  end
  object btSobre: TBitBtn
    Left = 44
    Top = 139
    Width = 185
    Height = 40
    Caption = 'Sobre'
    TabOrder = 3
    OnClick = btSobreClick
  end
end
