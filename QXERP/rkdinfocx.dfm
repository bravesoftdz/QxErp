﻿object Form70: TForm70
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20837#24211#21333#20449#24687#26597#35810
  ClientHeight = 687
  ClientWidth = 1028
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
    Left = 32
    Top = 24
    Width = 108
    Height = 13
    Caption = #36755#20837#35201#26597#35810#30340#20379#24212#21830
  end
  object Label3: TLabel
    Left = 32
    Top = 56
    Width = 108
    Height = 13
    Caption = #20837#24211#21333#26597#35810#36215#27490#26102#38388
  end
  object 自: TLabel
    Left = 153
    Top = 56
    Width = 12
    Height = 13
    Caption = #33258
  end
  object 至: TLabel
    Left = 305
    Top = 56
    Width = 12
    Height = 13
    Caption = #33258
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 21
    Width = 601
    Height = 21
    DropDownCount = 16
    TabOrder = 0
    OnKeyDown = ComboBox1KeyDown
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 95
    Width = 1028
    Height = 592
    Align = alBottom
    ColCount = 9
    RowCount = 2
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    ExplicitTop = 84
    ExplicitWidth = 1018
    ColWidths = (
      44
      73
      228
      80
      77
      71
      104
      82
      85)
  end
  object Button1: TButton
    Left = 664
    Top = 51
    Width = 89
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 784
    Top = 16
    Width = 201
    Height = 61
    Caption = #26597#35810#36873#39033
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #26410#26680#24080
      #24050#26680#24080
      #20840#37096)
    TabOrder = 3
  end
  object DateTimePicker1: TDateTimePicker
    Left = 179
    Top = 53
    Width = 105
    Height = 21
    Date = 42373.622128645830000000
    Time = 42373.622128645830000000
    TabOrder = 4
  end
  object DateTimePicker2: TDateTimePicker
    Left = 339
    Top = 53
    Width = 105
    Height = 21
    Date = 42373.622160972220000000
    Time = 42373.622160972220000000
    TabOrder = 5
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 736
    Top = 416
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
