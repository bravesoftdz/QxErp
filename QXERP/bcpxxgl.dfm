object Form11: TForm11
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21322#25104#21697#20449#24687#31649#29702
  ClientHeight = 646
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1056
    Height = 646
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #26032#22686#21322#25104#21697#20449#24687
      object Label6: TLabel
        Left = 398
        Top = 125
        Width = 6
        Height = 13
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 215
        Top = 261
        Width = 57
        Height = 13
        Caption = '* '#20026#24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel
        Left = 120
        Top = 80
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#32534#21495
      end
      object Label2: TLabel
        Left = 112
        Top = 117
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#35268#26684
      end
      object Label3: TLabel
        Left = 120
        Top = 152
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867
      end
      object Label4: TLabel
        Left = 120
        Top = 187
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25152#23646#20135#21697#32534#21495
      end
      object Label13: TLabel
        Left = 120
        Top = 224
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label25: TLabel
        Left = 398
        Top = 157
        Width = 6
        Height = 13
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label26: TLabel
        Left = 398
        Top = 192
        Width = 6
        Height = 13
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label30: TLabel
        Left = 585
        Top = 80
        Width = 72
        Height = 13
        Caption = #36755#20837#26597#35810#21517#31216
      end
      object Button1: TButton
        Left = 176
        Top = 353
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 278
        Top = 353
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 216
        Top = 77
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 215
        Top = 114
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Edit10: TEdit
        Left = 215
        Top = 221
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 5
      end
      object ComboBox2: TComboBox
        Left = 216
        Top = 149
        Width = 176
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 4
        OnDropDown = ComboBox2DropDown
      end
      object Edit7: TEdit
        Left = 216
        Top = 184
        Width = 176
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 6
      end
      object Button11: TButton
        Left = 382
        Top = 353
        Width = 97
        Height = 25
        Caption = #32534#21495#36741#21161#26597#35810'>>'
        TabOrder = 7
        Visible = False
        OnClick = Button11Click
      end
      object Edit16: TEdit
        Left = 663
        Top = 77
        Width = 169
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
        OnChange = Edit16Change
      end
      object StringGrid4: TStringGrid
        Left = 585
        Top = 104
        Width = 384
        Height = 282
        ColCount = 3
        FixedCols = 0
        TabOrder = 9
        OnSelectCell = StringGrid4SelectCell
        ColWidths = (
          89
          93
          90)
      end
      object Button12: TButton
        Left = 424
        Top = 75
        Width = 89
        Height = 25
        Caption = #33719#21462#26032#22686#32534#21495
        TabOrder = 10
        OnClick = Button12Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21322#25104#21697#24211#23384#26597#35810
      ImageIndex = 2
      object Label12: TLabel
        Left = 45
        Top = 24
        Width = 65
        Height = 18
        AutoSize = False
        Caption = #20135#21697#35268#26684
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 48
        Width = 1041
        Height = 189
        Align = alCustom
        ColCount = 6
        DefaultColWidth = 200
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid1SelectCell
      end
      object Edit9: TEdit
        Left = 116
        Top = 19
        Width = 365
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button6: TButton
        Left = 497
        Top = 17
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = Button6Click
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 290
        Width = 1048
        Height = 328
        Align = alBottom
        ColCount = 3
        TabOrder = 3
      end
    end
    object TabSheet4: TTabSheet
      Caption = #26032#22686#21322#25104#21697#31181#31867
      ImageIndex = 3
      object Label10: TLabel
        Left = 192
        Top = 128
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#32534#21495
      end
      object Label11: TLabel
        Left = 192
        Top = 181
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#21517#31216
      end
      object Label15: TLabel
        Left = 200
        Top = 232
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22791#27880
      end
      object Label16: TLabel
        Left = 296
        Top = 269
        Width = 57
        Height = 13
        Caption = '* '#20026#24517#22635#39033
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 478
        Top = 181
        Width = 6
        Height = 13
        Caption = '*'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Edit8: TEdit
        Left = 296
        Top = 125
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 0
      end
      object Edit11: TEdit
        Left = 295
        Top = 178
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Edit12: TEdit
        Left = 296
        Top = 229
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Button3: TButton
        Left = 296
        Top = 312
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 398
        Top = 312
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 4
      end
      object Button10: TButton
        Left = 528
        Top = 123
        Width = 129
        Height = 25
        Caption = #33719#21462#26032#22686#32534#21495
        TabOrder = 5
        OnClick = Button10Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21322#25104#21697#31181#31867#20462#25913
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label5: TLabel
        Left = 432
        Top = 78
        Width = 48
        Height = 13
        Caption = #27169#31946#26597#35810
      end
      object Label8: TLabel
        Left = 400
        Top = 144
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#32534#21495
      end
      object Label9: TLabel
        Left = 400
        Top = 197
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#25104#21697#31181#31867#21517#31216
      end
      object Label14: TLabel
        Left = 408
        Top = 248
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#22791#27880
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 249
        Height = 618
        Align = alLeft
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object Edit3: TEdit
        Left = 504
        Top = 75
        Width = 176
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button5: TButton
        Left = 704
        Top = 73
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = Button5Click
      end
      object CheckBox1: TCheckBox
        Left = 704
        Top = 196
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 704
        Top = 247
        Width = 97
        Height = 17
        Caption = #20462#25913
        TabOrder = 4
        OnClick = CheckBox2Click
      end
      object Button7: TButton
        Left = 464
        Top = 392
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 672
        Top = 392
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 6
      end
      object Edit4: TEdit
        Left = 504
        Top = 141
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 7
      end
      object Edit5: TEdit
        Left = 503
        Top = 194
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 8
      end
      object Edit6: TEdit
        Left = 504
        Top = 245
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        ReadOnly = True
        TabOrder = 9
      end
      object Button9: TButton
        Left = 567
        Top = 392
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 10
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 832
    Top = 512
  end
end
