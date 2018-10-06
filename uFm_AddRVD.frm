object Fm_AddRVD: TFm_AddRVD
  Left = 348
  Height = 541
  Top = 220
  Width = 556
  BorderStyle = bsDialog
  Caption = '新建虛擬磁碟'
  ClientHeight = 541
  ClientWidth = 556
  Font.CharSet = CHINESEBIG5_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Microsoft JhengHei UI'
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
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
    Width = 263
    Caption = 'rclone 雲名稱(MyRemoteDrv:/path)'
    ParentColor = False
  end
  object ed_RemotePath: TEdit
    Left = 9
    Height = 28
    Top = 75
    Width = 495
    TabOrder = 0
  end
  object dir_MountPath: TDirectoryEdit
    Left = 9
    Height = 28
    Top = 210
    Width = 527
    ShowHidden = False
    ButtonWidth = 23
    NumGlyphs = 1
    MaxLength = 0
    TabOrder = 2
  end
  object Label3: TLabel
    Left = 9
    Height = 20
    Top = 189
    Width = 160
    Caption = '本地虛擬磁碟掛載目錄'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 9
    Height = 20
    Top = 119
    Width = 160
    Caption = '本地虛擬磁碟掛載代號'
    ParentColor = False
  end
  object cb_LocalDrv: TComboBox
    Left = 9
    Height = 28
    Top = 144
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
    TabOrder = 1
    Text = '不使用'
  end
  object btn_OK: TBitBtn
    Left = 154
    Height = 30
    Top = 488
    Width = 75
    Caption = '確定'
    Default = True
    Kind = bkOK
    OnClick = btn_OKClick
    TabOrder = 8
  end
  object ck_AllowOther: TCheckBox
    Left = 9
    Height = 24
    Top = 293
    Width = 121
    Caption = '--allow-other'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object ck_AllowNonEmpty: TCheckBox
    Left = 297
    Height = 24
    Top = 293
    Width = 165
    Caption = '--allow-non-empty'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object cb_CacheMode: TComboBox
    Left = 9
    Height = 28
    Top = 256
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
    TabOrder = 3
    Text = '--vfs-cache-mode writes'
  end
  object ck_AllowRoot: TCheckBox
    Left = 154
    Height = 24
    Top = 293
    Width = 112
    Caption = '--allow-root'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object Label5: TLabel
    Left = 9
    Height = 20
    Top = 332
    Width = 64
    Caption = '其他參數'
    ParentColor = False
  end
  object Memo_Other: TMemo
    Left = 8
    Height = 75
    Top = 357
    Width = 528
    TabOrder = 7
  end
  object btn_Cancel: TBitBtn
    Left = 277
    Height = 30
    Top = 488
    Width = 75
    Cancel = True
    Caption = '取消'
    Kind = bkCancel
    ModalResult = 2
    TabOrder = 9
  end
  object ck_AutoMount: TCheckBox
    Left = 11
    Height = 24
    Top = 442
    Width = 132
    Caption = '啟動時自動掛載'
    TabOrder = 10
  end
  object SpeedButton1: TSpeedButton
    Left = 286
    Height = 33
    Top = 11
    Width = 105
    Caption = 'rc config'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 399
    Height = 33
    Top = 11
    Width = 105
    Caption = 'rc Remotes'
    OnClick = SpeedButton2Click
  end
end
