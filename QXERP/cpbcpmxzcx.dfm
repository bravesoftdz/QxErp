object Form91: TForm91
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25104#21697#21322#25104#21697#26126#32454#24080#26597#35810
  ClientHeight = 613
  ClientWidth = 1082
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
  object StringGrid2: TStringGrid
    Left = 8
    Top = 8
    Width = 527
    Height = 585
    Align = alCustom
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    ColWidths = (
      56
      80
      77
      83
      192)
  end
  object StringGrid1: TStringGrid
    Left = 538
    Top = 8
    Width = 527
    Height = 585
    Align = alCustom
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    ColWidths = (
      64
      86
      83
      98
      153)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 816
    Top = 432
  end
end
