unit uploadpatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,ADODB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls,inifiles;

type
  TForm1 = class(TForm)
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Button8: TButton;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure FormActivate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button8Click(Sender: TObject);
var
memsize:integer;
buffer:Pchar;
myfile:TFileStream;
stream:tadoblobstream;
filename,cdir:string;
begin
IF edit6.Text <>'' then
begin
cdir:=extractfilepath(application.ExeName);
setcurrentdir(cdir+'update');
zquery1.Active:=false;
zquery1.SQL.Text:='delete from erpupdate_info';
zquery1.ExecSQL;
zquery1.SQL.Text:='select * from erpupdate_info';
zquery1.Open;
filename:='erppatch.exe';
if fileexists(filename)=false then
begin
showmessage('对不起，找不到升级文件!');
//exit;
end;
label7.Visible:=true;
myfile:=tfilestream.Create(filename,fmopenread);
with zquery1 do
begin
insertrecord([1,null,null,null]);
edit;
fieldbyname('fver').AsString:=edit6.Text;
fieldbyname('fname').AsString :=filename;
stream:=tadoblobstream.Create(fieldbyname('ffilestream') as tblobfield,bmwrite);
memsize:=myfile.Size;
inc(memsize);
buffer:=allocmem(memsize);
try
stream.Seek(0,sofrombeginning);
myfile.Read(buffer^,memsize);
stream.Write(buffer^,memsize);
finally
myfile.Free;
stream.Free;
end;
try
post;
except
raise;
end;
end;
showmessage('升级文件装入完毕!');
label7.Visible:=false;
self.close;
end
else
showmessage('请填写最新版本号!');
end;

procedure TForm1.FormActivate(Sender: TObject);
var
cfginifile:tinifile;
filename:string;
  strDBName:string;
  strServerName:string;
  strUserName:string;
  strPwd:string;
  isLogined:Boolean;
  strUserQX:string;
  strUser:string;
  strPort:string;
  strPageCode:string;
  strVer:string;
  strRemoteVer:string;
begin
    filename:=extractfilepath(paramstr(0))+'config.ini';
    if FileExists(filename) = False then
    begin
      application.MessageBox('无法读取配置文件，请在运行主程序进行配置','UPPatch提示');
    end else
    begin
        try
        cfginifile:=tinifile.Create(filename);
        strServerName:=cfginifile.ReadString('服务器设置','服务器名称','');
        strDBName:=cfginifile.ReadString('服务器设置','数据库名称','');
        strUserName:=cfginifile.ReadString('服务器设置','用户','');
        strPwd:=cfginifile.ReadString('服务器设置','密码','');
        strPort:=cfginifile.ReadString('服务器设置','端口','');
        strPageCode:=cfginifile.ReadString('服务器设置','编码','');
        strVer:=cfginifile.ReadString('服务器设置','版本号','');
        ZConnection1.HostName:=strServerName;
        ZConnection1.Port:=strtoint(strPort);
        ZConnection1.Database:=strDBName;
        ZConnection1.User:=strUserName;
        ZConnection1.Password:=strPwd;
        ZConnection1.ClientCodepage:=strPageCode;
        ZConnection1.Connect();
        finally

        end;
end;
end;

end.
