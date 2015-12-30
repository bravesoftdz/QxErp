unit csckgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  ComCtrls, Grids;

type
  TForm64 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    ZStoredProc1: TZStoredProc;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form64: TForm64;

implementation
uses main;

{$R *.dfm}

procedure TForm64.Button1Click(Sender: TObject);
var
  booldouble:boolean;
  i:integer;
begin
  booldouble:=false;
  if (combobox2.Text<>'') and (edit1.Text<>'') then
  begin
    for i := 1 to stringgrid1.RowCount - 1 do
    begin
      if combobox1.Text=stringgrid1.Cells[1,i] then
         booldouble:=true;
    end;
    if booldouble=true then
        application.MessageBox('�ò�Ʒ���������б��У���ȷ�ϣ�','��Ʒ���Գ�����ʾ')
      else
      if (edit2.Text<>'') and (combobox1.Text<>'') then
        if strtofloat(edit2.Text)<=strtofloat(edit4.Text)  then
        begin
          stringgrid1.RowCount:=stringgrid1.RowCount+1;
          stringgrid1.Cells[0,stringgrid1.RowCount-2]:=inttostr(stringgrid1.RowCount-2);
          stringgrid1.Cells[1,stringgrid1.RowCount-2]:=combobox1.Text;
          stringgrid1.Cells[2,stringgrid1.RowCount-2]:=edit2.Text;
          stringgrid1.Cells[3,stringgrid1.RowCount-2]:=edit3.Text;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          combobox1.Text:='';
          edit2.Text:='';
          edit3.Text:='';
          combobox1.SetFocus;
        end else
          application.MessageBox('�����������ڿ��������','��Ʒ���Գ�����ʾ')
      else
        application.MessageBox('�뽫��ϸ��д������','��Ʒ���Գ�����ʾ');
  end else
    application.MessageBox('�뽫���Գ��ⵥ��д������','��Ʒ���Գ�����ʾ');
end;

procedure TForm64.Button2Click(Sender: TObject);
var
  y:integer;
begin
if application.MessageBox('ȷ��Ҫ����������','�����ӹ���������ʾ',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_ceshichuku_info';  //csckdid,cscksqrid,csckdate,czry,csckly
        zstoredproc1.ParamByName('csckdid').Value:=edit1.Text;
        zstoredproc1.ParamByName('cscksqrid').Value:=splitstring(combobox2.Text,'|');
        zstoredproc1.ParamByName('csckdate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('czry').Value:=main.strUser;
        zstoredproc1.ParamByName('csckly').Value:='*'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_ceshichuku_mxz';  //jcsckdid,csckcpbh,cscksl,csckmemo
        for y := 1 to stringgrid1.RowCount - 2 do
        begin
          zstoredproc1.ParamByName('csckdid').Value:=edit1.Text;
          zstoredproc1.ParamByName('csckcpbh').Value:=splitstring(stringgrid1.cells[1,y],'|');
          zstoredproc1.ParamByName('cscksl').Value:=stringgrid1.cells[2,y];
          zstoredproc1.ParamByName('csckmemo').Value:='*'+stringgrid1.cells[3,y];
          execProc;
        end;
      end;
      application.MessageBox('�������ݳɹ���','�����ӹ���������ʾ');
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      edit4.Text:='0';
      combobox1.Text:='';
      combobox2.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=1;
  except
    application.MessageBox('��������ʧ�ܣ�','�����ӹ���������ʾ');
  end else
    application.MessageBox('�����Ӽӹ����ڵ���ϸ��','�����ӹ���������ʾ');
end;

procedure TForm64.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    edit4.Text:='0';
    //combobox1.Items.Add('*|ȫ����Ӧ��');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        ParamByName('cpmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʒ���Գ�����ʾ');
  end;
 end;
end;

procedure TForm64.ComboBox1Select(Sender: TObject);
begin
  edit4.Text:='';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_cpkcb_by_cbph';
      ParamByName('cpbh').Value:=SplitString(combobox1.Text,'|');
      open;
      if not eof then
        edit4.Text:=fields[0].AsString;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʒ������ʾ');
  end;
end;

procedure TForm64.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox2.Items.Count>0 then
    ComboBox2.Items.Clear;
    //combobox1.Items.Add('*|ȫ����Ӧ��');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_zgbhandxm_by_zgxm';
        zstoredproc1.ParamByName('zgxm').Value:=ComboBox2.Text;
        open;
        while not eof do
        begin
          ComboBox2.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʒ���Գ�����ʾ');
  end;
 end;
end;

procedure TForm64.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_newcsckdid';
        open;
        if fields[0].AsString<>'' then
          edit1.Text:=fields[0].AsString
        else
          edit1.Text:=formatDateTime('yyyy',date)+'0001';
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','�����ӹ���������ʾ');
    end;
end;

procedure TForm64.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm64.FormShow(Sender: TObject);
begin
  datetimepicker1.DateTime:=now();
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ����';
  stringgrid1.Cells[2,0]:='��������';
  stringgrid1.Cells[3,0]:='��ע';
end;

end.