object from9: Tfrom9
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #25104#21697#24211#23384#26597#35810
  ClientHeight = 704
  ClientWidth = 977
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
    Width = 977
    Height = 704
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1089
    object TabSheet3: TTabSheet
      Caption = #24211#23384#26597#35810
      ImageIndex = 2
      ExplicitWidth = 1081
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
        Top = 59
        Width = 969
        Height = 255
        Align = alCustom
        ColCount = 6
        DefaultColWidth = 200
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 0
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          80
          136
          135
          142
          125
          294)
      end
      object Edit9: TEdit
        Left = 116
        Top = 19
        Width = 365
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
        TabOrder = 1
        TextHint = #26597#35810#20840#37096#24211#23384#26102#65292#35831#23558#22788#27492#20445#30041#31354#30333
        OnChange = Edit9Change
      end
      object Button6: TButton
        Left = 513
        Top = 17
        Width = 75
        Height = 25
        Caption = #26597#35810#20840#37096
        TabOrder = 2
        OnClick = Button6Click
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 320
        Width = 969
        Height = 356
        Align = alBottom
        TabOrder = 3
        ColWidths = (
          64
          118
          117
          122
          487)
      end
      object Button8: TButton
        Left = 624
        Top = 17
        Width = 91
        Height = 25
        Caption = #23548#20986#21040'EXECL'
        TabOrder = 4
        OnClick = Button8Click
      end
      object RadioGroup1: TRadioGroup
        Left = 744
        Top = -2
        Width = 225
        Height = 55
        Caption = #23548#20986#34920#36873#25321
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #34920#19968
          #34920#20108
          #20840#37096)
        TabOrder = 5
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    Params = <>
    Left = 576
    Top = 232
  end
end
