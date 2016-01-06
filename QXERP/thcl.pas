unit thcl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  ComCtrls, Grids, Menus;

type
  TForm73 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Edit1: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    StringGrid1: TStringGrid;
    Edit7: TEdit;
    Edit8: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    ComboBox4: TComboBox;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Edit2: TEdit;
    Button3: TButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form73: TForm73;
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

procedure TForm73.Button1Click(Sender: TObject);
var
  i:integer;
  booldouble:boolean;
begin
  booldouble:=true;
  for i := 1 to stringgrid1.RowCount-2 do
    if trim(combobox4.Text)=trim(stringgrid1.Cells[1,i]) then
      booldouble:=false;
  if booldouble=false then
    application.MessageBox('该产品编号已经添加至列表!','退货处理提示')
  else if (strtofloat(edit5.Text)<=strtofloat(edit4.Text)) and (strtofloat(edit5.Text)>0) then
  begin
    stringgrid1.RowCount:=stringgrid1.RowCount+1;
    stringgrid1.Cells[0,stringgrid1.RowCount-2]:=inttostr(stringgrid1.RowCount-2);
    stringgrid1.Cells[1,stringgrid1.RowCount-2]:=combobox4.Text;
    stringgrid1.Cells[2,stringgrid1.RowCount-2]:=edit7.Text;
    stringgrid1.Cells[3,stringgrid1.RowCount-2]:=edit5.Text;
    stringgrid1.Cells[4,stringgrid1.RowCount-2]:=floattostr(strtofloat(edit7.Text)*strtofloat(edit5.Text));
    edit2.Text:=floattostr(strtofloat(edit2.Text)+strtofloat(stringgrid1.Cells[4,stringgrid1.RowCount-2]));
    edit7.Text:='';
    edit5.Text:='0';
    edit4.Text:='';
    edit8.Text:='';
    combobox4.Text:='';
    combobox4.SetFocus;
  end else
    application.MessageBox('退货数量大于已发货数量或小于等于0!','退货处理提示');
end;

procedure TForm73.Button2Click(Sender: TObject);
var
  i:integer;
begin
  if  application.MessageBox('确定要进行退货处理吗？','退货处理提示',1)=1 then
    if (stringgrid1.RowCount>2) and (edit1.Text<>'') then
      try
        with zStoredProc1 do          //proc_modify_tuihuo_htinfo_yskmxzwkp_yskxx htbh,thje,thdate,memo
        begin                          //proc_modify_tuihuo_htmxz_cpmxz_cpkcb htbh,cpbh,thsl,thdate,czry,memo
          close;
          StoredProcName:='proc_modify_tuihuo_htinfo_yskmxzwkp_yskxx';
          ParamByName('htbh').Value:=edit1.Text;
          ParamByName('thje').Value:=edit2.Text;
          ParamByName('thdate').Value:=datetimepicker1.Date;
          ParamByName('memo').Value:='*合同编号为：'+edit1.Text+'退货';
          ExecProc;
          close;
          StoredProcName:='proc_modify_tuihuo_htmxz_cpmxz_cpkcb';
          for i := 1 to stringgrid1.RowCount - 2 do
          begin
            ParamByName('htbh').Value:=edit1.Text;
            ParamByName('cpbh').Value:=splitstring(stringgrid1.Cells[1,i],'|');
            ParamByName('thsl').Value:=stringgrid1.Cells[3,i];
            ParamByName('thdate').Value:=datetimepicker1.Date;
            ParamByName('czry').Value:=main.strUser;
            ParamByName('memo').Value:='*合同编号为：'+edit1.Text+'退货';;
            ExecProc;
          end;
          edit9.text:='';
          edit6.text:='';
          edit11.text:='';
          edit3.text:='';
          edit12.text:='';
          edit13.text:='';
          memo1.Lines.Clear;
          edit2.Text:='0';
          datetimepicker1.Date:=now();
          edit4.Text:='';
          edit5.Text:='0';
          edit8.Text:='';
          edit7.Text:='';
          combobox4.Text:='';
          stringgrid1.RowCount:=2;
          stringgrid1.Rows[1].Clear;
          edit1.Text:='';
          edit1.SetFocus;
          application.MessageBox('退货处理成功！','退货处理提示');
        end;
      except
        application.MessageBox('退货处理失败！','退货处理提示');
      end;
end;

procedure TForm73.Button3Click(Sender: TObject);
begin
  if  application.MessageBox('确定取消退出吗？','退货处理提示',1)=1 then
  begin
    edit9.text:='';
    edit6.text:='';
    edit11.text:='';
    edit3.text:='';
    edit12.text:='';
    edit13.text:='';
    memo1.Lines.Clear;
    edit2.Text:='0';
    datetimepicker1.Date:=now();
    edit4.Text:='';
    edit5.Text:='0';
    edit8.Text:='';
    edit7.Text:='';
    edit1.Text:='';
    combobox4.Text:='';
    stringgrid1.RowCount:=2;
    stringgrid1.Rows[1].Clear;
    edit1.SetFocus;
    form73.Close;
  end;
end;

procedure TForm73.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox4.Items.Count>0 then
    ComboBox4.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_tuihui_cplxkinhtmxz_by_htbh';
        ParamByName('htbh').Value:=edit1.Text;
        ParamByName('cpmc').Value:=combobox4.Text;
        open;
        while not eof do
        begin
          ComboBox4.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','退货处理提示');
  end;
 end;
end;

procedure TForm73.ComboBox4Select(Sender: TObject);
begin          //proc_cx_tuihui_htmxzinfo_by_cpbh
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_tuihui_htmxzinfo_by_cpbh';
        ParamByName('cpbh').Value:=splitstring(combobox4.Text,'|');
        open;
        if not eof then
        begin
          edit7.text:=fields[0].AsString;
          edit8.text:=fields[1].AsString;
          edit4.text:=fields[2].AsString;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','退货处理提示');
    end;
end;

procedure TForm73.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (edit1.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_tuihuo_htinfo_by_htbh';
        ParamByName('htbh').Value:=edit1.Text;
        open;
        if not eof then
        begin
          edit9.text:=fields[0].AsString;
          edit6.text:=fields[1].AsString;
          edit11.text:=fields[2].AsString;
          edit3.text:=fields[3].AsString;
          edit12.text:=fields[4].AsString;
          edit13.text:=fields[5].AsString;
          memo1.Text:=fields[6].AsString;
        end;

      end;
    except
      application.MessageBox('数据查询失败！','退货处理提示');
    end;

end;

procedure TForm73.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品名称';
  stringgrid1.Cells[2,0]:='销售单价';
  stringgrid1.Cells[3,0]:='退货数量';
  stringgrid1.Cells[4,0]:='退货总额';
  datetimepicker1.Date:=now();
end;

procedure TForm73.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount-1) then
  begin
    edit2.Text:=floattostr(strtofloat(edit2.Text)-strtofloat(stringgrid1.Cells[4,selRowIndex]));
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

procedure TForm73.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
end;

end.
