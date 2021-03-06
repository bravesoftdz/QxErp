unit htsccx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls;

type
  TForm105 = class(TForm)
    Label12: TLabel;
    Edit9: TEdit;
    Button1: TButton;
    ZStoredProc1: TZStoredProc;
    StringGrid2: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form105: TForm105;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

procedure TForm105.Button1Click(Sender: TObject);
var
  y:integer;
begin
 try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_htinfo_by_htbh';
        ParamByName('htbh').Value:=edit9.Text;
        open;
        if not eof then
        begin
        edit1.Text:=fields[2].AsString;
        end;
      end;
    Except
        Application.MessageBox('查询失败！','合同管理提示');
    end;
end;

procedure TForm105.Button2Click(Sender: TObject);
var
  y:integer;
begin
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
    y:=1;
    try
    with zStoredProc1 do      //proc_cx_htcpmzx_by_htbh
    begin
      close;
      StoredProcName:='proc_cx_htcpmzx_by_htbh';
      ParamByName('htbh').Value:=edit9.Text;
      open;
      FirstResultSet;
      while not eof do
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
     //   stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[2,y]:=fields[3].AsString;
      //  stringgrid2.Cells[4,y]:=fields[4].AsString;
        stringgrid2.Cells[3,y]:=fields[5].AsString;
      //  stringgrid2.Cells[6,y]:=fields[6].AsString;
        stringgrid2.Cells[4,y]:=fields[8].AsString;
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
        y:=y+1;
        next;
      end;
      nextresultset;
      if not eof then
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        //stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[2,y]:=fields[3].AsString;
        //stringgrid2.Cells[4,y]:=fields[4].AsString;
        stringgrid2.Cells[3,y]:=fields[5].AsString;
        //stringgrid2.Cells[6,y]:=fields[6].AsString;
        // stringgrid2.Cells[7,y]:=fields[8].AsString;
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      end;
    end;
    Except
        Application.MessageBox('查询失败！','合同管理提示');
    end;

end;

procedure TForm105.Button8Click(Sender: TObject);
begin
ExportStrGridToExcel([StringGrid2]);
end;

procedure TForm105.FormShow(Sender: TObject);
begin
  stringgrid2.Cells[0,0]:='产品类型';
  stringgrid2.Cells[1,0]:='产品名称';
  stringgrid2.Cells[2,0]:='合同数量';
  stringgrid2.Cells[3,0]:='已发数量';
  stringgrid2.Cells[4,0]:='备注';
end;

end.
