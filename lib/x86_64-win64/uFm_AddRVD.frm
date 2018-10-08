object Fm_AddRVD: TFm_AddRVD
  Left = 86
  Height = 589
  Top = 86
  Width = 556
  BorderStyle = bsDialog
  Caption = '新建虛擬磁碟'
  ClientHeight = 589
  ClientWidth = 556
  Font.CharSet = CHINESEBIG5_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Microsoft JhengHei UI'
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnShow = FormShow
  Position = poMainFormCenter
  LCLVersion = '6.4'
  object Label1: TLabel
    Left = 9
    Height = 20
    Top = 13
    Width = 132
    Caption = '新建虛擬磁碟設置:'
    ParentColor = False
  end
  object Label2: TLabel
    Left = 9
    Height = 20
    Top = 51
    Width = 117
    Caption = 'rclone Remotes'
    ParentColor = False
  end
  object ed_RemotePath: TEdit
    Left = 8
    Height = 28
    Top = 136
    Width = 279
    TabOrder = 1
    Text = '/'
  end
  object dir_MountPath: TDirectoryEdit
    Left = 9
    Height = 28
    Top = 264
    Width = 527
    ShowHidden = False
    ButtonWidth = 23
    NumGlyphs = 1
    MaxLength = 0
    TabOrder = 3
    OnEnter = dir_MountPathEnter
  end
  object Label3: TLabel
    Left = 9
    Height = 20
    Top = 243
    Width = 160
    Caption = '本地虛擬磁碟掛載目錄'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 9
    Height = 20
    Top = 173
    Width = 160
    Caption = '本地虛擬磁碟掛載代號'
    ParentColor = False
  end
  object cb_LocalDrv: TComboBox
    Left = 9
    Height = 28
    Top = 198
    Width = 81
    ItemHeight = 20
    ItemIndex = 0
    Items.Strings = (
      '不使用'
      'D:'
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
    TabOrder = 2
    Text = '不使用'
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
  object ck_AllowOther: TCheckBox
    Left = 9
    Height = 24
    Top = 347
    Width = 121
    Caption = '--allow-other'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object ck_AllowNonEmpty: TCheckBox
    Left = 297
    Height = 24
    Top = 347
    Width = 165
    Caption = '--allow-non-empty'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object cb_CacheMode: TComboBox
    Left = 9
    Height = 28
    Top = 310
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
    TabOrder = 4
    Text = '--vfs-cache-mode writes'
  end
  object ck_AllowRoot: TCheckBox
    Left = 154
    Height = 24
    Top = 347
    Width = 112
    Caption = '--allow-root'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object Label5: TLabel
    Left = 9
    Height = 20
    Top = 386
    Width = 64
    Caption = '其他參數'
    ParentColor = False
  end
  object Memo_Other: TMemo
    Left = 8
    Height = 75
    Top = 411
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
    Left = 11
    Height = 24
    Top = 496
    Width = 132
    Caption = '啟動時自動掛載'
    TabOrder = 11
  end
  object SpeedButton1: TSpeedButton
    Left = 403
    Height = 33
    Top = 74
    Width = 105
    Caption = 'rc config'
    OnClick = SpeedButton1Click
  end
  object cb_rcRemote: TECComboBtn
    Left = 9
    Height = 28
    Top = 76
    Width = 335
    Button.Width = 40
    Button.GlyphDesign = egdArrsB_UU
    Button.OnClick = ECCSpeedBtnClick
    ItemHeight = 20
    Style = csDropDownList
    TabOrder = 0
  end
  object Label6: TLabel
    Left = 7
    Height = 20
    Top = 113
    Width = 80
    Caption = '遠端資料夾'
    ParentColor = False
  end
end
