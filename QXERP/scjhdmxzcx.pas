unit scjhdmxzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, Menus,
  Grids;

type
  TForm90 = class(TForm)
    StringGrid2: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form90: TForm90;
  strscjhdbh:string;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation
uses main,cpbcpmxzcx;

{$R *.dfm}

procedure TForm90.Execl1Click(Sender: TObject);
begin
  if stringgrid2.RowCount>2 then
    ExportStrGridToExcel([stringgrid2])
  else
    application.MessageBox('�б���û���κ����ݣ�','�����ƻ�����Ϣ��ѯ');
end;

procedure TForm90.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid2.Cells[0,0]:='���';
  stringgrid2.Cells[1,0]:='��Ʒ���';
  stringgrid2.Cells[2,0]:='��Ʒ����';
  stringgrid2.Cells[3,0]:='��Ʒ����';
  stringgrid2.Cells[4,0]:='��Ʒ����';
  stringgrid2.Cells[5,0]:='�ƻ�����';
  stringgrid2.Cells[6,0]:='�������ѿ�����';
  stringgrid2.Cells[7,0]:='�������';
  stringgrid2.Cells[8,0]:='�ƻ������ѿ���������';
  stringgrid2.Cells[9,0]:='�Ƿ��㹻';
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  if (strscjhdbh<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_jhdmxztofhdmzx_by_jhdbh';
      ParamByName('jhdbh').Value:=strscjhdbh;
      //ParamByName('htbh').Value:=stringgrid1.Cells[1,ARow];
      open;
      i:=1;
      while not eof do
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,i]:=inttostr(i);
        stringgrid2.Cells[1,i]:=fields[0].AsString;
        stringgrid2.Cells[2,i]:=fields[1].AsString;
        stringgrid2.Cells[3,i]:=fields[2].AsString;
        stringgrid2.Cells[4,i]:=fields[3].AsString;
        stringgrid2.Cells[5,i]:=fields[4].AsString;
        stringgrid2.Cells[6,i]:=fields[5].AsString;
        stringgrid2.Cells[7,i]:=fields[6].AsString;
        stringgrid2.Cells[8,i]:=fields[8].AsString;
        stringgrid2.Cells[9,i]:=fields[7].AsString;
        i:=i+1;
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
        next;
      end;
      form90.Caption:='�����ƻ�����Ϣ��ѯ ���ƻ������:'+strscjhdbh+'��';
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','�����ƻ�����Ϣ��ѯ');
  end;
end;

procedure TForm90.StringGrid2DblClick(Sender: TObject);
begin
  cpbcpmxzcx.Form91.ShowModal;
end;

procedure TForm90.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  cpbcpmxzcx.strcpbh:='null';
  cpbcpmxzcx.strbcpbh:='null';
  cpbcpmxzcx.strcpzl:='null';
  cpbcpmxzcx.strcpmc:='';
  cpbcpmxzcx.strbcpmc:='';
  if (ARow>0) and (ARow+1<stringgrid2.RowCount) then
  begin
    cpbcpmxzcx.strcpbh:=stringgrid2.Cells[2,ARow];
    //cpbcpmxzcx.strbcpbh:=stringgrid2.Cells[3,ARow];
    cpbcpmxzcx.strcpzl:=stringgrid2.Cells[3,ARow];
    cpbcpmxzcx.strcpmc:=stringgrid2.Cells[2,ARow]+'-'+stringgrid2.Cells[3,ARow];
    //cpbcpmxzcx.strbcpmc:=stringgrid2.Cells[4,ARow]+'-'+stringgrid2.Cells[5,ARow];
  end;
end;

end.