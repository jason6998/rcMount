unit uFm_AddRVD;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, StdCtrls, EditBtn,FileUtil,
  Buttons, process, UTF8Process, ECEditBtns,strutils;

type

  { TFm_AddRVD }

  TFm_AddRVD = class(TForm)
    btn_OK: TBitBtn;
    btn_Cancel: TBitBtn;
    ck_AutoMount: TCheckBox;
    cb_LocalDrv: TComboBox;
    cb_CacheMode: TComboBox;
    dir_MountPath: TDirectoryEdit;
    cb_rcRemote: TECComboBtn;
    ed_MountName: TEdit;
    ed_RVDName: TEdit;
    ed_RemotePath: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mo_RcloneOther: TMemo;
    SpeedButton1: TSpeedButton;
    procedure btn_OKClick(Sender: TObject);
    procedure ECCSpeedBtnClick(Sender: TObject);
    procedure ed_MountNameEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public
    rcloneFile :String;
    InitMountDIR :String;
    //MountCMD: TAsyncProcess;
    procedure GetRemotes;
  end;

var
  Fm_AddRVD: TFm_AddRVD;

implementation

{$R *.frm}

{ TFm_AddRVD }

procedure TFm_AddRVD.btn_OKClick(Sender: TObject);
var aDir:string;
begin
  if cb_rcRemote.Text='' then begin
    MessageDlg('rclone Remoter 未輸入!請重新設置。', mtError, [mbOK],0);
    cb_rcRemote.SetFocus;
    abort;
  end;
  if (cb_LocalDrv.ItemIndex=0) then begin
    //如果未設定掛載磁碟
    aDir := dir_MountPath.Text+'/'+ed_MountName.Text {ExtractFileDir(dir_MountPath.Text)};
    if (dir_MountPath.Text='') or (ed_MountName.Text='') or (not DirectoryExists(dir_MountPath.Text))
       or DirectoryExists(aDir) then begin
      MessageDlg('掛載磁碟資料夾位置不正確!請重新設置。', mtError, [mbOK],0);
      dir_MountPath.SetFocus;
      abort;
    end;
  end;
  ModalResult:=mrOK;
end;

procedure TFm_AddRVD.ECCSpeedBtnClick(Sender: TObject);
begin
  GetRemotes;
end;

procedure TFm_AddRVD.ed_MountNameEnter(Sender: TObject);
begin
  //
  if ed_MountName.text='' then
    ed_MountName.Text:=StringsReplace(ed_RVDName.Text,['*','?','>','<','|',':','/','\']
                                      ,['','','','','','','',''],[rfReplaceAll]);
end;

procedure TFm_AddRVD.FormCreate(Sender: TObject);
begin
    //GetRemotes;
end;

procedure TFm_AddRVD.SpeedButton1Click(Sender: TObject);
var t:TProcessUTF8;
begin
  //ShellExecute(0,nil, PChar('cmd'),PChar('/k '+rcloneFile+' config'),nil,1);
  //RunCommand('CMD.exe',['/k',rcloneFile,'config'],ss,[poPassInput]);
  //ShowMessage(ss);
  t:= TProcessUTF8.Create(NIL);
  try
    t.Executable := 'cmd.exe';
    t.Parameters.Add('/c');
    t.Parameters.Add(rcloneFile);
    t.Parameters.Add('config');
    t.Options := t.Options + [poWaitOnExit];
    t.Execute;
    GetRemotes;
  finally
    t.Free;
  end;
end;

procedure TFm_AddRVD.GetRemotes;
var aStt: TStringList;
    t:TProcessUTF8;
    ss:String;
begin
  //RunCommand(rcloneFile,['listremotes'],ss,[swoHIDE]);
  ss := cb_rcRemote.Text;
  t:= TProcessUTF8.Create(NIL);
  aStt := TStringList.Create;
  try
    t.Executable := rcloneFile;
    t.Parameters.Add('listremotes');
    t.Options := t.Options + [poWaitOnExit, poUsePipes];
    t.ShowWindow:=swoHIDE;
    t.Execute;
    aStt.LoadFromStream(t.Output);
    cb_rcRemote.Clear;
    cb_rcRemote.Items.AddStrings(aStt);
    cb_rcRemote.ItemIndex := cb_rcRemote.Items.IndexOf(ss);
  finally
    t.Free;
    aStt.Free;
  end;
end;

end.

