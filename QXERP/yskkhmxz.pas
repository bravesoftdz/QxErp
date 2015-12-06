unit yskkhmxz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus;

type
  TForm42 = class(TForm)
    StringGrid1: TStringGrid;
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
  Form42: TForm42;
  strYskbh:string;
  strKhmc:string;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses yskjs;

{$R *.dfm}

procedure TForm42.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('�б���û���κ����ݣ�','Ӧ�տʾ������ʾ');
end;

procedure TForm42.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='Ӧ�տ�����';
  stringgrid1.Cells[2,0]:='Ӧ�տ��ջ�';
  stringgrid1.Cells[3,0]:='�ջ�����';
  stringgrid1.Cells[4,0]:='��ע';
  form42.Caption:='Ӧ�տ�ͻ���ϸ��ѯ��'+strKhmc+'��Ӧ�տ��ţ�'+strYskbh;
  try
    with yskjs.Form41.ZStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cs_yskkhmzx_by_yskbh';
      ParamByName('yskbh').Value:=strYskbh;
      open;
      FirstResultSet;
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
      NextResultSet;
      stringgrid1.RowCount:=stringgrid1.RowCount+1;
      stringgrid1.Cells[0,i]:='�ϼ�';
      stringgrid1.Cells[1,i]:=fields[0].AsString;
      stringgrid1.Cells[2,i]:=fields[1].AsString;
      stringgrid1.Cells[3,i]:=fields[2].AsString;
      stringgrid1.Cells[4,i]:=fields[3].AsString;
      i:=i+1;
      stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','Ӧ�տʾ������ʾ');
  end;
end;

end.