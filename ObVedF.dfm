object ObVed: TObVed
  Left = 360
  Top = 225
  HelpContext = 25
  Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' - '#1088#1072#1089#1095#1105#1090
  ClientHeight = 432
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 21
    Width = 83
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
  end
  object Label2: TLabel
    Left = 224
    Top = 21
    Width = 77
    Height = 13
    Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
  end
  object Dat1: TDateTimePicker
    Left = 32
    Top = 40
    Width = 105
    Height = 21
    Date = 41641.691074513890000000
    Time = 41641.691074513890000000
    TabOrder = 0
  end
  object Dat2: TDateTimePicker
    Left = 224
    Top = 40
    Width = 105
    Height = 21
    Date = 42171.691249780100000000
    Time = 42171.691249780100000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 104
    Width = 113
    Height = 25
    Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 270
    Top = 256
    Width = 131
    Height = 25
    DoubleBuffered = True
    Kind = bkClose
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
  end
  object CB3: TCheckBox
    Left = 224
    Top = 108
    Width = 117
    Height = 17
    Caption = #1042' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1094#1077#1085#1072#1093
    TabOrder = 4
  end
  object BitBtn3: TBitBtn
    Left = 32
    Top = 256
    Width = 129
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object RG: TRadioGroup
    Left = 24
    Top = 159
    Width = 369
    Height = 56
    Caption = #1058#1080#1087' '#1054#1073#1086#1088#1090#1082#1080
    Columns = 3
    Items.Strings = (
      #1055#1086' '#1090#1086#1074#1072#1088#1072#1084
      #1055#1086' '#1091#1089#1083#1091#1075#1072#1084
      #1055#1086' '#1084#1072#1089#1090#1077#1088#1072#1084
      #1055#1086' '#1075#1088#1091#1087#1087#1077' '#1090#1086#1074#1072#1088#1086#1074)
    TabOrder = 6
    OnClick = RGClick
  end
  object DBL1: TDBLookupComboBox
    Left = 32
    Top = 229
    Width = 153
    Height = 21
    KeyField = 'CODE_MAST'
    ListField = 'NAIM'
    ListSource = DataMain.MasterDS
    TabOrder = 7
    Visible = False
    OnDropDown = DBL1DropDown
  end
  object DBL2: TDBLookupComboBox
    Left = 32
    Top = 229
    Width = 153
    Height = 21
    KeyField = 'CODEGR'
    ListField = 'NAIM'
    ListSource = DataMain.GrTovarDS
    TabOrder = 8
    Visible = False
    OnDropDown = DBL2DropDown
  end
  object PB: TJvProgressBar
    Left = 32
    Top = 74
    Width = 369
    Height = 17
    TabOrder = 9
  end
  object Prih: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'select T.Code, N.Prov2D as OT ,N.Valprice, Tn.Price, Tn.Kol'
      'from NaklPrih N, TnPrih Tn, Tovar T'
      'where (N.Prov2D <= :Dat2) and'
      '(N.Priz = '#39'1'#39') and'
      '(TN.Nomer = N.Nomer) and'
      '(T.Code = Tn.Code) '
      'Order by T.Code, N.Prov2D')
    Left = 16
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Dat2'
        ParamType = ptUnknown
      end>
    object PrihCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"TOVAR"."CODE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PrihOT: TDateField
      FieldName = 'OT'
      Origin = '"NAKLPRIH"."PROV2D"'
    end
    object PrihKOL: TIntegerField
      FieldName = 'KOL'
      Origin = '"TNPRIH"."KOL"'
    end
    object PrihVALPRICE: TFloatField
      FieldName = 'VALPRICE'
      Origin = '"NAKLPRIH"."VALPRICE"'
    end
    object PrihPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = '"TNPRIH"."PRICE"'
    end
  end
  object Vozv: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'select T.Code, N.Prov2D as Ot, Tn.Price, Tn.Kol'
      'from NaklVozv N, TnVozv Tn, Tovar T'
      'where (N.Prov2D <= :Dat2) and'
      '(N.Priz = '#39'1'#39') and'
      '(Tn.Nomer = N.Nomer) and'
      '(T.Code = Tn.Code)'
      'Order by T.Code, N.Ot')
    Left = 48
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Dat2'
        ParamType = ptUnknown
      end>
    object VozvCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"TOVAR"."CODE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object VozvOT: TDateField
      FieldName = 'OT'
      Origin = '"NAKLVOZV"."PROV2D"'
    end
    object VozvKOL: TIntegerField
      FieldName = 'KOL'
      Origin = '"TNVOZV"."KOL"'
    end
    object VozvPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = '"TNVOZV"."PRICE"'
    end
  end
  object Izl: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'select T.Code, N.Prizdat as Ot, Tn.Price, Tn.Kol'
      'from IzlNakl N, IzlTn Tn, Tovar T'
      'where (N.PrizDat <= :Dat2) and'
      '(N.Priz = '#39'1'#39') and'
      '(Tn.Nomer = N.Nomer) and'
      '(T.Code = Tn.Code) '
      'Order by T.Code, N.Ot')
    Left = 80
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Dat2'
        ParamType = ptUnknown
      end>
    object IzlCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"TOVAR"."CODE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IzlOT: TDateField
      FieldName = 'OT'
      Origin = '"IZLNAKL"."PRIZDAT"'
    end
    object IzlKOL: TIntegerField
      FieldName = 'KOL'
      Origin = '"IZLTN"."KOL"'
    end
    object IzlPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = '"IZLTN"."PRICE"'
    end
  end
  object Cash: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      
        'select  T.Code, N.dataOtp, N.code_pr, N.CODE_MAST, Tn.Price, Tn.' +
        'Kol'
      'from CashNakl N, CashTn Tn, Tovar T'
      'where (N.DataOtp <= :Dat2) and'
      '(N.Otp = '#39'1'#39') and'
      '(Tn.Nomer = N.Nomer) and'
      '(T.Code = Tn.Code) and'
      '(T.Vid = '#39'0'#39')'
      'order by T.Code, N.DataOtp')
    Left = 112
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Dat2'
        ParamType = ptUnknown
      end>
    object CashCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"TOVAR"."CODE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CashDATAOTP: TDateField
      FieldName = 'DATAOTP'
      Origin = '"CASHNAKL"."DATAOTP"'
    end
    object CashCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"CASHNAKL"."CODE_PR"'
    end
    object CashCODE_MAST: TIntegerField
      FieldName = 'CODE_MAST'
      Origin = '"CASHNAKL"."CODE_MAST"'
    end
    object CashKOL: TIntegerField
      FieldName = 'KOL'
      Origin = '"CASHTN"."KOL"'
    end
    object CashPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = '"CASHTN"."PRICE"'
    end
  end
  object Brak: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'select T.Code, N.PrizDat, Tn.Price, Tn.Kol'
      'from BrNakl N, BrTn Tn, Tovar T'
      'where (N.PrizDat <= :Dat2) and'
      '(N.Priz = '#39'1'#39')  and'
      '(Tn.Nomer = N.Nomer) and'
      '(T.Code = Tn.Code) '
      'order by T.Code, N.Prizdat')
    Left = 144
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Dat2'
        ParamType = ptUnknown
      end>
    object BrakCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"TOVAR"."CODE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BrakPRIZDAT: TDateField
      FieldName = 'PRIZDAT'
      Origin = '"BRNAKL"."PRIZDAT"'
    end
    object BrakKOL: TIntegerField
      FieldName = 'KOL'
      Origin = '"BRTN"."KOL"'
    end
    object BrakPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = '"BRTN"."PRICE"'
    end
  end
  object QOprih: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'SELECT T.Naim as Naim, O.CODE,'
      ' SUM(O.PrihK) PrihodK, SUM(O.PrihS) PrihodS'
      'FROM Obor O'
      '   INNER JOIN Tovar T'
      '   ON  (T.Code = O.Code)'
      'GROUP BY T.Naim, O.CODE'
      'ORDER BY T.Naim')
    Left = 224
    Top = 288
    object QOprihNAIM: TIBStringField
      FieldName = 'NAIM'
      ProviderFlags = []
      Size = 320
    end
    object QOprihCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBOR"."CODE"'
    end
    object QOprihPRIHODK: TLargeintField
      FieldName = 'PRIHODK'
      ProviderFlags = []
    end
    object QOprihPRIHODS: TLargeintField
      FieldName = 'PRIHODS'
      ProviderFlags = []
    end
  end
  object QORash: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'SELECT T.Naim, O.Oper, O.CODE_MAST, O.CODE,'
      ' SUM(O.CashK) RashodK, SUM(O.CashS) RashodS,'
      ' sum(O.Dohod) as Dohod, Avg(O.Nac) as Nacen'
      'FROM OborRash O'
      '   INNER JOIN Tovar T'
      '   ON  (T.Code = O.Code)'
      'GROUP BY T.Naim, O.Oper, O.CODE_MAST, O.CODE'
      'ORDER BY T.Naim')
    Left = 264
    Top = 288
    object QORashNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"TOVAR"."NAIM"'
      Size = 320
    end
    object QORashOPER: TIntegerField
      FieldName = 'OPER'
      Origin = '"OBORRASH"."OPER"'
    end
    object QORashCODE_MAST: TIntegerField
      FieldName = 'CODE_MAST'
      Origin = '"OBORRASH"."CODE_MAST"'
    end
    object QORashCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBORRASH"."CODE"'
    end
    object QORashRASHODK: TFloatField
      FieldName = 'RASHODK'
      ProviderFlags = []
    end
    object QORashRASHODS: TFloatField
      FieldName = 'RASHODS'
      ProviderFlags = []
    end
    object QORashDOHOD: TFloatField
      FieldName = 'DOHOD'
      ProviderFlags = []
    end
    object QORashNACEN: TFloatField
      FieldName = 'NACEN'
      ProviderFlags = []
    end
  end
  object Qost: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'select T.Naim, O.CODE,'
      'sum(O.NK) as NK,'
      'sum(O.NS) as NS,'
      'sum(O.KK) as KK,'
      'sum(O.KS) as KS'
      'from NKOst O, Tovar T'
      'where T.Code=O.Code'
      'group by T.Naim, O.CODE')
    Left = 304
    Top = 288
    object QostNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"TOVAR"."NAIM"'
      Size = 320
    end
    object QostNK: TLargeintField
      FieldName = 'NK'
      ProviderFlags = []
    end
    object QostCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"NKOST"."CODE"'
    end
    object QostNS: TLargeintField
      FieldName = 'NS'
      ProviderFlags = []
    end
    object QostKK: TLargeintField
      FieldName = 'KK'
      ProviderFlags = []
    end
    object QostKS: TLargeintField
      FieldName = 'KS'
      ProviderFlags = []
    end
  end
  object QOstN: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'select O.Code, '
      'sum(O.Kol) as Kol,'
      'sum(O.Kol*O.Price) as Summa'
      'from OborotOst O'
      'where (O.Data < :dat1)'
      'group by O.Code')
    Left = 344
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dat1'
        ParamType = ptUnknown
      end>
    object QOstNCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBOROTOST"."CODE"'
    end
    object QOstNKOL: TLargeintField
      FieldName = 'KOL'
      ProviderFlags = []
    end
    object QOstNSUMMA: TFloatField
      FieldName = 'SUMMA'
      ProviderFlags = []
    end
  end
  object QOstK: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'select O.Code,'
      'sum(O.Kol) as Kol, '
      'sum(O.Kol*O.Price) as Summa'
      'from OborotOst O'
      'where (O.Data <= :dat2)'
      'group by O.Code')
    Left = 384
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dat2'
        ParamType = ptUnknown
      end>
    object QOstKCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBOROTOST"."CODE"'
    end
    object QOstKKOL: TLargeintField
      FieldName = 'KOL'
      ProviderFlags = []
    end
    object QOstKSUMMA: TFloatField
      FieldName = 'SUMMA'
      ProviderFlags = []
    end
  end
  object FT2: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'SELECT O.NAIM NAIM, sum(O.PRIHODK) as PrihK,'
      'sum(O.PRIHODS) as PrihS,'
      'sum(O.RASHODK) as CASHK,'
      'sum(O.RASHODS) as CASHS,'
      'sum(O.NK) as NK,'
      'sum(O.NS) as NS,'
      'sum(O.KK) as KK,'
      'sum(O.KS) as KS,'
      'sum(O.DOHOD) as DOHOD,'
      'AVG(O.NACEN) as Nacen'
      'FROM Oborotka O'
      'GROUP BY O.NAIM ')
    Left = 304
    Top = 344
    object FT2NAIM: TIBStringField
      FieldName = 'NAIM'
      ProviderFlags = []
      Size = 400
    end
    object FT2PRIHK: TLargeintField
      FieldName = 'PRIHK'
      ProviderFlags = []
    end
    object FT2PRIHS: TLargeintField
      FieldName = 'PRIHS'
      ProviderFlags = []
    end
    object FT2CASHK: TLargeintField
      FieldName = 'CASHK'
      ProviderFlags = []
    end
    object FT2CASHS: TLargeintField
      FieldName = 'CASHS'
      ProviderFlags = []
    end
    object FT2NK: TLargeintField
      FieldName = 'NK'
      ProviderFlags = []
    end
    object FT2NS: TLargeintField
      FieldName = 'NS'
      ProviderFlags = []
    end
    object FT2KK: TLargeintField
      FieldName = 'KK'
      ProviderFlags = []
    end
    object FT2KS: TLargeintField
      FieldName = 'KS'
      ProviderFlags = []
    end
    object FT2DOHOD: TFloatField
      FieldName = 'DOHOD'
      ProviderFlags = []
    end
    object FT2NACEN: TFloatField
      FieldName = 'NACEN'
      ProviderFlags = []
    end
  end
  object FM2: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'SELECT O.NAIM NAIM,'
      'sum(O.RASHODK) as CASHK,'
      'sum(O.RASHODS) as CASHS,'
      'sum(O.DOHOD) as DOHOD,'
      'AVG(O.NACEN) as Nacen'
      'FROM Oborotka O'
      'where O.CODE_MAST = :CODE_MAST'
      'GROUP BY O.NAIM ')
    Left = 344
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODE_MAST'
        ParamType = ptUnknown
      end>
    object FM2NAIM: TIBStringField
      FieldName = 'NAIM'
      ProviderFlags = []
      Size = 400
    end
    object FM2CASHK: TLargeintField
      FieldName = 'CASHK'
      ProviderFlags = []
    end
    object FM2CASHS: TLargeintField
      FieldName = 'CASHS'
      ProviderFlags = []
    end
    object FM2DOHOD: TFloatField
      FieldName = 'DOHOD'
      ProviderFlags = []
    end
    object FM2NACEN: TFloatField
      FieldName = 'NACEN'
      ProviderFlags = []
    end
  end
  object FGRT2: TIBQuery
    Database = DataMain.IBDB
    Transaction = IBTOborot
    SQL.Strings = (
      'SELECT O.NAIM NAIM, sum(O.PRIHODK) as PrihK,'
      'sum(O.PRIHODS) as PrihS,'
      'sum(O.RASHODK) as CASHK,'
      'sum(O.RASHODS) as CASHS,'
      'sum(O.NK) as NK,'
      'sum(O.NS) as NS,'
      'sum(O.KK) as KK,'
      'sum(O.KS) as KS,'
      'sum(O.DOHOD) as DOHOD,'
      'AVG(O.NACEN) as Nacen'
      'FROM Oborotka O, Tovar T'
      'where (O.Code = T.CODE) and (T.CODEGR = :CODEGR)'
      'GROUP BY O.NAIM ')
    Left = 384
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODEGR'
        ParamType = ptUnknown
      end>
    object FGRT2NAIM: TIBStringField
      FieldName = 'NAIM'
      ProviderFlags = []
      Size = 400
    end
    object FGRT2PRIHK: TLargeintField
      FieldName = 'PRIHK'
      ProviderFlags = []
    end
    object FGRT2PRIHS: TLargeintField
      FieldName = 'PRIHS'
      ProviderFlags = []
    end
    object FGRT2CASHK: TLargeintField
      FieldName = 'CASHK'
      ProviderFlags = []
    end
    object FGRT2CASHS: TLargeintField
      FieldName = 'CASHS'
      ProviderFlags = []
    end
    object FGRT2NK: TLargeintField
      FieldName = 'NK'
      ProviderFlags = []
    end
    object FGRT2NS: TLargeintField
      FieldName = 'NS'
      ProviderFlags = []
    end
    object FGRT2KK: TLargeintField
      FieldName = 'KK'
      ProviderFlags = []
    end
    object FGRT2KS: TLargeintField
      FieldName = 'KS'
      ProviderFlags = []
    end
    object FGRT2DOHOD: TFloatField
      FieldName = 'DOHOD'
      ProviderFlags = []
    end
    object FGRT2NACEN: TFloatField
      FieldName = 'NACEN'
      ProviderFlags = []
    end
  end
  object Obor: TIBTable
    Database = DataMain.IBDB
    Transaction = IBTOborot
    FieldDefs = <
      item
        Name = 'CODE'
        DataType = ftInteger
      end
      item
        Name = 'PRIHK'
        DataType = ftInteger
      end
      item
        Name = 'PRIHS'
        DataType = ftInteger
      end
      item
        Name = 'OPER'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'NAC'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OPER'
        Fields = 'OPER'
      end
      item
        Name = 'CODE3'
        Fields = 'CODE'
      end>
    StoreDefs = True
    TableName = 'OBOR'
    Left = 16
    Top = 344
    object OborCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBOR"."CODE"'
    end
    object OborOPER: TIntegerField
      FieldName = 'OPER'
      Origin = '"OBOR"."OPER"'
    end
    object OborDATA: TDateField
      FieldName = 'DATA'
      Origin = '"OBOR"."DATA"'
    end
    object OborPRIHK: TIntegerField
      FieldName = 'PRIHK'
      Origin = '"OBOR"."PRIHK"'
    end
    object OborPRIHS: TIntegerField
      FieldName = 'PRIHS'
      Origin = '"OBOR"."PRIHS"'
    end
    object OborNAC: TFloatField
      FieldName = 'NAC'
      Origin = '"OBOR"."NAC"'
    end
  end
  object OborRash: TIBTable
    Database = DataMain.IBDB
    Transaction = IBTOborot
    FieldDefs = <
      item
        Name = 'CODE'
        DataType = ftInteger
      end
      item
        Name = 'CODE_PR'
        DataType = ftInteger
      end
      item
        Name = 'CODE_MAST'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'OPER'
        DataType = ftInteger
      end
      item
        Name = 'CASHK'
        DataType = ftFloat
      end
      item
        Name = 'CASHS'
        DataType = ftFloat
      end
      item
        Name = 'NAC'
        DataType = ftFloat
      end
      item
        Name = 'DOHOD'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CODE4'
        Fields = 'CODE'
      end
      item
        Name = 'DATA'
        Fields = 'DATA'
      end>
    StoreDefs = True
    TableName = 'OBORRASH'
    OnFilterRecord = OborRash_FilterRecord
    Left = 56
    Top = 344
    object OborRashCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBORRASH"."CODE"'
    end
    object OborRashCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"OBORRASH"."CODE_PR"'
    end
    object OborRashCODE_MAST: TIntegerField
      FieldName = 'CODE_MAST'
      Origin = '"OBORRASH"."CODE_MAST"'
    end
    object OborRashOPER: TIntegerField
      FieldName = 'OPER'
      Origin = '"OBORRASH"."OPER"'
    end
    object OborRashCASHK: TFloatField
      FieldName = 'CASHK'
      Origin = '"OBORRASH"."CASHK"'
    end
    object OborRashCASHS: TFloatField
      FieldName = 'CASHS'
      Origin = '"OBORRASH"."CASHS"'
    end
    object OborRashNAC: TFloatField
      FieldName = 'NAC'
      Origin = '"OBORRASH"."NAC"'
    end
    object OborRashDOHOD: TFloatField
      FieldName = 'DOHOD'
      Origin = '"OBORRASH"."DOHOD"'
    end
    object OborRashDATA: TDateField
      FieldName = 'DATA'
      Origin = '"OBORRASH"."DATA"'
    end
  end
  object OborotOst: TIBTable
    Database = DataMain.IBDB
    Transaction = IBTOborot
    FieldDefs = <
      item
        Name = 'CODE'
        DataType = ftInteger
      end
      item
        Name = 'CODE_PR'
        DataType = ftInteger
      end
      item
        Name = 'KOL'
        DataType = ftInteger
      end
      item
        Name = 'OPER'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'PRICE'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'OBOROTOST'
    Left = 104
    Top = 344
    object OborotOstCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBOROTOST"."CODE"'
    end
    object OborotOstPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = '"OBOROTOST"."PRICE"'
    end
    object OborotOstCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"OBOROTOST"."CODE_PR"'
    end
    object OborotOstKOL: TIntegerField
      FieldName = 'KOL'
      Origin = '"OBOROTOST"."KOL"'
    end
    object OborotOstOPER: TIntegerField
      FieldName = 'OPER'
      Origin = '"OBOROTOST"."OPER"'
    end
    object OborotOstDATA: TDateField
      FieldName = 'DATA'
      Origin = '"OBOROTOST"."DATA"'
    end
  end
  object Oborotka: TIBTable
    Database = DataMain.IBDB
    Transaction = IBTOborot
    FieldDefs = <
      item
        Name = 'NAIM'
        DataType = ftWideString
        Size = 400
      end
      item
        Name = 'NK'
        DataType = ftInteger
      end
      item
        Name = 'CODE'
        DataType = ftInteger
      end
      item
        Name = 'PRIHODK'
        DataType = ftInteger
      end
      item
        Name = 'CODE_PR'
        DataType = ftInteger
      end
      item
        Name = 'NS'
        DataType = ftInteger
      end
      item
        Name = 'PRIHODS'
        DataType = ftInteger
      end
      item
        Name = 'OPER'
        DataType = ftInteger
      end
      item
        Name = 'KS'
        DataType = ftInteger
      end
      item
        Name = 'KK'
        DataType = ftInteger
      end
      item
        Name = 'RASHODK'
        DataType = ftInteger
      end
      item
        Name = 'CODE_MAST'
        DataType = ftInteger
      end
      item
        Name = 'RASHODS'
        DataType = ftInteger
      end
      item
        Name = 'CODE_POST'
        DataType = ftInteger
      end
      item
        Name = 'DOHOD'
        DataType = ftFloat
      end
      item
        Name = 'NACEN'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'OBOROTKA'
    Left = 240
    Top = 344
    object OborotkaNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"OBOROTKA"."NAIM"'
      Size = 400
    end
    object OborotkaNK: TIntegerField
      FieldName = 'NK'
      Origin = '"OBOROTKA"."NK"'
    end
    object OborotkaCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"OBOROTKA"."CODE"'
    end
    object OborotkaCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"OBOROTKA"."CODE_PR"'
    end
    object OborotkaNS: TIntegerField
      FieldName = 'NS'
      Origin = '"OBOROTKA"."NS"'
    end
    object OborotkaOPER: TIntegerField
      FieldName = 'OPER'
      Origin = '"OBOROTKA"."OPER"'
    end
    object OborotkaKS: TIntegerField
      FieldName = 'KS'
      Origin = '"OBOROTKA"."KS"'
    end
    object OborotkaKK: TIntegerField
      FieldName = 'KK'
      Origin = '"OBOROTKA"."KK"'
    end
    object OborotkaCODE_MAST: TIntegerField
      FieldName = 'CODE_MAST'
      Origin = '"OBOROTKA"."CODE_MAST"'
    end
    object OborotkaCODE_POST: TIntegerField
      FieldName = 'CODE_POST'
      Origin = '"OBOROTKA"."CODE_POST"'
    end
    object OborotkaPRIHODK: TIntegerField
      FieldName = 'PRIHODK'
    end
    object OborotkaPRIHODS: TIntegerField
      FieldName = 'PRIHODS'
      Origin = '"OBOROTKA"."PRIHODS"'
    end
    object OborotkaRASHODK: TIntegerField
      FieldName = 'RASHODK'
      Origin = '"OBOROTKA"."RASHODK"'
    end
    object OborotkaRASHODS: TIntegerField
      FieldName = 'RASHODS'
      Origin = '"OBOROTKA"."RASHODS"'
    end
    object OborotkaDOHOD: TFloatField
      FieldName = 'DOHOD'
      Origin = '"OBOROTKA"."DOHOD"'
    end
    object OborotkaNACEN: TFloatField
      FieldName = 'NACEN'
      Origin = '"OBOROTKA"."NACEN"'
    end
  end
  object Tovar: TIBTable
    Database = DataMain.IBDB
    Transaction = IBTOborot
    FieldDefs = <
      item
        Name = 'CODE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAIM'
        DataType = ftWideString
        Size = 320
      end
      item
        Name = 'KOL1'
        DataType = ftInteger
      end
      item
        Name = 'CODE_PR'
        DataType = ftInteger
      end
      item
        Name = 'KOL2'
        DataType = ftInteger
      end
      item
        Name = 'UP'
        DataType = ftSmallint
      end
      item
        Name = 'CODE_VAL'
        DataType = ftSmallint
      end
      item
        Name = 'COMM1'
        DataType = ftWideString
        Size = 800
      end
      item
        Name = 'COMM2'
        DataType = ftWideString
        Size = 800
      end
      item
        Name = 'SERT'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'NDS'
        DataType = ftSmallint
      end
      item
        Name = 'BONUS'
        DataType = ftInteger
      end
      item
        Name = 'CODEGR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SPEC'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 4
      end
      item
        Name = 'CODE_S'
        DataType = ftInteger
      end
      item
        Name = 'TYPE_T'
        DataType = ftInteger
      end
      item
        Name = 'DATASERT'
        DataType = ftDate
      end
      item
        Name = 'STRANA'
        DataType = ftWideString
        Size = 80
      end
      item
        Name = 'NTD'
        DataType = ftWideString
        Size = 320
      end
      item
        Name = 'VSKLAD'
        DataType = ftInteger
      end
      item
        Name = 'MESTO'
        DataType = ftWideString
        Size = 40
      end
      item
        Name = 'RZT'
        DataType = ftInteger
      end
      item
        Name = 'ARTIKUL'
        DataType = ftWideString
        Size = 80
      end
      item
        Name = 'STELLA'
        DataType = ftWideString
        Size = 80
      end
      item
        Name = 'NEW'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 4
      end
      item
        Name = 'ROZNPRIZ'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 4
      end
      item
        Name = 'ALKO_STR'
        DataType = ftWideString
        Size = 400
      end
      item
        Name = 'ALKO_DAL'
        DataType = ftInteger
      end
      item
        Name = 'TGR_ID'
        DataType = ftInteger
      end
      item
        Name = 'VID'
        DataType = ftSmallint
      end
      item
        Name = 'CODE_POST'
        DataType = ftInteger
      end
      item
        Name = 'ALKO'
        DataType = ftSmallint
      end
      item
        Name = 'PRIHOD'
        DataType = ftFloat
      end
      item
        Name = 'NACEN'
        DataType = ftFloat
      end
      item
        Name = 'PRICE_B'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'TYPE_T'
        Fields = 'TYPE_T'
      end
      item
        Name = 'VSKLAD'
        Fields = 'VSKLAD'
      end
      item
        Name = 'CODE_POST1'
        Fields = 'CODE_POST'
      end
      item
        Name = 'CODE_S1'
        Fields = 'CODE_S'
      end
      item
        Name = 'CODE12'
        Fields = 'CODE'
      end
      item
        Name = 'CODE_PR5'
        Fields = 'CODE_PR'
      end
      item
        Name = 'CODEGR1'
        Fields = 'CODEGR'
      end
      item
        Name = 'CODE_VAL1'
        Fields = 'CODE_VAL'
      end
      item
        Name = 'NAIM10'
        Fields = 'NAIM'
      end
      item
        Name = 'PK_TOVAR'
        Fields = 'CODE'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TOVAR'
    Left = 200
    Top = 344
    object TovarCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"TOVAR"."CODE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TovarNAIM: TIBStringField
      FieldName = 'NAIM'
      Origin = '"TOVAR"."NAIM"'
      Size = 320
    end
    object TovarKOL1: TIntegerField
      FieldName = 'KOL1'
      Origin = '"TOVAR"."KOL1"'
    end
    object TovarCODE_PR: TIntegerField
      FieldName = 'CODE_PR'
      Origin = '"TOVAR"."CODE_PR"'
    end
    object TovarKOL2: TIntegerField
      FieldName = 'KOL2'
      Origin = '"TOVAR"."KOL2"'
    end
    object TovarUP: TSmallintField
      FieldName = 'UP'
      Origin = '"TOVAR"."UP"'
    end
    object TovarCODE_VAL: TSmallintField
      FieldName = 'CODE_VAL'
      Origin = '"TOVAR"."CODE_VAL"'
    end
    object TovarCOMM1: TIBStringField
      FieldName = 'COMM1'
      Origin = '"TOVAR"."COMM1"'
      Size = 800
    end
    object TovarCOMM2: TIBStringField
      FieldName = 'COMM2'
      Origin = '"TOVAR"."COMM2"'
      Size = 800
    end
    object TovarSERT: TWideMemoField
      FieldName = 'SERT'
      Origin = '"TOVAR"."SERT"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TovarNDS: TSmallintField
      FieldName = 'NDS'
      Origin = '"TOVAR"."NDS"'
    end
    object TovarBONUS: TIntegerField
      FieldName = 'BONUS'
      Origin = '"TOVAR"."BONUS"'
    end
    object TovarCODEGR: TIntegerField
      FieldName = 'CODEGR'
      Origin = '"TOVAR"."CODEGR"'
      Required = True
    end
    object TovarSPEC: TIBStringField
      FieldName = 'SPEC'
      Origin = '"TOVAR"."SPEC"'
      FixedChar = True
      Size = 4
    end
    object TovarCODE_S: TIntegerField
      FieldName = 'CODE_S'
      Origin = '"TOVAR"."CODE_S"'
    end
    object TovarTYPE_T: TIntegerField
      FieldName = 'TYPE_T'
      Origin = '"TOVAR"."TYPE_T"'
    end
    object TovarDATASERT: TDateField
      FieldName = 'DATASERT'
      Origin = '"TOVAR"."DATASERT"'
    end
    object TovarSTRANA: TIBStringField
      FieldName = 'STRANA'
      Origin = '"TOVAR"."STRANA"'
      Size = 80
    end
    object TovarNTD: TIBStringField
      FieldName = 'NTD'
      Origin = '"TOVAR"."NTD"'
      Size = 320
    end
    object TovarVSKLAD: TIntegerField
      FieldName = 'VSKLAD'
      Origin = '"TOVAR"."VSKLAD"'
    end
    object TovarMESTO: TIBStringField
      FieldName = 'MESTO'
      Origin = '"TOVAR"."MESTO"'
      Size = 40
    end
    object TovarRZT: TIntegerField
      FieldName = 'RZT'
      Origin = '"TOVAR"."RZT"'
    end
    object TovarARTIKUL: TIBStringField
      FieldName = 'ARTIKUL'
      Origin = '"TOVAR"."ARTIKUL"'
      Size = 80
    end
    object TovarSTELLA: TIBStringField
      FieldName = 'STELLA'
      Origin = '"TOVAR"."STELLA"'
      Size = 80
    end
    object TovarNEW: TIBStringField
      FieldName = 'NEW'
      Origin = '"TOVAR"."NEW"'
      FixedChar = True
      Size = 4
    end
    object TovarROZNPRIZ: TIBStringField
      FieldName = 'ROZNPRIZ'
      Origin = '"TOVAR"."ROZNPRIZ"'
      FixedChar = True
      Size = 4
    end
    object TovarALKO_STR: TIBStringField
      FieldName = 'ALKO_STR'
      Origin = '"TOVAR"."ALKO_STR"'
      Size = 400
    end
    object TovarALKO_DAL: TIntegerField
      FieldName = 'ALKO_DAL'
      Origin = '"TOVAR"."ALKO_DAL"'
    end
    object TovarTGR_ID: TIntegerField
      FieldName = 'TGR_ID'
      Origin = '"TOVAR"."TGR_ID"'
    end
    object TovarVID: TSmallintField
      FieldName = 'VID'
      Origin = '"TOVAR"."VID"'
    end
    object TovarCODE_POST: TIntegerField
      FieldName = 'CODE_POST'
      Origin = '"TOVAR"."CODE_POST"'
    end
    object TovarALKO: TSmallintField
      FieldName = 'ALKO'
      Origin = '"TOVAR"."ALKO"'
    end
    object TovarPRIHOD: TFloatField
      FieldName = 'PRIHOD'
    end
    object TovarNACEN: TFloatField
      FieldName = 'NACEN'
      Origin = '"TOVAR"."NACEN"'
    end
    object TovarPRICE_B: TFloatField
      FieldName = 'PRICE_B'
      Origin = '"TOVAR"."PRICE_B"'
    end
  end
  object Nkost: TIBTable
    Database = DataMain.IBDB
    Transaction = IBTOborot
    FieldDefs = <
      item
        Name = 'NK'
        DataType = ftInteger
      end
      item
        Name = 'CODE'
        DataType = ftInteger
      end
      item
        Name = 'NS'
        DataType = ftInteger
      end
      item
        Name = 'KK'
        DataType = ftInteger
      end
      item
        Name = 'KS'
        DataType = ftInteger
      end
      item
        Name = 'DOHOD'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'NKOST'
    Left = 160
    Top = 344
    object NkostNK: TIntegerField
      FieldName = 'NK'
    end
    object NkostCODE: TIntegerField
      FieldName = 'CODE'
      Origin = '"NKOST"."CODE"'
    end
    object NkostNS: TIntegerField
      FieldName = 'NS'
      Origin = '"NKOST"."NS"'
    end
    object NkostKK: TIntegerField
      FieldName = 'KK'
      Origin = '"NKOST"."KK"'
    end
    object NkostKS: TIntegerField
      FieldName = 'KS'
      Origin = '"NKOST"."KS"'
    end
    object NkostDOHOD: TFloatField
      FieldName = 'DOHOD'
      Origin = '"NKOST"."DOHOD"'
    end
  end
  object IBTOborot: TIBTransaction
    DefaultDatabase = DataMain.IBDB
    Left = 208
    Top = 224
  end
end
