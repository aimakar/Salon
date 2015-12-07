object Spr_Rekv: TSpr_Rekv
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074
  ClientHeight = 301
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 260
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label2: TLabel
      Left = 8
      Top = 36
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    object Label9: TLabel
      Left = 8
      Top = 64
      Width = 52
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085#1099
    end
    object Label3: TLabel
      Left = 8
      Top = 90
      Width = 73
      Height = 13
      Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    end
    object Label10: TLabel
      Left = 8
      Top = 114
      Width = 46
      Height = 13
      Caption = #1043#1083#1072#1074'.'#1073#1091#1093
    end
    object DBEdit1: TDBEdit
      Left = 96
      Top = 5
      Width = 586
      Height = 21
      DataField = 'NAIM'
      DataSource = DataMain.RekvDS
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 32
      Width = 586
      Height = 21
      DataField = 'ADDRESS'
      DataSource = DataMain.RekvDS
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 96
      Top = 59
      Width = 586
      Height = 21
      DataField = 'TEL'
      DataSource = DataMain.RekvDS
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 149
      Width = 699
      Height = 110
      Align = alBottom
      Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
      TabOrder = 5
      object Label13: TLabel
        Left = 24
        Top = 32
        Width = 48
        Height = 13
        Caption = #1051#1080#1094#1077#1085#1079#1080#1103
      end
      object Label8: TLabel
        Left = 24
        Top = 56
        Width = 21
        Height = 13
        Caption = #1048#1053#1053
      end
      object Label12: TLabel
        Left = 232
        Top = 56
        Width = 21
        Height = 13
        Caption = #1050#1055#1055
      end
      object Label4: TLabel
        Left = 488
        Top = 32
        Width = 21
        Height = 13
        Caption = #1056'/'#1089#1095
      end
      object Label7: TLabel
        Left = 472
        Top = 56
        Width = 40
        Height = 13
        Caption = #1050#1086#1088#1088'/'#1089#1095
      end
      object Label5: TLabel
        Left = 24
        Top = 80
        Width = 39
        Height = 13
        Caption = #1074' '#1041#1072#1085#1082#1077
      end
      object Label6: TLabel
        Left = 476
        Top = 78
        Width = 20
        Height = 13
        Caption = #1041#1048#1050
      end
      object DBEdit12: TDBEdit
        Left = 88
        Top = 24
        Width = 377
        Height = 21
        DataField = 'LIC'
        DataSource = DataMain.RekvDS
        TabOrder = 0
      end
      object DBEdit9: TDBEdit
        Left = 56
        Top = 48
        Width = 169
        Height = 21
        AutoSize = False
        DataField = 'INN'
        DataSource = DataMain.RekvDS
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 264
        Top = 48
        Width = 201
        Height = 21
        DataField = 'KPP'
        DataSource = DataMain.RekvDS
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 520
        Top = 24
        Width = 161
        Height = 21
        DataField = 'RS'
        DataSource = DataMain.RekvDS
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 520
        Top = 48
        Width = 161
        Height = 21
        DataField = 'KS'
        DataSource = DataMain.RekvDS
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 72
        Top = 72
        Width = 377
        Height = 21
        DataField = 'BANK'
        DataSource = DataMain.RekvDS
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 520
        Top = 75
        Width = 121
        Height = 21
        AutoSize = False
        DataField = 'BIK'
        DataSource = DataMain.RekvDS
        TabOrder = 6
      end
    end
    object DBEdit3: TDBEdit
      Left = 96
      Top = 86
      Width = 586
      Height = 21
      DataField = 'RUK'
      DataSource = DataMain.RekvDS
      TabOrder = 3
    end
    object DBEdit11: TDBEdit
      Left = 96
      Top = 113
      Width = 586
      Height = 21
      DataField = 'GLBUCH'
      DataSource = DataMain.RekvDS
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 260
    Width = 701
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 512
      Top = 5
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 607
      Top = 5
      Width = 75
      Height = 25
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object ActionManager1: TActionManager
    Images = DataMain.ImageList2
    Left = 376
    Top = 232
    StyleName = 'XP Style'
    object A_WinCr: TAction
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1082#1085#1072
      OnExecute = A_WinCrExecute
    end
    object A_Save: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
      OnExecute = A_SaveExecute
    end
  end
end
