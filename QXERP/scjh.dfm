object Form17: TForm17
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #29983#20135#35745#21010#21333#26597#35810
  ClientHeight = 639
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 926
    Height = 639
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1059
    object TabSheet3: TTabSheet
      Caption = #29983#20135#35745#21010#26597#35810
      ImageIndex = 2
      ExplicitWidth = 1051
      object Label12: TLabel
        Left = 21
        Top = 22
        Width = 65
        Height = 18
        AutoSize = False
        Caption = #39033#30446#21517#31216
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 56
        Width = 921
        Height = 193
        Align = alCustom
        ColCount = 8
        DefaultColWidth = 200
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          57
          85
          301
          72
          70
          73
          72
          146)
      end
      object Button6: TButton
        Left = 521
        Top = 17
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 1
        OnClick = Button6Click
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 255
        Width = 918
        Height = 356
        Align = alBottom
        ColCount = 9
        TabOrder = 2
        ExplicitWidth = 945
        ColWidths = (
          64
          88
          93
          135
          105
          103
          108
          93
          83)
      end
      object Button8: TButton
        Left = 624
        Top = 17
        Width = 91
        Height = 25
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 3
      end
      object RadioGroup1: TRadioGroup
        Left = 732
        Top = 13
        Width = 165
        Height = 37
        Caption = #23548#20986#34920#36873#25321
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #34920#19968
          #34920#20108
          #20840#37096)
        TabOrder = 4
      end
      object ComboBox1: TComboBox
        Left = 92
        Top = 19
        Width = 405
        Height = 21
        TabOrder = 5
        OnKeyDown = ComboBox1KeyDown
      end
    end
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 640
    Top = 344
  end
end
