unit htgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Grids, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZStoredProcedure;

type
  TForm6 = class(TForm)
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    Label12: TLabel;
    StringGrid2: TStringGrid;
    Button8: TButton;
    RadioGroup1: TRadioGroup;
    ZStoredProc1: TZStoredProc;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button8Click(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  boolhtinfoloaded:boolean;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses Main;

{$R *.dfm}

procedure TForm6.Button2Click(Sender: TObject);
begin
  form6.Close;
end;

procedure TForm6.Button6Click(Sender: TObject);
var y:integer;
begin
    y:=1;
    boolhtinfoloaded:=false;
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_htinfo_by_khmc';
        ParamByName('khmc').Value:='';
        open;
        while not eof do
        begin
          stringgrid1.RowCount:=stringgrid1.RowCount+1;
          stringgrid1.Cells[0,y]:=fields[0].AsString;
          stringgrid1.Cells[1,y]:=fields[1].AsString;
          stringgrid1.Cells[2,y]:=fields[2].AsString;
          stringgrid1.Cells[3,y]:=fields[3].AsString;
          stringgrid1.Cells[4,y]:=fields[4].AsString;
          stringgrid1.Cells[5,y]:=fields[5].AsString;
          stringgrid1.Cells[6,y]:=fields[6].AsString;
          stringgrid1.Cells[7,y]:=fields[7].AsString;
          stringgrid1.Cells[8,y]:=fields[8].AsString;
          y:=y+1;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          next;
        end;
        boolhtinfoloaded:=true;
      end;
    Except
        Application.MessageBox('查询失败！','合同管理提示');
    end;
end;

procedure TForm6.Button8Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
    0: ExportStrGridToExcel([StringGrid1]);
    1: ExportStrGridToExcel([StringGrid2]);
    2: ExportStrGridToExcel([StringGrid1,StringGrid2]);
  end;
end;

procedure TForm6.Edit9Change(Sender: TObject);
var y:integer;
begin
  if edit9.Text<>'' then
    y:=1;
    boolhtinfoloaded:=false;
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_htinfo_by_khmc';
        ParamByName('khmc').Value:=edit9.Text;
        open;
        while not eof do
        begin
          stringgrid1.RowCount:=stringgrid1.RowCount+1;
          stringgrid1.Cells[0,y]:=fields[0].AsString;
          stringgrid1.Cells[1,y]:=fields[1].AsString;
          stringgrid1.Cells[2,y]:=fields[2].AsString;
          stringgrid1.Cells[3,y]:=fields[3].AsString;
          stringgrid1.Cells[4,y]:=fields[4].AsString;
          stringgrid1.Cells[5,y]:=fields[5].AsString;
          stringgrid1.Cells[6,y]:=fields[6].AsString;
          stringgrid1.Cells[7,y]:=fields[7].AsString;
          stringgrid1.Cells[8,y]:=fields[8].AsString;
          y:=y+1;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          next;
        end;
        boolhtinfoloaded:=true;
      end;
    Except
        Application.MessageBox('查询失败！','合同管理提示');
    end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  stringgrid1.ColWidths[0]:=100;
  stringgrid1.ColWidths[1]:=100;
  stringgrid1.ColWidths[2]:=400;
  stringgrid1.ColWidths[3]:=60;
  stringgrid1.ColWidths[4]:=50;
  stringgrid1.ColWidths[5]:=90;
  stringgrid1.ColWidths[6]:=60;
  stringgrid1.ColWidths[7]:=60;
  stringgrid1.ColWidths[8]:=150;
  stringgrid1.Cells[0,0]:='合同编号';
  stringgrid1.Cells[1,0]:='合同日期';
  stringgrid1.Cells[2,0]:='客户名称';
  stringgrid1.Cells[3,0]:='销售人员';
  stringgrid1.Cells[4,0]:='联系人';
  stringgrid1.Cells[5,0]:='联系电话';
  stringgrid1.Cells[6,0]:='合同金额';
  stringgrid1.Cells[7,0]:='供货结束';
  stringgrid1.Cells[8,0]:='备注';
  stringgrid2.ColWidths[0]:=100;
  stringgrid2.ColWidths[1]:=100;
  stringgrid2.ColWidths[2]:=100;
  stringgrid2.ColWidths[3]:=100;
  stringgrid2.ColWidths[4]:=100;
  stringgrid2.ColWidths[5]:=100;
  stringgrid2.ColWidths[6]:=100;
  stringgrid2.Cells[0,0]:='产品类型';
  stringgrid2.Cells[1,0]:='产品名称';
  stringgrid2.Cells[2,0]:='单价';
  stringgrid2.Cells[3,0]:='合同数量';
  stringgrid2.Cells[4,0]:='合计金额';
  stringgrid2.Cells[5,0]:='已发数量';
  stringgrid2.Cells[6,0]:='发货金额';
  stringgrid2.Cells[7,0]:='备注';
end;

procedure TForm6.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  y:integer;
begin
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  if (boolhtinfoloaded=true) and (stringgrid1.Cells[0,ARow]<>'') then
  begin
    y:=1;
    try
    with zStoredProc1 do      //proc_cx_htcpmzx_by_htbh
    begin
      close;
      StoredProcName:='proc_cx_htcpmzx_by_htbh';
      ParamByName('htbh').Value:=stringgrid1.Cells[0,ARow];
      open;
      FirstResultSet;
      while not eof do
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        stringgrid2.Cells[5,y]:=fields[5].AsString;
        stringgrid2.Cells[6,y]:=fields[6].AsString;
        stringgrid2.Cells[7,y]:=fields[8].AsString;
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
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        stringgrid2.Cells[5,y]:=fields[5].AsString;
        stringgrid2.Cells[6,y]:=fields[6].AsString;
        stringgrid2.Rows[stringgrid2.RowCount-1].Clear;
      end;
    end;
    Except
        Application.MessageBox('查询失败！','合同管理提示');
    end;
  end;
end;

end.
