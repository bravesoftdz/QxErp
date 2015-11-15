unit yskcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, DB, ADODB, ExtCtrls,ComObj;

type
  TForm7 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    TabSheet2: TTabSheet;
    DateTimePicker3: TDateTimePicker;
    Button2: TButton;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    TabSheet3: TTabSheet;
    DateTimePicker4: TDateTimePicker;
    Button3: TButton;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    TabSheet4: TTabSheet;
    DateTimePicker5: TDateTimePicker;
    Button4: TButton;
    StringGrid7: TStringGrid;
    StringGrid8: TStringGrid;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    Button5: TButton;
    RadioGroup1: TRadioGroup;
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

//  uses DLLTools;

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var y:integer;
tmpxsyid:string;
begin
  y:=1;
  stringgrid1.RowCount:=1;
  stringgrid1.Cells[0,0]:='应收款编号';
  stringgrid1.Cells[1,0]:='客户名称';
  stringgrid1.Cells[2,0]:='主管单位名称';
  stringgrid1.Cells[3,0]:='当前余额';
  stringgrid1.Cells[4,0]:='末笔收款日期';
  tmpxsyid:=splitstring(combobox1.Text,'|');
  try
    with adoquery1 do
    begin
      close;
      sql.Clear;
      if tmpxsyid='*' then
      sql.Add('select c.fyskbh,c.fkhmc,d.fzgdwmc,c.fdqye,c.flastdate from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx )'+''+' as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid order by c.fdqye desc')
      else
      sql.Add('select c.fyskbh,c.fkhmc,d.fzgdwmc,c.fdqye,c.flastdate from (select a.fyskbh,b.fkhmc,a.fzgdwbh,a.fdqye,a.flastdate from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where fxsyid='+tmpxsyid+' ) as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid order by c.fdqye desc');
      open;
      stringgrid1.RowCount:=RecordCount+2;
      while not eof do
      begin
        stringgrid1.Cells[0,y]:=fields[0].AsString;
        stringgrid1.Cells[1,y]:=fields[1].AsString;
        stringgrid1.Cells[2,y]:=fields[2].AsString;
        stringgrid1.Cells[3,y]:=fields[3].AsString;
        stringgrid1.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        next;
      end;
      sql.Clear;
      if tmpxsyid='*' then
      sql.Add('select ''合计'',count(*),'''',SUM(c.fdqye),'''' from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx )'+''+'  as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid')
      else
      sql.Add('select ''合计'',count(*),'''',SUM(c.fdqye),'''' from (select a.fyskbh,b.fkhmc,a.fzgdwbh,a.fdqye,a.flastdate from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where fxsyid='+tmpxsyid+' ) as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid');
      open;
      if not eof then
      begin
        stringgrid1.Cells[0,y]:=fields[0].AsString;
        stringgrid1.Cells[1,y]:=fields[1].AsString;
        stringgrid1.Cells[2,y]:=fields[2].AsString;
        stringgrid1.Cells[3,y]:=fields[3].AsString;
        stringgrid1.Cells[4,y]:=fields[4].AsString;
      end;
    end;
  Except
    Application.MessageBox('查询失败！','生产统计查询提示');
  end;
end;


procedure TForm7.Button5Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
    0: ExportStrGridToExcel([StringGrid1]);
    1: ExportStrGridToExcel([StringGrid2]);
    2: ExportStrGridToExcel([StringGrid1,StringGrid2]);
  end;
  //ExportStrGridToExcel([StringGrid1,StringGrid2]);
end;

procedure TForm7.ComboBox1DropDown(Sender: TObject);
begin
  combobox1.Items.Clear;
  combobox1.Items.Add('*|全部');
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select concat(trim(fxsyid),''|'',trim(fxsyxm)) from Xsy_info');
    open;
    while not eof do
    begin
       combobox1.Items.Add(fields[0].asstring);
       next;
    end;
  end;
  //application.MessageBox(pwidechar(splitstring(combobox1.Text,'|')),'aaaaaa');
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
  datetimepicker1.DateTime := strtodate('2010/01/01');
  datetimepicker2.DateTime := date();
end;

procedure TForm7.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var y:integer;
var strCpbh:string;
begin
  y:=1;
  strCpbh:=stringgrid1.Cells[0,ARow];
  stringgrid2.Cells[0,0]:='应收款编号';
  stringgrid2.Cells[1,0]:='新增应收款';
  stringgrid2.Cells[2,0]:='回收金额';
  stringgrid2.Cells[3,0]:='记帐日期';
  stringgrid2.Cells[4,0]:='备注';
  try
    with adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fyskbh,fxzje,fhsje,fskdate,fmemo from yskmxz where fyskbh='''+strCpbh+''' and isdel=''N'' and fskdate>='''+datetimetostr(datetimepicker1.Date)+''' and fskdate<='''+datetimetostr(datetimepicker2.Date)+'''');
      open;
      stringgrid2.RowCount:=RecordCount+2;
      while not eof do
      begin
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        next;
      end;
      sql.Clear;
      sql.Add('select ''合计'',sum(fxzje),sum(fhsje),SUM(fxzje)-SUM(fhsje),'''' from yskmxz where fyskbh='''+strCpbh+''' and isdel=''N'' and fskdate>='''+datetimetostr(datetimepicker1.Date)+''' and fskdate<='''+datetimetostr(datetimepicker2.Date)+'''');
      open;
      if not eof then
      begin
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
      end;
    end;
  Except
    Application.MessageBox('查询失败！','应收款统计查询提示');
  end;
end;
end.
