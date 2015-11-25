unit fcpckgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, ExtCtrls;

type
  TForm27 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Memo1: TMemo;
    Label6: TLabel;
    Button2: TButton;
    ZStoredProc1: TZStoredProc;
    ComboBoxEx1: TComboBoxEx;
    Label8: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Label16: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxEx1Select(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Change(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';
implementation

{$R *.dfm}

uses main;

procedure TForm27.Button1Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (combobox1.Text<>'') then
    if (edit2.Text<>'') and (edit3.Text<>'') then
      if (strtofloat(edit4.Text)>=strtofloat(edit3.Text)) then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=inttostr(stringgrid1.RowCount-1);
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=edit2.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=edit3.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=edit5.Text;
        edit2.Text:='';
        edit3.Text:='';
        edit4.Text:='';
        edit5.Text:='';
        edit2.SetFocus;
      end else
        application.MessageBox('申领数额大于库存数！','非产品出库管理提示')
    else
      application.MessageBox('请将明细填写！','非产品出库管理提示')
  else
    application.MessageBox('请先将出库单信息填写完整！','非产品出库管理提示');
end;

procedure TForm27.Button2Click(Sender: TObject);
var
  y:integer;
begin
if application.MessageBox('确定要保存数据吗？','入库单管理提示',1)=1 then
  if stringgrid1.RowCount>1 then
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_insert_ckdinfo';
        zstoredproc1.ParamByName('ckdbh').Value:=edit1.Text;
        zstoredproc1.ParamByName('zgid').Value:=splitstring(ComboBox1.Text,'|');
        zstoredproc1.ParamByName('ckdate').Value:=datetimepicker1.Date;
        zstoredproc1.ParamByName('czry').Value:=main.strUser;
        zstoredproc1.ParamByName('memo').Value:='*'+memo1.Text;
        execProc;
        zstoredproc1.StoredProcName:='proc_insert_ckdmxz';
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('ckdbh').Value:=edit4.Text;
          zstoredproc1.ParamByName('itembh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('cksl').Value:=stringgrid1.Cells[2,y];
          zstoredproc1.ParamByName('memo').Value:='*'+stringgrid1.Cells[3,y];
          execProc;
        end;
        zstoredproc1.StoredProcName:='proc_update_ckitem_itemkcs';
        for y := 1 to stringgrid1.RowCount - 1 do
        begin
          zstoredproc1.ParamByName('itembh').Value:=splitstring(stringgrid1.Cells[1,y],'|');
          zstoredproc1.ParamByName('cksl').Value:=stringgrid1.Cells[2,y];
          execProc;
        end;
      end;
      application.MessageBox('保存数据成功！','材料配件入库管理提示');
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      edit4.Text:='';
      combobox1.Text:='';
      memo1.Text:='';
      stringgrid1.RowCount:=1;
  except
    application.MessageBox('保存数据失败！','材料配件入库管理提示');
  end else
    application.MessageBox('请添加入库单内的明细！','材料配件入库管理提示');
end;

procedure TForm27.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//proc_cx_zgbhandxm_by_zgxm
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_zgbhandxm_by_zgxm';
        zstoredproc1.ParamByName('zgxm').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','非产品出库管理提示');
  end;
 end;
end;

procedure TForm27.ComboBoxEx1Select(Sender: TObject);
begin
  edit2.Text:=comboboxex1.Text;
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_ckitemkcsl_by_itembh';
      ParamByName('itembh').Value:=SplitString(edit2.Text,'|');
      open;
      if not eof then
        edit4.Text:=fields[0].AsString
      else
        application.MessageBox('该物品不存在！','非产品出库管理');
    end;
  except
    application.MessageBox('数据查询失败！','非产品出库管理');
  end;
end;

procedure TForm27.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
  try
  with  zStoredProc1 do
  begin
    close;
    StoredProcName:='proc_cx_newckdbh';
    open;
    if fields[0].AsString<>'' then
      edit1.Text:=fields[0].AsString
    else
      edit1.Text:='1';
  end;
  except
    application.MessageBox('数据查询失败！','非产品出库管理');
  end;

end;

procedure TForm27.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (edit2.Text<>'') then
    try
      with zstoredproc1 do
      begin
        comboboxex1.Items.Clear;
        close;
        zstoredproc1.StoredProcName:='proc_cx_ckitemmc';
        zstoredproc1.ParamByName('itemname').Value:=edit2.Text;
        open;
        while not eof do
        begin
          comboboxex1.Items.Add(fields[0].asstring);
          next;
        end;
          comboboxex1.DroppedDown:=true;
          edit2.SetFocus;
      end;
  except
    application.MessageBox('数据查询失败！','材料配件入库管理提示');
  end;
end;

procedure TForm27.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit3.Text)>0)   then
    key:=#0;
end;

procedure TForm27.Edit4Change(Sender: TObject);
begin
  if edit4.text<>'' then
    if strtofloat(edit4.Text)<=0 then
    begin
      application.MessageBox('当前库存为零！','材料配件入库管理提示');
      edit4.Text:='';
      edit2.text:='';
    end;
end;

procedure TForm27.FormShow(Sender: TObject);
begin
  datetimepicker1.Date:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='物品编号';
  stringgrid1.Cells[2,0]:='出库数量';
  stringgrid1.Cells[3,0]:='备注';

end;

end.
