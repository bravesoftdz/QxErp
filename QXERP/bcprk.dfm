object Form31: TForm31
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21322#25104#21697#20837#24211
  ClientHeight = 421
  ClientWidth = 769
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
    Top = 24
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = #21322#25104#21697#32534#21495
  end
  object Label2: TLabel
    Left = 347
    Top = 24
    Width = 49
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#24211#25968#37327
  end
  object Label3: TLabel
    Left = 546
    Top = 24
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #35760#24080#26085#26399
  end
  object Label4: TLabel
    Left = 76
    Top = 64
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880
  end
  object Label5: TLabel
    Left = 52
    Top = 380
    Width = 77
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24403#21069#24211#23384#25968#37327
  end
  object Edit2: TEdit
    Left = 418
    Top = 21
    Width = 97
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnKeyPress = Edit2KeyPress
  end
  object DateTimePicker1: TDateTimePicker
    Left = 614
    Top = 21
    Width = 115
    Height = 21
    Date = 42180.606373275460000000
    Time = 42180.606373275460000000
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
  end
  object Edit4: TEdit
    Left = 122
    Top = 61
    Width = 495
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 104
    Width = 697
    Height = 249
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 3
    OnMouseUp = StringGrid1MouseUp
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      171
      85
      137
      213)
  end
  object Button1: TButton
    Left = 640
    Top = 367
    Width = 89
    Height = 25
    Caption = #20445#23384#20837#24211#20449#24687
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 640
    Top = 59
    Width = 89
    Height = 25
    Caption = #28155#21152#26126#32454
    TabOrder = 5
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 122
    Top = 21
    Width = 183
    Height = 21
    TabOrder = 6
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object Edit1: TEdit
    Left = 147
    Top = 377
    Width = 97
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 7
    OnKeyPress = Edit2KeyPress
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 384
    Top = 216
  end
  object PopupMenu1: TPopupMenu
    Left = 496
    Top = 368
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
      OnClick = N1Click
    end
  end
end
