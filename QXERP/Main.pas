unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, StdCtrls, DB, Grids, ADODB,inifiles, ExtCtrls,StrUtils,math;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    C1: TMenuItem;
    X1: TMenuItem;
    L1: TMenuItem;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button8: TButton;
    ADOConnection1: TADOConnection;
    Button4: TButton;
    Button3: TButton;
    N3: TMenuItem;
    Button6: TButton;
    Button10: TButton;
    Button11: TButton;
    Button7: TButton;
    Button9: TButton;
    Button12: TButton;
    N4: TMenuItem;
    TabSheet6: TTabSheet;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  cfginifile:tinifile;
  strDBName:string;
  strServerName:string;
  strUserName:string;
  strPwd:string;
  isLogined:Boolean;
  strUserQX:string;
  strUser:string;
  filename:string;

implementation
uses dbconnecter,xsygl,zgdwgl,khgl,htgl,cpxxgl,ckgl,about,yskjz,dlgl,bcpxxgl,bcpgl,yskcx,zggl,zhqxgl,xgmm,sctjcx,scjh;

{$R *.dfm}



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
  if(MidStr(main.strUserQX,12,1)='1') then
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
  if(MidStr(main.strUserQX,14,1)='1') then
    sctjcx.Form16.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,17,1)='1') then
    scjh.Form17.Show
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,4,1)='1') then
    zgdwgl.Form4.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,9,1)='1') then
    ckgl.from9.Show
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

procedure TForm1.Button5Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,5,1)='1') then
    khgl.Form5.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,10,1)='1') then
    yskjz.form9.Show  //权限设置位为第10位 ，因为FORM9与应收款管理的FORM9重复。
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,6,1)='1') then
    htgl.Form6.Show
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
      Main.Form1.StatusBar1.Panels.Items[0].Width:= floor(Main.Form1.Width/3);
      Main.Form1.StatusBar1.Panels.Items[1].Width:= floor(Main.Form1.Width/3);
      Main.Form1.StatusBar1.Panels.Items[2].Width:= floor(Main.Form1.Width/3);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    dlgl.Form10.ShowModal;
    if(isLogined=false) then
    begin
    main.Form1.Close;
    end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
    about.AboutBox.ShowModal;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  xgmm.Form15.ShowModal;
end;

procedure TForm1.X1Click(Sender: TObject);
begin
  main.Form1.Close;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if(MidStr(main.strUserQX,7,1)='1') then
    yskcx.Form7.Show
  else
    application.MessageBox('该模块你无使用权限！','系统提示');
end;

end.
