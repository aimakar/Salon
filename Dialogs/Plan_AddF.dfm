object Plan_Add: TPlan_Add
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1089#1086#1073#1099#1090#1080#1103
  ClientHeight = 469
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 428
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 37
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object Label2: TLabel
      Left = 25
      Top = 125
      Width = 68
      Height = 13
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
    end
    object Label3: TLabel
      Left = 25
      Top = 171
      Width = 196
      Height = 13
      Caption = #1054#1088#1080#1077#1085#1090#1080#1088#1086#1074#1086#1095#1085#1072#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' ('#1084#1080#1085')'
    end
    object Label4: TLabel
      Left = 25
      Top = 264
      Width = 67
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Label6: TLabel
      Left = 24
      Top = 62
      Width = 37
      Height = 13
      Caption = #1052#1072#1089#1090#1077#1088
    end
    object JCE: TJvComboEdit
      Left = 24
      Top = 27
      Width = 369
      Height = 21
      DirectInput = False
      Glyph.Data = {
        4E000000424D4E000000000000003E000000280000000F000000040000000100
        010000000000100000000000000000000000020000000200000000000000FFFF
        FF00FFFE00009CE600009CE60000FFFE0000}
      TabOrder = 0
      OnButtonClick = JCEButtonClick
    end
    object JvDateEdit1: TJvDateEdit
      Left = 56
      Top = 144
      Width = 129
      Height = 21
      DefaultToday = True
      ShowNullDate = False
      TabOrder = 1
    end
    object TE_S: TJvTimeEdit
      Left = 211
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object TE_d: TJvTimeEdit
      Left = 144
      Top = 190
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 24
      Top = 283
      Width = 369
      Height = 21
      TabOrder = 4
    end
    object RadioGroup1: TRadioGroup
      Left = 24
      Top = 217
      Width = 369
      Height = 41
      Caption = #1058#1080#1087' '#1089#1086#1073#1099#1090#1080#1103
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1055#1086#1089#1077#1097#1077#1085#1080#1077
        #1047#1074#1086#1085#1086#1082)
      TabOrder = 5
      OnEnter = RadioGroup1Enter
      OnExit = RadioGroup1Exit
    end
    object JCEM: TJvComboEdit
      Left = 24
      Top = 81
      Width = 369
      Height = 21
      Glyph.Data = {
        4E000000424D4E000000000000003E000000280000000F000000040000000100
        010000000000100000000000000000000000020000000200000000000000FFFF
        FF00FFFE00009CE600009CE60000FFFE0000}
      TabOrder = 6
      OnButtonClick = JCEMButtonClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 428
    Width = 422
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 237
      Top = 6
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
      Left = 318
      Top = 6
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
    Left = 352
    Top = 160
    StyleName = 'XP Style'
    object A_WinCr: TAction
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1082#1085#1072
      OnExecute = A_WinCrExecute
    end
    object A_Save: TAction
      Caption = #1047#1072#1087#1080#1089#1100
      OnExecute = A_SaveExecute
    end
  end
  object Query1_: TQuery
    DatabaseName = 'Sklad'
    SQL.Strings = (
      'select p.naim, p.tel, m.naim as naimm, o.*'
      'from outlook o '
      'left join predpr p on  o.code_pr = p.code_pr'
      'left join master m on o.code_mast = m.code_mast'
      'where o.id = :id'
      '')
    Left = 232
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Query2_: TQuery
    DatabaseName = 'Sklad'
    SQL.Strings = (
      'select * from predpr where code_pr = :code_pr')
    Left = 288
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'code_pr'
        ParamType = ptUnknown
      end>
  end
  object Table1_: TTable
    DatabaseName = 'Sklad'
    TableName = 'outlook.dbf'
    TableType = ttDBase
    Left = 184
    Top = 320
    object Table1_CODE_PR: TFloatField
      FieldName = 'CODE_PR'
    end
    object Table1_OT: TDateField
      FieldName = 'OT'
    end
    object Table1_TM_S: TStringField
      FieldName = 'TM_S'
      Size = 5
    end
    object Table1_TM_E: TStringField
      FieldName = 'TM_E'
      Size = 5
    end
    object Table1_TYPE_: TSmallintField
      FieldName = 'TYPE_'
    end
    object Table1_COMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 150
    end
    object Table1_PRIZ: TSmallintField
      FieldName = 'PRIZ'
    end
    object Table1_ID_NAKL: TFloatField
      FieldName = 'ID_NAKL'
    end
    object Table1_ID: TFloatField
      FieldName = 'ID'
    end
    object Table1_CODE_MAST: TFloatField
      FieldName = 'CODE_MAST'
    end
  end
  object Table1: TIBTable
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    FieldDefs = <
      item
        Name = 'TM_S'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'TM_E'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'CODE_PR'
        DataType = ftInteger
      end
      item
        Name = 'TYPE_'
        DataType = ftSmallint
      end
      item
        Name = 'PRIZ'
        DataType = ftSmallint
      end
      item
        Name = 'ID_NAKL'
        DataType = ftInteger
      end
      item
        Name = 'OT'
        DataType = ftDate
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'CODE_MAST'
        DataType = ftInteger
      end
      item
        Name = 'COMMENT'
        DataType = ftWideString
        Size = 600
      end>
    IndexDefs = <
      item
        Name = 'ID'
        Fields = 'ID'
      end
      item
        Name = 'ID_NAKL'
        Fields = 'ID_NAKL'
      end
      item
        Name = 'CODE_PR3'
        Fields = 'CODE_PR'
      end>
    StoreDefs = True
    TableName = 'OUTLOOK'
    Left = 184
    Top = 368
    object Table1TM_S: TIBStringField
      FieldName = 'TM_S'
      Origin = '"OUTLOOK"."TM_S"'
    end
    object Table1TM_E: TIBStringField
      FieldName = 'TM_E'
      Origin = '"OUTLOOK"."TM_E"'
    end
    object Table1CODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"OUTLOOK"."CODE_PR"'
    end
    object Table1TYPE_: TSmallintField
      FieldName = 'TYPE_'
      Origin = '"OUTLOOK"."TYPE_"'
    end
    object Table1PRIZ: TSmallintField
      FieldName = 'PRIZ'
      Origin = '"OUTLOOK"."PRIZ"'
    end
    object Table1ID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Origin = '"OUTLOOK"."ID_NAKL"'
    end
    object Table1OT: TDateField
      FieldName = 'OT'
      Origin = '"OUTLOOK"."OT"'
    end
    object Table1ID: TIntegerField
      FieldName = 'ID'
      Origin = '"OUTLOOK"."ID"'
    end
    object Table1CODE_MAST: TIntegerField
      FieldName = 'CODE_MAST'
      Origin = '"OUTLOOK"."CODE_MAST"'
    end
    object Table1COMMENT: TIBStringField
      FieldName = 'COMMENT'
      Origin = '"OUTLOOK"."COMMENT"'
      Size = 600
    end
  end
  object Query1: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'select p.naim, p.tel, m.naim as naimm, o.*'
      'from outlook o '
      'left join predpr p on  o.code_pr = p.code_pr'
      'left join master m on o.code_mast = m.code_mast'
      'where o.id = :id')
    Left = 232
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Query2: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'select * from predpr where code_pr = :code_pr')
    Left = 288
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'code_pr'
        ParamType = ptUnknown
      end>
  end
end
