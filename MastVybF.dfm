object MastVyb: TMastVyb
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1084#1072#1089#1090#1077#1088#1072
  ClientHeight = 407
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 269
    Height = 407
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Table1: TTable
    DatabaseName = 'Sklad'
    FieldDefs = <
      item
        Name = 'NAIM'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ADDRESS'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'GOROD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'BIRTH_DATE'
        DataType = ftDate
      end
      item
        Name = 'CODE_MAST'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CODE_MAST'
        Fields = 'CODE_MAST'
        Source = 'MASTER.MDX'
      end
      item
        Name = 'NAIM'
        Fields = 'NAIM'
        Source = 'MASTER.MDX'
      end>
    IndexName = 'NAIM'
    StoreDefs = True
    TableName = 'Master.DBF'
    Left = 32
    Top = 168
    object Table1NAIM: TStringField
      FieldName = 'NAIM'
      Size = 50
    end
    object Table1ADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
    object Table1GOROD: TStringField
      FieldName = 'GOROD'
      Size = 50
    end
    object Table1TEL: TStringField
      FieldName = 'TEL'
      Size = 15
    end
    object Table1BIRTH_DATE: TDateField
      FieldName = 'BIRTH_DATE'
    end
    object Table1CODE_MAST: TFloatField
      FieldName = 'CODE_MAST'
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 88
    Top = 168
  end
end
