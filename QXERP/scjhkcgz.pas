unit scjhkcgz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  Menus;

type
  TForm94 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
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
  Form94: TForm94;

implementation

{$R *.dfm}

uses main,cpbcpmxzcx;

procedure TForm94.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','生产计划单信息查询');
end;

procedure TForm94.FormShow(Sender: TObject);
var
  i:integer;
begin
try
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品编号';
  stringgrid1.Cells[2,0]:='产品名称';
  stringgrid1.Cells[3,0]:='产品种类';
  stringgrid1.Cells[4,0]:='计划数量';
  stringgrid1.Cells[5,0]:='库存数量';
  stringgrid1.Cells[6,0]:='缺少数量';
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  with zStoredProc1 do
  begin
    close;
    StoredProcName:='proc_cx_sckcsl_by_czyid';
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
      i:=i+1;
      stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
      next;
    end;
  end;
except
  application.MessageBox('数据查询失败','生产计划及库存查询');
end;
end;

procedure TForm94.StringGrid1DblClick(Sender: TObject);
begin
  cpbcpmxzcx.Form91.ShowModal;
end;

procedure TForm94.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
  begin
    if (ARow>0) and (ARow<TStringGrid(Sender).rowCount-1) then
      if(strtofloat(Cells[6,ARow])<0) then
//        Canvas.Brush.Color:=clRed
        Canvas.Font.Color:=clRed
      else
  //      Canvas.Brush.Color:=clWindow;
        Canvas.Font.Color:=clWindowText;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol,ARow]);
  end;
end;

procedure TForm94.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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
    //cpbcpmxzcx.strbcpbh:=stringgrid2.Cells[3,ARow];
    cpbcpmxzcx.strcpzl:=stringgrid1.Cells[3,ARow];
    cpbcpmxzcx.strcpmc:=stringgrid1.Cells[2,ARow]+'-'+stringgrid1.Cells[3,ARow];
    //cpbcpmxzcx.strbcpmc:=stringgrid2.Cells[4,ARow]+'-'+stringgrid2.Cells[5,ARow];
  end;
end;

end.
