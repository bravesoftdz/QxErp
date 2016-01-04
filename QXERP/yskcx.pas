unit yskcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, DB, ADODB, ExtCtrls,ComObj,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZStoredProcedure;

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
    TabSheet3: TTabSheet;
    DateTimePicker4: TDateTimePicker;
    Button3: TButton;
    StringGrid5: TStringGrid;
    TabSheet4: TTabSheet;
    DateTimePicker5: TDateTimePicker;
    Button4: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button5: TButton;
    RadioGroup1: TRadioGroup;
    StringGrid6: TStringGrid;
    TabSheet2: TTabSheet;
    DateTimePicker3: TDateTimePicker;
    Button2: TButton;
    StringGrid3: TStringGrid;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ZQuery1: TZQuery;
    TabSheet5: TTabSheet;
    Button9: TButton;
    Button10: TButton;
    StringGrid4: TStringGrid;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    ZStoredProc1: TZStoredProc;
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Select(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure StringGrid4DblClick(Sender: TObject);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
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
uses main,yskkhmxz;
//  uses DLLTools;

{$R *.dfm}

procedure TForm7.Button10Click(Sender: TObject);
begin
  ExportStrGridToExcel([StringGrid4]);
end;

procedure TForm7.Button1Click(Sender: TObject);
var y:integer;
tmpxsyid:string;
begin
  y:=1;
  //stringgrid1.RowCount:=2;
  stringgrid1.Cells[0,0]:='应收款编号';
  stringgrid1.Cells[1,0]:='客户名称';
  stringgrid1.Cells[2,0]:='主管单位名称';
  stringgrid1.Cells[3,0]:='当前余额';
  stringgrid1.Cells[4,0]:='末笔收款日期';
  tmpxsyid:=splitstring(combobox1.Text,'|');
  try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      if tmpxsyid='*' then
      sql.Add('select c.fyskbh,c.fkhmc,d.fzgdwmc,c.fdqye,c.flastdate from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where fisdel=''N'' )'+''+' as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid order by c.fdqye desc')
      else
      sql.Add('select c.fyskbh,c.fkhmc,d.fzgdwmc,c.fdqye,c.flastdate from (select a.fyskbh,b.fkhmc,a.fzgdwbh,a.fdqye,a.flastdate from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where fxsyid='+tmpxsyid+' and fisdel=''N'' ) as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid order by c.fdqye desc');
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
      sql.Add('select ''合计'',count(*),'''',SUM(c.fdqye),'''' from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where fisdel=''N'')'+''+'  as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid')
      else
      sql.Add('select ''合计'',count(*),'''',SUM(c.fdqye),'''' from (select a.fyskbh,b.fkhmc,a.fzgdwbh,a.fdqye,a.flastdate from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where fxsyid='+tmpxsyid+' and fisdel=''N'') as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid');
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


procedure TForm7.Button2Click(Sender: TObject);
var y:integer;
begin
  y:=1;
  //stringgrid3.RowCount:=1;
  stringgrid3.Cells[0,0]:='应收款编号';
  stringgrid3.Cells[1,0]:='客户名称';
  stringgrid3.Cells[2,0]:='主管单位名称';
  stringgrid3.Cells[3,0]:='当前余额';
  stringgrid3.Cells[4,0]:='末笔收款日期';
  try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select c.fyskbh,c.fkhmc,d.fzgdwmc,c.fdqye,c.flastdate from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where week(flastdate)=week('''+datetimetostr(datetimepicker3.Date)+''')and year(flastdate)=year('''+datetimetostr(datetimepicker3.Date)+''')) as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid order by c.flastdate,c.fdqye desc');
      open;
      stringgrid3.RowCount:=RecordCount+2;
      while not eof do
      begin
        stringgrid3.Cells[0,y]:=fields[0].AsString;
        stringgrid3.Cells[1,y]:=fields[1].AsString;
        stringgrid3.Cells[2,y]:=fields[2].AsString;
        stringgrid3.Cells[3,y]:=fields[3].AsString;
        stringgrid3.Cells[4,y]:=fields[4].AsString;
        y := y +1;
        next;
      end;
      sql.Clear;
      sql.Add('select ''合计'',count(*),'''',SUM(c.fdqye),'''' from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh,fdqye,flastdate from yskxx where week(flastdate)=week('''+datetimetostr(datetimepicker3.Date)+''')and year(flastdate)=year('''+datetimetostr(datetimepicker3.Date)+''')) as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid order by c.flastdate,c.fdqye desc');
      open;
      if not eof then
      begin
        stringgrid3.Cells[0,y]:=fields[0].AsString;
        stringgrid3.Cells[1,y]:=fields[1].AsString;
        stringgrid3.Cells[2,y]:=fields[2].AsString;
        stringgrid3.Cells[3,y]:=fields[3].AsString;
        stringgrid3.Cells[4,y]:=fields[4].AsString;
      end;
    end;
  Except
    Application.MessageBox('查询失败！','生产统计查询提示');
  end;
end;

procedure TForm7.Button3Click(Sender: TObject);
var y:integer;
begin
  y:=1;
  //stringgrid5.RowCount:=1;
  stringgrid5.Cells[0,0]:='应收款编号';
  stringgrid5.Cells[1,0]:='客户名称';
  stringgrid5.Cells[2,0]:='主管单位名称';
  stringgrid5.Cells[3,0]:='新增金额';
  stringgrid5.Cells[4,0]:='回收金额';
  stringgrid5.Cells[5,0]:='收款日期';
  try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select d.*,e.fxzje,e.fhsje,e.fskdate from (select c.fyskbh,c.fkhmc,d.fzgdwmc from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh from yskxx )'+''+' as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid) as d join (select fyskbh,fxzje,fhsje,fskdate from yskmxz where month(fskdate)=month('''+datetimetostr(datetimepicker4.Date)+''') and year(fskdate)=year('''+datetimetostr(datetimepicker4.Date)+''')) as e on d.fyskbh=e.fyskbh order by e.fskdate desc');
      open;
      stringgrid5.RowCount:=RecordCount+2;
      while not eof do
      begin
        stringgrid5.Cells[0,y]:=fields[0].AsString;
        stringgrid5.Cells[1,y]:=fields[1].AsString;
        stringgrid5.Cells[2,y]:=fields[2].AsString;
        stringgrid5.Cells[3,y]:=fields[3].AsString;
        stringgrid5.Cells[4,y]:=fields[4].AsString;
        stringgrid5.Cells[5,y]:=fields[5].AsString;
        y := y +1;
        next;
      end;
      sql.Clear;
      sql.Add('select ''合计'',count(*),'''',sum(e.fxzje),SUM(e.fhsje),'''' from (select c.fyskbh,c.fkhmc,d.fzgdwmc from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh from yskxx )'+''+' as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid) as d join (select fyskbh,fxzje,fhsje,fskdate from yskmxz where month(fskdate)=month('''+datetimetostr(datetimepicker4.Date)+''') and year(fskdate)=year('''+datetimetostr(datetimepicker4.Date)+''')) as e on d.fyskbh=e.fyskbh order by e.fskdate desc');
      open;
      if not eof then
      begin
        stringgrid5.Cells[0,y]:=fields[0].AsString;
        stringgrid5.Cells[1,y]:=fields[1].AsString;
        stringgrid5.Cells[2,y]:=fields[2].AsString;
        stringgrid5.Cells[3,y]:=fields[3].AsString;
        stringgrid5.Cells[4,y]:=fields[4].AsString;
        stringgrid5.Cells[5,y]:=fields[5].AsString;
      end;
    end;
  Except
    Application.MessageBox('查询失败！','生产统计查询提示');
  end;
end;

procedure TForm7.Button4Click(Sender: TObject);
var y:integer;
begin
  y:=1;
  //stringgrid6.RowCount:=1;
  stringgrid6.Cells[0,0]:='应收款编号';
  stringgrid6.Cells[1,0]:='客户名称';
  stringgrid6.Cells[2,0]:='主管单位名称';
  stringgrid6.Cells[3,0]:='新增金额';
  stringgrid6.Cells[4,0]:='回收金额';
  stringgrid6.Cells[5,0]:='收款日期';
  try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select d.*,e.fxzje,e.fhsje,e.fskdate from (select c.fyskbh,c.fkhmc,d.fzgdwmc from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh from yskxx )'+''+' as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid) as d join (select fyskbh,fxzje,fhsje,fskdate from yskmxz where year(fskdate)=year('''+datetimetostr(datetimepicker5.Date)+''')) as e on d.fyskbh=e.fyskbh order by e.fskdate desc');
      open;
      stringgrid6.RowCount:=RecordCount+2;
      while not eof do
      begin
        stringgrid6.Cells[0,y]:=fields[0].AsString;
        stringgrid6.Cells[1,y]:=fields[1].AsString;
        stringgrid6.Cells[2,y]:=fields[2].AsString;
        stringgrid6.Cells[3,y]:=fields[3].AsString;
        stringgrid6.Cells[4,y]:=fields[4].AsString;
        stringgrid6.Cells[5,y]:=fields[5].AsString;
        y := y +1;
        next;
      end;
      sql.Clear;
      sql.Add('select ''合计'',count(*),'''',sum(e.fxzje),SUM(e.fhsje),'''' from (select c.fyskbh,c.fkhmc,d.fzgdwmc from (select a.*,b.fkhmc from (select fyskbh,fkhid,fzgdwbh from yskxx )'+''+' as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join(select fzgdwid,fzgdwmc from zgdw_info) as d on c.fzgdwbh=d.fzgdwid) as d join (select fyskbh,fxzje,fhsje,fskdate from yskmxz where year(fskdate)=year('''+datetimetostr(datetimepicker5.Date)+''')) as e on d.fyskbh=e.fyskbh order by e.fskdate desc');
      open;
      if not eof then
      begin
        stringgrid6.Cells[0,y]:=fields[0].AsString;
        stringgrid6.Cells[1,y]:=fields[1].AsString;
        stringgrid6.Cells[2,y]:=fields[2].AsString;
        stringgrid6.Cells[3,y]:=fields[3].AsString;
        stringgrid6.Cells[4,y]:=fields[4].AsString;
        stringgrid6.Cells[5,y]:=fields[5].AsString;
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

procedure TForm7.Button6Click(Sender: TObject);
begin
ExportStrGridToExcel([StringGrid5]);
end;

procedure TForm7.Button7Click(Sender: TObject);
begin
ExportStrGridToExcel([StringGrid6]);
end;

procedure TForm7.Button8Click(Sender: TObject);
begin
ExportStrGridToExcel([StringGrid3]);
end;

procedure TForm7.Button9Click(Sender: TObject);
var
  i:integer;
begin     //proc_cx_yskxx_of_dw__by_zgdwbh_khid
  if (combobox2.Text<>'') and (combobox3.Text<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_yskxx_of_dw__by_zgdwbh_khid';
      ParamByName('zgdwbh').Value:=splitstring(combobox2.Text,'|');
      ParamByName('khid').Value:=splitstring(combobox3.Text,'|');
      open;
      i:=1;
      stringgrid4.RowCount:=stringgrid4.RowCount+1;
      stringgrid4.Rows[1].Clear;
      while not eof do
      begin
        stringgrid4.RowCount:=stringgrid4.RowCount+1;
        stringgrid4.Cells[0,i]:=inttostr(i);
        stringgrid4.Cells[1,i]:=fields[0].AsString;
        stringgrid4.Cells[2,i]:=fields[1].AsString;
        stringgrid4.Cells[3,i]:=fields[2].AsString;
        stringgrid4.Cells[4,i]:=fields[3].AsString;
        stringgrid4.Cells[5,i]:=fields[4].AsString;
        stringgrid4.Cells[6,i]:=fields[5].AsString;
        i:=i+1;
        stringgrid4.Rows[stringgrid4.RowCount-1].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('查询数据失败','应收款管理');
  end else
    application.MessageBox('请选择查询的项目','应收款管理');
end;

procedure TForm7.ComboBox1DropDown(Sender: TObject);
begin
  combobox1.Items.Clear;
  combobox1.Items.Add('*|全部');
  with ZQuery1 do
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

procedure TForm7.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox2.Items.Count>0 then
    ComboBox2.Items.Clear;
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_khandzgdwandxsy_by_cxitemandcxmc';
        zstoredproc1.ParamByName('cxitem').Value:='zgdw';
        zstoredproc1.ParamByName('cxmc').Value:=ComboBox2.Text;
        open;
        while not eof do
        begin
          ComboBox2.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
 end;
end;

procedure TForm7.ComboBox2Select(Sender: TObject);
begin
    if combobox3.Items.Count>0 then
      ComboBox3.Items.Clear;
      combobox3.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_khandzgdwandxsy_by_cxitemandcxmc';
        zstoredproc1.ParamByName('cxitem').Value:='khbyzg';
        zstoredproc1.ParamByName('cxmc').Value:=splitstring(ComboBox2.Text,'|');
        open;
        while not eof do
        begin
          ComboBox3.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','新增合同提示');
  end;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
  datetimepicker1.DateTime := strtodate('2010/01/01');
  datetimepicker2.DateTime := date();
  datetimepicker3.DateTime := date();
  datetimepicker4.DateTime := date();
  datetimepicker5.DateTime := date();
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
    with ZQuery1 do
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
procedure TForm7.StringGrid4DblClick(Sender: TObject);
begin
  if strYskbh<>'NULL' then
  yskkhmxz.Form42.ShowModal;
end;

procedure TForm7.StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if stringgrid4.RowCount>2 then
  begin
    strYskbh:=stringgrid4.Cells[1,ARow];
    strKhmc:=stringgrid4.Cells[3,ARow];
  end
  else
    strYskbh:='NULL';
end;

procedure TForm7.TabSheet5Show(Sender: TObject);
begin
  stringgrid4.Cells[0,0]:='序号';
  stringgrid4.Cells[1,0]:='应收款编号';
  stringgrid4.Cells[2,0]:='客户名称';
  stringgrid4.Cells[3,0]:='主管单位名称';
  stringgrid4.Cells[4,0]:='当前余额';
  stringgrid4.Cells[5,0]:='销售员';
  stringgrid4.Cells[6,0]:='末笔收款日期';
end;

end.
