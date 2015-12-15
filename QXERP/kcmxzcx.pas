unit kcmxzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  Menus;

type
  TForm45 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form45: TForm45;
  strCkItemBh:string;
  strCkItemmc:string;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main,crkdinfomxzcx;

{$R *.dfm}

procedure TForm45.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('�б���û���κ����ݣ�','Ӧ�տʾ������ʾ');
end;

procedure TForm45.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='����ⵥ���';
  stringgrid1.Cells[2,0]:='���';
  stringgrid1.Cells[3,0]:='����';
  stringgrid1.Cells[4,0]:='ʱ��';
  stringgrid1.Cells[5,0]:='����ⱸע';
  form45.Caption:='���������ϸ��ѯ��'+strCkItemmc+'�����ʱ�ţ�'+strCkItemBh;
  try
    with ZStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_ckitemmxz';
      ParamByName('itemid').Value:=strCkItemBh;
      open;
      FirstResultSet;
      i:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[4,i]:=fields[2].AsString;
        stringgrid1.Cells[5,i]:=fields[3].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      NextResultSet;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[3,i]:=fields[1].AsString;
        stringgrid1.Cells[4,i]:=fields[2].AsString;
        stringgrid1.Cells[5,i]:=fields[3].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','���������ϸ��ѯ��ʾ');
  end;
end;

procedure TForm45.StringGrid1DblClick(Sender: TObject);
begin
  if strCrkdbh<>'NULL' then
    crkdinfomxzcx.Form46.ShowModal;
end;

procedure TForm45.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if stringgrid1.RowCount>2 then
  begin
    strCrkdbh:=stringgrid1.Cells[1,ARow];
    strCrkDate:= stringgrid1.Cells[4,ARow];
    if stringgrid1.Cells[2,Arow]='' then
      strIsCrk:='ck'
    else
      strIsCrk:='rk';
  end
  else
    strCrkdbh:='NULL';
end;

end.