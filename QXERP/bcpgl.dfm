object Form12: TForm12
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21322#25104#21697#31649#29702
  ClientHeight = 681
  ClientWidth = 1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1084
    Height = 681
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #21322#25104#21697#20837#24211
      object Label7: TLabel
        Left = 248
        Top = 349
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
        Left = 113
        Top = 120
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21322#20135#21697#32534#21495
      end
      object Label2: TLabel
        Left = 104
        Top = 176
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20837#24211#25968#37327
      end
      object Label3: TLabel
        Left = 113
        Top = 232
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35760#24080#26085#26399
      end
      object Label4: TLabel
        Left = 113
        Top = 288
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label30: TLabel
        Left = 481
        Top = 48
        Width = 72
        Height = 13
        Caption = #36755#20837#26597#35810#21517#31216
        Visible = False
      end
      object Label5: TLabel
        Left = 391
        Top = 120
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
      object Label6: TLabel
        Left = 391
        Top = 176
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
      object Button1: TButton
        Left = 159
        Top = 401
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 278
        Top = 401
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 208
        Top = 117
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 208
        Top = 173
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 208
        Top = 285
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 4
      end
      object Edit16: TEdit
        Left = 559
        Top = 45
        Width = 169
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 5
        Visible = False
        OnChange = Edit16Change
      end
      object StringGrid4: TStringGrid
        Left = 559
        Top = 72
        Width = 426
        Height = 354
        ColCount = 4
        FixedCols = 0
        TabOrder = 6
        Visible = False
        OnSelectCell = StringGrid4SelectCell
        ColWidths = (
          97
          98
          100
          96)
      end
      object Button7: TButton
        Left = 398
        Top = 401
        Width = 97
        Height = 25
        Caption = #32534#21495#36741#21161#26597#35810'>>'
        TabOrder = 7
        OnClick = Button7Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 208
        Top = 227
        Width = 177
        Height = 21
        Date = 42180.606373275460000000
        Time = 42180.606373275460000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21322#25104#21697#20986#24211
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label8: TLabel
        Left = 113
        Top = 120
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20135#21697#32534#21495
      end
      object Label9: TLabel
        Left = 391
        Top = 120
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
      object Label10: TLabel
        Left = 391
        Top = 176
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
      object Label11: TLabel
        Left = 104
        Top = 176
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20986#24211#25968#37327
      end
      object Label13: TLabel
        Left = 113
        Top = 232
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35760#24080#26085#26399
      end
      object Label14: TLabel
        Left = 113
        Top = 288
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22791#27880
      end
      object Label15: TLabel
        Left = 248
        Top = 349
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
      object Label16: TLabel
        Left = 481
        Top = 48
        Width = 72
        Height = 13
        Caption = #36755#20837#26597#35810#21517#31216
        Visible = False
      end
      object Edit3: TEdit
        Left = 208
        Top = 117
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Edit5: TEdit
        Left = 208
        Top = 173
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object DateTimePicker2: TDateTimePicker
        Left = 208
        Top = 227
        Width = 177
        Height = 21
        Date = 42180.606373275460000000
        Time = 42180.606373275460000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 208
        Top = 285
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 3
      end
      object Button3: TButton
        Left = 159
        Top = 401
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 278
        Top = 401
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 5
      end
      object Button5: TButton
        Left = 398
        Top = 401
        Width = 97
        Height = 25
        Caption = #32534#21495#36741#21161#26597#35810'>>'
        TabOrder = 6
        OnClick = Button5Click
      end
      object StringGrid3: TStringGrid
        Left = 559
        Top = 72
        Width = 426
        Height = 354
        ColCount = 3
        FixedCols = 0
        TabOrder = 7
        Visible = False
        OnSelectCell = StringGrid3SelectCell
      end
      object Edit7: TEdit
        Left = 559
        Top = 45
        Width = 169
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 8
        Visible = False
        OnChange = Edit7Change
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21322#25104#21697#24211#23384#26597#35810
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
        Width = 1073
        Height = 254
        Align = alCustom
        ColCount = 9
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
        Top = 301
        Width = 513
        Height = 340
        Align = alCustom
        ColCount = 4
        TabOrder = 3
        OnSelectCell = StringGrid2SelectCell
        ColWidths = (
          64
          82
          88
          64)
      end
      object StringGrid7: TStringGrid
        Left = 519
        Top = 301
        Width = 546
        Height = 340
        Align = alCustom
        TabOrder = 4
        ColWidths = (
          64
          82
          88
          92
          89)
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 136
    Top = 56
  end
end
