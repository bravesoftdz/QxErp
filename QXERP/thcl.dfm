object Form73: TForm73
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36864#36135#22788#29702
  ClientHeight = 516
  ClientWidth = 868
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
    Left = 34
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#32534#21495
  end
  object Label2: TLabel
    Left = 34
    Top = 57
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20449#24687
  end
  object Label4: TLabel
    Left = 242
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#26085#26399
  end
  object Label13: TLabel
    Left = 439
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#22995#21517
  end
  object Label19: TLabel
    Left = 642
    Top = 22
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#37329#39069
  end
  object Label20: TLabel
    Left = 654
    Top = 57
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#20154
  end
  object Label21: TLabel
    Left = 642
    Top = 90
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#30005#35805
  end
  object Label22: TLabel
    Left = 58
    Top = 90
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880
  end
  object Label9: TLabel
    Left = 34
    Top = 149
    Width = 48
    Height = 13
    Caption = #20135#21697#32534#21495
  end
  object Label10: TLabel
    Left = 277
    Top = 149
    Width = 48
    Height = 13
    Caption = #38144#21806#21333#20215
  end
  object Label11: TLabel
    Left = 416
    Top = 149
    Width = 48
    Height = 13
    Caption = #21512#21516#25968#37327
  end
  object Label16: TLabel
    Left = 39
    Top = 467
    Width = 84
    Height = 13
    Caption = #32511#33394#26159#24517#22635#36873#39033
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 553
    Top = 149
    Width = 48
    Height = 13
    Caption = #21457#36135#25968#37327
  end
  object Label6: TLabel
    Left = 678
    Top = 149
    Width = 48
    Height = 13
    Caption = #36864#22238#25968#37327
  end
  object Label3: TLabel
    Left = 416
    Top = 467
    Width = 48
    Height = 13
    Caption = #36864#36135#26085#26399
  end
  object Edit1: TEdit
    Left = 96
    Top = 19
    Width = 129
    Height = 21
    Color = clMoneyGreen
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    TextHint = #22238#36710#33719#21462#26032#21512#21516#32534#21495
    OnKeyDown = Edit1KeyDown
  end
  object Edit11: TEdit
    Left = 696
    Top = 19
    Width = 130
    Height = 21
    Color = clBtnFace
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object Edit12: TEdit
    Left = 696
    Top = 54
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 2
  end
  object Edit13: TEdit
    Left = 696
    Top = 87
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 3
  end
  object StringGrid1: TStringGrid
    Left = 34
    Top = 178
    Width = 792
    Height = 273
    FixedCols = 0
    RowCount = 2
    PopupMenu = PopupMenu1
    TabOrder = 4
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      210
      151
      158
      158)
  end
  object Edit7: TEdit
    Left = 338
    Top = 146
    Width = 68
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 5
  end
  object Edit8: TEdit
    Left = 475
    Top = 146
    Width = 68
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 6
  end
  object Button1: TButton
    Left = 741
    Top = 114
    Width = 85
    Height = 25
    Caption = #28155#21152#20135#21697#26126#32454
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 627
    Top = 462
    Width = 83
    Height = 25
    Caption = #36827#34892#36864#36135#22788#29702
    TabOrder = 8
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 96
    Top = 86
    Width = 530
    Height = 47
    ReadOnly = True
    TabOrder = 9
  end
  object ComboBox4: TComboBox
    Left = 93
    Top = 146
    Width = 175
    Height = 21
    Color = clMoneyGreen
    DropDownCount = 16
    TabOrder = 10
    OnKeyDown = ComboBox4KeyDown
    OnSelect = ComboBox4Select
  end
  object Edit3: TEdit
    Left = 96
    Top = 54
    Width = 530
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
  end
  object Edit4: TEdit
    Left = 611
    Top = 146
    Width = 60
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 12
  end
  object Edit5: TEdit
    Left = 741
    Top = 145
    Width = 84
    Height = 21
    Color = clMoneyGreen
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 13
    Text = '0'
  end
  object Edit6: TEdit
    Left = 496
    Top = 19
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 14
  end
  object Edit9: TEdit
    Left = 303
    Top = 19
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 15
  end
  object DateTimePicker1: TDateTimePicker
    Left = 481
    Top = 464
    Width = 104
    Height = 21
    Date = 42375.877153634260000000
    Time = 42375.877153634260000000
    Color = clMoneyGreen
    TabOrder = 16
  end
  object Edit2: TEdit
    Left = 158
    Top = 464
    Width = 92
    Height = 21
    TabOrder = 17
    Text = '0'
  end
  object Button3: TButton
    Left = 741
    Top = 462
    Width = 85
    Height = 25
    Caption = #21462#28040
    TabOrder = 18
    OnClick = Button3Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 720
    Top = 376
  end
  object PopupMenu1: TPopupMenu
    Left = 528
    Top = 368
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
      OnClick = N1Click
    end
  end
end
