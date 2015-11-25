unit fpwhzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure, StdCtrls,
  Grids;

type
  TForm26 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    ZStoredProc1: TZStoredProc;
    Label2: TLabel;
    Button2: TButton;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm26.Button1Click(Sender: TObject);
var
  gyslist:tstringlist;
  i:integer;
  tmpgysid:string;
  cxgysid:string;
  y:integer;
begin
  if combobox1.Text<>'' then
  try
    with zStoredProc1 do
    begin
      stringgrid1.RowCount:=2;
      stringgrid1.Rows[1].Clear;
      close;
      StoredProcName:='proc_cx_notcheckedformla';
      if combobox1.Text='*' then
        ParamByName('gysbh').Value:='*'
      else
        ParamByName('gysbh').Value:=SplitString(ComboBox1.Text,'|');
      open;
      if not eof then
      begin
        gyslist:=tstringlist.Create;
        tmpgysid:='gysid';
        y:=1;
      while not eof do
      begin
        gyslist.Add(fields[0].asstring);
        next;
      end;
      for i := 0 to gyslist.Count - 1 do     //proc_cx_fpwhzcx_by_rkdbh
        begin
          close;
          StoredProcName:='proc_cx_fpwhzcx_by_rkdbh';
          ParamByName('rkdbh').Value:=gyslist[i];
                  //application.MessageBox(pwidechar(gyslist[i]),'��Ʊδ���ʲ�ѯ��ʾ');
          open;
          zstoredproc1.FirstResultSet;
          cxgysid:=fields[0].AsString;
          if tmpgysid<>cxgysid then
          begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            tmpgysid:=cxgysid;
            stringgrid1.Cells[0,y]:=inttostr(y);
            stringgrid1.Cells[1,y]:=tmpgysid;
            stringgrid1.Cells[2,y]:=fields[1].AsString;
            y:=y+1;
            stringgrid1.Cells[0,y]:=inttostr(y);
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            zstoredproc1.NextResultSet;
            stringgrid1.Cells[3,y]:=fields[0].AsString;
            stringgrid1.Cells[4,y]:=fields[1].AsString;
            stringgrid1.Cells[5,y]:=fields[2].AsString;
            y:=y+1;
            zstoredproc1.LastResultSet;
            while not eof do
            begin
              stringgrid1.RowCount:=stringgrid1.RowCount+1;
              stringgrid1.Cells[0,y]:=inttostr(y);
              stringgrid1.Cells[6,y]:=fields[0].AsString;
              stringgrid1.Cells[7,y]:=fields[1].AsString;
              stringgrid1.Cells[8,y]:=fields[2].AsString;
              y:=y+1;
              stringgrid1.Rows[y].Clear;
              next;
            end;
          end else
          begin
            stringgrid1.RowCount:=stringgrid1.RowCount+1;
            zstoredproc1.NextResultSet;
            stringgrid1.Cells[0,y]:=inttostr(y);
            stringgrid1.Cells[3,y]:=fields[0].AsString;
            stringgrid1.Cells[4,y]:=fields[1].AsString;
            stringgrid1.Cells[5,y]:=fields[2].AsString;
            y:=y+1;
            zstoredproc1.LastResultSet;
            while not eof do
            begin
              stringgrid1.RowCount:=stringgrid1.RowCount+1;
              stringgrid1.Cells[0,y]:=inttostr(y);
              stringgrid1.Cells[6,y]:=fields[0].AsString;
              stringgrid1.Cells[7,y]:=fields[1].AsString;
              stringgrid1.Cells[8,y]:=fields[2].AsString;
              y:=y+1;
              stringgrid1.Rows[y].Clear;
              next;
            end;
          end;
        end;
        gyslist.Free;
      end else
        application.MessageBox('�ù�Ӧ��û��δ���ʵ���ⵥ��','��Ʊδ���ʲ�ѯ��ʾ');
    end;
  except
    application.MessageBox('��ѯ����ʧ�ܣ�','��Ʊδ���ʲ�ѯ��ʾ');
  end;
end;

procedure TForm26.Button2Click(Sender: TObject);
begin
ExportStrGridToExcel([stringgrid1]);
end;

procedure TForm26.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then
 begin
    if combobox1.Items.Count>0 then
    ComboBox1.Items.Clear;
    combobox1.Items.Add('*|ȫ����Ӧ��');
    try
      with zstoredproc1 do
      begin
        close;
        zstoredproc1.StoredProcName:='proc_cx_gysmc';
        zstoredproc1.ParamByName('gysname').Value:=ComboBox1.Text;
        open;
        while not eof do
        begin
          ComboBox1.Items.Add(fields[0].asstring);
          next;
        end;
        //combobox1.DroppedDown:=true;
      end;
  except
    application.MessageBox('���ݲ�ѯʧ�ܣ�','��Ʊδ���ʲ�ѯ��ʾ');
  end;
 end;
end;

procedure TForm26.FormShow(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='���';
  stringgrid1.Cells[1,0]:='��Ӧ�̱��';
  stringgrid1.Cells[2,0]:='��Ӧ������';
  stringgrid1.Cells[3,0]:='��ⵥ���';
  stringgrid1.Cells[4,0]:='���ʱ��';
  stringgrid1.Cells[5,0]:='�����';
  stringgrid1.Cells[6,0]:='��Ʒ����';
  stringgrid1.Cells[7,0]:='�������';
  stringgrid1.Cells[8,0]:='��Ʒ����';
end;

end.