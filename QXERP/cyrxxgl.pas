unit cyrxxgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure;

type
  TForm72 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    ListBox1: TListBox;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    Edit15: TEdit;
    ZStoredProc1: TZStoredProc;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form72: TForm72;

implementation

uses main;

{$R *.dfm}

procedure TForm72.Button1Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (edit2.Text<>'') and (edit5.Text<>'') and (edit6.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_cyrinfo';     // cysid,cysmc,lxr,lxrphone,memo
        ParamByName('cysid').Value:=edit1.Text;
        ParamByName('cysmc').Value:=edit2.Text;
        ParamByName('lxr').Value:=edit5.Text;
        ParamByName('lxrphone').Value:=edit6.Text;
        ParamByName('memo').Value:='*'+memo1.Text;
        ExecProc;
        if ParamByName('returncode').Value=1 then
          application.MessageBox('�ó������Ѿ����ڣ�','�����̹�����ʾ')
        else begin
          application.MessageBox('���ݱ���ɹ���','�����̹�����ʾ');
          edit1.Text:='';
          edit2.Text:='';
          edit5.Text:='';
          edit6.Text:='';
          memo1.Text:='';
          edit1.SetFocus;
        end;
      end;
  except
    application.MessageBox('���ݸ���ʧ�ܣ�','�����̹�����ʾ');
  end else
    application.MessageBox('�뽫��������д������','�����̹�����ʾ');
end;

procedure TForm72.Button3Click(Sender: TObject);
begin
  if (edit15.Text<>'') and (edit8.Text<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_update_cyrinfo_by_cyrid';
        ParamByName('cyrid').Value:=edit15.Text;
        ParamByName('cyrmc').Value:=edit8.Text;
        ParamByName('lxr').Value:=edit11.Text;
        ParamByName('lxrphone').Value:=edit12.Text;
        ParamByName('memo').Value:=memo2.Text;
      ExecProc;
      //fgysmc=gysmc,fgyszh=gyszh,fgyskhh=gyskhh,flxr=lxr,flxrphone=lxrphone,fmemo=memo
    end;
      application.MessageBox('�����޸ĳɹ���','�����̹�����ʾ');
  except
    application.MessageBox('���ݸ���ʧ�ܣ�','�����̹�����ʾ');
  end;
end;

procedure TForm72.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_newcyrid';
      open;
      if fields[0].AsString<>'' then
      begin
        edit1.Text:=fields[0].AsString;
        edit2.SetFocus;
      end else
      begin
        edit1.Text:='1';
        edit2.SetFocus;
      end;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','�����̹�����ʾ');
  end;
end;

procedure TForm72.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit7.Text<>'') then
  try
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_modicyrinfo_by_crymc';
      ParamByName('cyrmc').Value:=edit7.Text;
      open;
      listbox1.Clear;
      while not eof do
      begin
        listbox1.Items.Add(fields[0].asstring);
        next;
      end;
      edit7.Text:='';
      listbox1.ItemIndex:=0;
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','�����̹�����ʾ');
  end;
end;

procedure TForm72.ListBox1Click(Sender: TObject);
begin
  try
    if ListBox1.Items.Strings[ListBox1.itemindex]<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_cyrinfo_by_cyrid';
        ParamByName('cyrid').Value:=SplitString(ListBox1.Items.Strings[ListBox1.itemindex],'|');
        open;
        if not eof then
        begin
          Edit15.Text := fields[1].AsString;
          Edit8.Text := fields[2].AsString;
          Edit11.Text := fields[3].AsString;
          Edit12.Text := fields[4].AsString;
          Memo2.Text := fields[5].AsString;
        end;
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','�����̹�����ʾ');
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','�����̹�����ʾ');
  end;
end;

end.