unit OtchMF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, DBTables, ComObj, ActiveX, DBCtrls, Sklad,
  IBCustomDataSet, IBQuery;

type
  TOtchM = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Dat1: TDateTimePicker;
    Dat2: TDateTimePicker;
    LCB: TDBLookupComboBox;
    Otch_m: TIBQuery;
    Otch_mNAIM: TIBStringField;
    Otch_mNAIMT: TIBStringField;
    Otch_mOT: TDateField;
    Otch_mPRICE: TFloatField;
    Otch_mKOL: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OtchM: TOtchM;


implementation

uses data;

{$R *.dfm}

procedure TOtchM.BitBtn1Click(Sender: TObject);
var i,k : integer;
  sum: real;
begin
NewBook(true);
 for k := 1 to 4 do
  begin
    MyExcel.Cells[1,k].Interior.Color := clGreen;
    MyExcel.Cells[1,k].Font.Size:=13;
    MyExcel.Cells[1,k].Font.Bold:=true;
  end;
 MyExcel.Cells[1,1]:='������������';
 MyExcel.Cells[1,2]:='������';
 MyExcel.Cells[1,3]:='����';
 MyExcel.Cells[1,4]:='����';
 MyExcel.Columns.Range['A:A'].ColumnWidth := 81;
 MyExcel.Columns.Range['B:B'].ColumnWidth := 23;
 MyExcel.Columns.Range['C:C'].ColumnWidth := 15;
 MyExcel.Columns.Range['D:D'].ColumnWidth := 12;
 i:=2; sum:=0;
 try
 Otch_m.Close;
 Otch_m.ParamByName('dat1').AsDate := dat1.date;
 Otch_m.ParamByName('dat2').AsDate := dat2.date;
 Otch_m.ParamByName('naim_mp').AsString := LCB.Text;
 Otch_m.Open;
 while not Otch_m.Eof do
  begin
    MyExcel.Cells[i,1]:= Otch_m.FieldByName('naimt').AsString;
    MyExcel.Cells[i,2]:= Otch_m.FieldByName('naim').AsString;
    MyExcel.Cells[i,3]:= Otch_m.FieldByName('ot').AsString;
    MyExcel.Cells[i,4]:= floattostr(Otch_m.FieldByName('price').AsFloat * Otch_m.FieldByName('kol').ASFloat);
    sum:= sum + (Otch_m.FieldByName('price').AsFloat * Otch_m.FieldByName('kol').ASFloat);
    i:=i+1;
    Otch_m.Next;
  end;
  MyExcel.Cells[i+2,3]:='�����';
  MyExcel.Cells[i+2,4]:= sum;
 except on E: Exception do
      begin
        ShowMessage('���������� ������: ' + #13 + E.Message);
      end;
 end;
 SetForegroundWindow(MyExcel.Hwnd);
 MyExcel:=UnAssigned;
 ModalResult := mrOk;
end;

procedure TOtchM.FormActivate(Sender: TObject);
begin
DataMain.Master.Open;
DataMain.Master.Last;
end;

procedure TOtchM.FormCreate(Sender: TObject);
begin
if not DataMain.IBT.InTransaction then  DataMain.IBT.StartTransaction;
end;

procedure TOtchM.FormDestroy(Sender: TObject);
begin
if DataMain.IBT.InTransaction then  DataMain.IBT.Commit;
end;

end.
