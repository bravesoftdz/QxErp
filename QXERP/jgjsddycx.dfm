object Form82: TForm82
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22806#21327#21152#24037#32467#31639#21333#25171#21360#26597#35810'('#21452#20987#35760#24405#34892','#36827#20837#25171#21360#30028#38754')'
  ClientHeight = 520
  ClientWidth = 1050
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
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 1050
    Height = 520
    Align = alClient
    ColCount = 9
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      47
      76
      212
      82
      187
      66
      87
      71
      208)
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 536
    Top = 288
  end
end
