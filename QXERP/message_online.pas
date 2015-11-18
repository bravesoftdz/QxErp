unit message_online;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  ComCtrls, Grids;

type
  TForm18 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Button1: TButton;
    ZQuery1: TZQuery;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Memo2: TMemo;
    Label3: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    TabSheet3: TTabSheet;
    StringGrid2: TStringGrid;
    Memo3: TMemo;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    StringGrid3: TStringGrid;
    Memo4: TMemo;
    StringGrid4: TStringGrid;
    Memo5: TMemo;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    TabSheet6: TTabSheet;
    StringGrid5: TStringGrid;
    Memo6: TMemo;
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure StringGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;
  strMessid:string;
  strFavMessid:string;
  strOldMessid:string;
  strDelMessid:string;
  strMyMessid:string;
  selectRow:integer;
  selectFavRow:integer;
  selectOldRow:integer;
  selectDelRow:integer;
  selectMyRow:integer;
  //function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';

implementation
 uses main;
{$R *.dfm}

procedure DeleteStringGridRow(vRow: Integer; StringGrid: TStringGrid);
var
  i:Integer;
begin
  if StringGrid.RowCount > vRow then
  begin
    for i:= vRow to StringGrid.RowCount - vRow do
    begin
      StringGrid.Rows[i]:= StringGrid.Rows[i+1];
    end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
  end;
end;

procedure TForm18.Button1Click(Sender: TObject);
begin
if (combobox1.Text <> '') and (edit1.Text<>'') and (memo2.Lines.Count>0) then
begin
  try
    with ZQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('insert into message_online (fsendid,freciid,fcontent,fsenddate,fmessagetitle) values ('''+main.strUser+''','''+combobox1.Text+''','''+memo2.Lines.Text+''','''+datetimetostr(now())+''','''+edit1.Text+''')');
      ExecSQL;
      application.MessageBox('消息发送成功!','系统提示');
      edit1.Text:='';
      memo2.Lines.Clear;
    end;
  except
    application.MessageBox('消息发送失败!','系统提示');
  end;
end else
  application.MessageBox('请将所有项目填写完整!','发送信息提示');

end;

procedure TForm18.Button2Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('update message_online set fisread=''Y'' where fid='+strMessid);
      execsql;
      DeleteStringGridRow(selectRow,stringgrid2);
      memo1.Lines.Clear;
    end;
  except
    application.MessageBox('标记失败!','消息处理提示');
  end;
end;

procedure TForm18.Button3Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('update message_online set fisfavorite=''Y'' where fid='+strFavMessid);
      execsql;
      DeleteStringGridRow(selectFavRow,stringgrid2);
      memo3.Lines.Clear;
    end;
  except
    application.MessageBox('标记失败!','消息处理提示');
  end;
end;

procedure TForm18.Button4Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('update message_online set fisfavorite=''Y'',fisread=''Y'' where fid='+strMessid);
      execsql;
      DeleteStringGridRow(selectRow,stringgrid1);
      memo1.Lines.Clear;
    end;
  except
    application.MessageBox('标记失败!','消息处理提示');
  end;
end;

procedure TForm18.Button5Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('update message_online set fisdel=''Y'' where fid='+strMessid);
      execsql;
      DeleteStringGridRow(selectRow,stringgrid1);
      memo1.Lines.Clear;
    end;
  except
    application.MessageBox('标记失败!','消息处理提示');
  end;
end;

procedure TForm18.Button6Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('update message_online set fisdel=''Y'' where fid='+strOldmessid);
      execsql;
      DeleteStringGridRow(selectOldRow,stringgrid3);
      memo4.Lines.Clear;
    end;
  except
    application.MessageBox('删除失败!','消息处理提示');
  end;
end;


procedure TForm18.Button7Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('update message_online set fisdel=''Y'' where freciid='''+main.strUser+''' and fisfavorite=''N'' and fisread=''Y''');
      execsql;
      stringgrid3.RowCount:=1;
      memo4.Lines.Clear;
    end;
  except
    application.MessageBox('删除失败!','消息处理提示');
  end;
end;

procedure TForm18.Button8Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('delete from message_online where fid='+strDelmessid);
      execsql;
      DeleteStringGridRow(selectDelRow,stringgrid4);
      memo5.Lines.Clear;
    end;
  except
    application.MessageBox('彻底删除失败!','消息处理提示');
  end;
end;

procedure TForm18.Button9Click(Sender: TObject);
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('delete message_online from where freciid='''+main.strUser+''' and fisfavorite=''N'' and fisdel=''Y''');
      execsql;
      stringgrid4.RowCount:=1;
      memo5.Lines.Clear;
    end;
  except
    application.MessageBox('彻底删除失败!','消息处理提示');
  end;
end;

procedure TForm18.ComboBox1DropDown(Sender: TObject);
begin
  with ZQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select fuser from user_info');
    open;
    combobox1.Items.Clear;
    while not eof do
    begin
       combobox1.Items.Add(fields[0].asstring);
       next;
    end;
  end;
end;

procedure TForm18.FormShow(Sender: TObject);
begin
  if (main.intMessage>0) and (main.boolMesscandle=true) then
    pagecontrol1.TabIndex:=1
  else
    pagecontrol1.TabIndex:=0;
end;


procedure TForm18.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selectRow:=ARow;
  strMessid:=stringgrid1.Cells[0,ARow];
  if strMessid<>'' then
  begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select fsendid,fsenddate,fmessagetitle,fcontent from message_online where fid='''+stringgrid1.Cells[0,ARow]+'''');
        open;
        if not eof then
        begin
          memo1.Lines.Clear;
          memo1.Lines.Add('标题：'+fields[2].asstring);
          memo1.Lines.Add('内容：'+fields[3].asstring);
          memo1.Lines.Add('');
          memo1.Lines.Add('');
          memo1.Lines.Add('');
          memo1.Lines.Add('来自：'+fields[0].asstring+'，于'+fields[1].asstring);
        end;
      end;
    except
      application.MessageBox('信息读取失败!','消息处理提示');
    end;
  end;
end;

procedure TForm18.StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selectFavRow:=ARow;
  strFavMessid:=stringgrid2.Cells[0,ARow];
  if strFavMessid<>'' then
  begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select fsendid,fsenddate,fmessagetitle,fcontent from message_online where fid='''+stringgrid2.Cells[0,ARow]+'''');
        open;
        if not eof then
        begin
          memo3.Lines.Clear;
          memo3.Lines.Add('标题：'+fields[2].asstring);
          memo3.Lines.Add('内容：'+fields[3].asstring);
          memo3.Lines.Add('');
          memo3.Lines.Add('');
          memo3.Lines.Add('');
          memo3.Lines.Add('来自：'+fields[0].asstring+'，于'+fields[1].asstring);
        end;
      end;
    except
      application.MessageBox('信息读取失败!','消息处理提示');
    end;
  end;
end;

procedure TForm18.StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selectOldRow:=ARow;
  strOldMessid:=stringgrid3.Cells[0,ARow];
  if strOldMessid<>'' then
  begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select fsendid,fsenddate,fmessagetitle,fcontent from message_online where fid='''+stringgrid3.Cells[0,ARow]+'''');
        open;
        if not eof then
        begin
          memo4.Lines.Clear;
          memo4.Lines.Add('标题：'+fields[2].asstring);
          memo4.Lines.Add('内容：'+fields[3].asstring);
          memo4.Lines.Add('');
          memo4.Lines.Add('');
          memo4.Lines.Add('');
          memo4.Lines.Add('来自：'+fields[0].asstring+'，于'+fields[1].asstring);
        end;
      end;
    except
      application.MessageBox('信息读取失败!','消息处理提示');
    end;
  end;
end;

procedure TForm18.StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selectDelRow:=ARow;
  strDelMessid:=stringgrid4.Cells[0,ARow];
  if strDelMessid<>'' then
  begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select fsendid,fsenddate,fmessagetitle,fcontent from message_online where fid='''+stringgrid4.Cells[0,ARow]+'''');
        open;
        if not eof then
        begin
          memo5.Lines.Clear;
          memo5.Lines.Add('标题：'+fields[2].asstring);
          memo5.Lines.Add('内容：'+fields[3].asstring);
          memo5.Lines.Add('');
          memo5.Lines.Add('');
          memo5.Lines.Add('');
          memo5.Lines.Add('来自：'+fields[0].asstring+'，于'+fields[1].asstring);
        end;
      end;
    except
      application.MessageBox('信息读取失败!','消息处理提示');
    end;
  end;
end;

procedure TForm18.StringGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  selectMyRow:=ARow;
  strMyMessid:=stringgrid5.Cells[0,ARow];
  if strMyMessid<>'' then
  begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select fsendid,fsenddate,fmessagetitle,fcontent from message_online where fid='''+stringgrid5.Cells[0,ARow]+'''');
        open;
        if not eof then
        begin
          memo6.Lines.Clear;
          memo6.Lines.Add('标题：'+fields[2].asstring);
          memo6.Lines.Add('内容：'+fields[3].asstring);
          memo6.Lines.Add('');
          memo6.Lines.Add('');
          memo6.Lines.Add('');
          memo6.Lines.Add('来自：'+fields[0].asstring+'，于'+fields[1].asstring);
        end;
      end;
    except
      application.MessageBox('信息读取失败!','消息处理提示');
    end;
  end;
end;

procedure TForm18.TabSheet2Show(Sender: TObject);
var
y:integer;
begin
    y:=1;
    stringgrid1.Cells[0,0]:='编号';
    stringgrid1.Cells[1,0]:='发送人';
    stringgrid1.Cells[2,0]:='发送时间';
    stringgrid1.Cells[3,0]:='标题';
    with zquery1 do
    begin
      try
        close;
        sql.Clear;
        sql.Add('select fid,fsendid,fsenddate,fmessagetitle from message_online where freciid='''+main.strUser+''' and fisread=''N'' and fisdel=''N''');
        open;
        stringgrid1.RowCount:=RecordCount+1;
        while not eof do
        begin
          stringgrid1.Cells[0,y]:=fields[0].AsString;
          stringgrid1.Cells[1,y]:=fields[1].AsString;
          stringgrid1.Cells[2,y]:=fields[2].AsString;
          stringgrid1.Cells[3,y]:=fields[3].AsString;
          y := y +1;
          next;
        end;
      except
          application.MessageBox('信息列表读取失败!','消息处理提示');
      end;
    end;
end;

procedure TForm18.TabSheet3Show(Sender: TObject);
var
y:integer;
begin
    y:=1;
    stringgrid2.Cells[0,0]:='编号';
    stringgrid2.Cells[1,0]:='发送人';
    stringgrid2.Cells[2,0]:='发送时间';
    stringgrid2.Cells[3,0]:='标题';
    with zquery1 do
    begin
      try
        close;
        sql.Clear;
        sql.Add('select fid,fsendid,fsenddate,fmessagetitle from message_online where freciid='''+main.strUser+''' and fisfavorite=''Y'' and fisdel=''N''');
        open;
        stringgrid2.RowCount:=RecordCount+1;
        while not eof do
        begin
          stringgrid2.Cells[0,y]:=fields[0].AsString;
          stringgrid2.Cells[1,y]:=fields[1].AsString;
          stringgrid2.Cells[2,y]:=fields[2].AsString;
          stringgrid2.Cells[3,y]:=fields[3].AsString;
          y := y +1;
          next;
        end;
      except
          application.MessageBox('信息列表读取失败!','消息处理提示');
      end;
    end;

end;

procedure TForm18.TabSheet4Show(Sender: TObject);
var
y:integer;
begin
    y:=1;
    stringgrid3.Cells[0,0]:='编号';
    stringgrid3.Cells[1,0]:='发送人';
    stringgrid3.Cells[2,0]:='发送时间';
    stringgrid3.Cells[3,0]:='标题';
    with zquery1 do
    begin
      try
        close;
        sql.Clear;
        sql.Add('select fid,fsendid,fsenddate,fmessagetitle from message_online where freciid='''+main.strUser+''' and fisfavorite=''N'' and fisread=''Y'' and fisdel=''N''');
        open;
        stringgrid3.RowCount:=RecordCount+1;
        while not eof do
        begin
          stringgrid3.Cells[0,y]:=fields[0].AsString;
          stringgrid3.Cells[1,y]:=fields[1].AsString;
          stringgrid3.Cells[2,y]:=fields[2].AsString;
          stringgrid3.Cells[3,y]:=fields[3].AsString;
          y := y +1;
          next;
        end;
      except
          application.MessageBox('信息列表读取失败!','消息处理提示');
      end;
    end;
end;

procedure TForm18.TabSheet5Show(Sender: TObject);
var
y:integer;
begin
    y:=1;
    stringgrid4.Cells[0,0]:='编号';
    stringgrid4.Cells[1,0]:='发送人';
    stringgrid4.Cells[2,0]:='发送时间';
    stringgrid4.Cells[3,0]:='标题';
    with zquery1 do
    begin
      try
        close;
        sql.Clear;
        sql.Add('select fid,fsendid,fsenddate,fmessagetitle from message_online where freciid='''+main.strUser+''' and fisdel=''Y''');
        open;
        stringgrid4.RowCount:=RecordCount+1;
        while not eof do
        begin
          stringgrid4.Cells[0,y]:=fields[0].AsString;
          stringgrid4.Cells[1,y]:=fields[1].AsString;
          stringgrid4.Cells[2,y]:=fields[2].AsString;
          stringgrid4.Cells[3,y]:=fields[3].AsString;
          y := y +1;
          next;
        end;
      except
          application.MessageBox('信息列表读取失败!','消息处理提示');
      end;
    end;
end;

procedure TForm18.TabSheet6Show(Sender: TObject);
var
y:integer;
begin
    y:=1;
    stringgrid5.Cells[0,0]:='编号';
    stringgrid5.Cells[1,0]:='接收人';
    stringgrid5.Cells[2,0]:='发送时间';
    stringgrid5.Cells[3,0]:='已读';
    stringgrid5.Cells[4,0]:='标题';
    with zquery1 do
    begin
      try
        close;
        sql.Clear;
        sql.Add('select fid,freciid,fsenddate,fisread,fmessagetitle from message_online where fsendid='''+main.strUser+'''');
        open;
        stringgrid5.RowCount:=RecordCount+1;
        while not eof do
        begin
          stringgrid5.Cells[0,y]:=fields[0].AsString;
          stringgrid5.Cells[1,y]:=fields[1].AsString;
          stringgrid5.Cells[2,y]:=fields[2].AsString;
          stringgrid5.Cells[3,y]:=fields[3].AsString;
          stringgrid5.Cells[4,y]:=fields[4].AsString;
          y := y +1;
          next;
        end;
      except
          application.MessageBox('信息列表读取失败!','消息处理提示');
      end;
    end;
end;

end.
