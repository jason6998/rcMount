object Fm_AddRVD: TFm_AddRVD
  Left = 348
  Height = 589
  Top = 220
  Width = 548
  BorderStyle = bsDialog
  Caption = '新建虛擬磁碟'
  ClientHeight = 589
  ClientWidth = 548
  Font.CharSet = CHINESEBIG5_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Microsoft JhengHei UI'
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '6.4'
  object Label1: TLabel
    Left = 9
    Height = 26
    Top = 13
    Width = 173
    Caption = '遠端虛擬磁碟設置:'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Height = 20
    Top = 108
    Width = 121
    Caption = 'Rclone Remotes'
    ParentColor = False
  end
  object ed_RemotePath: TEdit
    Left = 8
    Height = 28
    Top = 186
    Width = 279
    TabOrder = 3
    Text = '/'
  end
  object dir_MountPath: TDirectoryEdit
    Left = 9
    Height = 28
    Top = 288
    Width = 527
    ShowHidden = False
    ButtonWidth = 23
    NumGlyphs = 1
    MaxLength = 0
    TabOrder = 5
  end
  object Label3: TLabel
    Left = 9
    Height = 20
    Top = 268
    Width = 144
    Caption = '掛載磁碟資料夾位置'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 9
    Height = 20
    Top = 238
    Width = 112
    Caption = '掛載磁碟代號：'
    ParentColor = False
  end
  object cb_LocalDrv: TComboBox
    Left = 127
    Height = 28
    Top = 234
    Width = 233
    ItemHeight = 20
    ItemIndex = 0
    Items.Strings = (
      '不使用，請掛載成虛擬資料夾'
      'E:'
      'F:'
      'G:'
      'H:'
      'I:'
      'J:'
      'K:'
      'L:'
      'M:'
      'N:'
      'O:'
      'P:'
      'Q:'
      'R:'
      'S:'
      'T:'
      'U:'
      'V:'
      'X:'
      'Y:'
      'Z:'
    )
    Style = csDropDownList
    TabOrder = 4
    Text = '不使用，請掛載成虛擬資料夾'
  end
  object btn_OK: TBitBtn
    Left = 154
    Height = 30
    Top = 546
    Width = 75
    Caption = '確定'
    Default = True
    Kind = bkOK
    OnClick = btn_OKClick
    TabOrder = 9
  end
  object cb_CacheMode: TComboBox
    Left = 9
    Height = 28
    Top = 374
    Width = 261
    ItemHeight = 20
    ItemIndex = 2
    Items.Strings = (
      '--vfs-cache-mode off'
      '--vfs-cache-mode minimal'
      '--vfs-cache-mode writes'
      '--vfs-cache-mode full'
    )
    Style = csDropDownList
    TabOrder = 7
    Text = '--vfs-cache-mode writes'
  end
  object Label5: TLabel
    Left = 11
    Height = 20
    Top = 409
    Width = 64
    Caption = '其他參數'
    ParentColor = False
  end
  object mo_RcloneOther: TMemo
    Left = 8
    Height = 100
    Top = 433
    Width = 528
    TabOrder = 8
  end
  object btn_Cancel: TBitBtn
    Left = 277
    Height = 30
    Top = 546
    Width = 75
    Cancel = True
    Caption = '取消'
    Kind = bkCancel
    ModalResult = 2
    TabOrder = 10
  end
  object ck_AutoMount: TCheckBox
    Left = 376
    Height = 24
    Top = 72
    Width = 132
    Caption = '啟動時自動掛載'
    TabOrder = 1
  end
  object SpeedButton1: TSpeedButton
    Left = 403
    Height = 33
    Top = 127
    Width = 105
    Caption = 'rc config'
    OnClick = SpeedButton1Click
  end
  object cb_rcRemote: TECComboBtn
    Left = 9
    Height = 28
    Top = 129
    Width = 335
    Button.Width = 40
    Button.GlyphDesign = egdArrsB_UU
    Button.OnClick = ECCSpeedBtnClick
    ItemHeight = 20
    Style = csDropDownList
    TabOrder = 2
  end
  object Label6: TLabel
    Left = 7
    Height = 20
    Top = 166
    Width = 80
    Caption = '遠端資料夾'
    ParentColor = False
  end
  object Label7: TLabel
    Left = 11
    Height = 20
    Top = 52
    Width = 64
    Caption = '標籤名稱'
    ParentColor = False
  end
  object ed_RVDName: TEdit
    Left = 11
    Height = 28
    Top = 72
    Width = 229
    TabOrder = 0
  end
  object Label8: TLabel
    Left = 7
    Height = 20
    Top = 328
    Width = 128
    Caption = '虛擬資料夾名稱：'
    ParentColor = False
  end
  object ed_MountName: TEdit
    Left = 136
    Height = 28
    Top = 325
    Width = 224
    OnEnter = ed_MountNameEnter
    TabOrder = 6
  end
end
