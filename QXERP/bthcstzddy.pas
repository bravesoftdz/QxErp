unit bthcstzddy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids;

type
  TForm75 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    ZStoredProc1: TZStoredProc;
    Memo2: TMemo;
    Label4: TLabel;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form75: TForm75;

implementation

uses main;

{$R *.dfm}

procedure TForm75.Button3Click(Sender: TObject);
begin
if(edit1.Text<>'') and (stringgrid1.RowCount>2) then
  try
    form1.RvDataSetConnection1.DataSet:=zstoredProc1;
    with zstoredproc1 do
    begin
      close;
      StoredProcName:='proc_cx_bthcscktzd_info_mxz_by_csckdid';
      ParamByName('csckdid').Value:=edit1.Text;
      open;
      with form1 do
      begin
        rvproject1.Open;
        rvproject1.SelectReport('bthcstzddy',true);
        rvproject1.ClearParams;
        rvproject1.SetParam('csckdbh',edit1.Text);
        rvproject1.SetParam('sqrxm',edit2.Text);
        rvproject1.SetParam('bthmemo',memo2.Text);
        rvproject1.SetParam('memo',memo1.Text);
        rvproject1.SetParam('cdrq',edit3.Text);
        rvproject1.SetParam('czry',main.strUser);
        zstoredproc1.SetResultSet(1);
        RvProject1.Execute;
        rvproject1.Close;
      end;
      edit1.Text:='';
      edit2.Text:='';
      edit3.Text:='';
      memo1.Lines.Clear;
      memo2.Lines.Clear;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      edit1.SetFocus;
    end;
  except
    application.MessageBox('打印失败','加工单打印提示');
  end else
    application.MessageBox('请先调入已保存的产品测试出库单！','加工单打印提示');
end;

procedure TForm75.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i:integer;
begin
  if (key=13) and (edit1.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_cx_bthcscktzd_info_mxz_by_csckdid';
        ParamByName('csckdid').Value:=edit1.Text;
        open;
        firstresultset;
        if not eof  then
        begin
          edit1.Text:=fields[0].AsString;
          edit2.Text:=fields[1].AsString;
          edit3.Text:=fields[2].AsString;
          memo1.Text:=fields[3].AsString;
          memo2.Text:=fields[6].AsString;

        stringgrid1.RowCount:=2;
        stringgrid1.Rows[1].Clear;
        i:=1;
        nextresultset;
        while not eof do
        begin
          stringgrid1.RowCount:=stringgrid1.RowCount+1;
          stringgrid1.Cells[0,i]:=inttostr(i);
          stringgrid1.Cells[1,i]:=fields[0].AsString;
          stringgrid1.Cells[2,i]:=fields[1].AsString;
          stringgrid1.Cells[3,i]:=fields[3].AsString;
         // stringgrid1.Cells[4,i]:=fields[3].AsString;
          i:=i+1;
          stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
          next;
        end;
        end;
      end;
    except
      application.MessageBox('数据查询失败！','测试出库不退回通知单打印提示');
    end;
end;

procedure TForm75.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='序号';
  stringgrid1.Cells[1,0]:='产品名称';
  stringgrid1.Cells[2,0]:='测试数量';
  stringgrid1.Cells[3,0]:='备注';
end;

end.
