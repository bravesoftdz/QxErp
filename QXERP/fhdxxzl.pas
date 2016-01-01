unit fhdxxzl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Grids,
  ExtCtrls, ZStoredProcedure;

type
  TForm21 = class(TForm)
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Edit2: TEdit;
    Edit3: TEdit;
    StringGrid1: TStringGrid;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Button2: TButton;
    Edit14: TEdit;
    Edit1: TEdit;
    ZStoredProc1: TZStoredProc;
    Label16: TLabel;
    Edit15: TEdit;
    Label17: TLabel;
    Edit16: TEdit;
    Label18: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;
  fhdid:string;
  function SmallTOBig(small:real):string;stdcall;external 'dlltools.dll';

implementation

{$R *.dfm}

uses main;

procedure TForm21.Button2Click(Sender: TObject);
begin
  try
    form1.RvDataSetConnection1.DataSet:=zstoredProc1;
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_fhdxxzl';
      zstoredproc1.ParamByName('fhdbh').Value:=fhdid;
      open;
      //zstoredproc1.SetResultSet(0);
      with form1 do
      begin
        rvproject1.Open;
        rvproject1.SelectReport('fhtzd',true);
        rvproject1.ClearParams;
        rvproject1.SetParam('fhdbh',edit1.Text);
        rvproject1.SetParam('khmc',edit4.Text);
        rvproject1.SetParam('fhdz',edit9.Text);
        rvproject1.SetParam('memo',edit5.Text);
        rvproject1.SetParam('hjje','（人民币）'+stringgrid1.Cells[6,stringgrid1.RowCount-1]+'元（￥:'+SmallTOBig(strtofloat(stringgrid1.Cells[6,stringgrid1.RowCount-1]))+'）');
        rvproject1.SetParam('cdrq',edit15.Text);
        rvproject1.SetParam('czry',main.strUser);
        rvproject1.SetParam('xsyxm',edit6.Text);
        //zstoredproc1.StoredProcName:='proc_cx_fhdxxzl';
        //zstoredproc1.ParamByName('fhdbh').Value:=fhdid;
        //zstoredproc1.SetResultSet(2);
        //open;
        rvproject1.SetParam('cys',edit18.Text);
        rvproject1.SetParam('cpdh',edit8.Text);
        rvproject1.SetParam('yunfei','（人民币）'+edit10.Text+'元（￥:'+edit14.Text+'）');
        rvproject1.SetParam('ysjl',edit11.Text);
        rvproject1.SetParam('hwzl',edit12.Text);
        rvproject1.SetParam('hydmemo',edit13.Text);
        //zstoredproc1.StoredProcName:='proc_cx_fhdxxzl';
        //zstoredproc1.ParamByName('fhdbh').Value:=fhdid;
        zstoredproc1.SetResultSet(1);
        //open;
        RvProject1.Execute;
        rvproject1.Close;
      end;
    end;
  except
    application.MessageBox('打印失败','发货单打印提示');
  end;
end;

procedure TForm21.Edit10Change(Sender: TObject);
begin
  if edit10.Text <> '' then
    edit14.Text:=smalltobig(strtofloat(edit10.Text))
   else
    edit14.Text:='';
end;

procedure TForm21.FormShow(Sender: TObject);
var
  i:integer;
begin
  try
    with zstoredproc1 do
    begin
      close;
      zstoredproc1.StoredProcName:='proc_cx_fhdxxzl';
      zstoredproc1.ParamByName('fhdbh').Value:=fhdid;
      open;
      zstoredproc1.FirstResultSet;
      edit1.Text:=fields[0].AsString;
      edit2.Text:=fields[1].AsString;
      edit4.Text:=fields[2].AsString;
      edit6.Text:=fields[3].AsString;
      edit15.Text:=fields[4].AsString;
      edit16.Text:=fields[5].AsString;
      edit17.Text:=fields[6].AsString;
      edit5.Text:=fields[7].AsString;
      zstoredproc1.NextResultSet;
      i:=1;
      stringgrid1.Cells[0,0]:='序号';
      stringgrid1.Cells[1,0]:='产品编号';
      stringgrid1.Cells[2,0]:='产品名称';
      stringgrid1.Cells[3,0]:='产品种类';
      stringgrid1.Cells[4,0]:='销售价格';
      stringgrid1.Cells[5,0]:='发货数量';
      stringgrid1.Cells[6,0]:='合计金额';
      stringgrid1.RowCount:=recordcount+2;
      while not eof do
      begin
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        i:=i+1;
        next;
      end;
      zstoredproc1.NextResultSet;
      while not eof do
      begin
        //stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[0,i]:=fields[0].AsString;
        stringgrid1.Cells[2,i]:=fields[1].AsString;
        stringgrid1.Cells[3,i]:=fields[2].AsString;
        stringgrid1.Cells[4,i]:=fields[3].AsString;
        stringgrid1.Cells[5,i]:=fields[4].AsString;
        stringgrid1.Cells[6,i]:=fields[5].AsString;
        i:=i+1;
        next;
      end;
      zstoredproc1.LastResultSet;
      edit3.Text:=fields[0].AsString;
      edit7.Text:=fields[1].AsString;
      edit18.Text:=fields[2].AsString;
      edit8.Text:=fields[3].AsString;
      edit12.Text:=fields[4].AsString;
      edit11.Text:=fields[5].AsString;
      edit10.Text:=fields[6].AsString;
      edit13.Text:=fields[7].AsString;
      edit9.Text:=fields[8].AsString;
      close;
    end;
  except
    application.MessageBox('查询数据失败！','发货单详细信息提示');

  end;
end;

end.
