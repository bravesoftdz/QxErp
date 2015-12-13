unit blzjjldj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZStoredProcedure;

type
  TForm48 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    ZStoredProc1: TZStoredProc;
    Button2: TButton;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form48: TForm48;
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation

uses main;

{$R *.dfm}

procedure TForm48.Button1Click(Sender: TObject);
begin
  if (combobox1.Text<>'') and (memo1.Text<>'') then
    try
      with zStoredProc1 do
      begin
        close;
        StoredProcName:='proc_insert_zjbljl_zgbh_zjdate_memo';
        ParamByName('zgbh').Value:=SplitString(combobox1.Text,'|');
        ParamByName('zjdate').Value:=datetimepicker1.Date;
        ParamByName('memo').Value:='*'+memo1.Text;
        ExecProc;
        application.MessageBox('保存数据成功！','质量管理提示');
        combobox1.Text:='';
        memo1.Lines.Clear;
        combobox1.SetFocus;
      end;
    except
      application.MessageBox('保存数据失败！','质量管理提示');
    end else
    application.MessageBox('请将所有项目填写完整！','质量管理提示');
end;

procedure TForm48.Button2Click(Sender: TObject);
begin
  combobox1.Text:='';
  memo1.Lines.Clear;
  form48.Close;
end;

procedure TForm48.ComboBox1KeyDown(Sender: TObject; var Key: Word;
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

end.
