object Form74: TForm74
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#27979#35797#19981#36864#22238#20986#24211#36890#30693#21333
  ClientHeight = 507
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 19
    Width = 84
    Height = 13
    Caption = #27979#35797#20986#24211#21333#32534#21495
  end
  object Label2: TLabel
    Left = 260
    Top = 19
    Width = 60
    Height = 13
    Caption = #20986#24211#30003#35831#20154
  end
  object Label3: TLabel
    Left = 76
    Top = 53
    Width = 48
    Height = 13
    Caption = #20986#24211#29702#30001
  end
  object Label6: TLabel
    Left = 453
    Top = 19
    Width = 48
    Height = 13
    Caption = #20986#24211#26085#26399
  end
  object Label4: TLabel
    Left = 64
    Top = 379
    Width = 60
    Height = 13
    Caption = #19981#36864#22238#35828#26126
  end
  object Edit1: TEdit
    Left = 130
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    TextHint = #36755#20837#20986#24211#21333#21495#22238#36710
    OnKeyDown = Edit1KeyDown
  end
  object Memo1: TMemo
    Left = 130
    Top = 50
    Width = 503
    Height = 57
    ReadOnly = True
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 122
    Width = 625
    Height = 241
    TabStop = False
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    ColWidths = (
      70
      151
      114
      257)
  end
  object Button3: TButton
    Left = 424
    Top = 456
    Width = 225
    Height = 25
    Caption = #29983#25104#20135#21697#27979#35797#19981#36864#22238#20986#24211#36890#30693#21333
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 326
    Top = 16
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 511
    Top = 16
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object Memo2: TMemo
    Left = 130
    Top = 376
    Width = 519
    Height = 65
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 130
    Top = 458
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 7
    TextHint = #36755#20837#20986#24211#21333#21495#22238#36710
    Visible = False
    OnKeyDown = Edit1KeyDown
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 336
    Top = 240
  end
end
