object F_Teste: TF_Teste
  Left = 376
  Top = 318
  Width = 717
  Height = 331
  Caption = 'RFID'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoRX: TMemo
    Left = 0
    Top = 0
    Width = 701
    Height = 265
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 265
    Width = 701
    Height = 28
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Limpar: TButton
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 0
      OnClick = LimparClick
    end
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 604
    Top = 65
  end
end
