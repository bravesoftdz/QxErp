unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, StdCtrls, DB, Grids, ADODB,inifiles, ExtCtrls,StrUtils,math,
  ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, RpDefine, RpRave, RpCon, RpConDS, RpConBDE, RpBase, RpSystem,
  IdBaseComponent, IdComponent, IdIPWatch,ShellAPI, ImgList, RpRender,
  RpRenderPDF;

 // CONST WM_BARICON=WM_USER+200;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    C1: TMenuItem;
    X1: TMenuItem;
    L1: TMenuItem;
    StatusBar1: TStatusBar;
    N3: TMenuItem;
    N4: TMenuItem;
    ZConnection1: TZConnection;
    Timer1: TTimer;
    ZQuery1: TZQuery;
    Panel1: TPanel;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet7: TTabSheet;
    Button19: TButton;
    Button20: TButton;
    Button39: TButton;
    TabSheet1: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button8: TButton;
    Button31: TButton;
    TabSheet2: TTabSheet;
    Button11: TButton;
    Button17: TButton;
    Button36: TButton;
    Button38: TButton;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button44: TButton;
    TabSheet10: TTabSheet;
    TabSheet9: TTabSheet;
    Button45: TButton;
    Button46: TButton;
    TabSheet8: TTabSheet;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    TabSheet3: TTabSheet;
    Button25: TButton;
    Button26: TButton;
    Button29: TButton;
    Button30: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button37: TButton;
    Button15: TButton;
    Button49: TButton;
    Button50: TButton;
    TabSheet4: TTabSheet;
    Button7: TButton;
    Button18: TButton;
    Button16: TButton;
    TabSheet6: TTabSheet;
    Button14: TButton;
    Button3: TButton;
    TabSheet5: TTabSheet;
    Button4: TButton;
    Button10: TButton;
    Button9: TButton;
    Button12: TButton;
    Button27: TButton;
    Button28: TButton;
    Button35: TButton;
    Button48: TButton;
    Button54: TButton;
    Button47: TButton;
    Button51: TButton;
    Button52: TButton;
    Button53: TButton;
    Button40: TButton;
    Button13: TButton;
    Button55: TButton;
    Button56: TButton;
    Button57: TButton;
    Button58: TButton;
    Button59: TButton;
    Button60: TButton;
    Button61: TButton;
    Button63: TButton;
    Button64: TButton;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    Button66: TButton;
    Button65: TButton;
    Button67: TButton;
    Button69: TButton;
    Button70: TButton;
    Button71: TButton;
    Button72: TButton;
    Button73: TButton;
    Button62: TButton;
    Button68: TButton;
    Button74: TButton;
    Button75: TButton;
    Button79: TButton;
    Button80: TButton;
    Button81: TButton;
    Button82: TButton;
    Button83: TButton;
    IdIPWatch1: TIdIPWatch;
    Button84: TButton;
    Button85: TButton;
    Button86: TButton;
    Button87: TButton;
    Button88: TButton;
    Button89: TButton;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    Button90: TButton;
    TabSheet11: TTabSheet;
    Button91: TButton;
    Button92: TButton;
    Button93: TButton;
    Button94: TButton;
    TabSheet12: TTabSheet;
    Button76: TButton;
    Button77: TButton;
    Button78: TButton;
    Button95: TButton;
    Button6: TButton;
    Button96: TButton;
    RvRenderPDF1: TRvRenderPDF;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure AppLoginFalse(islogined:boolean);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
    procedure Button44Click(Sender: TObject);
    procedure Button45Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button48Click(Sender: TObject);
    procedure Button49Click(Sender: TObject);
    procedure Button50Click(Sender: TObject);
    procedure Button51Click(Sender: TObject);
    procedure Button52Click(Sender: TObject);
    procedure Button53Click(Sender: TObject);
    procedure Button54Click(Sender: TObject);
    procedure Button55Click(Sender: TObject);
    procedure Button56Click(Sender: TObject);
    procedure Button57Click(Sender: TObject);
    procedure Button58Click(Sender: TObject);
    procedure Button59Click(Sender: TObject);
    procedure Button60Click(Sender: TObject);
    procedure Button61Click(Sender: TObject);
    procedure Button62Click(Sender: TObject);
    procedure Button63Click(Sender: TObject);
    procedure Button64Click(Sender: TObject);
    procedure Button65Click(Sender: TObject);
    procedure Button66Click(Sender: TObject);
    procedure Button67Click(Sender: TObject);
    procedure Button68Click(Sender: TObject);
    procedure Button69Click(Sender: TObject);
    procedure Button70Click(Sender: TObject);
    procedure Button71Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button72Click(Sender: TObject);
    procedure Button73Click(Sender: TObject);
    procedure Button74Click(Sender: TObject);
    procedure Button75Click(Sender: TObject);
    procedure Button76Click(Sender: TObject);
    procedure Button77Click(Sender: TObject);
    procedure Button78Click(Sender: TObject);
    procedure Button79Click(Sender: TObject);
    procedure Button80Click(Sender: TObject);
    procedure Button81Click(Sender: TObject);
    procedure Button83Click(Sender: TObject);
    procedure Button82Click(Sender: TObject);
    procedure Button84Click(Sender: TObject);
    procedure Button85Click(Sender: TObject);
    procedure Button86Click(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Button87Click(Sender: TObject);
    procedure Button88Click(Sender: TObject);
    procedure Button89Click(Sender: TObject);
    procedure TrayIcon1Animate(Sender: TObject);
    procedure Button90Click(Sender: TObject);
    procedure Button91Click(Sender: TObject);
    procedure Button92Click(Sender: TObject);
    procedure Button93Click(Sender: TObject);
    procedure Button94Click(Sender: TObject);
    procedure Button95Click(Sender: TObject);
    procedure Button96Click(Sender: TObject);
  private
    { Private declarations }
    {procedure WMSysCommand(var Message: TMessage);
    message WM_SYSCOMMAND;
    procedure WMBarIcon(var Message:TMessage);
    message WM_BARICON;}
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  boolsignin:boolean;
  cfginifile:tinifile;
  strDBName:string;
  strServerName:string;
  strUserName:string;
  strPwd:string;
  isLogined:Boolean;
  strUserQX:string;
  strUser:string;
  strUserIP:string;
  filename:string;
  strPort:string;
  strPageCode:string;
  intMessage:integer;
  boolMesscandle:boolean;
  strcaption:string;
  oldver,newver:string;
  sjts:integer;
  Function ExportStrGridToExcel(Args: array of const): Boolean;stdcall;external 'dlltools.dll';
  function SplitString(Source, Deli: string ): String;stdcall;external 'dlltools.dll';


implementation
uses dbconnecter,xsygl,zgdwgl,khgl,htgl,
     cpxxgl,ckgl,about,yskjz,dlgl,bcpxxgl,
     bcpgl,yskcx,zggl,zhqxgl,xgmm,sctjcx,
     scjh,message_online,fhdgl,fhdcx,
     fapiaohezhang,ckitemrkgl,gysgl,
     ccxxgl,fpwhzcx,fcpckgl,xzht,cprk,
     cpck,bcprk,kczgxxgl,cgkcgz,ckcx,
     xzscjh,ckitemgz,qjgl,qjcx,rwdjs,
     yskjs,yskcscx,bcptsck,bcpsctjcx,
     blzjjldj,zjbljlcx,zxjgd,jgsgl,
     wxdwcprk,rkddelgl,bcpjgdcx,bcpjgrk,
     jgdjs,wjgjggl,lhttjcpmx,htmxtz,
     fhck,csckgl,cscprkgl,csckdgl,csckddy,
     monthreports,rkdinfocx,fpcxrkd,
     cyrxxgl,bthcscktzd,bthcstzddy,
     bthcsckgl,thcl,kptzs,kptzsdycx,
     jiagongfeijs,jgjsddycx,jgjsdqrpay,
     kptzskpqr,bcpkczzgl,bcpkcgz,
     scjhzggl,scjhjdgz,wxjgdtz,scjhkcgz,
     jhdjs,wwcrwslcx,rwslcxbyrwdbh,yjsjhdcx,
     delhtinfo,fhdcxyfh,cpbj;

{$R *.dfm}

{
procedure TForm1.WMSysCommand
(var Message:TMessage);
var
   lpData:PNotifyIconDataW;
begin
if Message.WParam = SC_ICON then
begin
    //如果用户最小化窗口则将窗口 隐藏并在任务栏上添加图标
    lpData := new(PNotifyIconDataW);
    lpData.cbSize := 88;
//SizeOf(PNotifyIconDataA);
    lpData.Wnd := Form1.Handle;
    lpData.hIcon := Form1.Icon.Handle;
    lpData.uCallbackMessage := WM_BARICON;
    lpData.uID :=0;
    lpData.szTip := '秦橡ERP';
    lpData.uFlags := NIF_ICON
or NIF_MESSAGE or NIF_TIP;
    Shell_NotifyIcon(NIM_ADD,lpData);
    dispose(lpData);
    Form1.Visible := False;
end
else
begin
    //如果是其它的SystemCommand 消息则调用系统缺省处理函数处理之。
    DefWindowProc(Form1.Handle,Message.
Msg,Message.WParam,Message.LParam);
end;
//
end;

procedure TForm1.WMBarIcon(var Message:TMessage);
var
   lpData:PNotifyIconDataW;
begin
if (Message.LParam = WM_LBUTTONDOWN) then
   begin
    //如果用户点击任务栏图标则将图标删除并回复窗口。
    lpData := new(PNotifyIconDataW);
    lpData.cbSize := 88;//SizeOf(PNotifyIconDataA);
    lpData.Wnd := Form1.Handle;
    lpData.hIcon := Form1.Icon.Handle;
    lpData.uCallbackMessage := WM_BARICON;
    lpData.uID :=0;
    lpData.szTip := '秦橡ERP';
    lpData.uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
    Shell_NotifyIcon(NIM_DELETE,lpData);
    dispose(lpData);
    Form1.Visible := True;
    //form1.BringToFront;
   end;
end;
}

procedure TForm1.AppLoginFalse(islogined: Boolean);
begin
  if(islogined=false) then
    main.Form1.Close;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,11,1)='1') then
    bcpxxgl.Form11.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    bcpgl.Form12.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,20,1)='1') then
    zhqxgl.Form14.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,3,1)='1') then
    sctjcx.Form16.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ckcx.Form34.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,10,1)='1') then
    yskcscx.Form43.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    scjh.Form17.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,10,1)='1') then
    yskjs.Form41.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    xsygl.Form2.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  boolmesscandle:=false;
  message_online.Form18.Show;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    fhdgl.Form19.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    cyrxxgl.Form72.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    fhdcx.Form20.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ckitemrkgl.Form22.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fapiaohezhang.Form23.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    gysgl.Form24.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ccxxgl.Form25.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fpwhzcx.Form26.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    zgdwgl.Form4.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fcpckgl.Form27.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    htgl.Form6.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button32Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    cprk.Form29.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button33Click(Sender: TObject);
begin
  if(main.strUser='admin') then
    cpck.Form30.Show
  else
    application.MessageBox('产品发货出库请走正常流程！','系统提示');
end;

procedure TForm1.Button34Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    cgkcgz.Form33.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button35Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    kczgxxgl.Form32.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button36Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    bcprk.Form31.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button37Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ckitemgz.Form35.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button38Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    xzscjh.Form36.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button39Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,19,1)='1') then
    qjgl.Form37.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,3,1)='1') then
    ckgl.from9.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button40Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,19,1)='1') then
    qjcx.Form38.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button41Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    wwcrwslcx.Form96.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button42Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    rwdjs.Form39.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button43Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    bcptsck.Form44.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button44Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    bcpsctjcx.Form47.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button45Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    blzjjldj.Form48.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button46Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    zjbljlcx.Form49.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button47Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    zxjgd.Form50.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button48Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    jgsgl.Form51.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button49Click(Sender: TObject);
begin
  if(main.strUser='admin') then
    wxdwcprk.Form52.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,8,1)='1') then
    cpxxgl.Form8.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button50Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    rkddelgl.Form53.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button51Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    bcpjgdcx.Form55.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button52Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    bcpjgrk.Form56.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button53Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    jgdjs.Form57.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button54Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,11,1)='1') then
    wjgjggl.Form58.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button55Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,3,1)='1') then
    zjbljlcx.Form49.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button56Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,3,1)='1') then
    bcpgl.Form12.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button57Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,3,1)='1') then
    bcpsctjcx.Form47.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button58Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,3,1)='1') then
    qjcx.Form38.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button59Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    lhttjcpmx.Form59.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    khgl.Form5.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button60Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    htmxtz.Form60.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button61Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fhck.Form62.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button62Click(Sender: TObject);
begin        //csckgl
  if(MidStr(main.strUserQX,9,1)='1') then
    bthcsckgl.Form76.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button63Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    cscprkgl.Form65.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button64Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    csckdgl.Form66.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button65Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    csckddy.Form67.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button66Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    csckgl.Form64.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button67Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    csckdgl.Form66.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button68Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    thcl.Form73.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button69Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    monthreports.Form69.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    yskjz.form9.Show  //权限设置位为第10位 ，因为FORM9与应收款管理的FORM9重复。
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button80Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    bcpkczzgl.Form86.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button81Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    bcpkcgz.Form87.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button82Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    scjhjdgz.Form89.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button83Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    scjhzggl.Form88.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button84Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,12,1)='1') then
    wxjgdtz.Form93.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button85Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    scjhkcgz.Form94.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button86Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    jhdjs.Form95.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button87Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    rwslcxbyrwdbh.Form97.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button88Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    yjsjhdcx.Form98.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button89Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    delhtinfo.Form99.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    xzht.Form28.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button90Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fhdcxyfh.Form100.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button91Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,15,1)='1') then
    wwcrwslcx.Form96.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button92Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,15,1)='1') then
    rwslcxbyrwdbh.Form97.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button93Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,15,1)='1') then
    rwdjs.Form39.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button94Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,15,1)='1') then
    xzscjh.Form36.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button95Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,18,1)='1') then
    cprk.Form29.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button96Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,2,1)='1') then
    cpbj.Form101.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,13,1)='1') then
    zggl.Form13.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.FormResize(Sender: TObject);
begin
      Main.Form1.StatusBar1.Panels.Items[0].Width:= floor(Main.Form1.Width/4);
      Main.Form1.StatusBar1.Panels.Items[1].Width:= floor(Main.Form1.Width/4);
      Main.Form1.StatusBar1.Panels.Items[2].Width:= floor(Main.Form1.Width/4);
      Main.Form1.StatusBar1.Panels.Items[3].Width:= floor(Main.Form1.Width/4);
      if form1.WindowState=wsMaximized then
      begin
      panel1.Left:=form1.ClientWidth-panel1.Width-10;
      panel1.Top:=form1.ClientHeight-statusbar1.Height-panel1.Height-10;
      //label1.Caption:=inttostr(form1.Width)+inttostr(form1.Height);
      end else
      begin
      panel1.Left:=form1.ClientWidth-panel1.Width-10;
      panel1.Top:=form1.ClientHeight-statusbar1.Height-panel1.Height-10;
      //label1.Caption:=inttostr(form1.Width)+inttostr(form1.Height);
      end;
  //    panel1.Repaint;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    strcaption:='浙江秦山橡胶工程股份有限公司生产办公管理系统';
    if boolsignin=false then
      dlgl.Form10.ShowModal;
    if(isLogined=false) then
    begin
    main.Form1.Close;
    end;
    boolmesscandle:=false;
    if zconnection1.Connected then
    begin
    try
      with zquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select count(*) from message_online where freciid='''+strUser+''' and fisread=''N'' and fisdel=''N''');
        open;
        intMessage:=fields[0].AsInteger;
        if intMessage>0 then
        begin
          form1.Caption:=strcaption+'            ========【您有 '+inttostr(intMessage)+' 条新的消息】========';
          form1.label1.Caption:='您有'+inttostr(intMessage)+'条新的消息';
          panel1.Visible:=true;
        end else
        begin
          panel1.Visible:=false;
          form1.Caption:=strcaption;
        end;
        //panel1.Left:=10;
        //panel1.Top:=10;
        //form1.OnResize(Sender);
    end;
    except
      application.MessageBox('查询数据失败！','在线消息提示');
    end;
    end;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  FlashWindow(Application.Handle, false);
  boolmesscandle:=true;
  panel1.Visible:=false;
  form18.Show;
end;

procedure TForm1.Label1MouseLeave(Sender: TObject);
begin
   Label1.Font.Color:=clWindowText;       //恢复Label1的字体颜色
   Label1.Font.Style:=[];                //恢复Label1的字体（去掉下划线）
   Label1.Cursor:=crDefault;
end;

procedure TForm1.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Font.Color:=clBlue;                //设置Label1的字体颜色为蓝色
  Label1.Font.Style:=[fsUnderline];        //设置Label1的字体带下划线
  Label1.Cursor:=crHandpoint;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
    about.AboutBox.ShowModal;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  xgmm.Form15.ShowModal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if zconnection1.Connected then
begin
  try
    with zquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select count(*) from message_online where freciid='''+strUser+''' and fisread=''N'' and fisdel=''N''');
      open;
      intMessage:=fields[0].AsInteger;
      if intMessage>0 then
      begin
        trayicon1.ShowBalloonHint;
        //trayicon1.Animate:=true;
        //trayicon1.AnimateInterval:=450;
        form1.Caption:=strcaption+'            ========【您有 '+inttostr(intMessage)+' 条新的消息】========';
        form1.Label1.Caption:='您有'+inttostr(intMessage)+'条新的消息';
        panel1.Visible:=true;
      end else
      begin
        form1.Caption:=strcaption;
        panel1.Visible:=false;
      end;
      close;
      sql.Clear;
      SQL.Add('select fver,ifnull(fmemo,''无升级信息'') from erpupdate_info');
      Open;
      if (RecordCount >0) and (not Fields.Fields[0].IsNull ) then
      begin
        newver:=Fields.Fields[0].AsString;
        if (trim(newver)>oldver) and (sjts=0) then
        begin
        messagedlg('系统发现新的软件版本，请及时升级！'+#13+#10+fields[1].AsString,mtinformation,[mbOk],0);
        sjts:=1;
        end;
      end;
    end;
  except
  begin
    StatusBar1.Panels.Items[0].Text := '系统信息：数据库连接已断开，请重新登录!';
    application.MessageBox('数据库连接已断开，请重新登录!','在线消息提示');
    timer1.Enabled:=false;
    zconnection1.Disconnect;
    dlgl.Form10.ShowModal;
  end;
  end;
end;
end;

procedure TForm1.TrayIcon1Animate(Sender: TObject);
begin
    trayicon1.IconIndex:=1;
end;

procedure TForm1.X1Click(Sender: TObject);
begin
  main.Form1.Close;
end;

procedure TForm1.Button70Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    rkdinfocx.Form70.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button71Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    fpcxrkd.Form71.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button72Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    bthcscktzd.Form74.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button73Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    bthcstzddy.Form75.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button74Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    kptzs.Form77.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button75Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    kptzsdycx.Form78.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button76Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    jiagongfeijs.Form81.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button77Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    jgjsddycx.Form82.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button78Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    jgjsdqrpay.Form84.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button79Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,1,1)='1') then
    kptzskpqr.Form85.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,10,1)='1') then
    yskcx.Form7.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

end.
