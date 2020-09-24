object Fm_AddRVD: TFm_AddRVD
  Left = 417
  Height = 582
  Top = 225
  Width = 548
  BorderStyle = bsDialog
  Caption = '新建虛擬磁碟'
  ClientHeight = 582
  ClientWidth = 548
  Font.CharSet = CHINESEBIG5_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Microsoft JhengHei UI'
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '7.1'
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
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object ed_RemotePath: TEdit
    Left = 8
    Height = 28
    Top = 186
    Width = 279
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
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
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    MaxLength = 0
    ParentFont = False
    TabOrder = 5
  end
  object Label3: TLabel
    Left = 9
    Height = 20
    Top = 268
    Width = 144
    Caption = '掛載磁碟資料夾位置'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 9
    Height = 20
    Top = 238
    Width = 112
    Caption = '掛載磁碟代號：'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object cb_LocalDrv: TComboBox
    Left = 127
    Height = 28
    Top = 234
    Width = 233
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
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
    ParentFont = False
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
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Kind = bkOK
    OnClick = btn_OKClick
    ParentFont = False
    TabOrder = 9
  end
  object cb_CacheMode: TComboBox
    Left = 9
    Height = 28
    Top = 374
    Width = 261
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ItemHeight = 20
    ItemIndex = 2
    Items.Strings = (
      '--vfs-cache-mode off'
      '--vfs-cache-mode minimal'
      '--vfs-cache-mode writes'
      '--vfs-cache-mode full'
    )
    ParentFont = False
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
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object mo_RcloneOther: TMemo
    Left = 8
    Height = 100
    Top = 433
    Width = 528
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 8
  end
  object btn_Cancel: TBitBtn
    Left = 277
    Height = 30
    Top = 546
    Width = 75
    Cancel = True
    Caption = '取消'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Kind = bkCancel
    ModalResult = 2
    ParentFont = False
    TabOrder = 10
  end
  object ck_AutoMount: TCheckBox
    Left = 376
    Height = 24
    Top = 72
    Width = 134
    Caption = '啟動時自動掛載'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 1
  end
  object btn_Config: TSpeedButton
    Left = 390
    Height = 26
    Top = 129
    Width = 65
    Caption = 'Config'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    OnClick = btn_ConfigClick
    ParentFont = False
  end
  object cb_rcRemote: TECComboBtn
    Left = 9
    Height = 28
    Top = 129
    Width = 335
    Button.Width = 40
    Button.GlyphDesign = egdArrsB_UU
    Button.OnClick = ECCSpeedBtnClick
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ItemHeight = 20
    ParentFont = False
    Style = csDropDownList
    TabOrder = 2
  end
  object Label6: TLabel
    Left = 7
    Height = 20
    Top = 166
    Width = 80
    Caption = '遠端資料夾'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 11
    Height = 20
    Top = 52
    Width = 64
    Caption = '標籤名稱'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object ed_RVDName: TEdit
    Left = 11
    Height = 28
    Top = 72
    Width = 229
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 0
  end
  object Label8: TLabel
    Left = 7
    Height = 20
    Top = 328
    Width = 128
    Caption = '虛擬資料夾名稱：'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object ed_MountName: TEdit
    Left = 136
    Height = 28
    Top = 325
    Width = 224
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    OnEnter = ed_MountNameEnter
    ParentFont = False
    TabOrder = 6
  end
  object btn_wgui: TSpeedButton
    Left = 461
    Height = 26
    Top = 129
    Width = 82
    Caption = 'Web GUI'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    OnClick = btn_wguiClick
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 293
    Height = 22
    Top = 188
    Width = 23
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
  end
end
