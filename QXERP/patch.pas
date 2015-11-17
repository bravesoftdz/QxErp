unit patch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,strutils, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection,inifiles;

type
  TForm1 = class(TForm)
    Label4: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
currenttime:longint;
newfile:string;
memsize:integer;
buffer:pchar;
myfile:tfilestream;
stream:tadoblobstream;
begin
  newfile:='pacth.exe';
  myfile:=tFileStream.Create(newfile,fmcreate);
  with zquery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select ffilestream from erpupdate_info');
    open;
    stream:=tadoblobstream.Create(fieldbyname('ffilestream') as tblobfield,bmread);
    memsize:=stream.Size;
    inc(memsize);
    buffer:=allocmem(memsize);
    try
      stream.Read(buffer^,memsize);
      myfile.Write(buffer^,memsize);
    finally
      myfile.Free;
      stream.Free;
    end;
  end;
  currenttime:=gettickcount div 1000;
  while((gettickcount div 1000) < (currenttime +3)) do;
  winexec('patch.exe',1);
  application.Terminate;
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
        if ZConnection1.Connected then
        begin
          with zquery1 do
          begin
            close;
            sql.Clear;
            sql.Add('select max(fver) from erpupdate_info');
            open;
            if not eof then
            begin
            strRemoteVer:=fields.Fields[0].AsString;
            label1.Caption:='新的软件版本:'+strRemoteVer;
            end else
                application.MessageBox('未发现任何升级信息！','UPPatch提示');
                button1.Enabled:=false;
            end;
            if (strRemoteVer='') or (strtoint(strVer)>=strtoint(strRemoteVer)) then
            begin
              application.MessageBox('未发现任何升级信息！','UPPatch提示');
              button1.Enabled:=false;
            end;
          end else
          begin
              application.MessageBox('无法连接服务器！','UPPatch提示');
          end;
          Except
              application.MessageBox('无法连接服务器！','UPPatch提示');
          end;
    end;

end;

end.
