unit uFm_AddRVD;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, EditBtn,FileUtil,
  Buttons, process, UTF8Process, ECEditBtns, ShellApi, AsyncProcess, ComboEx,strutils;

type

  { TFm_AddRVD }

  TFm_AddRVD = class(TForm)
    btn_OK: TBitBtn;
    btn_Cancel: TBitBtn;
    ck_AutoMount: TCheckBox;
    ck_AllowOther: TCheckBox;
    ck_AllowNonEmpty: TCheckBox;
    ck_AllowRoot: TCheckBox;
    cb_LocalDrv: TComboBox;
    cb_CacheMode: TComboBox;
    dir_MountPath: TDirectoryEdit;
    cb_rcRemote: TECComboBtn;
    ed_RemotePath: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    mo_RcloneOther: TMemo;
    SpeedButton1: TSpeedButton;
    procedure btn_OKClick(Sender: TObject);
    procedure dir_MountPathEnter(Sender: TObject);
    procedure ECCSpeedBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure GetRemotes;
  public
    rcloneFile :String;
    InitMountDIR :String;
    //MountCMD: TAsyncProcess;
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
    aDir := ExtractFileDir(dir_MountPath.Text);
    if ((aDir<>'') and (not DirectoryExists(aDir))) or (DirectoryExists(dir_MountPath.Text)) then begin
      MessageDlg('本地虛擬磁碟掛載目錄輸入部正確!請重新設置。', mtError, [mbOK],0);
      dir_MountPath.SetFocus;
      abort;
    end;
  end;
  ModalResult:=mrOK;
end;

procedure TFm_AddRVD.dir_MountPathEnter(Sender: TObject);
begin
  //
  if dir_MountPath.text='' then
    dir_MountPath.Text:= InitMountDIR+'/'
    +StringsReplace(cb_rcRemote.Text+ed_RemotePath.Text,[':','/','\'],['','',''],[rfReplaceAll] );
end;

procedure TFm_AddRVD.ECCSpeedBtnClick(Sender: TObject);
begin
  GetRemotes;
end;

procedure TFm_AddRVD.FormShow(Sender: TObject);
begin
  GetRemotes;
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
  finally
    t.Free;
  end;
end;

procedure TFm_AddRVD.GetRemotes;
var aStt: TStringList;
    t:TProcessUTF8;
begin
  //RunCommand(rcloneFile,['listremotes'],ss,[swoHIDE]);
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
  finally
    t.Free;
    aStt.Free;
  end;
end;

end.

