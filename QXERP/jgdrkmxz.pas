unit jgdrkmxz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure;

type
  TForm80 = class(TForm)
    StringGrid1: TStringGrid;
    ZStoredProc1: TZStoredProc;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form80: TForm80;
  strcpmc,strjgdbh:string;

implementation

uses main;

{$R *.dfm}

procedure TForm80.FormShow(Sender: TObject);
var
  i:integer;
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ʒ����';
  stringgrid1.Cells[2,0]:='�������';
  stringgrid1.Cells[3,0]:='�������';
  try
    with zStoredProc1 do
    begin
      close;
      StoredProcName:='proc_cx_waixiejiagong_rk_mxz_by_jgdbh';
      ParamByName('jgdbh').Value:=strjgdbh;
      open;
      i:=1;
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      while not eof do
      begin
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        stringgrid1.Cells[0,i]:=inttostr(i);
        stringgrid1.Cells[1,i]:=strcpmc;
        stringgrid1.Cells[2,i]:=fields[0].AsString;
        stringgrid1.Cells[3,i]:=fields[1].AsString;
        i:=i+1;
        stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
        next;
      end;
      form80.Caption:='��ӹ������ϸ��ѯ ���ӹ�����ţ�'+strjgdbh+'��';
    end;
  except

  end;
end;

end.