unit crkdinfomxzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, Menus;

type
  TForm46 = class(TForm)
    ZStoredProc1: TZStoredProc;
    StringGrid1: TStringGrid;
    Memo2: TMemo;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form46: TForm46;
  strCrkdBh:string;
  strIsCrk:string;
  strCrkDate:string;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm46.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('�б���û���κ����ݣ�','�������Ϣ������ʾ');
end;

procedure TForm46.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ����';
  stringgrid1.Cells[4,0]:='��ע';
  if strIsCrk='rk' then
  begin
    stringgrid1.Cells[2,0]:='�������';
    stringgrid1.Cells[3,0]:='����';
    form46.Caption:='���������ϸ��ѯ ��ⵥ��š�'+strCrkdBh+'���������:'+strCrkDate;
  end else
  begin
    stringgrid1.Cells[2,0]:='��������';
    stringgrid1.Cells[3,0]:=' ';
    form46.Caption:='���������ϸ��ѯ ���ⵥ��š�'+strCrkdBh+'����������:'+strCrkDate;
  end;
  memo2.Lines.Clear;
  try
    with ZStoredProc1 do
    begin
      close;
        StoredProcName:='proc_cx_crkd_info_mxz_by_crkbh';
        ParamByName('crkdbh').Value:=strCrkdBh;
        ParamByName('crkdm').Value:=strIsCrk;
      open;
      FirstResultSet;
      if not eof then
        memo2.Lines.Add(fields[0].AsString);
      NextResultSet;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','����ⵥ��Ϣ����ϸ��ѯ��ʾ');
  end;
end;

end.