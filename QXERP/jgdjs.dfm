object Form57: TForm57
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21152#24037#21333#32467#26463#22788#29702
  ClientHeight = 430
  ClientWidth = 523
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
    Width = 523
    Height = 361
    Align = alTop
    RowCount = 2
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      103
      127
      103
      84)
  end
  object Button1: TButton
    Left = 184
    Top = 379
    Width = 139
    Height = 25
    Caption = #25209#37327#22788#29702#24050#32467#26463#21152#24037#21333
    TabOrder = 1
    OnClick = Button1Click
  end
  object ZStoredProc1: TZStoredProc
    Connection = Form1.ZConnection1
    Params = <>
    Left = 144
    Top = 104
  end
end
