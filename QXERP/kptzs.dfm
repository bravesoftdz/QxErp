object Form77: TForm77
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24320#31080#36890#30693#20070
  ClientHeight = 556
  ClientWidth = 1046
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
    Left = 27
    Top = 19
    Width = 72
    Height = 13
    Caption = #21512#21516#20449#24687#26597#35810
  end
  object Label2: TLabel
    Left = 51
    Top = 54
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#32534#21495
  end
  object Label4: TLabel
    Left = 259
    Top = 54
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#26085#26399
  end
  object Label13: TLabel
    Left = 456
    Top = 54
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#22995#21517
  end
  object Label19: TLabel
    Left = 659
    Top = 54
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#37329#39069
  end
  object Label3: TLabel
    Left = 51
    Top = 89
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20449#24687
  end
  object Label20: TLabel
    Left = 863
    Top = 54
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#20154
  end
  object Label22: TLabel
    Left = 75
    Top = 122
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880
  end
  object Label21: TLabel
    Left = 851
    Top = 87
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = #32852#31995#30005#35805
  end
  object Label5: TLabel
    Left = 39
    Top = 479
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = #36890#30693#20070#22791#27880
  end
  object Label6: TLabel
    Left = 35
    Top = 178
    Width = 60
    Height = 13
    Caption = #36890#30693#20070#32534#21495
  end
  object ComboBox1: TComboBox
    Left = 113
    Top = 16
    Width = 905
    Height = 21
    TabOrder = 0
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object Edit1: TEdit
    Left = 113
    Top = 51
    Width = 129
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 1
    TextHint = #22238#36710#33719#21462#26032#21512#21516#32534#21495
  end
  object Edit9: TEdit
    Left = 320
    Top = 51
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 2
  end
  object Edit6: TEdit
    Left = 513
    Top = 51
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 3
  end
  object Edit11: TEdit
    Left = 713
    Top = 51
    Width = 130
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 4
    Text = '0'
  end
  object Edit3: TEdit
    Left = 113
    Top = 86
    Width = 730
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object Edit12: TEdit
    Left = 905
    Top = 51
    Width = 113
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 113
    Top = 118
    Width = 905
    Height = 47
    ReadOnly = True
    TabOrder = 7
  end
  object Edit13: TEdit
    Left = 905
    Top = 84
    Width = 113
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 8
  end
  object StringGrid1: TStringGrid
    Left = 17
    Top = 208
    Width = 626
    Height = 254
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 9
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      48
      76
      86
      82
      82
      208)
  end
  object StringGrid2: TStringGrid
    Left = 649
    Top = 208
    Width = 369
    Height = 254
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    TabOrder = 10
    OnSelectCell = StringGrid2SelectCell
    ColWidths = (
      46
      90
      101
      89)
  end
  object Edit2: TEdit
    Left = 113
    Top = 175
    Width = 129
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 11
  end
  object Button1: TButton
    Left = 513
    Top = 174
    Width = 107
    Height = 25
    Caption = #28155#21152#21457#36135#21333'>>'
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 664
    Top = 174
    Width = 107
    Height = 25
    Caption = '<<'#21024#38500#21457#36135#21333
    TabOrder = 13
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 801
    Top = 474
    Width = 104
    Height = 25
    Caption = #20445#23384#24320#31080#36890#30693#20070
    TabOrder = 14
    OnClick = Button3Click
  end
  object Memo2: TMemo
    Left = 113
    Top = 476
    Width = 672
    Height = 49
    TabOrder = 15
  end
  object Button4: TButton
    Left = 928
    Top = 474
    Width = 87
    Height = 25
    Caption = #21462#28040
    TabOrder = 16
    OnClick = Button4Click
  end
  object Edit4: TEdit
    Left = 259
    Top = 176
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 17
    Text = '0'
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 441
    Top = 208
  end
end
