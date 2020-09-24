unit uFm_WinMount;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, ExtCtrls, ComCtrls,
  Buttons, StdCtrls, XMLPropStorage, Menus, AsyncProcess,
  registry, process,LazFileUtils, UniqueInstance,
  {UniqueInstance,} strutils;

type

  { TFm_WinMount }

  TFm_WinMount = class(TForm)
    AsyncProcess1: TAsyncProcess;
    btn_Add: TSpeedButton;
    btn_Exit: TSpeedButton;
    btn_Modify: TSpeedButton;
    btn_Mount: TSpeedButton;
    btn_Remove: TSpeedButton;
    btn_SetUp: TSpeedButton;
    btn_unMount: TSpeedButton;
    ImageList1: TImageList;
    Label1: TLabel;
    LV_RVDList: TListView;
    Panel_mr: TPanel;
    Panel4: TPanel;
    Panel_m: TPanel;
    N_WinShow: TMenuItem;
    N_WinClose: TMenuItem;
    Panel_top: TPanel;
    Panel_topR: TPanel;
    PopupMenu1: TPopupMenu;
    sb_rcMount: TMemo;
    Splitter1: TSplitter;
    TrayIcon1: TTrayIcon;
    UniqueInstance1: TUniqueInstance;
    XMLPropStorage1: TXMLPropStorage;
    procedure btn_AddClick(Sender: TObject);
    procedure btn_ExitClick(Sender: TObject);
    procedure btn_ModifyClick(Sender: TObject);
    procedure btn_MountClick(Sender: TObject);
    procedure btn_RemoveClick(Sender: TObject);
    procedure btn_SetUpClick(Sender: TObject);
    procedure btn_unMountClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure LV_RVDListDblClick(Sender: TObject);
    procedure LV_RVDListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure N_WinCloseClick(Sender: TObject);
    procedure N_WinShowClick(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure XMLPropStorage1RestoreProperties(Sender: TObject);
    procedure XMLPropStorage1SaveProperties(Sender: TObject);
    procedure AsyncProcess1Terminate(Sender: TObject);
  private
    rcloneFile :String;
    InitMountDIR :String;
    RcloneOther :string;
    WinAutoRun :Boolean;
    RunTrayIcon :Boolean;
    CloseNeeded :Boolean;
    FirstShow :Boolean;
    function ItemToMountCMD(aItem: TListItem;Execute:Boolean=False):TAsyncProcess;
    function RcloneFileExists(Message:Boolean=True):Boolean;
    procedure MountRC(aItem: TListItem);
    procedure unMountRC(aItem: TListItem);
    procedure SetStateIndex(aItem: TListItem);
    procedure SetBtnEnabled(aItem: TListItem);
    procedure SetMountCMDText(aItem: TListItem);
    procedure SetAutoRun;
    procedure AddRVDExecute(Sender: TObject);
  protected

  public

  end;

var
  Fm_WinMount: TFm_WinMount;

implementation
{$R *.frm}

uses uFm_AddRVD,uFm_Setup;


{ TFm_WinMount }
procedure TFm_WinMount.SetStateIndex(aItem: TListItem);
var vt:TAsyncProcess;
begin
  if not Assigned(aItem) then exit;
  aItem.StateIndex:=0;
  if Assigned(aItem.Data) then begin
    vt := TAsyncProcess(aItem.Data);
    if vt.Running then
      aItem.StateIndex:=1
    else
      aItem.StateIndex:=0;
  end;
end;

procedure TFm_WinMount.SetBtnEnabled(aItem: TListItem);
begin
  btn_Modify.Enabled:=False;
  btn_Remove.Enabled:=False;
  btn_unMount.Enabled:= False;
  btn_Mount.Enabled:= False;
  if not Assigned(aItem) then exit;
  if not aItem.Selected then exit;
  btn_Modify.Enabled:=True;
  btn_Remove.Enabled:=True;
  if aItem.StateIndex=1 then
    btn_unMount.Enabled:= True
  else
    btn_Mount.Enabled:= True;
end;

procedure TFm_WinMount.SetMountCMDText(aItem: TListItem);
begin
  sb_rcMount.Text:='rclone mount '+aItem.SubItems[0]+' '+aItem.SubItems[1]
                         +' '+aItem.SubItems[2]+' '+aItem.SubItems[3] ;
  sb_rcMount.Hint:=sb_rcMount.Text;
end;

procedure TFm_WinMount.SetAutoRun;
var Reg: TRegistry;
begin
  //設定是否要自動執行
  //HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', true);
    if WinAutoRun then
      Reg.WriteString('rcMount',Application.ExeName)
    else
     Reg.DeleteValue('rcMount');
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

procedure TFm_WinMount.AddRVDExecute(Sender: TObject);
var aItem: TListItem;
    ss:String;
    ii:Integer;
begin
  //加入 or 修改
  if not RcloneFileExists then abort;
  if (Sender=btn_Modify) then
    if (not Assigned(LV_RVDList.Selected)) or (not LV_RVDList.Selected.Selected) then abort;

  Fm_AddRVD := TFm_AddRVD.Create(self);
  try
    //Fm_AddRVD.InitMountDIR := InitMountDIR;
    Fm_AddRVD.rcloneFile:=rcloneFile;
    Fm_AddRVD.mo_RcloneOther.Text:=RcloneOther;
    Fm_AddRVD.dir_MountPath.Text:=InitMountDIR;
    Fm_AddRVD.GetRemotes;
    if (Sender=btn_Modify) then begin
      aItem := LV_RVDList.Selected;
      with Fm_AddRVD do begin
        ii:=1;
        ed_RVDName.Text:=aItem.Caption;
        cb_rcRemote.Text := ExtractSubstr(aItem.SubItems[0],ii,[':'])+':';
        ed_RemotePath.Text := ExtractSubstr(aItem.SubItems[0],ii,[':']);
        ss := ExtractWord(2,aItem.SubItems[1],[':','/','\']); //取得磁碟之後的path
        if ss='' then
          cb_LocalDrv.Text := aItem.SubItems[1]
        else begin
          dir_MountPath.Text := ExtractFileDir(aItem.SubItems[1]);
          ed_MountName.Text := ExtractFileName(aItem.SubItems[1]);
        end;
        cb_CacheMode.Text := aItem.SubItems[2];
        mo_RcloneOther.Text := aItem.SubItems[3];
        ck_AutoMount.Checked := StrToBool(aItem.SubItems[4]);
      end;
    end;

    if Fm_AddRVD.ShowModal=mrok then
    begin
      if (Sender=btn_Add) then
        aItem := LV_RVDList.Items.Add
      else begin
        unMountRC(aItem);
        aItem.SubItems.Clear;
      end;
      aItem.Caption:= Fm_AddRVD.ed_RVDName.Text {''};
      aItem.SubItems.Add(Fm_AddRVD.cb_rcRemote.Text+Fm_AddRVD.ed_RemotePath.Text);  //0 Remote Path
      if Fm_AddRVD.cb_LocalDrv.ItemIndex>0 then
        aItem.SubItems.Add(Fm_AddRVD.cb_LocalDrv.Text)   //1 Local Drive
      else
        aItem.SubItems.Add(Fm_AddRVD.dir_MountPath.Text+'/'+Fm_AddRVD.ed_MountName.Text); //1 MountPath

      aItem.SubItems.Add(Fm_AddRVD.cb_CacheMode.Text);  //2 CacheMode
      aItem.SubItems.Add(Fm_AddRVD.mo_RcloneOther.Text); //3 參數
      if Fm_AddRVD.ck_AutoMount.Checked then
        aItem.SubItems.Add('1')
      else
        aItem.SubItems.Add('0');  //4 Auto Mount
      aItem.Data :=ItemToMountCMD(aItem,True);
      aItem.StateIndex:=1;
      SetMountCMDText(aItem);
      XMLPropStorage1.Save;
    end;
  finally
    FreeAndNil(Fm_AddRVD);
  end;
  SetBtnEnabled(LV_RVDList.Selected);
end;

procedure TFm_WinMount.AsyncProcess1Terminate(Sender: TObject);
var i:Integer;
begin
  for i := 0 to LV_RVDList.Items.Count-1 do begin
    SetStateIndex(LV_RVDList.Items[i]);
  end;
  SetBtnEnabled(LV_RVDList.Selected);
end;

procedure TFm_WinMount.btn_ExitClick(Sender: TObject);
begin
  Hide;
end;

procedure TFm_WinMount.btn_ModifyClick(Sender: TObject);
begin
  if not Assigned(LV_RVDList.Selected) then abort;
  unMountRC(LV_RVDList.Selected);
  AddRVDExecute(Sender);
end;

procedure TFm_WinMount.btn_AddClick(Sender: TObject);
begin
  AddRVDExecute(Sender);
end;

procedure TFm_WinMount.btn_MountClick(Sender: TObject);
begin
  //掛載
  if not RcloneFileExists then abort;
  if not Assigned(LV_RVDList.Selected) then abort;
  MountRC(LV_RVDList.Selected);
  SetBtnEnabled(LV_RVDList.Selected);
end;

procedure TFm_WinMount.btn_RemoveClick(Sender: TObject);
begin
  //移除
  if not Assigned(LV_RVDList.Selected) then abort;
  if MessageDlg('您確定要移除嗎?', mtConfirmation, [mbYes, mbNo],0,mbNo) = mrNo then
    abort;
  unMountRC(LV_RVDList.Selected);
  LV_RVDList.Items[LV_RVDList.ItemIndex].Delete;
  SetBtnEnabled(LV_RVDList.Selected);
  XMLPropStorage1.Save;
end;

procedure TFm_WinMount.btn_SetUpClick(Sender: TObject);
begin
  //設定
  Fm_Setup := TFm_Setup.Create(self);
  try
    Fm_Setup.File_rclone.Text := rcloneFile;
    Fm_Setup.dir_InitMount.Text := InitMountDIR;
    if Trim(RcloneOther)<>'' then
      Fm_Setup.mo_RcloneOther.Text:=RcloneOther;
    Fm_Setup.ck_WinAutoRun.Checked:=WinAutoRun;
    Fm_Setup.ck_RunTrayIcon.Checked:=RunTrayIcon;
    if Fm_Setup.ShowModal=mrok then begin
      rcloneFile := Fm_Setup.File_rclone.Text;
      InitMountDIR := Fm_Setup.dir_InitMount.Text;
      RcloneOther:= Fm_Setup.mo_RcloneOther.Text;
      WinAutoRun := Fm_Setup.ck_WinAutoRun.Checked;
      RunTrayIcon := Fm_Setup.ck_RunTrayIcon.Checked;
      SetAutoRun;
    end;
  finally
    FreeAndNil(Fm_Setup);
  end;
end;

procedure TFm_WinMount.btn_unMountClick(Sender: TObject);
begin
  //卸載
  if not Assigned(LV_RVDList.Selected) then abort;
  unMountRC(LV_RVDList.Selected);
  SetBtnEnabled(LV_RVDList.Selected);
end;

procedure TFm_WinMount.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
var ii:integer;
begin
   if CloseNeeded then
     CloseAction := caFree
   else begin
     ii:=QuestionDlg('警告','您確定要離開程式或隱藏視窗？',mtWarning,[mrYes,'離開',mrNo,'隱藏',mrCancel,'放棄'],0);
     if ii=mrYes then CloseAction := caFree
     else if ii=mrNo then CloseAction := caHide
     else abort;
   end;
end;

procedure TFm_WinMount.FormCreate(Sender: TObject);
var s :String;
begin
  //AppendPathDelim(GetUserDir + 'Documents');
  s:=GetAppConfigDir(False);
  ForceDirectories(s);
  XMLPropStorage1.FileName:=s+ChangeFileExt(ExtractFileName(Application.ExeName),'.xml');
  XMLPropStorage1.Active:=True;
//  XMLPropStorage1.Restore;
  Application.ProcessMessages;
  TrayIcon1.Show;
  CloseNeeded := False;
  FirstShow :=True;
end;

procedure TFm_WinMount.FormDestroy(Sender: TObject);
var i:Integer;
begin
  for i := 0 to LV_RVDList.Items.Count-1 do
    unMountRC(LV_RVDList.Items[i]);
  //XMLPropStorage1.Save;
end;

procedure TFm_WinMount.FormResize(Sender: TObject);
begin
  //if Fm_WinMount.Height>454;
  if Panel_m.Height<=310 then begin
    sb_rcMount.Height:=Fm_WinMount.Height-48-310-6-12;
    Panel_m.Height:=310;
  end;
end;

procedure TFm_WinMount.FormShow(Sender: TObject);
var i:Integer;
begin
  if FirstShow then begin
    for i := 0 to LV_RVDList.Items.Count-1 do begin
      if LV_RVDList.Items[i].SubItems[4]='1' then begin
        LV_RVDList.Items[i].Data := ItemToMountCMD(LV_RVDList.Items[i],True);     //設定成 MountCMD
        LV_RVDList.Items[i].StateIndex:=1;
      end;
    end;
    if RunTrayIcon then
      Hide;
  end;
  FirstShow:=False;
end;

procedure TFm_WinMount.FormWindowStateChange(Sender: TObject);
begin
  if WindowState=wsMinimized then begin
    Hide;
    WindowState:=wsNormal;
  end;
end;

procedure TFm_WinMount.LV_RVDListDblClick(Sender: TObject);
begin
  if (not Assigned(LV_RVDList.Selected)) or (not LV_RVDList.Selected.Selected) then abort;
  if LV_RVDList.Selected.StateIndex = 1 then
    unMountRC(LV_RVDList.Selected)
  else
    MountRC(LV_RVDList.Selected);
end;

procedure TFm_WinMount.LV_RVDListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Selected then begin
    SetStateIndex(Item);
    SetMountCMDText(Item);
  end else begin
    sb_rcMount.Text:='';
    sb_rcMount.Hint:='';
  end;
  SetBtnEnabled(Item);
end;

procedure TFm_WinMount.N_WinCloseClick(Sender: TObject);
begin
  CloseNeeded := True;
  close;
end;

procedure TFm_WinMount.N_WinShowClick(Sender: TObject);
begin
  Show;
end;

procedure TFm_WinMount.TrayIcon1Click(Sender: TObject);
begin
  if Showing then
    Hide
  else
    show;
end;

procedure TFm_WinMount.XMLPropStorage1RestoreProperties(Sender: TObject);
var St: TStringList;

  procedure StringsListToListView;
  var
    spt: TStringList;
    i, j: Integer;
    Item: TListItem;
  begin
    spt := TStringList.Create;
    try
      LV_RVDList.Clear;
      for i := 0 to St.Count-1 do begin
        spt.Clear;
        spt.StrictDelimiter:=True;
        spt.Delimiter:=#9;
        spt.DelimitedText:=St[i];

        Item := LV_RVDList.Items.Add;
        Item.StateIndex:=0;
        Item.Caption := spt[0];
        for j := 1 to spt.Count-1 do
          Item.SubItems.Add(spt[j]);
      end;
    finally
      spt.Free;
    end;
  end;
begin
  rcloneFile := XMLPropStorage1.ReadString('rcloneFile','');
  InitMountDIR := XMLPropStorage1.ReadString('InitMountDIR','');
  RcloneOther := XMLPropStorage1.ReadString('RcloneOther','');
  WinAutoRun:= XMLPropStorage1.ReadBoolean('WinAutoRun',False);
  RunTrayIcon:= XMLPropStorage1.ReadBoolean('RunTrayIcon',False);
  St := TStringList.Create;
  try
    XMLPropStorage1.ReadStrings('Items',St,Nil);
    StringsListToListView;
  finally
    st.free;
  end;
end;

procedure TFm_WinMount.XMLPropStorage1SaveProperties(Sender: TObject);
var St: TStringList;
  procedure ListViewItemToStringList;
  var
    ss: string;
    i, j: Integer;
  begin
    for i := 0 to LV_RVDList.Items.Count-1 do begin
      //ss := ''+#9;
      ss := LV_RVDList.Items[i].Caption + #9;
      for j := 0 to LV_RVDList.Items[i].SubItems.Count-1 do
        ss := ss + LV_RVDList.Items[i].SubItems[j] + #9;
      St.Add(System.Copy(ss, 1, Length(ss)-1));//remove trailing tab
    end;
   end;

begin
  XMLPropStorage1.WriteString('rcloneFile',rcloneFile);
  XMLPropStorage1.WriteString('InitMountDIR',InitMountDIR);
  XMLPropStorage1.WriteString('RcloneOther',RcloneOther);
  XMLPropStorage1.WriteBoolean('WinAutoRun',WinAutoRun);
  XMLPropStorage1.WriteBoolean('RunTrayIcon',RunTrayIcon);
  St := TStringList.Create;
  try
    ListViewItemToStringList;
    XMLPropStorage1.WriteStrings('Items',St);
  finally
    St.Free;
  end;
end;

function TFm_WinMount.ItemToMountCMD(aItem: TListItem;Execute:Boolean=False): TAsyncProcess;
var aParameters : TStrings;
begin
  aParameters := TStringList.Create;
  Result := TAsyncProcess.Create(nil);
  Result.OnTerminate:=@AsyncProcess1Terminate;
  try
    Result.Executable := rcloneFile; //rclone command line
    Result.Parameters.Add('mount');
    Result.Parameters.Add(aItem.SubItems[0]); //Remote
    Result.Parameters.Add(aItem.SubItems[1]); //Local Driver or Path
    CommandToList(aItem.SubItems[2]+' '+aItem.SubItems[3],aParameters); //其他參數
    Result.Parameters.AddStrings(aParameters);
    Result.ShowWindow := swoHIDE;
    if Execute then
      try Result.Execute; except end;
  finally
    FreeAndNil(aParameters);
  end;
end;

function TFm_WinMount.RcloneFileExists(Message:Boolean): Boolean;
begin
  Result := True;
  if not FileExists(rcloneFile) then begin
    Result := False;
    if Message then
      ShowMessage('請先設定 rclone 執行檔的資料夾位置!');
  end;
end;

procedure TFm_WinMount.MountRC(aItem: TListItem);
var vt:TAsyncProcess;
begin
  //掛載
  if not RcloneFileExists then abort;
  if not Assigned(aItem) then abort;
  if not Assigned(aItem.Data) then
    aItem.Data := ItemToMountCMD(aItem);     //設定成 MountCMD
  vt := TAsyncProcess(aItem.Data);
  try vt.Active:=True; except end;
  aItem.StateIndex:=1;
end;

procedure TFm_WinMount.unMountRC(aItem: TListItem);
var vt:TAsyncProcess;
begin
  //卸載
  if not Assigned(aItem) then abort;
  if Assigned(aItem.Data) then begin
    vt := TAsyncProcess(aItem.Data);
    try vt.Active:=False; except end;
    vt.Free;
    aItem.Data :=Nil;
    aItem.StateIndex:=0;
  end;
end;

end.

