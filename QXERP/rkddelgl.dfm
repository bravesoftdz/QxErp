object Form53: TForm53
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20837#24211#21333#31649#29702
  ClientHeight = 483
  ClientWidth = 882
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
  object Bevel1: TBevel
    Left = 21
    Top = 136
    Width = 832
    Height = 289
    Shape = bsFrame
    Style = bsRaised
  end
  object Label4: TLabel
    Left = 639
    Top = 25
    Width = 48
    Height = 13
    Caption = #20837#24211#26085#26399
  end
  object Label5: TLabel
    Left = 243
    Top = 97
    Width = 60
    Height = 13
    Caption = #20837#24211#21333#22791#27880
  end
  object Label6: TLabel
    Left = 55
    Top = 25
    Width = 48
    Height = 13
    Caption = #20837#24211#21333#21495
  end
  object Label7: TLabel
    Left = 243
    Top = 25
    Width = 60
    Height = 13
    Caption = #20379#24212#21830#21517#31216
  end
  object Label8: TLabel
    Left = 381
    Top = 130
    Width = 80
    Height = 16
    Caption = #20837#24211#21333#26126#32454
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 55
    Top = 61
    Width = 48
    Height = 13
    Caption = #21457#31080#32534#21495
  end
  object Label2: TLabel
    Left = 255
    Top = 61
    Width = 48
    Height = 13
    Caption = #21457#31080#22791#27880
  end
  object Label3: TLabel
    Left = 43
    Top = 97
    Width = 60
    Height = 13
    Caption = #20837#24211#25805#20316#21592
  end
  object Edit3: TEdit
    Left = 309
    Top = 22
    Width = 308
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 728
    Top = 440
    Width = 112
    Height = 25
    Caption = #21024#38500#20837#24211#21333#20449#24687
    TabOrder = 1
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 39
    Top = 152
    Width = 801
    Height = 256
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 2
    ColWidths = (
      88
      109
      104
      123
      356)
  end
  object Edit4: TEdit
    Left = 109
    Top = 22
    Width = 111
    Height = 21
    Color = clMoneyGreen
    TabOrder = 3
    TextHint = #36755#20837#20837#24211#21333#32534#21495
    OnKeyDown = Edit4KeyDown
  end
  object Edit1: TEdit
    Left = 109
    Top = 58
    Width = 111
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 309
    Top = 58
    Width = 519
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 701
    Top = 22
    Width = 127
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 6
    TextHint = #22238#36710#33719#21462#32534#21495
    OnKeyDown = Edit4KeyDown
  end
  object Edit6: TEdit
    Left = 309
    Top = 94
    Width = 519
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 7
  end
  object Edit7: TEdit
    Left = 109
    Top = 94
    Width = 111
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 8
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 602
    Top = 231
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 352
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
    end
  end
end
