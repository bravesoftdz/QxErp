object Form10: TForm10
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #30331#24405
  ClientHeight = 168
  ClientWidth = 425
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
  object Label1: TLabel
    Left = 99
    Top = 32
    Width = 36
    Height = 13
    Caption = #29992#25143#21517
  end
  object Label2: TLabel
    Left = 99
    Top = 72
    Width = 36
    Height = 13
    Caption = #23494'    '#30721
  end
  object Edit1: TEdit
    Left = 167
    Top = 29
    Width = 153
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 167
    Top = 69
    Width = 153
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 164
    Top = 112
    Width = 69
    Height = 25
    Caption = #30331#24405
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 252
    Top = 112
    Width = 68
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 16
    Top = 8
  end
end
