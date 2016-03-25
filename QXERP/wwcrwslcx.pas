unit wwcrwslcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, Menus;

type
  TForm96 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
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
  Form96: TForm96;

implementation

uses main;

{$R *.dfm}

procedure TForm96.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('�б���û���κ����ݣ�','δ���������ƻ�����������ϸ��ѯ');
end;

procedure TForm96.FormShow(Sender: TObject);
var
  i:integer;
begin         //proc_cx_renwudan_isend
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ���';
  stringgrid1.Cells[2,0]:='��Ʒ����';
  stringgrid1.Cells[3,0]:='��Ʒ����';
  stringgrid1.Cells[4,0]:='��ͬ������';
  stringgrid1.Cells[5,0]:='δ�¼ƻ���';

  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_wwcrwls';
      open;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('��ѯ����ʧ�ܣ�','δ���������ƻ�����������ϸ��ѯ��ʾ');
  end;
end;

end.