object Fm_Setup: TFm_Setup
  Left = 348
  Height = 399
  Top = 220
  Width = 499
  BorderStyle = bsDialog
  Caption = '設定'
  ClientHeight = 399
  ClientWidth = 499
  Font.CharSet = CHINESEBIG5_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Microsoft JhengHei UI'
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  Position = poMainFormCenter
  LCLVersion = '6.4'
  object Label1: TLabel
    Left = 19
    Height = 20
    Top = 15
    Width = 131
    Caption = 'rclone 命令檔路徑'
    ParentColor = False
  end
  object File_rclone: TFileNameEdit
    Left = 19
    Height = 28
    Top = 39
    Width = 453
    FilterIndex = 0
    HideDirectories = False
    ButtonWidth = 23
    NumGlyphs = 1
    MaxLength = 0
    TabOrder = 0
  end
  object Label2: TLabel
    Left = 19
    Height = 20
    Top = 80
    Width = 176
    Caption = '雲端磁碟預設掛載的目錄'
    ParentColor = False
  end
  object dir_InitMount: TDirectoryEdit
    Left = 19
    Height = 28
    Top = 104
    Width = 453
    ShowHidden = False
    ButtonWidth = 23
    NumGlyphs = 1
    MaxLength = 0
    TabOrder = 1
  end
  object BtnOK: TBitBtn
    Left = 200
    Height = 30
    Top = 351
    Width = 75
    Caption = '&確定'
    Default = True
    Kind = bkOK
    ModalResult = 1
    TabOrder = 2
  end
  object ck_WinAutoRun: TCheckBox
    Left = 19
    Height = 24
    Top = 288
    Width = 217
    Caption = '在Windows啟動時自動執行'
    TabOrder = 3
  end
  object ck_RunTrayIcon: TCheckBox
    Left = 19
    Height = 24
    Top = 315
    Width = 212
    Caption = '程式啟動後縮小至系統圖示'
    TabOrder = 4
  end
  object Label3: TLabel
    Left = 19
    Height = 20
    Top = 148
    Width = 163
    Caption = 'rclone 執行時預設參數'
    ParentColor = False
  end
  object mo_RcloneOther: TMemo
    Left = 19
    Height = 107
    Top = 173
    Width = 451
    Lines.Strings = (
      '--allow-other'
      '--allow-root'
      '--allow-non-empty'
      '--write-back-cache'
    )
    TabOrder = 5
  end
end
