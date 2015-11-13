unit khgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls;

type
  TForm5 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    ADOQuery1: TADOQuery;
    Edit4: TEdit;
    Edit9: TEdit;
    Label12: TLabel;
    Button5: TButton;
    Label13: TLabel;
    Edit10: TEdit;
    Label14: TLabel;
    Edit11: TEdit;
    Label15: TLabel;
    Edit12: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Edit8: TEdit;
    Label16: TLabel;
    Edit13: TEdit;
    Label17: TLabel;
    Edit14: TEdit;
    Label18: TLabel;
    Edit15: TEdit;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Button6: TButton;
    procedure FormShow(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Main;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  if (edit3.Text <> '') and (edit2.Text <> '') then
  begin
    try
      with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into Kh_info (fkdhid,fkhmc,fzgdwmc,faddr,ffrdb,flxr,flxrdh) values ('''+edit1.Text+''','''+edit3.Text+''','''+edit2.Text+''','''+edit4.Text+''','''+edit10.Text+''','''+edit11.Text+''','''+edit12.Text+''')');
        ExecSQL;
        Application.MessageBox('新增记录成功！','提示');
        edit2.Text := '';
        edit3.Text := '';
        edit4.Text := '';
      close;
      sql.Clear;
      sql.Add('select top 1 fkdhid+1 from Kh_info order by CONVERT(int,fkdhid) desc');
      open;
      if not eof then
        edit1.Text := fields[0].AsString;
      end;
      Except
      Application.MessageBox('新增记录失败！','提示');
    end;
   end else
    Application.MessageBox('请将必填项目填写完整！','提示');
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  if (Edit5.Text = '') then
  begin
    Application.MessageBox('请选择需要修改的单位！', '提示');
  end
  else
  begin
    try
      with ADOQuery1 do
      begin
        close;
        sql.Clear;
        if CheckBox1.Checked then
          sql.Add('update Kh_info set fkhmc = ''' + Edit6.Text +
              ''' where fkdhid = ''' + Edit5.Text + '''');
        if CheckBox2.Checked then
          sql.Add('update Kh_info set fzgdwmc = ''' + Edit7.Text +
              ''' where fkdhid = ''' + Edit5.Text + '''');
        if CheckBox4.Checked then
          sql.Add('update Kh_info set faddr = ''' + Edit8.Text +
              ''' where fkdhid = ''' + Edit5.Text + '''');
        if CheckBox3.Checked then
          sql.Add('update Kh_info set ffrdb = ''' + Edit13.Text +
              ''' where fkdhid = ''' + Edit5.Text + '''');
        if CheckBox5.Checked then
          sql.Add('update Kh_info set flxr = ''' + Edit14.Text +
              ''' where fkdhid = ''' + Edit5.Text + '''');
        if CheckBox6.Checked then
          sql.Add('update Kh_info set flxrdh = ''' + Edit15.Text +
              ''' where fkdhid = ''' + Edit5.Text + '''');
        ExecSQL;
        Edit6.ReadOnly := True;
        Edit7.ReadOnly := True;
        Edit8.ReadOnly := True;
        Edit13.ReadOnly := True;
        Edit14.ReadOnly := True;
        Edit15.ReadOnly := True;
        CheckBox1.Checked := False;
        CheckBox2.Checked := False;
        CheckBox3.Checked := False;
        CheckBox4.Checked := False;
        CheckBox5.Checked := False;
        CheckBox6.Checked := False;
        ListBox1.Clear;
        close;
        sql.Clear;
        sql.Add('select fkhmc from Kh_info');
        open;
        while not eof do
        begin
          ListBox1.Items.Append(fields[0].AsString);
          next;
        end;
        Application.MessageBox('记录修改成功！', '提示');
      end;
    Except
      Application.MessageBox('记录修改失败！', '提示');
    end;
  end;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  Form5.CloseModal;
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
  ListBox1.Clear;
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fkhmc from Kh_info where fkhmc like ''%' +
        Edit9.Text + '%''');
    open;
    while not eof do
    begin
      ListBox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;

end;

procedure TForm5.Button6Click(Sender: TObject);
var strZgdwMC:string;
begin
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select fzgdwmc from zgdw_info where fzgdwid = '''+edit7.Text+'''');
  open;
  if not eof then
  strZgdwMC := fields[0].AsString;
  application.MessageBox(PWideChar(strZgdwMC),'主管单位名称');

end;
end;

procedure TForm5.CheckBox1Click(Sender: TObject);
begin
  if Edit5.Text <> '' then
  begin
    Edit6.ReadOnly := not CheckBox1.Checked;
  end;
end;

procedure TForm5.CheckBox2Click(Sender: TObject);
begin
  if Edit5.Text <> '' then
  begin
    Edit7.ReadOnly := not CheckBox2.Checked;
  end;
end;

procedure TForm5.CheckBox3Click(Sender: TObject);
begin
  if Edit5.Text <> '' then
  begin
    Edit13.ReadOnly := not CheckBox3.Checked;
  end;
end;

procedure TForm5.CheckBox4Click(Sender: TObject);
begin
  if Edit5.Text <> '' then
  begin
    Edit8.ReadOnly := not CheckBox4.Checked;
  end;
end;

procedure TForm5.CheckBox5Click(Sender: TObject);
begin
  if Edit5.Text <> '' then
  begin
    Edit14.ReadOnly := not CheckBox5.Checked;
  end;
end;

procedure TForm5.CheckBox6Click(Sender: TObject);
begin
  if Edit5.Text <> '' then
  begin
    Edit15.ReadOnly := not CheckBox6.Checked;
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
var
  strKhBH: String;
begin
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select top 1 fkdhid+1 from Kh_info order by CONVERT(int,fkdhid) desc');
    open;
    if not eof then
      strKhBH := fields[0].AsString;
    Edit1.Text := strKhBH;
  end;
end;

procedure TForm5.ListBox1Click(Sender: TObject);
var
  strKHMC: String;
begin
  strKHMC := ListBox1.Items.Strings[ListBox1.itemindex];
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add(
      'select fkdhid,fkhmc,fzgdwmc,faddr,ffrdb,flxr,flxrdh from Kh_info where fkhmc = '''
        + strKHMC + '''');
    open;
    if not eof then
    begin
      Edit5.Text := fields[0].AsString;
      Edit6.Text := fields[1].AsString;
      Edit7.Text := fields[2].AsString;
      Edit8.Text := fields[3].AsString;
      Edit13.Text := fields[4].AsString;
      Edit14.Text := fields[5].AsString;
      Edit15.Text := fields[6].AsString;

    end;
  end;
end;

procedure TForm5.TabSheet2Show(Sender: TObject);
begin
  ListBox1.Clear;
  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fkhmc from kh_info');
    open;
    while not eof do
    begin
      ListBox1.Items.Append(fields[0].AsString);
      next;
    end;

  end;
end;

end.
