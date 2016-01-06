unit kczgxxgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure, ExtCtrls;

type
  TForm32 = class(TForm)
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    ZStoredProc1: TZStoredProc;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Bevel2: TBevel;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form32: TForm32;
  SelARow,gzSelARow:integer;
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

procedure TForm32.Button1Click(Sender: TObject);
begin
  if (SelArow>0) and (SelArow<stringgrid1.RowCount-1) and (stringgrid1.Cells[1,SelArow]<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_itemkctips_of_itemid';
      ParamByName('itemid').Value:=stringgrid1.Cells[1,SelArow];
      ParamByName('czlx').Value:='ADD';
      ExecProc;
      application.MessageBox('增加库存跟踪项目成功！','常规库存跟踪信息设置');
      stringgrid2.RowCount:=stringgrid2.RowCount+1;
      stringgrid2.Cells[0,stringgrid2.RowCount-2]:=inttostr(stringgrid2.RowCount-2);
      stringgrid2.Cells[1,stringgrid2.RowCount-2]:=stringgrid1.Cells[1,SelArow];
      stringgrid2.Cells[2,stringgrid2.RowCount-2]:=stringgrid1.Cells[2,SelArow];
      stringgrid2.Cells[3,stringgrid2.RowCount-2]:='0';
      DeleteStringGridRow(SelArow,stringgrid1);
    end;
  except
    application.MessageBox('增加库存跟踪项目失败','常规库存跟踪信息设置');
  end;
end;

procedure TForm32.Button2Click(Sender: TObject);
begin
  if (gzSelARow>0) and (gzSelARow<stringgrid2.RowCount-1) and (stringgrid2.Cells[1,gzSelARow]<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_insert_itemkctips_of_itemid';
      ParamByName('itemid').Value:=stringgrid2.Cells[1,gzSelARow];
      ParamByName('czlx').Value:='DEL';
      ExecProc;
    end;
      DeleteStringGridRow(gzSelARow,stringgrid2);
      application.MessageBox('删除库存跟踪项目成功！','常规库存跟踪信息设置');
  except
    application.MessageBox('增加库存跟踪项目失败','常规库存跟踪信息设置');
  end;
end;

procedure TForm32.Button3Click(Sender: TObject);
begin
  if (edit1.Text<>'') and (edit3.Text<>'') then
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_update_itemkctips_itemminsl_by_itembh';
      ParamByName('itembh').Value:=edit1.Text;
      ParamByName('kcminls').Value:=edit3.Text;
      ExecProc;
      stringgrid2.Cells[3,gzSelARow]:=edit3.Text;
      application.MessageBox('库存下限设置成功！','常规库存跟踪信息设置');
    end;
  except
    application.MessageBox('库存下限设置失败！','常规库存跟踪信息设置');
  end else
    application.MessageBox('请在右侧列表框中选择需要设置的记录行，并在下限数量中设置数量！','常规库存跟踪信息设置');
end;

procedure TForm32.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin     //proc_cx_itemlxinfo_by_itemlxmc
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    //combobox1.Items.Add('*|全部供应商');
    try
      with zstoredproc1 do
      begin
        close;
        StoredProcName:='proc_cx_itemlxinfo_by_itemlxmc';
        ParamByName('itemlxmc').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('数据查询失败！','常规库存跟踪信息设置');
  end;
 end;
end;

procedure TForm32.ComboBox1Select(Sender: TObject);
var
  y:integer;
begin
  try
    with zStoredProc1 do
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      close;
      StoredProcName:='proc_cx_ckiteminfo_notgz_by_itemlxid';
      ParamByName('itemlxid').Value:=SplitString(ComboBox1.Text,'|');
      open;
      y:=1;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,y]:=inttostr(y);
        stringgrid1.Cells[1,y]:=fields[0].AsString;
        stringgrid1.Cells[2,y]:=fields[1].AsString;
        y:=y+1;
        stringgrid1.Rows[y].Clear;
        next;
      end;
    end;
  except
    application.MessageBox('查询数据失败！','常规库存跟踪信息设置');
  end;
end;

procedure TForm32.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(key,['0'..'9','.',#8]) then
    key:=#0;
  if (key='.') and (Pos('.',Edit3.Text)>0)   then
    key:=#0;
end;

procedure TForm32.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.RowCount:=2;
  stringgrid1.Rows[1].Clear;
  stringgrid2.RowCount:=2;
  stringgrid2.Rows[1].Clear;
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='物品编号';
  stringgrid1.Cells[2,0]:='物品名称';
  stringgrid2.Cells[0,0]:='序号';
  stringgrid2.Cells[1,0]:='物品编号';
  stringgrid2.Cells[2,0]:='物品名称';
  stringgrid2.Cells[3,0]:='最少库存数';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_itemkctips';
      open;
      i:=1;
      while not eof do
      begin
        stringgrid2.RowCount:=stringgrid2.RowCount+1;
        stringgrid2.Cells[0,i]:=inttostr(i);
        stringgrid2.Cells[1,i]:=fields[0].AsString;
        stringgrid2.Cells[2,i]:=fields[1].AsString;
        stringgrid2.Cells[3,i]:=fields[2].AsString;
        i:=i+1;
        next;
      end;
    end;
  except
    application.MessageBox('数据查询失败','常规库存跟踪信息设置');
  end;
end;

procedure TForm32.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SelARow:=ARow;
end;

procedure TForm32.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  gzSelARow:=ARow;
  edit1.Text:=stringgrid2.Cells[1,gzSelARow];
  edit2.Text:=stringgrid2.Cells[2,gzSelARow];
  edit3.Text:=stringgrid2.Cells[3,gzSelARow];
end;

end.
