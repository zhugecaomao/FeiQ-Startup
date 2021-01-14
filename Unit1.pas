unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{$R UAC.res}//����UACȨ������

procedure TForm1.Button1Click(Sender: TObject);
var
  Reg:TRegistry;//���ȶ���һ��TRegistry���͵ı���Reg
begin
  if Edit1.Text <> '' then
  begin
    Reg:=TRegistry.Create;//����һ���¼�
    Reg.RootKey:=HKEY_LOCAL_MACHINE;//����������ΪHKEY_LOCAL_MACHINE
    Reg.OpenKey('SOFTWARE\Microsoft\windows\CurrentVersion\Run',true);//��һ����
    Reg.WriteString('FEIQ',PChar('"' + Edit1.Text + '"' +' ' +'1'));//��Reg�������д���������ƺ�������ֵ
    Reg.CloseKey;//�رռ�
  end
  else
  MessageBox(Handle,'��δѡ�����·����','��ʾ',MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if opendialog1.Execute then
edit1.text:=opendialog1.FileName ;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Reg:TRegistry;//���ȶ���һ��TRegistry���͵ı���Reg
begin
  Reg:=TRegistry.Create;//����һ���¼�
  Reg.RootKey:=HKEY_LOCAL_MACHINE;//����������ΪHKEY_LOCAL_MACHINE
  Reg.OpenKey('SOFTWARE\Microsoft\windows\CurrentVersion\Run',true);//��һ����
  Reg.DeleteValue('FEIQ');//ɾ��ע�����ֵ
  Reg.CloseKey;//�رռ�
  MessageBox(Handle,'�Ѿ�ȡ�����￪��������','��ʾ',MB_OK + MB_ICONASTERISK);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
//  AnimateWindow(Self.Handle, 500, aw_center or AW_Hide);//500Ϊ�رմ���ʱ�䣬��λ��ms
  Application.Terminate;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  AnimateWindow(Self.Handle, 500, aw_center or AW_Hide);//500Ϊ�رմ���ʱ�䣬��λ��ms
end;

procedure TForm1.Timer1Timer(Sender: TObject);//����Timer���
begin
  if Self.AlphaBlendValue <= 250 then
    Self.AlphaBlendValue := Self.AlphaBlendValue + 5;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Self.AlphaBlend := True;
  //Self.AlphaBlendValue := 0;
end;

end.