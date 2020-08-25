object Fm_AddRVD: TFm_AddRVD
  Left = 460
  Height = 727
  Top = 266
  Width = 685
  BorderStyle = bsDialog
  Caption = '新建虛擬磁碟'
  ClientHeight = 727
  ClientWidth = 685
  DesignTimePPI = 120
  Font.CharSet = CHINESEBIG5_CHARSET
  Font.Color = clBlack
  Font.Height = -20
  Font.Name = 'Microsoft JhengHei UI'
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  Position = poMainFormCenter
  LCLVersion = '6.9'
  object Label1: TLabel
    Left = 11
    Height = 33
    Top = 16
    Width = 215
    Caption = '遠端虛擬磁碟設置:'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -26
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 11
    Height = 25
    Top = 135
    Width = 152
    Caption = 'Rclone Remotes'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object ed_RemotePath: TEdit
    Left = 10
    Height = 33
    Top = 232
    Width = 349
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 3
    Text = '/'
  end
  object dir_MountPath: TDirectoryEdit
    Left = 11
    Height = 33
    Top = 360
    Width = 659
    ShowHidden = False
    ButtonWidth = 29
    NumGlyphs = 1
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    MaxLength = 0
    ParentFont = False
    TabOrder = 5
  end
  object Label3: TLabel
    Left = 11
    Height = 25
    Top = 335
    Width = 180
    Caption = '掛載磁碟資料夾位置'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 11
    Height = 25
    Top = 298
    Width = 140
    Caption = '掛載磁碟代號：'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object cb_LocalDrv: TComboBox
    Left = 159
    Height = 33
    Top = 292
    Width = 291
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ItemHeight = 25
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
    Left = 192
    Height = 38
    Top = 682
    Width = 94
    Caption = '確定'
    Default = True
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Kind = bkOK
    OnClick = btn_OKClick
    ParentFont = False
    TabOrder = 9
  end
  object cb_CacheMode: TComboBox
    Left = 11
    Height = 33
    Top = 468
    Width = 326
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ItemHeight = 25
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
    Left = 14
    Height = 25
    Top = 511
    Width = 80
    Caption = '其他參數'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object mo_RcloneOther: TMemo
    Left = 10
    Height = 125
    Top = 541
    Width = 660
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 8
  end
  object btn_Cancel: TBitBtn
    Left = 346
    Height = 38
    Top = 682
    Width = 94
    Cancel = True
    Caption = '取消'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Kind = bkCancel
    ModalResult = 2
    ParentFont = False
    TabOrder = 10
  end
  object ck_AutoMount: TCheckBox
    Left = 470
    Height = 29
    Top = 90
    Width = 164
    Caption = '啟動時自動掛載'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 1
  end
  object btn_Config: TSpeedButton
    Left = 488
    Height = 33
    Top = 161
    Width = 81
    Caption = 'Config'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    OnClick = btn_ConfigClick
    ParentFont = False
  end
  object cb_rcRemote: TECComboBtn
    Left = 11
    Height = 33
    Top = 161
    Width = 419
    Button.Width = 50
    Button.GlyphDesign = egdArrsB_UU
    Button.OnClick = ECCSpeedBtnClick
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ItemHeight = 25
    ParentFont = False
    Style = csDropDownList
    TabOrder = 2
  end
  object Label6: TLabel
    Left = 9
    Height = 25
    Top = 208
    Width = 100
    Caption = '遠端資料夾'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 14
    Height = 25
    Top = 65
    Width = 80
    Caption = '標籤名稱'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object ed_RVDName: TEdit
    Left = 14
    Height = 33
    Top = 90
    Width = 286
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 0
  end
  object Label8: TLabel
    Left = 9
    Height = 25
    Top = 410
    Width = 160
    Caption = '虛擬資料夾名稱：'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object ed_MountName: TEdit
    Left = 170
    Height = 33
    Top = 406
    Width = 280
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    OnEnter = ed_MountNameEnter
    ParentFont = False
    TabOrder = 6
  end
  object btn_wgui: TSpeedButton
    Left = 576
    Height = 33
    Top = 161
    Width = 103
    Caption = 'Web GUI'
    Font.CharSet = CHINESEBIG5_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    OnClick = btn_wguiClick
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 366
    Height = 28
    Top = 235
    Width = 29
  end
end
