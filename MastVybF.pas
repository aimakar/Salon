unit MastVybF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBTables;

type
  TMastVyb = class(TForm)
    Table1: TTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Table1NAIM: TStringField;
    Table1ADDRESS: TStringField;
    Table1GOROD: TStringField;
    Table1TEL: TStringField;
    Table1BIRTH_DATE: TDateField;
    Table1CODE_MAST: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MastVyb: TMastVyb;

implementation

{$R *.dfm}

end.
