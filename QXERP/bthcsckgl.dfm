object Form76: TForm76
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#27979#35797#19981#36864#22238#20986#24211#31649#29702
  ClientHeight = 532
  ClientWidth = 824
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
    Left = 24
    Top = 19
    Width = 84
    Height = 13
    Caption = #27979#35797#20986#24211#21333#32534#21495
  end
  object Label2: TLabel
    Left = 640
    Top = 19
    Width = 48
    Height = 13
    Caption = #38144#21806#22995#21517
  end
  object Label3: TLabel
    Left = 60
    Top = 85
    Width = 48
    Height = 13
    Caption = #20986#24211#29702#30001
  end
  object Label6: TLabel
    Left = 253
    Top = 19
    Width = 48
    Height = 13
    Caption = #20986#21333#26085#26399
  end
  object Label4: TLabel
    Left = 48
    Top = 409
    Width = 60
    Height = 13
    Caption = #19981#36864#22238#35828#26126
  end
  object Label5: TLabel
    Left = 421
    Top = 492
    Width = 48
    Height = 13
    Caption = #20986#24211#26085#26399
  end
  object Label9: TLabel
    Left = 51
    Top = 52
    Width = 48
    Height = 13
    Caption = #23458#25143#21517#31216
  end
  object Label7: TLabel
    Left = 461
    Top = 19
    Width = 48
    Height = 13
    Caption = #21512#21516#32534#21495
  end
  object Edit1: TEdit
    Left = 114
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    TextHint = #36755#20837#20986#24211#21333#21495#22238#36710
    OnKeyDown = Edit1KeyDown
  end
  object Memo1: TMemo
    Left = 114
    Top = 82
    Width = 683
    Height = 57
    ReadOnly = True
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 114
    Top = 154
    Width = 683
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
    Left = 619
    Top = 485
    Width = 155
    Height = 25
    Caption = #20445#23384#19981#36864#22238#20986#24211#20449#24687
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 706
    Top = 16
    Width = 91
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 311
    Top = 16
    Width = 138
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object Memo2: TMemo
    Left = 114
    Top = 406
    Width = 683
    Height = 65
    ReadOnly = True
    TabOrder = 6
  end
  object DateTimePicker1: TDateTimePicker
    Left = 475
    Top = 489
    Width = 105
    Height = 21
    Date = 42374.909171215280000000
    Time = 42374.909171215280000000
    Color = clMoneyGreen
    TabOrder = 7
  end
  object Edit6: TEdit
    Left = 111
    Top = 49
    Width = 686
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object Edit5: TEdit
    Left = 520
    Top = 16
    Width = 103
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 336
    Top = 240
  end
end