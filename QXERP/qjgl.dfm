object Form37: TForm37
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35831#20551#31649#29702
  ClientHeight = 403
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 259
    Top = 30
    Width = 36
    Height = 13
    Caption = #35831#20551#20154
  end
  object Label2: TLabel
    Left = 39
    Top = 72
    Width = 48
    Height = 13
    Caption = #35831#20551#26102#38388
  end
  object Label4: TLabel
    Left = 503
    Top = 30
    Width = 48
    Height = 13
    Caption = #35831#20551#31867#22411
  end
  object Label5: TLabel
    Left = 39
    Top = 114
    Width = 48
    Height = 13
    Caption = #35831#20551#29702#30001
  end
  object Label3: TLabel
    Left = 503
    Top = 72
    Width = 48
    Height = 13
    Caption = #30003#35831#26085#26399
  end
  object Label7: TLabel
    Left = 284
    Top = 72
    Width = 12
    Height = 13
    Caption = #21040
  end
  object Label8: TLabel
    Left = 27
    Top = 30
    Width = 60
    Height = 13
    Caption = #30003#35831#21333#32534#21495
  end
  object Label6: TLabel
    Left = 101
    Top = 349
    Width = 84
    Height = 13
    Caption = #32511#33394#20026#24517#22635#39033#30446
  end
  object Label9: TLabel
    Left = 105
    Top = 8
    Width = 304
    Height = 13
    Caption = #27599#24180#31532#19968#20010#35831#20551#21333#32534#21495#25163#24037#36755#20837#65306#24180#20221'+'#39'0001'#39','#22914'20150001'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 309
    Top = 27
    Width = 172
    Height = 21
    Color = clMoneyGreen
    DropDownCount = 16
    TabOrder = 1
    OnKeyDown = ComboBox1KeyDown
  end
  object Memo1: TMemo
    Left = 101
    Top = 111
    Width = 570
    Height = 210
    TabOrder = 8
  end
  object ComboBox2: TComboBox
    Left = 565
    Top = 27
    Width = 106
    Height = 21
    Color = clMoneyGreen
    TabOrder = 2
    Items.Strings = (
      #20107#20551
      #30149#20551
      #23130#20551
      #20007#20551
      #26103#24037
      #20854#20182)
  end
  object Button1: TButton
    Left = 503
    Top = 344
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 9
    OnClick = Button1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 105
    Top = 70
    Width = 96
    Height = 21
    Date = 42337.358579687500000000
    Time = 42337.358579687500000000
    ParseInput = True
    TabOrder = 3
    OnUserInput = DateTimePicker1UserInput
  end
  object DateTimePicker3: TDateTimePicker
    Left = 309
    Top = 70
    Width = 94
    Height = 21
    Date = 42337.358579687500000000
    Time = 42337.358579687500000000
    TabOrder = 5
  end
  object DateTimePicker5: TDateTimePicker
    Left = 565
    Top = 70
    Width = 106
    Height = 21
    Date = 42337.358579687500000000
    Time = 42337.358579687500000000
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 101
    Top = 27
    Width = 145
    Height = 21
    Color = clMoneyGreen
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object DateTimePicker2: TDateTimePicker
    Left = 200
    Top = 70
    Width = 77
    Height = 21
    Date = 42362.664318252310000000
    Time = 42362.664318252310000000
    Kind = dtkTime
    TabOrder = 4
  end
  object DateTimePicker4: TDateTimePicker
    Left = 402
    Top = 70
    Width = 79
    Height = 21
    Date = 42362.664318252310000000
    Time = 42362.664318252310000000
    Kind = dtkTime
    TabOrder = 6
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 245
    Top = 168
  end
end
