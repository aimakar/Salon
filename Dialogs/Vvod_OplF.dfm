object Vvod_Opl: TVvod_Opl
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054#1087#1083#1072#1090#1072
  ClientHeight = 179
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 59
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 89
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 60
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object Edit1: TEdit
      Left = 128
      Top = 5
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 128
      Top = 32
      Width = 353
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 59
    Width = 500
    Height = 79
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 117
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1082' '#1086#1087#1083#1072#1090#1077' '#1074' '#1088#1091#1073'.:'
    end
    object Label4: TLabel
      Left = 256
      Top = 9
      Width = 136
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1082' '#1086#1087#1083#1072#1090#1077' '#1074' '#1073#1086#1085#1091#1089#1072#1093':'
    end
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 106
      Height = 13
      Caption = #1055#1088#1077#1076#1098#1103#1074#1083#1077#1085#1072' '#1082#1072#1088#1090#1072':'
    end
    object Label6: TLabel
      Left = 256
      Top = 48
      Width = 93
      Height = 13
      Caption = #1041#1086#1085#1091#1089#1086#1074' '#1085#1072' '#1082#1072#1088#1090#1077':'
    end
    object SpeedButton1: TSpeedButton
      Left = 458
      Top = 41
      Width = 23
      Height = 22
      Action = A_Refr
    end
    object summa1: TJvCalcEdit
      Left = 147
      Top = 6
      Width = 86
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
      DecimalPlacesAlwaysShown = False
    end
    object summa2: TJvCalcEdit
      Left = 398
      Top = 6
      Width = 83
      Height = 21
      DecimalPlaces = 0
      DisplayFormat = ',0'
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
      DecimalPlacesAlwaysShown = False
    end
    object karted: TJvCalcEdit
      Left = 147
      Top = 41
      Width = 86
      Height = 21
      DecimalPlaces = 0
      DisplayFormat = ',0'
      TabOrder = 2
      DecimalPlacesAlwaysShown = False
      OnChange = kartedChange
    end
    object BonusEd: TJvCalcEdit
      Left = 374
      Top = 41
      Width = 83
      Height = 21
      DecimalPlaces = 0
      DisplayFormat = ',0'
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      ZeroEmpty = False
      DecimalPlacesAlwaysShown = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 138
    Width = 500
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 147
      Top = 6
      Width = 86
      Height = 25
      Caption = #1053#1072#1083#1080#1095#1085#1099#1084#1080
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 274
      Top = 6
      Width = 87
      Height = 25
      Caption = #1041#1086#1085#1091#1089#1072#1084#1080
      DoubleBuffered = True
      Kind = bkAll
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 406
      Top = 6
      Width = 75
      Height = 25
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object ActionManager1: TActionManager
    Images = DataMain.ImageList2
    Left = 320
    Top = 24
    StyleName = 'Platform Default'
    object A_Refr: TAction
      ImageIndex = 6
      OnExecute = A_RefrExecute
    end
    object A_WinCr: TAction
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1082#1085#1072
      OnExecute = A_WinCrExecute
    end
  end
end
