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
    ck_WinAutoRun: TCheckBox;
    dir_InitMount: TDirectoryEdit;
    File_rclone: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
  private

  public

  end;

var
  Fm_Setup: TFm_Setup;

implementation

{$R *.frm}

end.

