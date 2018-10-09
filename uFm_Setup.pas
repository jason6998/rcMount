unit uFm_Setup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, EditBtn,
  Buttons;

type

  { TFm_Setup }

  TFm_Setup = class(TForm)
    BtnOK: TBitBtn;
    ck_RunTrayIcon: TCheckBox;
    ck_WinAutoRun: TCheckBox;
    dir_InitMount: TDirectoryEdit;
    File_rclone: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mo_RcloneOther: TMemo;
  private

  public

  end;

var
  Fm_Setup: TFm_Setup;

implementation

{$R *.frm}

end.

