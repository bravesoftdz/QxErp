unit yskjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Grids;

type
  TForm9 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label30: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit16: TEdit;
    StringGrid4: TStringGrid;
    Button7: TButton;
    DateTimePicker1: TDateTimePicker;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    DateTimePicker2: TDateTimePicker;
    Edit6: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    StringGrid3: TStringGrid;
    Edit7: TEdit;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    StringGrid1: TStringGrid;
    Edit9: TEdit;
    Button6: TButton;
    StringGrid2: TStringGrid;
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton4: TRadioButton;
    procedure Edit16Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses main;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  if (edit1.Text <> '') and (edit2.Text <> '')then
  begin
    try
      with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into yskmxz (fyskbh,fxzje,fhsje,fskdate,fmemo) values ('''+edit1.Text+''','+edit2.Text+','+'0'+','''+datetimetostr(datetimepicker1.Date)+''','''+main.strUser+edit4.Text+''')');
        if strtofloat(edit2.text)>=0 then
        sql.Add('update yskxx set fdqye=fdqye+'+edit2.Text+',flastdate='''+datetimetostr(datetimepicker1.Date)+''' where fyskbh='+edit1.Text)
        else
        sql.Add('update yskxx set fdqye=fdqye'+edit2.Text+',flastdate='''+datetimetostr(datetimepicker1.Date)+''' where fyskbh='+edit1.Text);
        //edit1.Text:=sql.Text;
        ExecSQL;
        edit1.Text := '';
        edit2.Text := '';
        Application.MessageBox('新增应收款成功！','应收款管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('新增应收款失败！','应收款管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','应收款管理提示');
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
  if (edit3.Text <> '') and (edit5.Text <> '')then
  begin
    try
      with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into yskmxz (fyskbh,fxzje,fhsje,fskdate,fmemo) values ('''+edit3.Text+''','''+'0'+''','''+edit5.Text+''','''+datetimetostr(datetimepicker2.Date)+''','''+main.strUser+edit6.Text+''')');
        if strtofloat(edit5.text)>=0 then
        sql.Add('update yskxx set fdqye=fdqye-'+edit5.Text+',flastdate='''+datetimetostr(datetimepicker2.Date)+''' where fyskbh='+edit3.Text)
        else
        sql.Add('update yskxx set fdqye=fdqye+'+inttostr(strtoint(edit5.Text)*-1)+',flastdate='''+datetimetostr(datetimepicker2.Date)+''' where fyskbh='+edit3.Text);
        ExecSQL;
        edit3.Text := '';
        edit5.Text := '';
        Application.MessageBox('新增回收款成功！','应收款管理提示');
        //PageControl1.ActivePageIndex:=1;
      end;
    Except
      Application.MessageBox('新增回收款失败！','应收款管理提示');
    end;
  end else
    Application.MessageBox('请将必填项目填写完整！','应收款管理提示');
end;

procedure TForm9.Button5Click(Sender: TObject);
begin
  stringgrid3.Visible:=not stringgrid3.Visible;
  edit7.Visible:= not edit7.Visible;
  label16.Visible:= not label16.Visible;
  groupbox2.Visible:= not groupbox2.Visible;
end;

procedure TForm9.Button7Click(Sender: TObject);
begin
  stringgrid4.Visible:=not stringgrid4.Visible;
  edit16.Visible:= not edit16.Visible;
  label30.Visible:= not label30.Visible;
  groupbox1.Visible:= not groupbox1.Visible;
end;

procedure TForm9.Edit16Change(Sender: TObject);
var y:integer;
begin
  if (RadioButton2.Checked=false) and (RadioButton3.Checked=false) then
  begin
   Application.MessageBox('请选择查询项目！','应收款管理提示');
  end else
  begin
    y:=1;
    if edit16.Text<>'' then
    begin
      try
      with ADOQuery1 do
      begin
        close;
        sql.Clear;
        if RadioButton3.Checked=True then
        sql.Add('select fyskbh,fkhmc from (select fyskbh,fkhmc,fxsyid from (select fyskbh,fkhid,fxsyid from yskxx  where fisdel=''N'') as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join (select fxsyid,fxsyxm from Xsy_info  where fxsyxm like ''%'+edit16.Text+'%'') as d on c.fxsyid=d.fxsyid');
        if RadioButton2.Checked=True then
        sql.Add('select fyskbh,fkhmc+''--''+fxsyxm from (select fyskbh,fkhmc,fxsybh from (select fyskbh,fhtbh from yskxx) as c join (select fhtbh,fkhmc,fxsybh from (select fhtbh,fkhbh,fxsybh from ht_info) as a right join (select fkdhid,fkhmc from Kh_info where fkhmc like ''%'+edit16.Text+'%'') as b on a.fkhbh=b.fkdhid) as d on c.fhtbh=d.fhtbh) as e join (select fxsyid,fxsyxm from Xsy_info) as f on e.fxsybh=f.fxsyid');
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
            Application.MessageBox('查询失败！','应收款管理提示');
      end;
    end;
  end;
end;

procedure TForm9.Edit7Change(Sender: TObject);
var y:integer;
begin
  if (RadioButton1.Checked=false) and (RadioButton4.Checked=false) then
  begin
   Application.MessageBox('请选择查询项目！','应收款管理提示');
  end else
  begin
    y:=1;
    if edit7.Text<>'' then
    begin
      try
      with ADOQuery1 do
      begin
        close;
        sql.Clear;
        if RadioButton4.Checked=True then
        sql.Add('select fyskbh,fkhmc from (select fyskbh,fkhmc,fxsyid from (select fyskbh,fkhid,fxsyid from yskxx  where fisdel=''N'') as a join (select fkdhid,fkhmc from Kh_info) as b on a.fkhid=b.fkdhid) as c join (select fxsyid,fxsyxm from Xsy_info  where fxsyxm like ''%'+edit7.Text+'%'') as d on c.fxsyid=d.fxsyid');
        if RadioButton1.Checked=True then
        sql.Add('select fyskbh,fkhmc+''--''+fxsyxm from (select fyskbh,fkhmc,fxsybh from (select fyskbh,fhtbh from yskxx) as c join (select fhtbh,fkhmc,fxsybh from (select fhtbh,fkhbh,fxsybh from ht_info) as a right join (select fkdhid,fkhmc from Kh_info where fkhmc like ''%'+edit7.Text+'%'') as b on a.fkhbh=b.fkdhid) as d on c.fhtbh=d.fhtbh) as e join (select fxsyid,fxsyxm from Xsy_info) as f on e.fxsybh=f.fxsyid');
        open;
        stringgrid3.RowCount:=RecordCount+1;
        while not eof do
        begin
          stringgrid3.Cells[0,y]:=fields[0].AsString;
          stringgrid3.Cells[1,y]:=fields[1].AsString;
          y:=y+1;
          next;
        end;
      end;
        Except
            Application.MessageBox('查询失败！','应收款管理提示');
      end;
    end;
  end;
end;
procedure TForm9.FormActivate(Sender: TObject);
begin
  datetimepicker1.DateTime := date();
  datetimepicker2.DateTime := date();
end;

procedure TForm9.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
edit3.Text:=stringgrid3.Cells[0,ARow];
end;

procedure TForm9.StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
edit1.Text:=stringgrid4.Cells[0,ARow];
end;

end.

