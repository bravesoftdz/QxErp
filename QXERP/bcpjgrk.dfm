object Form56: TForm56
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22806#24037#21152#20837#24211
  ClientHeight = 621
  ClientWidth = 1043
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
  object Label6: TLabel
    Left = 17
    Top = 26
    Width = 60
    Height = 13
    Caption = #21152#24037#21333#32534#21495
  end
  object Label7: TLabel
    Left = 223
    Top = 26
    Width = 60
    Height = 13
    Caption = #21152#24037#21830#21517#31216
  end
  object Label4: TLabel
    Left = 731
    Top = 26
    Width = 48
    Height = 13
    Caption = #20986#21333#26085#26399
  end
  object Label5: TLabel
    Left = 53
    Top = 71
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object Bevel1: TBevel
    Left = 9
    Top = 116
    Width = 510
    Height = 469
    Shape = bsFrame
    Style = bsRaised
  end
  object Label8: TLabel
    Left = 210
    Top = 108
    Width = 80
    Height = 16
    Caption = #21152#24037#21333#26126#32454
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Bevel2: TBevel
    Left = 556
    Top = 116
    Width = 476
    Height = 469
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 746
    Top = 108
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
  object Label2: TLabel
    Left = 731
    Top = 71
    Width = 48
    Height = 13
    Caption = #20837#24211#26085#26399
  end
  object Label3: TLabel
    Left = 72
    Top = 598
    Width = 804
    Height = 13
    Caption = 
      #27880#65306#22240#20179#20648#29289#21697#28041#21450#20837#24211#21333#20449#24687#21644#20837#24211#20215#26684#65292#25152#20197#25152#26377#23646#20110#20179#20648#29289#21697#30340#20837#24211#24080#38500#20102#36825#37324#20445#23384#20837#24211#20449#24687#20043#22806#65292#36824#38656#35201#22312#20179#24211#31649#29702#20013#25163#24037#36827#34892#26448#26009#29289#36164 +
      #20837#24211#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit4: TEdit
    Left = 83
    Top = 23
    Width = 124
    Height = 21
    TabOrder = 0
    OnKeyDown = Edit4KeyDown
  end
  object Memo1: TMemo
    Left = 83
    Top = 57
    Width = 629
    Height = 45
    ReadOnly = True
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 17
    Top = 126
    Width = 495
    Height = 446
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      47
      73
      122
      73
      64
      64)
  end
  object Edit1: TEdit
    Left = 307
    Top = 23
    Width = 405
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 801
    Top = 23
    Width = 167
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object StringGrid2: TStringGrid
    Left = 564
    Top = 126
    Width = 461
    Height = 446
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 5
    OnSelectCell = StringGrid2SelectCell
    OnSetEditText = StringGrid2SetEditText
    ColWidths = (
      49
      120
      69
      68
      60
      64)
  end
  object Button1: TButton
    Left = 524
    Top = 248
    Width = 26
    Height = 25
    Caption = '+'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 525
    Top = 344
    Width = 26
    Height = 25
    Caption = '-'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 905
    Top = 66
    Width = 97
    Height = 25
    Caption = #20445#23384#20837#24211#20449#24687
    TabOrder = 8
    OnClick = Button3Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 793
    Top = 69
    Width = 97
    Height = 21
    Date = 42357.622556238430000000
    Time = 42357.622556238430000000
    TabOrder = 9
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 375
    Top = 296
  end
  object PopupMenu1: TPopupMenu
    Left = 305
    Top = 232
    object Execl1: TMenuItem
      Caption = #23548#20986#21040'Execl'
    end
  end
end
