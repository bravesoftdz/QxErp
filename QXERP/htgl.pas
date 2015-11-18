unit htgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Grids, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm6 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Button3: TButton;
    Button4: TButton;
    TabSheet3: TTabSheet;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    Label12: TLabel;
    StringGrid2: TStringGrid;
    Button5: TButton;
    StringGrid3: TStringGrid;
    Edit15: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Edit16: TEdit;
    StringGrid4: TStringGrid;
    Button7: TButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button8: TButton;
    RadioGroup1: TRadioGroup;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Edit15Enter(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit16Change(Sender: TObject);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses Main;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  if (edit1.Text <> '') and (edit2.Text <> '') and (edit3.Text <> '')and (edit4.Text <> '')and (edit10.Text <> '')and (edit11.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into ht_info (fhtbh,fkhbh,fhtdate,fxsybh,fhtzje,flxr,flxrdh,fmemo) values ('''+edit1.Text+''','''+edit2.Text+''','''+edit4.Text+''','''+edit10.Text+''','''+edit11.Text+''','''+edit12.Text+''','''+edit13.Text+''','''+main.strUser+edit14.Text+''')');
        ExecSQL;
        sql.Clear;
        sql.Add('insert into yskxx (fyskbh,fhtbh,fkhid,fzgdwbh,fyskzje,fdqye,flastdate,fxsyid,fmemo) values ('''+edit1.Text+''','''+edit1.Text+''','''+edit2.Text+''','''+edit3.Text+''','''+'0'+''','''+'0'+''','''+edit4.Text+''','''+edit10.Text+''','''+main.strUser+edit14.Text+''')');
        ExecSQL;
        edit5.Text := edit1.Text;
        edit1.Text := '';
        edit2.Text := '';
        edit3.Text := '';
        edit4.Text := '';
        edit10.Text := '';
        edit11.Text := '';
        edit12.Text := '';
        edit13.Text := '';
        edit14.Text := '';
        Application.MessageBox('新增合同成功！','提示');
        PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('新增合同失败！','提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','提示');
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  form6.Close;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
if (edit5.Text <> '')and (edit6.Text <> '')and (edit7.Text <> '')and (edit8.Text <> '')then
  begin
    try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into htcpmxb (fhtbh,fcpbh,fcpdj,fcpsl) values ('''+edit5.Text+''','''+edit6.Text+''','''+edit7.Text+''','''+edit8.Text+''')');
        ExecSQL;
        edit6.Text := '';
        edit7.Text := '';
        edit8.Text := '';
        edit6.SetFocus;
        Application.MessageBox('新增合同明细成功！','合同管理提示');
        PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('新增合同明细失败！','合同管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','提示');
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
  stringgrid3.Visible:=not stringgrid3.Visible;
  edit15.Visible:= not edit15.Visible;
  label29.Visible:= not label29.Visible;
  stringgrid3.ColWidths[0]:=80;
  stringgrid3.ColWidths[1]:=100;
  stringgrid3.ColWidths[2]:=80;
  stringgrid3.Cells[0,0]:='产品编号';
  stringgrid3.Cells[1,0]:='产品规格';
  stringgrid3.Cells[2,0]:='产品类型';
end;

procedure TForm6.Button6Click(Sender: TObject);
var y:integer;
begin
  y:=1;
  try
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fhtbh,fhtdate,fkhmc,fxsyxm,flxr,flxrdh,fhtzje,ffhjsbz,fmemo from (select * from (select fhtbh,fkhbh,fhtdate,fxsybh,flxr,flxrdh,fhtzje,ffhjsbz,fmemo from ht_info where fkhbh in (select fkdhid from Kh_info where fkhmc like ''%'+edit9.Text+'%'') and fisdel=''N'') as a inner join (select fkdhid,fkhmc from Kh_info) as b on a.fkhbh=b.fkdhid) as c inner join (select fxsyid,fxsyxm from Xsy_info) as d on c.fxsybh=d.fxsyid');
    open;
    stringgrid1.RowCount:=ZQuery1.RecordCount+1;
    while not eof do
    begin
      stringgrid2.Rows[y].Clear;
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
      next;
    end;
  end;
  Except
      Application.MessageBox('查询失败！','合同管理提示');
  end;
end;

procedure TForm6.Button7Click(Sender: TObject);
begin
  stringgrid4.Visible:=not stringgrid4.Visible;
  edit16.Visible:= not edit16.Visible;
  label30.Visible:= not label30.Visible;
  groupbox1.Visible:=not groupbox1.Visible;
end;

procedure TForm6.Button8Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
    0: ExportStrGridToExcel([StringGrid1]);
    1: ExportStrGridToExcel([StringGrid2]);
    2: ExportStrGridToExcel([StringGrid1,StringGrid2]);
  end;
end;

procedure TForm6.Edit15Change(Sender: TObject);
var y:integer;
begin
  y:=1;
  if edit15.Text<>'' then
  begin
    try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fcpbh,fcpmc,fcpzl from cplxk where fcpmc like ''%'+edit15.Text+'%'' order by fcpzl');
      open;
      stringgrid3.RowCount:=RecordCount+1;
      while not eof do
      begin
        stringgrid3.Cells[0,y]:=fields[0].AsString;
        stringgrid3.Cells[1,y]:=fields[1].AsString;
        stringgrid3.Cells[2,y]:=fields[2].AsString;
        y:=y+1;
        next;
      end;
    end;
      Except
          Application.MessageBox('查询失败！','合同管理提示');
    end;
  end;
end;

procedure TForm6.Edit15Enter(Sender: TObject);
var y:integer;
begin
  y:=1;
  if edit15.Text<>'' then
  begin
    try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fcpbh,fcpmc,fcpzl from cplxk where fcpmc like ''%'+edit15.Text+'%'' order by fcpzl');
      open;
      stringgrid3.RowCount:=RecordCount+1;
      while not eof do
      begin
        stringgrid3.Cells[0,y]:=fields[0].AsString;
        stringgrid3.Cells[0,y]:=fields[1].AsString;
        stringgrid3.Cells[0,y]:=fields[2].AsString;
        y:=y+1;
        next;
      end;
    end;
      Except
          Application.MessageBox('查询失败！','合同管理提示');
    end;
  end;
end;

procedure TForm6.Edit16Change(Sender: TObject);
var y:integer;
begin
  if (RadioButton1.Checked=false) and (RadioButton2.Checked=false) and (RadioButton3.Checked=false) then
  begin
   Application.MessageBox('请选择查询项目！','合同管理提示');
  end else
  begin
    y:=1;
    if edit16.Text<>'' then
    begin
      try
      with ZQuery1 do
      begin
        close;
        sql.Clear;
        if RadioButton1.Checked=True then
        sql.Add('select fkdhid,fkhmc from Kh_info where fkhmc like ''%'+edit16.Text+'%'' order by fkhmc');
        if RadioButton2.Checked=True then
        sql.Add('select fzgdwid,fzgdwmc from zgdw_info where fzgdwmc like ''%'+edit16.Text+'%'' order by fzgdwmc');
        if RadioButton3.Checked=True then
        sql.Add('select fxsyid,fxsyxm from Xsy_info where fxsyxm like ''%'+edit16.Text+'%'' order by fxsyxm');
        open;
        stringgrid4.RowCount:=RecordCount+1;
        while not eof do
        begin
          stringgrid4.Cells[0,y]:=fields[0].AsString;
          stringgrid4.Cells[1,y]:=fields[1].AsString;
          y:=y+1;
          next;
        end;
      end;
        Except
            Application.MessageBox('查询失败！','合同管理提示');
      end;
    end;
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
end;

procedure TForm6.RadioButton1Click(Sender: TObject);
begin
  RadioButton1.Checked:=true;
  stringgrid4.ColCount:=2;
  stringgrid4.ColWidths[0]:=60;
  stringgrid4.ColWidths[1]:=400;
  stringgrid4.Cells[0,0]:='客户编号';
  stringgrid4.Cells[1,0]:='客户名称';
  stringgrid4.RowCount:=1;
  edit16.Text:='';
  edit16.SetFocus;
end;

procedure TForm6.RadioButton2Click(Sender: TObject);
begin
  radiobutton2.Checked:=true;
  stringgrid4.ColCount:=2;
  stringgrid4.ColWidths[0]:=60;
  stringgrid4.ColWidths[1]:=400;
  stringgrid4.Cells[0,0]:='主管编号';
  stringgrid4.Cells[1,0]:='主管名称';
  stringgrid4.RowCount:=1;
  edit16.Text:='';
  edit16.SetFocus;
end;

procedure TForm6.RadioButton3Click(Sender: TObject);
begin
  RadioButton3.Checked:=true;
  stringgrid4.ColCount:=2;
  stringgrid4.ColWidths[0]:=80;
  stringgrid4.ColWidths[1]:=100;
  stringgrid4.Cells[0,0]:='销售编号';
  stringgrid4.Cells[1,0]:='销售姓名';
  stringgrid4.RowCount:=1;
  edit16.Text:='';
  edit16.SetFocus;
end;

procedure TForm6.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var strHtbh:string;
var y:integer;
var floatZje:real;
var htcpsl:integer;
var yfhcpsl:integer;
var yfhcpzje:real;
begin
  strHtbh:= stringgrid1.Cells[0,ARow];
  if strHtbh<>'' then
  begin
    y:=1;
    floatZje:=0;
    try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select fcpzl,fcpmc,fcpdj,fcpsl,fcpdj*fcpsl as fcpzje,fyfhsl,fyfhsl*fcpdj as fyfhzje from (select fcpbh,fcpdj,fcpsl,fyfhsl from htcpmxb where fcpbh in (select fcpbh from htcpmxb where fhtbh='''+strHtbh+''')) as a inner join(select fcpbh,fcpmc,fcpzl from cplxk) as b on a.fcpbh=b.fcpbh');
      open;
      if not eof then
      begin
        stringgrid2.RowCount:=ZQuery1.RecordCount+2;
      end else
      begin
        stringgrid2.RowCount:=1;
      end;
      while not eof do
      begin
        stringgrid2.Rows[y].Clear;
        stringgrid2.Cells[0,y]:=fields[0].AsString;
        stringgrid2.Cells[1,y]:=fields[1].AsString;
        stringgrid2.Cells[2,y]:=fields[2].AsString;
        stringgrid2.Cells[3,y]:=fields[3].AsString;
        stringgrid2.Cells[4,y]:=fields[4].AsString;
        stringgrid2.Cells[5,y]:=fields[5].AsString;
        stringgrid2.Cells[6,y]:=fields[6].AsString;
        htcpsl:=htcpsl+fields[3].AsInteger;
        floatzje:=floatzje+fields[4].AsFloat;
        yfhcpsl:=yfhcpsl+fields[5].AsInteger;
        yfhcpzje:=yfhcpzje+fields[6].AsFloat;
        y:=y+1;
        next;
      end;
      stringgrid2.Rows[y].Clear;
      stringgrid2.Cells[0,y]:='总计';
      stringgrid2.Cells[3,y]:=inttostr(htcpsl);
      stringgrid2.Cells[4,y]:=floattostr(floatzje);
      stringgrid2.Cells[5,y]:=inttostr(yfhcpsl);
      stringgrid2.Cells[6,y]:=floattostr(yfhcpzje);
    end;
    Except
        Application.MessageBox('查询失败！','合同管理提示');
    end;
  end;
end;

procedure TForm6.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  edit6.Text:= stringgrid3.Cells[0,ARow];
end;

procedure TForm6.StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if RadioButton1.Checked then
  edit2.Text:=stringgrid4.Cells[0,ARow];
if RadioButton2.Checked then
  edit3.Text:=stringgrid4.Cells[0,ARow];
if RadioButton3.Checked then
  edit10.Text:=stringgrid4.Cells[0,ARow];
end;

end.
