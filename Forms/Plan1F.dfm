object Plan1: TPlan1
  Left = 0
  Top = 0
  HelpContext = 18
  Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082
  ClientHeight = 661
  ClientWidth = 1050
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 1050
    Height = 26
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object TFD: TJvTFDays
    Left = 0
    Top = 26
    Width = 1050
    Height = 635
    ScheduleManager = TFS
    ColHdrHeight = 30
    Cols = <
      item
        SchedDate = 41984.000000000000000000
        SchedName = #1055#1088#1080#1084#1077#1088
        Title = #1055#1088#1080#1084#1077#1088' - 11.12.2014'
        Width = 996
      end>
    MinRowHeight = 20
    Options = [agoSizeCols, agoSizeRows, agoSizeColHdr, agoSizeRowHdr, agoSizeAppt, agoMoveAppt, agoShowPics, agoShowText, agoShowApptHints, agoShowSelHint, agoEnforceMaxColWidth, agoQuickEntry]
    RowHeight = 20
    Template.CompDate = 41984.000000000000000000
    Template.LinearDayCount = 1
    Template.LinearEndDate = 41984.000000000000000000
    Template.LinearStartDate = 41984.000000000000000000
    Grouping = grNone
    GridStartTime = 0.333333333333333300
    GridEndTime = 0.958333333333333400
    TimeBlocks = <>
    TimeBlockProps.BlockHdrAttr.Font.Charset = DEFAULT_CHARSET
    TimeBlockProps.BlockHdrAttr.Font.Color = clWindowText
    TimeBlockProps.BlockHdrAttr.Font.Height = -11
    TimeBlockProps.BlockHdrAttr.Font.Name = 'Tahoma'
    TimeBlockProps.BlockHdrAttr.Font.Style = []
    TimeBlockProps.BlockHdrAttr.ParentFont = False
    TimeBlockProps.BlockHdrAttr.FrameColor = clBlack
    TimeBlockProps.SelBlockHdrAttr.Font.Charset = DEFAULT_CHARSET
    TimeBlockProps.SelBlockHdrAttr.Font.Color = clBlack
    TimeBlockProps.SelBlockHdrAttr.Font.Height = -11
    TimeBlockProps.SelBlockHdrAttr.Font.Name = 'Tahoma'
    TimeBlockProps.SelBlockHdrAttr.Font.Style = []
    TimeBlockProps.SelBlockHdrAttr.ParentFont = False
    TimeBlockProps.SelBlockHdrAttr.FrameColor = clBlack
    ApptAttr.Color = clWhite
    ApptAttr.Font.Charset = DEFAULT_CHARSET
    ApptAttr.Font.Color = clWindowText
    ApptAttr.Font.Height = -11
    ApptAttr.Font.Name = 'Tahoma'
    ApptAttr.Font.Style = []
    SelApptAttr.Color = clWhite
    SelApptAttr.Font.Charset = DEFAULT_CHARSET
    SelApptAttr.Font.Color = clWindowText
    SelApptAttr.Font.Height = -11
    SelApptAttr.Font.Name = 'Tahoma'
    SelApptAttr.Font.Style = []
    HdrAttr.Font.Charset = DEFAULT_CHARSET
    HdrAttr.Font.Color = clWindowText
    HdrAttr.Font.Height = -11
    HdrAttr.Font.Name = 'Tahoma'
    HdrAttr.Font.Style = []
    HdrAttr.FrameColor = clBlack
    SelHdrAttr.Font.Charset = DEFAULT_CHARSET
    SelHdrAttr.Font.Color = clBlack
    SelHdrAttr.Font.Height = -11
    SelHdrAttr.Font.Name = 'Tahoma'
    SelHdrAttr.Font.Style = []
    SelHdrAttr.ParentFont = False
    SelHdrAttr.FrameColor = clBlack
    FancyRowHdrAttr.Hr2400 = True
    FancyRowHdrAttr.MinorFont.Charset = DEFAULT_CHARSET
    FancyRowHdrAttr.MinorFont.Color = clWindowText
    FancyRowHdrAttr.MinorFont.Height = -11
    FancyRowHdrAttr.MinorFont.Name = 'Tahoma'
    FancyRowHdrAttr.MinorFont.Style = []
    FancyRowHdrAttr.MajorFont.Charset = DEFAULT_CHARSET
    FancyRowHdrAttr.MajorFont.Color = clWindowText
    FancyRowHdrAttr.MajorFont.Height = -21
    FancyRowHdrAttr.MajorFont.Name = 'Tahoma'
    FancyRowHdrAttr.MajorFont.Style = []
    SelFancyRowHdrAttr.Hr2400 = False
    SelFancyRowHdrAttr.MinorFont.Charset = DEFAULT_CHARSET
    SelFancyRowHdrAttr.MinorFont.Color = clBlack
    SelFancyRowHdrAttr.MinorFont.Height = -11
    SelFancyRowHdrAttr.MinorFont.Name = 'Tahoma'
    SelFancyRowHdrAttr.MinorFont.Style = []
    SelFancyRowHdrAttr.MajorFont.Charset = DEFAULT_CHARSET
    SelFancyRowHdrAttr.MajorFont.Color = clBlack
    SelFancyRowHdrAttr.MajorFont.Height = -21
    SelFancyRowHdrAttr.MajorFont.Name = 'Tahoma'
    SelFancyRowHdrAttr.MajorFont.Style = []
    SelFancyRowHdrAttr.TickColor = clBlack
    PrimeTime.StartTime = 0.333333333333333300
    PrimeTime.EndTime = 0.958333333333333400
    PrimeTime.Color = clSilver
    RowHdrType = rhGrid
    GroupHdrAttr.Font.Charset = DEFAULT_CHARSET
    GroupHdrAttr.Font.Color = clWindowText
    GroupHdrAttr.Font.Height = -11
    GroupHdrAttr.Font.Name = 'Tahoma'
    GroupHdrAttr.Font.Style = []
    GroupHdrAttr.ParentFont = False
    GroupHdrAttr.FrameColor = clBlack
    SelGroupHdrAttr.Font.Charset = DEFAULT_CHARSET
    SelGroupHdrAttr.Font.Color = clBlack
    SelGroupHdrAttr.Font.Height = -11
    SelGroupHdrAttr.Font.Name = 'Tahoma'
    SelGroupHdrAttr.Font.Style = []
    SelGroupHdrAttr.ParentFont = False
    SelGroupHdrAttr.FrameColor = clBlack
    Weekend = []
    LeftCol = 0
    DateFormat = 'ddddd'
    TimeFormat = 'hh:mm'
    Align = alClient
    TabOrder = 1
    PopupMenu = PopupActionBar1
    OnDblClick = TFDDblClick
    DesignSize = (
      1046
      631)
  end
  object ComboBox1: TComboBox
    Left = 496
    Top = 3
    Width = 145
    Height = 21
    TabOrder = 2
    Text = #1042#1089#1077' '#1084#1072#1089#1090#1077#1088#1072
    OnChange = ComboBox1Change
    OnDropDown = ComboBox1DropDown
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = A_W_B
          end
          item
            Action = A_W_F
          end
          item
            Caption = '-'
          end
          item
            Action = A_Ins
            ImageIndex = 0
            ShortCut = 45
          end
          item
            Action = A_Edit
            ImageIndex = 1
            ShortCut = 115
          end
          item
            Action = A_Del
            ImageIndex = 2
            ShortCut = 46
          end>
        ActionBar = ActionToolBar1
      end>
    Images = DataMain.ImageList2
    Left = 544
    Top = 264
    StyleName = 'XP Style'
    object A_WinCR: TAction
      Category = #1057#1083#1091#1078#1077#1073#1085#1099#1077
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1082#1085#1072
      OnExecute = A_WinCRExecute
    end
    object A_W_F: TAction
      Caption = #1053#1077#1076#1077#1083#1103' '#1074#1087#1077#1088#1077#1076
      OnExecute = A_W_FExecute
    end
    object A_W_B: TAction
      Caption = #1053#1077#1076#1077#1083#1103' '#1085#1072#1079#1072#1076
      OnExecute = A_W_BExecute
    end
    object A_Ins: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 45
      OnExecute = A_InsExecute
    end
    object A_Del: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      ShortCut = 46
      OnExecute = A_DelExecute
    end
    object A_Edit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 1
      ShortCut = 115
      OnExecute = A_EditExecute
    end
    object A_Clear: TAction
      Category = #1057#1083#1091#1078#1077#1073#1085#1099#1077
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081
      OnExecute = A_ClearExecute
    end
    object A_Add: TAction
      Category = #1057#1083#1091#1078#1077#1073#1085#1099#1077
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1087#1077#1088#1080#1086#1076#1072
      OnExecute = A_AddExecute
    end
  end
  object Q_Browse_: TQuery
    DatabaseName = 'Sklad'
    SQL.Strings = (
      'select p.naim, p.tel,  m.naim as naimm, o.*'
      'from outlook o '
      'left join predpr p on  o.code_pr = p.code_pr'
      'left join master m on o.code_mast = m.code_mast'
      'where o.ot >= :dat1 and o.ot <= :dat2'
      'and o.type_ = :type_ ')
    Left = 288
    Top = 304
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dat2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_'
        ParamType = ptUnknown
      end>
  end
  object Q_Del_: TQuery
    DatabaseName = 'Sklad'
    SQL.Strings = (
      'delete from outlook where id = :id')
    Left = 336
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object PopupActionBar1: TPopupActionBar
    Images = DataMain.ImageList2
    Left = 544
    Top = 376
    object N1: TMenuItem
      Action = A_Ins
    end
    object N2: TMenuItem
      Action = A_Edit
    end
    object N3: TMenuItem
      Action = A_Del
    end
  end
  object Q_Dr_: TQuery
    DatabaseName = 'Sklad'
    SQL.Strings = (
      'select p.code_pr, p.naim, p.tel, p.birth_date'
      'from predpr p'
      'where (EXTRACT(MONTH FROM birth_date)= :m) and'
      ' (EXTRACT(DAY FROM birth_date)=:d1)'
      '')
    Left = 240
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'm'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'd1'
        ParamType = ptUnknown
      end>
  end
  object TFS: TJvTFScheduleManager
    StateImageMap.AlarmEnabled = -1
    StateImageMap.AlarmDisabled = -1
    StateImageMap.Shared = -1
    StateImageMap.Recurring = -1
    StateImageMap.Modified = -1
    Left = 544
    Top = 216
  end
  object Q_Mast_: TQuery
    DatabaseName = 'Sklad'
    SQL.Strings = (
      'select naim from master')
    Left = 384
    Top = 304
  end
  object Q_BrowseP_: TQuery
    DatabaseName = 'Sklad'
    SQL.Strings = (
      'select p.naim, p.tel, m.naim as naimm, o.*'
      'from outlook o '
      'left join predpr p on  o.code_pr = p.code_pr'
      
        'left join master m on o.code_mast =  (select code_mast from mast' +
        'er where naim = :naim_mp)'
      'where o.ot >= :dat1 and o.ot <= :dat2'
      'and o.type_ = :type_ and m.naim= :naim_mp')
    Left = 440
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'naim_mp'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dat2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'naim_mp'
        ParamType = ptUnknown
      end>
  end
  object Q_Dr: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'select p.code_pr, p.naim, p.tel, p.birth_date'
      'from predpr p'
      'where (EXTRACT(MONTH FROM birth_date)= :m) and'
      ' (EXTRACT(DAY FROM birth_date)=:d1)')
    Left = 240
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'd1'
        ParamType = ptUnknown
      end>
    object Q_DrCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"PREDPR"."CODE_PR"'
    end
    object Q_DrNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"PREDPR"."NAIM"'
      Size = 320
    end
    object Q_DrTEL: TIBStringField
      FieldName = 'TEL'
      Origin = '"PREDPR"."TEL"'
      Size = 320
    end
    object Q_DrBIRTH_DATE: TDateField
      FieldName = 'BIRTH_DATE'
      Origin = '"PREDPR"."BIRTH_DATE"'
    end
  end
  object Q_Browse: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'select p.naim, p.tel,  m.naim as naimm, o.*'
      'from outlook o '
      'left join predpr p on  o.code_pr = p.code_pr'
      'left join master m on o.code_mast = m.code_mast'
      'where o.ot >= :dat1 and o.ot <= :dat2'
      'and o.type_ = :type_ ')
    Left = 288
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dat2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_'
        ParamType = ptUnknown
      end>
    object Q_BrowseNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"PREDPR"."NAIM"'
      Size = 320
    end
    object Q_BrowseTEL: TIBStringField
      FieldName = 'TEL'
      Origin = '"PREDPR"."TEL"'
      Size = 320
    end
    object Q_BrowseNAIMM: TIBStringField
      FieldName = 'NAIMM'
      Origin = '"MASTER"."NAIM"'
      Size = 200
    end
    object Q_BrowseTM_S: TIBStringField
      FieldName = 'TM_S'
      Origin = '"OUTLOOK"."TM_S"'
    end
    object Q_BrowseTM_E: TIBStringField
      FieldName = 'TM_E'
      Origin = '"OUTLOOK"."TM_E"'
    end
    object Q_BrowseCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"OUTLOOK"."CODE_PR"'
    end
    object Q_BrowseTYPE_: TSmallintField
      FieldName = 'TYPE_'
      Origin = '"OUTLOOK"."TYPE_"'
    end
    object Q_BrowsePRIZ: TSmallintField
      FieldName = 'PRIZ'
      Origin = '"OUTLOOK"."PRIZ"'
    end
    object Q_BrowseID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Origin = '"OUTLOOK"."ID_NAKL"'
    end
    object Q_BrowseOT: TDateField
      FieldName = 'OT'
      Origin = '"OUTLOOK"."OT"'
    end
    object Q_BrowseID: TIntegerField
      FieldName = 'ID'
      Origin = '"OUTLOOK"."ID"'
    end
    object Q_BrowseCODE_MAST: TIntegerField
      FieldName = 'CODE_MAST'
      Origin = '"OUTLOOK"."CODE_MAST"'
    end
    object Q_BrowseCOMMENT: TIBStringField
      FieldName = 'COMMENT'
      Origin = '"OUTLOOK"."COMMENT"'
      Size = 600
    end
  end
  object Q_Del: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'delete from outlook where id = :id')
    Left = 336
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Q_Mast: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'select naim from master')
    Left = 384
    Top = 360
    object Q_MastNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"MASTER"."NAIM"'
      Size = 200
    end
  end
  object Q_BrowseP: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'select p.naim, p.tel, m.naim as naimm, o.*'
      'from outlook o '
      'left join predpr p on  o.code_pr = p.code_pr'
      
        'left join master m on o.code_mast =  (select code_mast from mast' +
        'er where naim = :naim_mp)'
      'where o.ot >= :dat1 and o.ot <= :dat2'
      'and o.type_ = :type_ and m.naim= :naim_mp')
    Left = 440
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'naim_mp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dat2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'type_'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'naim_mp'
        ParamType = ptUnknown
      end>
    object Q_BrowsePNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"PREDPR"."NAIM"'
      Size = 320
    end
    object Q_BrowsePTEL: TIBStringField
      FieldName = 'TEL'
      Origin = '"PREDPR"."TEL"'
      Size = 320
    end
    object Q_BrowsePNAIMM: TIBStringField
      FieldName = 'NAIMM'
      Origin = '"MASTER"."NAIM"'
      Size = 200
    end
    object Q_BrowsePTM_S: TIBStringField
      FieldName = 'TM_S'
      Origin = '"OUTLOOK"."TM_S"'
    end
    object Q_BrowsePTM_E: TIBStringField
      FieldName = 'TM_E'
      Origin = '"OUTLOOK"."TM_E"'
    end
    object Q_BrowsePCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"OUTLOOK"."CODE_PR"'
    end
    object Q_BrowsePTYPE_: TSmallintField
      FieldName = 'TYPE_'
      Origin = '"OUTLOOK"."TYPE_"'
    end
    object Q_BrowsePPRIZ: TSmallintField
      FieldName = 'PRIZ'
      Origin = '"OUTLOOK"."PRIZ"'
    end
    object Q_BrowsePID_NAKL: TIntegerField
      FieldName = 'ID_NAKL'
      Origin = '"OUTLOOK"."ID_NAKL"'
    end
    object Q_BrowsePOT: TDateField
      FieldName = 'OT'
      Origin = '"OUTLOOK"."OT"'
    end
    object Q_BrowsePID: TIntegerField
      FieldName = 'ID'
      Origin = '"OUTLOOK"."ID"'
    end
    object Q_BrowsePCODE_MAST: TIntegerField
      FieldName = 'CODE_MAST'
      Origin = '"OUTLOOK"."CODE_MAST"'
    end
    object Q_BrowsePCOMMENT: TIBStringField
      FieldName = 'COMMENT'
      Origin = '"OUTLOOK"."COMMENT"'
      Size = 600
    end
  end
end
