object Form49: TForm49
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36136#26816#19981#33391#35760#24405#26597#35810
  ClientHeight = 534
  ClientWidth = 990
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
    Left = 298
    Top = 17
    Width = 72
    Height = 13
    Caption = #36873#25321#26597#35810#26102#38388
  end
  object Label2: TLabel
    Left = 42
    Top = 17
    Width = 72
    Height = 13
    Caption = #36873#25321#32844#24037#22995#21517
  end
  object ComboBox2: TComboBox
    Left = 144
    Top = 14
    Width = 129
    Height = 21
    TabOrder = 0
    OnKeyDown = ComboBox2KeyDown
  end
  object Button1: TButton
    Left = 795
    Top = 14
    Width = 89
    Height = 25
    Caption = #26597#35810
    TabOrder = 1
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 559
    Top = 8
    Width = 186
    Height = 39
    Caption = #26597#35810#36873#39033
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #25353#26376
      #25353#24180
      #20840#37096)
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 384
    Top = 14
    Width = 145
    Height = 21
    Date = 42337.398820648150000000
    Time = 42337.398820648150000000
    TabOrder = 3
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 60
    Width = 990
    Height = 474
    Align = alBottom
    ColCount = 3
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 4
    ExplicitTop = 63
    ExplicitWidth = 977
    ColWidths = (
      55
      98
      787)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 520
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 224
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
