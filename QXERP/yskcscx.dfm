object Form43: TForm43
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #24212#25910#27454#20652#25910#26597#35810
  ClientHeight = 595
  ClientWidth = 1128
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
    Left = 416
    Top = 27
    Width = 36
    Height = 13
    Caption = #38144#21806#21592
  end
  object Label2: TLabel
    Left = 72
    Top = 27
    Width = 108
    Height = 13
    Caption = #24212#25910#27454#26411#31508#20837#24080#26102#38388
  end
  object DateTimePicker1: TDateTimePicker
    Left = 200
    Top = 26
    Width = 105
    Height = 21
    Date = 42187.350045567130000000
    Time = 42187.350045567130000000
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 472
    Top = 24
    Width = 161
    Height = 21
    TabOrder = 1
    Text = '*|'#20840#37096
    OnDropDown = ComboBox1DropDown
  end
  object Button1: TButton
    Left = 712
    Top = 22
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 64
    Width = 1128
    Height = 531
    Align = alBottom
    ColCount = 10
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ExplicitWidth = 1106
    ColWidths = (
      63
      77
      77
      337
      201
      70
      64
      64
      64
      78)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 648
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 520
    Top = 296
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
      OnClick = Execl1Click
    end
  end
end
