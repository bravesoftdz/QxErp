unit scjhdmxzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, Menus,
  Grids;

type
  TForm90 = class(TForm)
    StringGrid2: TStringGrid;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    ZStoredProc1: TZStoredProc;
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
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
uses main;

{$R *.dfm}

procedure TForm90.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='产品编号';
  stringgrid2.Cells[2,0]:='产品名称';
  stringgrid2.Cells[3,0]:='产品类型';
  stringgrid2.Cells[4,0]:='产品单价';
  stringgrid2.Cells[5,0]:='计划数量';
  stringgrid2.Cells[6,0]:='发货单已开数量';
  stringgrid2.Cells[7,0]:='库存数量';
  stringgrid2.Cells[8,0]:='计划单内已开发货数量';
  stringgrid2.Cells[9,0]:='是否足够';
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
      form90.Caption:='生产计划单信息查询 【计划单编号:'+strscjhdbh+'】';
    end;
  except
    application.MessageBox('数据查询失败！','生产计划单信息查询');
  end;
end;

procedure TForm90.MenuItem1Click(Sender: TObject);
begin
  if stringgrid2.RowCount>2 then
    ExportStrGridToExcel([stringgrid2])
  else
    application.MessageBox('列表中没有任何数据！','生产计划单信息查询');
end;

end.
