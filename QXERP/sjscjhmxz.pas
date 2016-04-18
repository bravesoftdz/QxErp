unit sjscjhmxz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  Grids;

type
  TForm92 = class(TForm)
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Execl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form92: TForm92;
  strcxitem,strgzlx:string;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation
uses main,cpbcpmxzcx;
{$R *.dfm}

procedure TForm92.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','常规库存跟踪管理');
end;

procedure TForm92.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='成品种类';
  stringgrid1.Cells[2,0]:='成品名称';
  stringgrid1.Cells[3,0]:='半成品编号';
  stringgrid1.Cells[4,0]:='半成品名称';
  stringgrid1.Cells[5,0]:='半成品类型';
  stringgrid1.Cells[6,0]:='成品库存数';
  stringgrid1.Cells[7,0]:='半成品库存数';
  stringgrid1.Cells[8,0]:='半成品下限数';
  stringgrid1.Cells[9,0]:='半成品缺补数';
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  screen.Cursor:=crHourGlass;
  try
    with zStoredProc1 do
    begin
      close;
      if strgzlx='cgkcgz' then
        StoredProcName:='proc_cx_sjscjhmxz_by_czyid'
      else
        StoredProcName:='proc_cx_scjhdsjscmxz_by_czyid';
      ParamByName('cxitem').Value:=strcxitem;
      ParamByName('czyid').Value:=main.strUser;
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
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        stringgrid1.Cells[7,i]:=fields[6].AsString;
        stringgrid1.Cells[8,i]:=fields[7].AsString;
        stringgrid1.Cells[9,i]:=fields[8].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      Screen.Cursor:=crDefault;
    end;
  except
    application.MessageBox('数据查询失败！','生产计划跟踪管理');
    Screen.Cursor:=crDefault;
  end;

end;

procedure TForm92.StringGrid1DblClick(Sender: TObject);
begin
  cpbcpmxzcx.Form91.ShowModal;
end;

procedure TForm92.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  cpbcpmxzcx.strcpbh:='null';
  cpbcpmxzcx.strbcpbh:='null';
  cpbcpmxzcx.strcpzl:='null';
  cpbcpmxzcx.strcpmc:='';
  cpbcpmxzcx.strbcpmc:='';
  if (ARow>0) and (ARow+1<stringgrid1.RowCount) then
  begin
    cpbcpmxzcx.strcpbh:=stringgrid1.Cells[2,ARow];
    cpbcpmxzcx.strbcpbh:=stringgrid1.Cells[3,ARow];
    cpbcpmxzcx.strcpzl:=stringgrid1.Cells[1,ARow];
    cpbcpmxzcx.strcpmc:=stringgrid1.Cells[2,ARow]+'-'+stringgrid1.Cells[1,ARow];
    cpbcpmxzcx.strbcpmc:=stringgrid1.Cells[4,ARow]+'-'+stringgrid1.Cells[5,ARow];
  end;
end;

end.
