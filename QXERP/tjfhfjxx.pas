unit tjfhfjxx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm61 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form61: TForm61;
  isfrom:string;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses jhdxzfhd,xzscjh;

{$R *.dfm}

procedure TForm61.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  booldouble:=true;
  if edit3.text<>'' then
  begin
    if isfrom='xzjh' then
      with xzscjh.Form36.StringGrid3 do
      begin
        for i := 1 to RowCount-2 do
          if trim(Cells[1,i])=trim(SplitString(combobox1.Text,'|')) then
            booldouble:=false;
        if booldouble=false then
          application.MessageBox('该产品编号已经添加至发货单列表!','添加附属物件提示')
        else begin
          RowCount:=RowCount+1;
          Cells[0,RowCount-2]:=inttostr(RowCount-2);
          Cells[1,RowCount-2]:=xzscjh.Form36.Edit2.Text;
          Cells[2,RowCount-2]:=combobox1.Text;
          Cells[3,RowCount-2]:=edit3.Text;
          Cells[4,RowCount-2]:=edit3.Text;
          Rows[RowCount-1].Clear;
          edit1.Text:='';
          edit2.Text:='';
          edit3.Text:='';
          combobox1.Text:='';
          combobox1.SetFocus;
        end;
      end;
    if isfrom='jhdzfhd' then
      with jhdxzfhd.form40.stringgrid2 do
      begin
        for i := 1 to RowCount-2 do
          if trim(Cells[1,i])=trim(SplitString(combobox1.Text,'|')) then
            booldouble:=false;
        if booldouble=false then
          application.MessageBox('该产品编号已经添加至发货单列表!','添加附属物件提示')
        else begin
          RowCount:=RowCount+1;
          Cells[0,RowCount-2]:=inttostr(RowCount-2);
          Cells[1,RowCount-2]:=SplitString(combobox1.Text,'|');
          Cells[2,RowCount-2]:=edit1.Text;
          Cells[3,RowCount-2]:=edit2.Text;
          Cells[4,RowCount-2]:='0';
          Cells[5,RowCount-2]:=edit3.Text;
          Rows[RowCount-1].Clear;
          edit1.Text:='';
          edit2.Text:='';
          edit3.Text:='';
          combobox1.Text:='';
          combobox1.SetFocus;
        end;
      end;
  end else
    application.MessageBox('请将所有项目填写完整!','添加附属物件提示');
end;

procedure TForm61.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    edit1.Text:='';
    //combobox1.Items.Add('*|全部供应商');
    try
      with jhdxzfhd.form40.ZStoredProc1 do
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
    application.MessageBox('数据查询失败！','添加附属物件提示');
  end;
 end;
end;

procedure TForm61.ComboBox1Select(Sender: TObject);
begin
  try
    with jhdxzfhd.form40.zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_cplxk_by_cpbh';
      ParamByName('cpbh').Value:=SplitString(combobox1.Text,'|');
      Open;
      if not eof then
      begin
        edit1.text:=fields[1].asstring;
        edit2.text:=fields[2].asstring;
      end;
    end;
  except
    application.MessageBox('数据查询失败！','添加附属物件提示');
  end;
end;

procedure TForm61.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit3.Text)>0)   then
    key:=#0;
end;

end.
