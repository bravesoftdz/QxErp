object Form101: TForm101
  Left = 0
  Top = 0
  Caption = #20135#21697#25253#20215#35745#31639
  ClientHeight = 624
  ClientWidth = 984
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
    Top = 99
    Width = 48
    Height = 13
    Caption = #20135#21697#35268#26684
  end
  object Label2: TLabel
    Left = 330
    Top = 99
    Width = 66
    Height = 13
    Caption = #37325#37327#25110#20307#31215'1'
  end
  object Label3: TLabel
    Left = 801
    Top = 99
    Width = 48
    Height = 13
    Caption = #20135#21697#25968#37327
  end
  object Label4: TLabel
    Left = 330
    Top = 39
    Width = 101
    Height = 13
    Caption = #30406#24335#21333#20215#65288#20803'/KG'#65289
  end
  object Label5: TLabel
    Left = 519
    Top = 39
    Width = 133
    Height = 13
    Caption = #26222#36890#26495#24335#21333#20215#65288#20803'/CM3'#65289
  end
  object Label6: TLabel
    Left = 735
    Top = 39
    Width = 121
    Height = 13
    Caption = 'F4'#26495#24335#21333#20215#65288#20803'/CM2'#65289
  end
  object Label7: TLabel
    Left = 40
    Top = 139
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Bevel1: TBevel
    Left = 32
    Top = 73
    Width = 921
    Height = 3
  end
  object Label8: TLabel
    Left = 503
    Top = 99
    Width = 30
    Height = 13
    Caption = #20307#31215'2'
  end
  object Label9: TLabel
    Left = 642
    Top = 99
    Width = 48
    Height = 13
    Caption = #20135#21697#21333#20215
  end
  object Label10: TLabel
    Left = 705
    Top = 139
    Width = 78
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20248#24800#25240#25187'(%)'
  end
  object Edit1: TEdit
    Left = 437
    Top = 36
    Width = 76
    Height = 21
    TabOrder = 0
    Text = '0'
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 658
    Top = 36
    Width = 71
    Height = 21
    TabOrder = 1
    Text = '0'
    OnKeyDown = Edit2KeyDown
  end
  object Edit3: TEdit
    Left = 864
    Top = 36
    Width = 89
    Height = 21
    TabOrder = 2
    Text = '0'
    OnKeyDown = Edit3KeyDown
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 24
    Width = 281
    Height = 33
    Caption = #20135#21697#31867#22411
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #30406#24335#25903#24231
      #26222#36890#26495#24335#25903#24231
      'F4'#26495#24335#25903#24231)
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 96
    Width = 201
    Height = 21
    TabOrder = 4
    OnKeyDown = ComboBox1KeyDown
    OnSelect = ComboBox1Select
  end
  object Edit4: TEdit
    Left = 402
    Top = 96
    Width = 95
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 864
    Top = 96
    Width = 89
    Height = 21
    TabOrder = 6
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 168
    Width = 921
    Height = 409
    ColCount = 6
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    PopupMenu = PopupMenu1
    TabOrder = 7
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      187
      113
      116
      112
      290)
  end
  object Button1: TButton
    Left = 864
    Top = 134
    Width = 89
    Height = 25
    Caption = #28155#21152#25253#20215#26126#32454
    TabOrder = 8
    OnClick = Button1Click
  end
  object Edit6: TEdit
    Left = 112
    Top = 136
    Width = 578
    Height = 21
    TabOrder = 9
  end
  object Edit7: TEdit
    Left = 550
    Top = 96
    Width = 78
    Height = 21
    TabOrder = 10
  end
  object Edit8: TEdit
    Left = 705
    Top = 96
    Width = 80
    Height = 21
    ReadOnly = True
    TabOrder = 11
  end
  object Edit9: TEdit
    Left = 801
    Top = 136
    Width = 36
    Height = 21
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
    Text = '0'
  end
  object UpDown1: TUpDown
    Left = 837
    Top = 136
    Width = 16
    Height = 21
    Associate = Edit9
    Max = 30
    TabOrder = 13
    OnChanging = UpDown1Changing
  end
  object Button2: TButton
    Left = 801
    Top = 583
    Width = 152
    Height = 25
    Caption = #28165#38500#24182#37325#26032#29983#25104#25253#20215#21333
    TabOrder = 14
    OnClick = Button2Click
  end
  object Edit10: TEdit
    Left = 32
    Top = 583
    Width = 745
    Height = 25
    AutoSize = False
    TabOrder = 15
    OnKeyDown = Edit10KeyDown
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 640
    Top = 336
  end
  object PopupMenu1: TPopupMenu
    Left = 576
    Top = 272
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
      OnClick = N1Click
    end
    object EXECL1: TMenuItem
      Caption = #23548#20986#21040'EXECL'
      OnClick = EXECL1Click
    end
  end
end
