object Form7: TForm7
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24212#25910#27454#26597#35810
  ClientHeight = 695
  ClientWidth = 1091
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
    Width = 1091
    Height = 695
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24212#25910#27454#26597#35810
      object Label2: TLabel
        Left = 112
        Top = 27
        Width = 12
        Height = 13
        Caption = #33258
      end
      object Label3: TLabel
        Left = 247
        Top = 27
        Width = 12
        Height = 13
        Caption = #33267
      end
      object Label1: TLabel
        Left = 400
        Top = 27
        Width = 36
        Height = 13
        Caption = #38144#21806#21592
      end
      object DateTimePicker1: TDateTimePicker
        Left = 136
        Top = 24
        Width = 105
        Height = 21
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 274
        Top = 24
        Width = 103
        Height = 21
        Date = 42187.350101030090000000
        Time = 42187.350101030090000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
      end
      object Button1: TButton
        Left = 640
        Top = 22
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = Button1Click
      end
      object StringGrid1: TStringGrid
        Left = 3
        Top = 64
        Width = 1077
        Height = 298
        Align = alCustom
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 3
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          74
          450
          323
          104
          115)
      end
      object StringGrid2: TStringGrid
        Left = 3
        Top = 368
        Width = 1077
        Height = 296
        Align = alCustom
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 4
        ColWidths = (
          77
          142
          155
          159
          289)
      end
      object ComboBox1: TComboBox
        Left = 456
        Top = 24
        Width = 161
        Height = 21
        TabOrder = 5
        Text = '*|'#20840#37096
        OnDropDown = ComboBox1DropDown
      end
      object Button5: TButton
        Left = 736
        Top = 22
        Width = 91
        Height = 25
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 6
        OnClick = Button5Click
      end
      object RadioGroup1: TRadioGroup
        Left = 848
        Top = 3
        Width = 225
        Height = 55
        Caption = #23548#20986#34920#36873#25321
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #34920#19968
          #34920#20108
          #20840#37096)
        TabOrder = 7
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25353#21608#32479#35745
      ImageIndex = 1
      object DateTimePicker3: TDateTimePicker
        Left = 136
        Top = 24
        Width = 186
        Height = 21
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button2: TButton
        Left = 360
        Top = 24
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 1
      end
      object StringGrid3: TStringGrid
        Left = 3
        Top = 77
        Width = 529
        Height = 585
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 2
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object StringGrid4: TStringGrid
        Left = 552
        Top = 77
        Width = 527
        Height = 585
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 3
        ColWidths = (
          64
          99
          106
          104
          115)
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25353#26376#32479#35745
      ImageIndex = 2
      object DateTimePicker4: TDateTimePicker
        Left = 136
        Top = 24
        Width = 186
        Height = 21
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button3: TButton
        Left = 360
        Top = 24
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 1
      end
      object StringGrid5: TStringGrid
        Left = 3
        Top = 77
        Width = 529
        Height = 585
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 2
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object StringGrid6: TStringGrid
        Left = 552
        Top = 77
        Width = 527
        Height = 585
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 3
        ColWidths = (
          64
          99
          106
          104
          115)
      end
    end
    object TabSheet4: TTabSheet
      Caption = #25353#24180#32479#35745
      ImageIndex = 3
      object DateTimePicker5: TDateTimePicker
        Left = 136
        Top = 24
        Width = 186
        Height = 21
        Date = 42187.350045567130000000
        Time = 42187.350045567130000000
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 0
      end
      object Button4: TButton
        Left = 360
        Top = 24
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 1
      end
      object StringGrid7: TStringGrid
        Left = 3
        Top = 77
        Width = 529
        Height = 585
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 2
        ColWidths = (
          64
          99
          106
          104
          115)
      end
      object StringGrid8: TStringGrid
        Left = 552
        Top = 77
        Width = 527
        Height = 585
        Align = alCustom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 3
        ColWidths = (
          64
          99
          106
          104
          115)
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 40
    Top = 616
  end
end
