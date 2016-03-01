unit scjh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZStoredProcedure, Menus, RpDefine, RpCon, RpConDS, DBGrids;

type
  TForm17 = class(TForm)
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    Execl1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    Label12: TLabel;
    ComboBox1: TComboBox;
    Button6: TButton;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button2: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RadioGroup1: TRadioGroup;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Execl1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;
  SelARow:integer;
  tmpjhdbh:string;
  boolReaded:boolean;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main,jhdxzfhd;

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
var
  i:integer;
  boolenough:boolean;
begin
  boolenough:=true;
  for i := 1 to stringgrid2.RowCount - 2 do
    begin
      if stringgrid2.Cells[8,i]='N' then
        boolenough:=false;
    end;
    if boolenough then
      jhdxzfhd.Form40.ShowModal
    else
      application.MessageBox('有项目库存数量不够，请核实','计划单转发货单管理提示');
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
if stringgrid1.RowCount>2 then
  try
    form1.RvDataSetConnection1.DataSet:=zstoredProc1;
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_jhdmxztofhdmzx_by_jhdbh';
      ParamByName('jhdbh').Value:=stringgrid1.Cells[5,SelARow];
      //ParamByName('htbh').Value:=stringgrid1.Cells[1,SelARow];
      open;
      with form1 do
      begin
        rvproject1.Open;
        rvproject1.SelectReport('scjhd',true);
        rvproject1.ClearParams;
        rvproject1.SetParam('jhdbh',stringgrid1.Cells[5,SelARow]);
        rvproject1.SetParam('khmc',stringgrid1.Cells[2,SelARow]);
        rvproject1.SetParam('htbh',stringgrid1.Cells[1,SelARow]);
        rvproject1.SetParam('jhksdate',stringgrid1.Cells[6,SelARow]);
        rvproject1.SetParam('jhjhdate',stringgrid1.Cells[7,SelARow]);
        rvproject1.SetParam('jhdmemo',stringgrid1.Cells[8,SelARow]);
        rvproject1.SetParam('czry',main.strUser);
        rvproject1.SetParam('printdate',datetimetostr(now()));
        rvproject1.SetParam('xsyxm',stringgrid1.Cells[9,SelARow]);
        RvProject1.Execute;
        rvproject1.Close;
      end;
    end;
  except
      application.MessageBox('打印失败','计划单打印提示');
  end;
end;

procedure TForm17.Button6Click(Sender: TObject);
var
  i:integer;
begin
  if combobox1.Text<>'' then
    try
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      stringgrid2.RowCount:=2;
      stringgrid2.Rows[1].Clear;
      boolReaded:=false;
      with  zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_jihuadaninfo_by_htbh';
        ParamByName('htbh').Value:=SplitString(combobox1.Text,'|');
        open;
        i:=1;
        while not eof do
        begin
          if (radiogroup1.ItemIndex=0) then
          begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            stringgrid1.Cells[0,i]:=inttostr(i)+fields[9].AsString;
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
          end;
          if (radiogroup1.ItemIndex=1) and (fields[9].AsString='') then
          begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            stringgrid1.Cells[0,i]:=inttostr(i)+fields[9].AsString;
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
          end;
          if (radiogroup1.ItemIndex=2) and (fields[9].AsString='(完成)') then
          begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            stringgrid1.Cells[0,i]:=inttostr(i)+fields[9].AsString;
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
          end;
          next;
        end;
      end;
      boolReaded:=true;
    except
      application.MessageBox('数据查询失败！','计划单查询提示');
    end else
  application.MessageBox('请选择要查询的项目客户名称！','计划单查询提示');
end;

procedure TForm17.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin      //proc_cx_khandzgdwandxsy_by_cxitemandcxmc
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    combobox1.Items.Add('*|全部未发货计划单');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_hthasjhd_by_khmc';
        zstoredproc1.ParamByName('khmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','计划单查询提示');
  end;
 end;
end;

procedure TForm17.Execl1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('列表中没有任何数据！','计划单查询提示');
end;

procedure TForm17.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='合同编号';
  stringgrid1.Cells[2,0]:='项目客户名称';
  stringgrid1.Cells[3,0]:='客户编号';
  stringgrid1.Cells[4,0]:='任务单号';
  stringgrid1.Cells[5,0]:='计划单号';
  stringgrid1.Cells[6,0]:='计划开始时间';
  stringgrid1.Cells[7,0]:='预计发货时间';
  stringgrid1.Cells[8,0]:='备注';
  stringgrid1.Cells[9,0]:='销售员';
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
end;

procedure TForm17.MenuItem1Click(Sender: TObject);
begin
  if stringgrid2.RowCount>2 then
    ExportStrGridToExcel([stringgrid2])
  else
    application.MessageBox('列表中没有任何数据！','计划单查询提示');
end;

procedure TForm17.N2Click(Sender: TObject);
begin
//proc_update_jihuadaninfo_iswanchengbz
if (stringgrid1.Cells[5,SelARow]<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_update_jihuadaninfo_iswanchengbz';
      ParamByName('bz').Value:='ywc';
      ParamByName('jhdbh').Value:=stringgrid1.Cells[5,selARow];
      //ParamByName('htbh').Value:=stringgrid1.Cells[1,ARow];
      execproc;
      button6.Click;
    end;
  except
    application.MessageBox('设置完成标记失败！','计划单查询提示');
  end;
end;

procedure TForm17.N3Click(Sender: TObject);
begin
if (stringgrid1.Cells[5,SelARow]<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_update_jihuadaninfo_iswanchengbz';
      ParamByName('bz').Value:='wwc';
      ParamByName('jhdbh').Value:=stringgrid1.Cells[5,selARow];
      //ParamByName('htbh').Value:=stringgrid1.Cells[1,ARow];
      execproc;
      button6.Click;
    end;
  except
    application.MessageBox('设置未完成标记失败！','计划单查询提示');
  end;
end;

procedure TForm17.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  i:integer;
begin
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  SelARow:=ARow;
  tmpjhdbh:=stringgrid1.Cells[5,ARow];
  if (stringgrid1.Cells[5,ARow]<>'') and (boolReaded=true) then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_jhdmxztofhdmzx_by_jhdbh';
      ParamByName('jhdbh').Value:=stringgrid1.Cells[5,ARow];
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
    end;
  except
    application.MessageBox('数据查询失败！','计划单查询提示');
  end;
end;

end.
