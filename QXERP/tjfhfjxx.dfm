object Form61: TForm61
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #28155#21152#21457#36135#38468#20214#20449#24687
  ClientHeight = 181
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 27
    Width = 72
    Height = 13
    Caption = #26597#35810#38468#20214#32534#21495
  end
  object Label2: TLabel
    Left = 343
    Top = 27
    Width = 48
    Height = 13
    Caption = #38468#20214#21517#31216
  end
  object Label3: TLabel
    Left = 48
    Top = 75
    Width = 48
    Height = 13
    Caption = #38468#20214#31867#22411
  end
  object Label4: TLabel
    Left = 343
    Top = 75
    Width = 48
    Height = 13
    Caption = #28155#21152#25968#37327
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 24
    Width = 209
    Height = 21
    TabOrder = 0
    TextHint = #36755#20837#20851#38190#23383#26597#35810#20135#21697#20449#24687
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object Edit1: TEdit
    Left = 413
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 112
    Top = 72
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 413
    Top = 72
    Width = 145
    Height = 21
    TabOrder = 3
    OnKeyPress = Edit3KeyPress
  end
  object Button1: TButton
    Left = 413
    Top = 120
    Width = 145
    Height = 25
    Caption = #28155#21152#38468#23646#29289#20214
    TabOrder = 4
    OnClick = Button1Click
  end
end
