unit bcptsck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure,
  StdCtrls, Grids, ComCtrls;

type
  TForm44 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit4: TEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ZStoredProc1: TZStoredProc;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form44: TForm44;
  selRowIndex:integer;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

uses main;

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

procedure TForm44.Button1Click(Sender: TObject);
var
  i:integer;
begin   //proc_insert_cpcrkmxz_cprk   cpbh,rksl,jzdate,memo
  if stringgrid1.RowCount>2 then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_bcptsck'; //bcpbh,rksl,jzdate,czry
      for i := 1 to stringgrid1.RowCount - 2 do
      begin
        ParamByName('bcpbh').Value:=SplitString(stringgrid1.Cells[1,i],'|');
        ParamByName('cksl').Value:=stringgrid1.Cells[2,i];
        ParamByName('jzdate').Value:=stringgrid1.Cells[3,i];
        ParamByName('memo').Value:=stringgrid1.Cells[4,i];
        ParamByName('czry').Value:=main.strUser;
        ExecProc;
      end;
        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        edit1.Text:='';
        edit2.Text:='';
        edit4.Text:='';
        combobox1.Text:='';
        combobox1.SetFocus;
        application.MessageBox('保存数据成功！','半成品出库提示');
    end;
  except
    application.MessageBox('保存数据失败！','半成品出库提示');
  end;
end;

procedure TForm44.Button2Click(Sender: TObject);
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
      application.MessageBox('该产品已在下面列表中，请确认！','半成品出库提示')
    else
    if (edit2.Text<>'') and (combobox1.Text<>'') then
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,stringgrid1.RowCount-2]:=inttostr(stringgrid1.RowCount-2);
        stringgrid1.Cells[1,stringgrid1.RowCount-2]:=combobox1.Text;
        stringgrid1.Cells[2,stringgrid1.RowCount-2]:=edit2.Text;
        stringgrid1.Cells[3,stringgrid1.RowCount-2]:=datetostr(datetimepicker1.Date);
        stringgrid1.Cells[4,stringgrid1.RowCount-2]:=edit4.Text;
        //stringgrid1.RowCount:=stringgrid1.RowCount-1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        combobox1.Text:='';
        edit1.Text:='';
        edit2.Text:='';
        edit4.Text:='';
        combobox1.SetFocus;
      end else
      application.MessageBox('请将明细填写完整！','半成品出库提示');
end;

procedure TForm44.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    edit1.Text:='';
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_bcplxk_bcpbh';
        ParamByName('bcpmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','半成品出库提示');
  end;
 end;
end;

procedure TForm44.ComboBox1Select(Sender: TObject);
begin
  edit1.Text:='';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_bcpkcb_bcpkcs_by_bcpbh';
      ParamByName('bcpbh').Value:=SplitString(combobox1.Text,'|');
      open;
      if not eof then
        edit1.Text:=fields[0].AsString;
    end;
  except
    application.MessageBox('数据查询失败！','半成品出库提示');
  end;
end;

procedure TForm44.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit2.Text)>0)   then
    key:=#0;
end;

procedure TForm44.FormShow(Sender: TObject);
begin
  datetimepicker1.Date:=now();
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='半成品编号';
  stringgrid1.Cells[2,0]:='出库数量';
  stringgrid1.Cells[3,0]:='出库日期';
  stringgrid1.Cells[4,0]:='备注';
end;

procedure TForm44.N1Click(Sender: TObject);
begin
  if (selRowIndex>0) and (selRowIndex<stringgrid1.RowCount) then
  begin
    DeleteStringGridRow(selRowIndex,stringgrid1);
  end;
end;

procedure TForm44.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selRowIndex:=ARow;
end;

end.
