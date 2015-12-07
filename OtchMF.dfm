object OtchM: TOtchM
  Left = 0
  Top = 0
  HelpContext = 24
  Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1084#1072#1089#1090#1077#1088#1072#1084
  ClientHeight = 149
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label2: TLabel
    Left = 175
    Top = 24
    Width = 13
    Height = 13
    Caption = #1055#1086
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 106
    Width = 75
    Height = 25
    Caption = 'Ok'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 110
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object Dat1: TDateTimePicker
    Left = 37
    Top = 16
    Width = 117
    Height = 21
    Date = 41055.496719803240000000
    Time = 41055.496719803240000000
    TabOrder = 2
  end
  object Dat2: TDateTimePicker
    Left = 202
    Top = 16
    Width = 119
    Height = 21
    Date = 42150.496899895840000000
    Time = 42150.496899895840000000
    TabOrder = 3
  end
  object LCB: TDBLookupComboBox
    Left = 37
    Top = 56
    Width = 284
    Height = 21
    KeyField = 'CODE_MAST'
    ListField = 'NAIM'
    ListSource = DataMain.MasterDS
    TabOrder = 4
  end
  object Otch_m: TIBQuery
    Database = DataMain.IBDB
    Transaction = DataMain.IBT
    SQL.Strings = (
      'select m.naim, t.naim as naimt, c.ot, ct.price, ct.kol'
      'from cashtn ct'
      'left join tovar t on ct.code =  t.code'
      'left join cashnakl c on ct.nomer = c.nomer'
      'left join master m on c.code_mast = m.code_mast'
      'where c.ot >= :dat1 and c.ot <= :dat2 and m.naim= :naim_mp')
    Left = 168
    Top = 96
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
        Name = 'naim_mp'
        ParamType = ptUnknown
      end>
    object Otch_mNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"MASTER"."NAIM"'
      Size = 200
    end
    object Otch_mNAIMT: TIBStringField
      FieldName = 'NAIMT'
      Origin = '"TOVAR"."NAIM"'
      Size = 320
    end
    object Otch_mOT: TDateField
      FieldName = 'OT'
      Origin = '"CASHNAKL"."OT"'
    end
    object Otch_mPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = '"CASHTN"."PRICE"'
    end
    object Otch_mKOL: TIntegerField
      FieldName = 'KOL'
      Origin = '"CASHTN"."KOL"'
    end
  end
end
