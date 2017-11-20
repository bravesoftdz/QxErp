unit cpbj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids, ExtCtrls,inifiles, ComCtrls, Menus;

type
  TForm101 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ZStoredProc1: TZStoredProc;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    Edit5: TEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    UpDown1: TUpDown;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    EXECL1: TMenuItem;
    Button2: TButton;
    Edit10: TEdit;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure EXECL1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form101: TForm101;
  cfginifile:tinifile;
  selRowIndex:integer;

implementation
uses main;

{$R *.dfm}

procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i:Integer;
begin
  if StringGrid.RowCount > vRow then
  begin
    for i:= vRow to StringGrid.RowCount - 1 do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm101.Button1Click(Sender: TObject);
var
  booldouble:boolean;
  i:integer;
begin
  booldouble:=false;
  for i := 1 to stringgrid1.RowCount - 1 do
  begin
    if combobox1.Text=stringgrid1.Cells[1,i] then
       booldouble:=true;
  end;
  if booldouble=true then
      application.MessageBox('�ò�Ʒ���������б��У���ȷ�ϣ�','��Ʒ���ۼ�����ʾ')
    else
    begin
      if (edit5.Text<>'') and (edit8.Text<>'') and (combobox1.Text<>'') then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-2]:=inttostr(stringgrid1.RowCount-2);
        stringgrid1.Cells[1,stringgrid1.RowCount-2]:=combobox1.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-2]:=edit8.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-2]:=edit5.Text;
        stringgrid1.Cells[4,stringgrid1.RowCount-2]:=floattostr(strtofloat(edit8.Text)*strtofloat(edit5.Text));
        stringgrid1.Cells[5,stringgrid1.RowCount-2]:=edit6.Text+'|�Żݴ�����Ϊ:'+edit9.Text;
        //stringgrid1.RowCount:=stringgrid1.RowCount-1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        combobox1.Text:='';
        edit4.Text:='';
        edit5.Text:='';
        edit6.Text:='';
        edit7.Text:='';
        edit8.Text:='';
        combobox1.SetFocus;
      end else
      application.MessageBox('�뽫��ϸ��д������','��Ʒ���ۼ�����ʾ');
    end;
end;

procedure TForm101.Button2Click(Sender: TObject);
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  combobox1.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  combobox1.SetFocus;
end;

procedure TForm101.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    //combobox1.Items.Add('*|ȫ����Ӧ��');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_cmlxk_cpbhandmcandzl_by_cpmc';
        zstoredproc1.ParamByName('cpmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','������ͬ��ʾ');
  end;
 end;
end;

procedure TForm101.ComboBox1Select(Sender: TObject);
begin
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_cplxk_cpzltj_by_cpbh';
        zstoredproc1.ParamByName('cpbh').Value:=splitstring(combobox1.Text,'|');
        open;
        if not eof then
        begin
          edit4.Text:=fields[0].AsString;
          edit7.Text:=fields[1].AsString;
          case radiogroup1.ItemIndex of
            0: edit8.Text:=floattostr(strtofloat(edit4.Text)*strtofloat(edit1.Text)*(1-strtofloat(edit9.Text)/100));
            1: edit8.Text:=floattostr(strtofloat(edit4.Text)*strtofloat(edit2.Text)*(1-strtofloat(edit9.Text)/100));
            2: edit8.Text:=floattostr((strtofloat(edit4.Text)*strtofloat(edit2.Text)+strtofloat(edit7.Text)*strtofloat(edit3.Text))*(1-strtofloat(edit9.Text)/100));
          end;
        end;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','������ͬ��ʾ');
  end;
end;

procedure TForm101.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit10.Text<>'') then
  begin
    cfginifile.WriteString('�۸�����','���ۼ�Ҫ',edit10.Text);
  end;
end;

procedure TForm101.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit1.Text<>'') then
  begin
    cfginifile.WriteString('�۸�����','��ʽ֧���۸�',edit1.Text);
  end;
end;

procedure TForm101.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit2.Text<>'') then
  begin
    cfginifile.WriteString('�۸�����','��ͨ��ʽ֧���۸�',edit2.Text);
  end;
end;

procedure TForm101.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit3.Text<>'') then
  begin
    cfginifile.WriteString('�۸�����','F4��ʽ֧���۸�',edit3.Text);
  end;
end;

procedure TForm101.EXECL1Click(Sender: TObject);
begin
  if stringgrid1.RowCount>2 then
    ExportStrGridToExcel([stringgrid1])
  else
    application.MessageBox('�б���û���κ����ݣ�','�����ƻ�����Ϣ��ѯ');
end;

procedure TForm101.FormShow(Sender: TObject);
var
filename:string;
begin
    stringgrid1.Cells[0,0]:='���';
    stringgrid1.Cells[1,0]:='��Ʒ����';
    stringgrid1.Cells[2,0]:='����';
    stringgrid1.Cells[3,0]:='����';
    stringgrid1.Cells[4,0]:='�ϼƽ��';
    stringgrid1.Cells[5,0]:='��ע';
    filename:=extractfilepath(paramstr(0))+'config.ini';
    cfginifile:=tinifile.Create(filename);
    edit1.Text:=cfginifile.ReadString('�۸�����','��ʽ֧���۸�','0');
    edit2.Text:=cfginifile.ReadString('�۸�����','��ͨ��ʽ֧���۸�','0');
    edit3.Text:=cfginifile.ReadString('�۸�����','F4��ʽ֧���۸�','0');
    edit10.Text:=cfginifile.ReadString('�۸�����','���ۼ�Ҫ','��');
end;

procedure TForm101.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount-1) then
  begin
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

procedure TForm101.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
end;

procedure TForm101.UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  case radiogroup1.ItemIndex of
    0: edit8.Text:=floattostr(strtofloat(edit4.Text)*strtofloat(edit1.Text)*(1-strtofloat(edit9.Text)/100));
    1: edit8.Text:=floattostr(strtofloat(edit4.Text)*strtofloat(edit2.Text)*(1-strtofloat(edit9.Text)/100));
    2: edit8.Text:=floattostr((strtofloat(edit4.Text)*strtofloat(edit2.Text)+strtofloat(edit7.Text)*strtofloat(edit3.Text))*(1-strtofloat(edit9.Text)/100));
  end;
end;

end.