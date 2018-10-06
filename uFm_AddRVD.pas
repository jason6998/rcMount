unit uFm_AddRVD;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, EditBtn,
  Buttons, process, UTF8Process, ShellApi, AsyncProcess;

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
    ed_RemotePath: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo_Other: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure btn_OKClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

  public
    rcloneFile :String;
    //MountCMD: TAsyncProcess;
  end;

var
  Fm_AddRVD: TFm_AddRVD;

implementation

{$R *.frm}

{ TFm_AddRVD }

procedure TFm_AddRVD.btn_OKClick(Sender: TObject);
begin
  if ed_RemotePath.Text='' then begin
    MessageDlg('rclone 雲名稱未輸入!請重新設置。', mtError, [mbOK],0);
    ed_RemotePath.SetFocus;
    abort;
  end;
  if (cb_LocalDrv.ItemIndex=0) and DirectoryExists(dir_MountPath.Text) then begin
    MessageDlg('本地虛擬磁碟掛載目錄已經存在!請重新設置。', mtError, [mbOK],0);
    dir_MountPath.SetFocus;
    abort;
  end;
  ModalResult:=mrOK;
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

procedure TFm_AddRVD.SpeedButton2Click(Sender: TObject);
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
    ShowMessage(aStt.Text);
  finally
    t.Free;
    aStt.Free;
  end;
end;

end.

