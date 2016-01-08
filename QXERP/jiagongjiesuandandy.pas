unit jiagongjiesuandandy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  Grids;

type
  TForm83 = class(TForm)
    Label8: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    Edit15: TEdit;
    Edit8: TEdit;
    Edit14: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    Label5: TLabel;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Label1: TLabel;
    Edit5: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form83: TForm83;
  strjgjsdbh,strjgsbh,strfpbh,strfpsl,strjsje,strjsdmemo,strcddate:string;
  function SmallTOBig(small:real):string;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm83.Button3Click(Sender: TObject);
begin
if(edit2.Text<>'') and (stringgrid1.RowCount>2) then
  try
    form1.RvDataSetConnection1.DataSet:=zstoredProc1;
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_jgjsd_mxz_by_jgjsdid';
      ParamByName('jgjsdid').Value:=edit2.Text;
      open;
      with form1 do
      begin
        rvproject1.Open;
        rvproject1.SelectReport('jgjsddy',true);
        rvproject1.ClearParams;
        rvproject1.SetParam('jgjsdbh',edit2.Text);
        rvproject1.SetParam('jgsbh',edit15.Text);
        rvproject1.SetParam('jgsmc',edit8.Text);
        rvproject1.SetParam('cdrq',edit5.Text);
        rvproject1.SetParam('lxr',edit11.Text);
        rvproject1.SetParam('lxrdh',edit12.Text);
        rvproject1.SetParam('jgszh',edit9.Text);
        rvproject1.SetParam('jgskhh',edit10.Text);
        rvproject1.SetParam('jgsdz',edit14.Text);
        rvproject1.SetParam('fpbh',edit1.Text);
        rvproject1.SetParam('fpsl',edit3.Text+'%');
        rvproject1.SetParam('memo',memo2.Text);
        rvproject1.SetParam('hjje','������ң�'+edit4.Text+'Ԫ����:'+SmallTOBig(strtofloat(edit4.Text))+'��');
        rvproject1.SetParam('czry',main.strUser);
        zstoredproc1.SetResultSet(1);
        RvProject1.Execute;
        rvproject1.Close;
      end;
    end;
  except
    application.MessageBox('��ӡʧ��','�ӹ����㵥��ӡ��ʾ');
  end else
    application.MessageBox('���ȵ����ѱ���ļӹ����㵥��','�ӹ����㵥��ӡ��ʾ');
end;

procedure TForm83.Button4Click(Sender: TObject);
begin
  if  application.MessageBox('ȷ��ȡ���˳���','��Ʊ֪ͨ���ӡ��ʾ',1)=1 then
  begin
    edit9.text:='';
    edit8.text:='';
    edit11.text:='';
    edit3.text:='0';
    edit4.text:='0';
    edit12.text:='';
    edit10.text:='';
    edit14.text:='';
    edit15.text:='';
    memo2.Lines.Clear;
    edit2.Text:='';
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    edit1.Text:='';
    form83.Close;
  end;
end;

procedure TForm83.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='���㵥���';
  stringgrid1.Cells[2,0]:='�ӹ������';
  stringgrid1.Cells[3,0]:='��Ʊ���';
  stringgrid1.Cells[4,0]:='��ע';
  edit5.Text:= strcddate;
  edit2.Text:= strjgjsdbh;
  edit4.Text:= '0';
  try
    if edit2.Text<>'' then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_jgsinfo_jgsbh';
        ParamByName('jgsbh').Value:=splitstring(strjgsbh,'|');
        open;
        if not eof then
        begin
          Edit15.Text := fields[1].AsString;
          Edit8.Text := fields[2].AsString;
          Edit14.Text := fields[3].AsString;
          Edit9.Text := fields[4].AsString;
          Edit10.Text := fields[5].AsString;
          Edit11.Text := fields[6].AsString;
          Edit12.Text := fields[7].AsString;
          Edit1.Text := strfpbh;
          Edit3.Text := strfpsl;
          Edit4.Text := strjsje;
          Memo2.Text := strjsdmemo;
        end;                                  //proc_cx_jgdjiesuan_wxjgdinfo_by_jgsbh
        close;
        StoredProcName:='proc_cx_jgjsd_mxz_by_jgjsdid';
        ParamByName('jgjsdid').Value:=edit2.Text;
        open;
        i:=1;
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        while not eof do
        begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            stringgrid1.Cells[0,i]:=inttostr(i);
            stringgrid1.Cells[1,i]:=fields[0].AsString;
            stringgrid1.Cells[2,i]:=fields[1].AsString;
            stringgrid1.Cells[3,i]:=fields[2].AsString;
            stringgrid1.Cells[4,i]:=fields[3].AsString;
            //stringgrid1.Cells[5,i]:=fields[3].AsString;
            i:=i+1;
            stringgrid1.Rows[stringgrid1.RowCount-1].Clear;         //proc_cx_newkptzsid
          next;
        end;
      end;
    except
      application.MessageBox('���ݲ�ѯʧ�ܣ�','�ӹ����㵥��ӡ��ʾ');
    end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','�ӹ����㵥��ӡ��ʾ');
  end;
end;

end.