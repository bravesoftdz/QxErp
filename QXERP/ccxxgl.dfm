object Form25: TForm25
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20179#20648#20449#24687#31649#29702
  ClientHeight = 612
  ClientWidth = 1042
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1042
    Height = 612
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24211#23384#29289#21697#20449#24687#31649#29702
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 1034
        Height = 584
        ActivePage = TabSheet5
        Align = alClient
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = #26032#22686#29289#21697#20449#24687
          object Label1: TLabel
            Left = 173
            Top = 27
            Width = 48
            Height = 13
            Caption = #29289#21697#32534#21495
          end
          object Label2: TLabel
            Left = 174
            Top = 67
            Width = 48
            Height = 13
            Caption = #29289#21697#21517#31216
          end
          object Label3: TLabel
            Left = 174
            Top = 147
            Width = 48
            Height = 13
            Caption = #29289#21697#31867#22411
          end
          object Label4: TLabel
            Left = 174
            Top = 187
            Width = 48
            Height = 13
            Caption = #20179#24211#32534#21495
          end
          object Label5: TLabel
            Left = 174
            Top = 227
            Width = 48
            Height = 13
            Caption = #36135#26550#32534#21495
          end
          object Label6: TLabel
            Left = 409
            Top = 187
            Width = 3
            Height = 13
          end
          object Label7: TLabel
            Left = 197
            Top = 267
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label16: TLabel
            Left = 240
            Top = 381
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
          object Label65: TLabel
            Left = 174
            Top = 107
            Width = 48
            Height = 13
            Caption = #29289#21697#21333#20301
          end
          object Edit1: TEdit
            Left = 240
            Top = 24
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 0
            TextHint = #22238#36710#33719#21462#32534#21495
            OnKeyDown = Edit1KeyDown
          end
          object Edit2: TEdit
            Left = 240
            Top = 64
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
          end
          object Memo1: TMemo
            Left = 240
            Top = 264
            Width = 393
            Height = 89
            TabOrder = 2
          end
          object Button1: TButton
            Left = 536
            Top = 376
            Width = 97
            Height = 25
            Caption = #20445#23384
            TabOrder = 3
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 409
            Top = 376
            Width = 97
            Height = 25
            Caption = #21462#28040
            TabOrder = 4
          end
          object ComboBox1: TComboBox
            Left = 240
            Top = 184
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 5
            OnDropDown = ComboBox1DropDown
          end
          object ComboBox2: TComboBox
            Left = 240
            Top = 224
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 6
            OnDropDown = ComboBox2DropDown
          end
          object ComboBox3: TComboBox
            Left = 240
            Top = 144
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 7
            OnDropDown = ComboBox3DropDown
          end
          object ComboBox4: TComboBox
            Left = 240
            Top = 104
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 8
            OnDropDown = ComboBox4DropDown
          end
        end
        object TabSheet5: TTabSheet
          Caption = #29289#21697#20449#24687#20462#25913
          ImageIndex = 1
          object Label8: TLabel
            Left = 325
            Top = 35
            Width = 48
            Height = 13
            Caption = #29289#21697#32534#21495
          end
          object Label9: TLabel
            Left = 326
            Top = 75
            Width = 48
            Height = 13
            Caption = #29289#21697#21517#31216
          end
          object Label10: TLabel
            Left = 326
            Top = 115
            Width = 48
            Height = 13
            Caption = #29289#21697#21333#20301
          end
          object Label11: TLabel
            Left = 326
            Top = 155
            Width = 48
            Height = 13
            Caption = #29289#21697#31867#22411
          end
          object Label12: TLabel
            Left = 326
            Top = 195
            Width = 48
            Height = 13
            Caption = #20179#24211#32534#21495
          end
          object Label13: TLabel
            Left = 326
            Top = 235
            Width = 48
            Height = 13
            Caption = #36135#26550#32534#21495
          end
          object Label14: TLabel
            Left = 349
            Top = 275
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label15: TLabel
            Left = 528
            Top = 35
            Width = 130
            Height = 13
            Caption = #27169#31946#26597#35810','#36755#20837'*'#34920#31034#20840#37096
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ListBox1: TListBox
            Left = 0
            Top = 0
            Width = 241
            Height = 556
            Align = alLeft
            ItemHeight = 13
            TabOrder = 0
            OnClick = ListBox1Click
          end
          object Edit7: TEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
            TextHint = #36755#20837#20851#38190#23383#21518#22238#36710
            OnKeyDown = Edit7KeyDown
          end
          object Button3: TButton
            Left = 688
            Top = 383
            Width = 97
            Height = 25
            Caption = #20445#23384#20462#25913
            TabOrder = 2
          end
          object Button4: TButton
            Left = 561
            Top = 383
            Width = 104
            Height = 25
            Caption = #21462#28040
            TabOrder = 3
          end
          object Edit5: TEdit
            Left = 392
            Top = 72
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 4
          end
          object ComboBox6: TComboBox
            Left = 392
            Top = 112
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 5
            OnDropDown = ComboBox6DropDown
          end
          object ComboBox7: TComboBox
            Left = 392
            Top = 152
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 6
            OnDropDown = ComboBox7DropDown
          end
          object ComboBox8: TComboBox
            Left = 392
            Top = 192
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 7
            OnDropDown = ComboBox8DropDown
          end
          object ComboBox9: TComboBox
            Left = 392
            Top = 232
            Width = 201
            Height = 21
            Color = clMoneyGreen
            TabOrder = 8
            OnDropDown = ComboBox9DropDown
          end
          object Memo2: TMemo
            Left = 392
            Top = 272
            Width = 393
            Height = 89
            TabOrder = 9
          end
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = #29289#21697#31867#22411#31649#29702
      ImageIndex = 3
      object PageControl5: TPageControl
        Left = 0
        Top = 0
        Width = 1034
        Height = 584
        ActivePage = TabSheet12
        Align = alClient
        TabOrder = 0
        object TabSheet11: TTabSheet
          Caption = #26032#22686#29289#21697#31867#22411
          object Label49: TLabel
            Left = 162
            Top = 27
            Width = 72
            Height = 13
            Caption = #29289#21697#31867#22411#32534#21495
          end
          object Label50: TLabel
            Left = 162
            Top = 67
            Width = 72
            Height = 13
            Caption = #29289#21697#31867#22411#21517#31216
          end
          object Label55: TLabel
            Left = 210
            Top = 107
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label56: TLabel
            Left = 240
            Top = 221
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
          object Edit3: TEdit
            Left = 240
            Top = 24
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 0
            TextHint = #22238#36710#33719#21462#32534#21495
            OnKeyDown = Edit3KeyDown
          end
          object Edit4: TEdit
            Left = 240
            Top = 64
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
          end
          object Memo7: TMemo
            Left = 240
            Top = 104
            Width = 393
            Height = 89
            TabOrder = 2
          end
          object Button13: TButton
            Left = 536
            Top = 216
            Width = 97
            Height = 25
            Caption = #20445#23384
            TabOrder = 3
            OnClick = Button13Click
          end
          object Button14: TButton
            Left = 409
            Top = 216
            Width = 97
            Height = 25
            Caption = #21462#28040
            TabOrder = 4
          end
        end
        object TabSheet12: TTabSheet
          Caption = #29289#21697#31867#22411#20462#25913
          ImageIndex = 1
          object Label64: TLabel
            Left = 528
            Top = 35
            Width = 130
            Height = 13
            Caption = #27169#31946#26597#35810','#36755#20837'*'#34920#31034#20840#37096
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 314
            Top = 35
            Width = 72
            Height = 13
            Caption = #29289#21697#31867#22411#32534#21495
          end
          object Label20: TLabel
            Left = 314
            Top = 75
            Width = 72
            Height = 13
            Caption = #29289#21697#31867#22411#21517#31216
          end
          object Label21: TLabel
            Left = 362
            Top = 115
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object ListBox4: TListBox
            Left = 0
            Top = 0
            Width = 241
            Height = 556
            Align = alLeft
            ItemHeight = 13
            TabOrder = 0
            OnClick = ListBox4Click
          end
          object Edit39: TEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
            TextHint = #36755#20837#20851#38190#23383#21518#22238#36710
            OnKeyDown = Edit39KeyDown
          end
          object Button15: TButton
            Left = 688
            Top = 343
            Width = 97
            Height = 25
            Caption = #20445#23384#20462#25913
            TabOrder = 2
          end
          object Button16: TButton
            Left = 561
            Top = 343
            Width = 104
            Height = 25
            Caption = #21462#28040
            TabOrder = 3
          end
          object Edit6: TEdit
            Left = 392
            Top = 72
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 4
          end
          object Memo8: TMemo
            Left = 392
            Top = 112
            Width = 393
            Height = 89
            TabOrder = 5
          end
        end
      end
    end
    object TabSheet13: TTabSheet
      Caption = #29289#21697#21333#20301#20449#24687#31649#29702
      ImageIndex = 4
      object PageControl6: TPageControl
        Left = 0
        Top = 0
        Width = 1034
        Height = 584
        ActivePage = TabSheet15
        Align = alClient
        TabOrder = 0
        object TabSheet14: TTabSheet
          Caption = #26032#22686#29289#21697#21333#20301
          object Label66: TLabel
            Left = 173
            Top = 27
            Width = 48
            Height = 13
            Caption = #21333#20301#32534#21495
          end
          object Label67: TLabel
            Left = 174
            Top = 67
            Width = 48
            Height = 13
            Caption = #21333#20301#21517#31216
          end
          object Label71: TLabel
            Left = 409
            Top = 187
            Width = 3
            Height = 13
          end
          object Label72: TLabel
            Left = 197
            Top = 107
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label73: TLabel
            Left = 240
            Top = 221
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
          object Edit45: TEdit
            Left = 240
            Top = 24
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 0
            TextHint = #22238#36710#33719#21462#32534#21495
            OnKeyDown = Edit45KeyDown
          end
          object Edit46: TEdit
            Left = 240
            Top = 64
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
          end
          object Memo9: TMemo
            Left = 240
            Top = 104
            Width = 393
            Height = 89
            TabOrder = 2
          end
          object Button17: TButton
            Left = 536
            Top = 216
            Width = 97
            Height = 25
            Caption = #20445#23384
            TabOrder = 3
            OnClick = Button17Click
          end
          object Button18: TButton
            Left = 409
            Top = 216
            Width = 97
            Height = 25
            Caption = #21462#28040
            TabOrder = 4
          end
        end
        object TabSheet15: TTabSheet
          Caption = #29289#21697#21333#20301#20449#24687#20462#25913
          ImageIndex = 1
          object Label22: TLabel
            Left = 325
            Top = 35
            Width = 48
            Height = 13
            Caption = #21333#20301#32534#21495
          end
          object Label35: TLabel
            Left = 326
            Top = 75
            Width = 48
            Height = 13
            Caption = #21333#20301#21517#31216
          end
          object Label36: TLabel
            Left = 349
            Top = 115
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label37: TLabel
            Left = 528
            Top = 35
            Width = 130
            Height = 13
            Caption = #27169#31946#26597#35810','#36755#20837'*'#34920#31034#20840#37096
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ListBox5: TListBox
            Left = 0
            Top = 0
            Width = 241
            Height = 556
            Align = alLeft
            ItemHeight = 13
            TabOrder = 0
            OnClick = ListBox5Click
          end
          object Edit47: TEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
            TextHint = #36755#20837#20851#38190#23383#21518#22238#36710
            OnKeyDown = Edit47KeyDown
          end
          object Button19: TButton
            Left = 688
            Top = 343
            Width = 97
            Height = 25
            Caption = #20445#23384#20462#25913
            TabOrder = 2
          end
          object Button20: TButton
            Left = 561
            Top = 343
            Width = 104
            Height = 25
            Caption = #21462#28040
            TabOrder = 3
          end
          object Edit8: TEdit
            Left = 392
            Top = 72
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 4
          end
          object Memo10: TMemo
            Left = 392
            Top = 112
            Width = 393
            Height = 89
            TabOrder = 5
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20179#24211#20449#24687#31649#29702
      ImageIndex = 1
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 1034
        Height = 584
        ActivePage = TabSheet7
        Align = alClient
        TabOrder = 0
        object TabSheet6: TTabSheet
          Caption = #26032#22686#20179#24211#20449#24687
          object Label17: TLabel
            Left = 173
            Top = 27
            Width = 48
            Height = 13
            Caption = #20179#24211#32534#21495
          end
          object Label18: TLabel
            Left = 174
            Top = 67
            Width = 48
            Height = 13
            Caption = #20179#24211#21517#31216
          end
          object Label23: TLabel
            Left = 198
            Top = 107
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label24: TLabel
            Left = 240
            Top = 221
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
          object Edit13: TEdit
            Left = 240
            Top = 24
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 0
            TextHint = #22238#36710#33719#21462#32534#21495
            OnKeyDown = Edit13KeyDown
          end
          object Edit14: TEdit
            Left = 240
            Top = 64
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
          end
          object Memo3: TMemo
            Left = 240
            Top = 104
            Width = 393
            Height = 89
            TabOrder = 2
          end
          object Button5: TButton
            Left = 536
            Top = 216
            Width = 97
            Height = 25
            Caption = #20445#23384
            TabOrder = 3
            OnClick = Button5Click
          end
          object Button6: TButton
            Left = 409
            Top = 216
            Width = 97
            Height = 25
            Caption = #21462#28040
            TabOrder = 4
          end
        end
        object TabSheet7: TTabSheet
          Caption = #20179#24211#20449#24687#20462#25913
          ImageIndex = 1
          ExplicitLeft = 0
          object Label25: TLabel
            Left = 325
            Top = 35
            Width = 48
            Height = 13
            Caption = #20179#24211#32534#21495
          end
          object Label26: TLabel
            Left = 326
            Top = 75
            Width = 48
            Height = 13
            Caption = #20179#24211#21517#31216
          end
          object Label27: TLabel
            Left = 350
            Top = 115
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label32: TLabel
            Left = 528
            Top = 35
            Width = 130
            Height = 13
            Caption = #27169#31946#26597#35810','#36755#20837'*'#34920#31034#20840#37096
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ListBox2: TListBox
            Left = 0
            Top = 0
            Width = 241
            Height = 556
            Align = alLeft
            ItemHeight = 13
            TabOrder = 0
            OnClick = ListBox2Click
          end
          object Edit19: TEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
            TextHint = #36755#20837#20851#38190#23383#21518#22238#36710
            OnKeyDown = Edit19KeyDown
          end
          object Button7: TButton
            Left = 688
            Top = 343
            Width = 97
            Height = 25
            Caption = #20445#23384#20462#25913
            TabOrder = 2
          end
          object Button8: TButton
            Left = 561
            Top = 343
            Width = 104
            Height = 25
            Caption = #21462#28040
            TabOrder = 3
          end
          object Edit9: TEdit
            Left = 392
            Top = 72
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 4
          end
          object Memo4: TMemo
            Left = 392
            Top = 112
            Width = 393
            Height = 89
            TabOrder = 5
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #36135#26550#20449#24687#31649#29702
      ImageIndex = 2
      object PageControl4: TPageControl
        Left = 0
        Top = 0
        Width = 1034
        Height = 584
        ActivePage = TabSheet9
        Align = alClient
        TabOrder = 0
        object TabSheet8: TTabSheet
          Caption = #26032#22686#36135#26550#20449#24687
          ExplicitLeft = 0
          object Label33: TLabel
            Left = 173
            Top = 27
            Width = 48
            Height = 13
            Caption = #36135#26550#32534#21495
          end
          object Label34: TLabel
            Left = 173
            Top = 67
            Width = 48
            Height = 13
            Caption = #36135#26550#21517#31216
          end
          object Label38: TLabel
            Left = 173
            Top = 107
            Width = 48
            Height = 13
            Caption = #20179#24211#32534#21495
          end
          object Label39: TLabel
            Left = 197
            Top = 150
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label40: TLabel
            Left = 240
            Top = 264
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
          object Edit25: TEdit
            Left = 240
            Top = 24
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 0
            TextHint = #22238#36710#33719#21462#32534#21495
            OnKeyDown = Edit25KeyDown
          end
          object Edit26: TEdit
            Left = 240
            Top = 64
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
          end
          object Memo5: TMemo
            Left = 240
            Top = 147
            Width = 393
            Height = 89
            TabOrder = 2
          end
          object Button9: TButton
            Left = 536
            Top = 259
            Width = 97
            Height = 25
            Caption = #20445#23384
            TabOrder = 3
            OnClick = Button9Click
          end
          object Button10: TButton
            Left = 409
            Top = 259
            Width = 97
            Height = 25
            Caption = #21462#28040
            TabOrder = 4
          end
          object ComboBox5: TComboBox
            Left = 240
            Top = 104
            Width = 177
            Height = 21
            Color = clMoneyGreen
            TabOrder = 5
            OnDropDown = ComboBox5DropDown
          end
        end
        object TabSheet9: TTabSheet
          Caption = #36135#26550#20449#24687#20462#25913
          ImageIndex = 1
          object Label28: TLabel
            Left = 325
            Top = 35
            Width = 48
            Height = 13
            Caption = #36135#26550#32534#21495
          end
          object Label29: TLabel
            Left = 325
            Top = 75
            Width = 48
            Height = 13
            Caption = #36135#26550#21517#31216
          end
          object Label30: TLabel
            Left = 325
            Top = 115
            Width = 48
            Height = 13
            Caption = #20179#24211#32534#21495
          end
          object Label31: TLabel
            Left = 349
            Top = 158
            Width = 24
            Height = 13
            Caption = #22791#27880
          end
          object Label41: TLabel
            Left = 528
            Top = 35
            Width = 130
            Height = 13
            Caption = #27169#31946#26597#35810','#36755#20837'*'#34920#31034#20840#37096
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ListBox3: TListBox
            Left = 0
            Top = 0
            Width = 241
            Height = 556
            Align = alLeft
            ItemHeight = 13
            TabOrder = 0
            OnClick = ListBox3Click
          end
          object Edit31: TEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Color = clMoneyGreen
            TabOrder = 1
            TextHint = #36755#20837#20851#38190#23383#21518#22238#36710
            OnKeyDown = Edit31KeyDown
          end
          object Button11: TButton
            Left = 688
            Top = 343
            Width = 97
            Height = 25
            Caption = #20445#23384#20462#25913
            TabOrder = 2
          end
          object Button12: TButton
            Left = 561
            Top = 343
            Width = 104
            Height = 25
            Caption = #21462#28040
            TabOrder = 3
          end
          object Edit10: TEdit
            Left = 392
            Top = 72
            Width = 393
            Height = 21
            Color = clMoneyGreen
            TabOrder = 4
          end
          object ComboBox10: TComboBox
            Left = 392
            Top = 112
            Width = 177
            Height = 21
            Color = clMoneyGreen
            TabOrder = 5
            OnDropDown = ComboBox10DropDown
          end
          object Memo6: TMemo
            Left = 392
            Top = 155
            Width = 393
            Height = 89
            TabOrder = 6
          end
        end
      end
    end
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 712
    Top = 184
  end
end
