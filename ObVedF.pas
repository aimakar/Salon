unit ObVedF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, DBTables, Math, ExtCtrls,
  DBCtrls, JvExComCtrls, JvProgressBar, IBCustomDataSet, IBQuery, IBTable,
  IBDatabase;

type
  TObVed = class(TForm)
    Dat1: TDateTimePicker;
    Dat2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CB3: TCheckBox;
    BitBtn3: TBitBtn;
    RG: TRadioGroup;
    DBL1: TDBLookupComboBox;
    DBL2: TDBLookupComboBox;
    PB: TJvProgressBar;
    Prih: TIBQuery;
    Vozv: TIBQuery;
    Izl: TIBQuery;
    Cash: TIBQuery;
    Brak: TIBQuery;
    QOprih: TIBQuery;
    QORash: TIBQuery;
    Qost: TIBQuery;
    QOstN: TIBQuery;
    QOstK: TIBQuery;
    FT2: TIBQuery;
    FM2: TIBQuery;
    FGRT2: TIBQuery;
    PrihCODE: TIntegerField;
    PrihOT: TDateField;
    PrihKOL: TIntegerField;
    VozvCODE: TIntegerField;
    VozvOT: TDateField;
    VozvKOL: TIntegerField;
    IzlCODE: TIntegerField;
    IzlOT: TDateField;
    IzlKOL: TIntegerField;
    CashCODE: TIntegerField;
    CashDATAOTP: TDateField;
    CashCODE_PR: TIntegerField;
    CashCODE_MAST: TIntegerField;
    CashKOL: TIntegerField;
    BrakCODE: TIntegerField;
    BrakPRIZDAT: TDateField;
    BrakKOL: TIntegerField;
    Obor: TIBTable;
    OborRash: TIBTable;
    OborotOst: TIBTable;
    Oborotka: TIBTable;
    Tovar: TIBTable;
    Nkost: TIBTable;
    OborCODE: TIntegerField;
    OborOPER: TIntegerField;
    OborDATA: TDateField;
    OborRashCODE: TIntegerField;
    OborRashCODE_PR: TIntegerField;
    OborRashCODE_MAST: TIntegerField;
    OborRashOPER: TIntegerField;
    OborotOstCODE: TIntegerField;
    OborotOstCODE_PR: TIntegerField;
    OborotOstKOL: TIntegerField;
    OborotOstOPER: TIntegerField;
    OborotOstDATA: TDateField;
    OborotkaNAIM: TIBStringField;
    OborotkaNK: TIntegerField;
    OborotkaCODE: TIntegerField;
    OborotkaCODE_PR: TIntegerField;
    OborotkaNS: TIntegerField;
    OborotkaOPER: TIntegerField;
    OborotkaKS: TIntegerField;
    OborotkaKK: TIntegerField;
    OborotkaCODE_MAST: TIntegerField;
    OborotkaCODE_POST: TIntegerField;
    TovarCODE: TIntegerField;
    TovarNAIM: TIBStringField;
    TovarKOL1: TIntegerField;
    TovarCODE_PR: TIntegerField;
    TovarKOL2: TIntegerField;
    TovarUP: TSmallintField;
    TovarCODE_VAL: TSmallintField;
    TovarCOMM1: TIBStringField;
    TovarCOMM2: TIBStringField;
    TovarSERT: TWideMemoField;
    TovarNDS: TSmallintField;
    TovarBONUS: TIntegerField;
    TovarCODEGR: TIntegerField;
    TovarSPEC: TIBStringField;
    TovarCODE_S: TIntegerField;
    TovarTYPE_T: TIntegerField;
    TovarDATASERT: TDateField;
    TovarSTRANA: TIBStringField;
    TovarNTD: TIBStringField;
    TovarVSKLAD: TIntegerField;
    TovarMESTO: TIBStringField;
    TovarRZT: TIntegerField;
    TovarARTIKUL: TIBStringField;
    TovarSTELLA: TIBStringField;
    TovarNEW: TIBStringField;
    TovarROZNPRIZ: TIBStringField;
    TovarALKO_STR: TIBStringField;
    TovarALKO_DAL: TIntegerField;
    TovarTGR_ID: TIntegerField;
    TovarVID: TSmallintField;
    TovarCODE_POST: TIntegerField;
    TovarALKO: TSmallintField;
    QORashNAIM: TIBStringField;
    QORashOPER: TIntegerField;
    QORashCODE_MAST: TIntegerField;
    QORashCODE: TIntegerField;
    QostNAIM: TIBStringField;
    QostNK: TLargeintField;
    QostCODE: TIntegerField;
    QostNS: TLargeintField;
    QostKK: TLargeintField;
    QostKS: TLargeintField;
    QOstKCODE: TIntegerField;
    QOstKKOL: TLargeintField;
    QOstNCODE: TIntegerField;
    QOstNKOL: TLargeintField;
    OborRashCASHK: TFloatField;
    OborRashCASHS: TFloatField;
    OborRashNAC: TFloatField;
    OborRashDOHOD: TFloatField;
    OborotOstPRICE: TFloatField;
    PrihVALPRICE: TFloatField;
    PrihPRICE: TFloatField;
    VozvPRICE: TFloatField;
    OborPRIHK: TIntegerField;
    OborPRIHS: TIntegerField;
    OborNAC: TFloatField;
    IzlPRICE: TFloatField;
    CashPRICE: TFloatField;
    BrakPRICE: TFloatField;
    QORashRASHODK: TFloatField;
    QORashRASHODS: TFloatField;
    QORashDOHOD: TFloatField;
    QORashNACEN: TFloatField;
    QOstNSUMMA: TFloatField;
    QOstKSUMMA: TFloatField;
    FT2NAIM: TIBStringField;
    FT2PRIHK: TLargeintField;
    FT2PRIHS: TLargeintField;
    FT2CASHK: TLargeintField;
    FT2CASHS: TLargeintField;
    FT2NK: TLargeintField;
    FT2NS: TLargeintField;
    FT2KK: TLargeintField;
    FT2KS: TLargeintField;
    FT2DOHOD: TFloatField;
    FT2NACEN: TFloatField;
    FM2NAIM: TIBStringField;
    FM2CASHK: TLargeintField;
    FM2CASHS: TLargeintField;
    FM2DOHOD: TFloatField;
    FM2NACEN: TFloatField;
    FGRT2NAIM: TIBStringField;
    FGRT2PRIHK: TLargeintField;
    FGRT2PRIHS: TLargeintField;
    FGRT2CASHK: TLargeintField;
    FGRT2CASHS: TLargeintField;
    FGRT2NK: TLargeintField;
    FGRT2NS: TLargeintField;
    FGRT2KK: TLargeintField;
    FGRT2KS: TLargeintField;
    FGRT2DOHOD: TFloatField;
    FGRT2NACEN: TFloatField;
    QOprihNAIM: TIBStringField;
    QOprihCODE: TIntegerField;
    QOprihPRIHODK: TLargeintField;
    QOprihPRIHODS: TLargeintField;
    NkostNK: TIntegerField;
    NkostCODE: TIntegerField;
    NkostNS: TIntegerField;
    NkostKK: TIntegerField;
    NkostKS: TIntegerField;
    NkostDOHOD: TFloatField;
    TovarPRIHOD: TFloatField;
    TovarNACEN: TFloatField;
    TovarPRICE_B: TFloatField;
    OborotkaPRIHODK: TIntegerField;
    OborotkaPRIHODS: TIntegerField;
    OborotkaRASHODK: TIntegerField;
    OborotkaRASHODS: TIntegerField;
    OborotkaDOHOD: TFloatField;
    OborotkaNACEN: TFloatField;
    OborRashDATA: TDateField;
    IBTOborot: TIBTransaction;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OborRash_FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure RGClick(Sender: TObject);
    procedure DBL1DropDown(Sender: TObject);
    procedure DBL2DropDown(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObVed: TObVed;
  Cod, i : Integer;

implementation

uses Rep1F, MastVybF, Rep2F, Rep3F, Unit8, Data;

{$R *.dfm}

procedure TObVed.BitBtn1Click(Sender: TObject);
//const AErr = '������� %s �� ������� � ��������������� �����������.'+#13+'����  %s';
var K, KT,TempKol, TKol, TempFili : Integer;
    Pr, PrT, Doh, TDoh, TSumma : Real;
    D1, D2, DataR : TDate;
    F : TextFile;
    FL : Boolean;
begin
  PB.max := 12;
  PB.Position := 1;
  OborRash.Tag := 0;
  Obor.Close;
  // Obor.exclusive := true;
  Obor.Open;
  Obor.EmptyTable;
  OborRash.Close;
  //   OborRash.exclusive := true;
  OborRash.Open;
  OborRash.EmptyTable;
  i:=0;
  PB.Position := PB.Position +1;
  // ������� �������
  Prih.Close;
  Prih.ParamByName('dat2').AsDate := dat2.date;
  Prih.Open;
  while not(Prih.Eof) do
    begin
      Obor.Append;
      OborCode.AsInteger := PrihCode.AsInteger;
      Obordata.AsDateTime := PrihOt.AsDateTime;
      OborPrihK.AsInteger := PrihKol.AsInteger;
      if PrihValPrice.AsFloat = 0 then
         OborPrihS.AsFloat := PrihKol.AsInteger*PrihPrice.AsFloat
      else
         OborPrihS.AsFloat := PrihKol.AsInteger*PrihPrice.AsFloat*PrihValPrice.AsFloat;
      OborOper.AsInteger := 1;
      Obor.Post;
      Prih.Next;
    end;
  Prih.Close;
  Obor.Close;
  PB.Position := PB.Position +1;
  //������� ��������
  Obor.Close;
  Obor.Open;
  Vozv.Close;
  Vozv.ParamByName('dat2').AsDate:= dat2.date;
  Vozv.Open;
  Vozv.First;
  while not(Vozv.Eof) do
    begin
      Obor.Append;
      OborCode.AsInteger := VozvCode.AsInteger;
      Obordata.AsDateTime := VozvOt.AsDateTime;
      OborPrihK.AsInteger := VozvKol.AsInteger;
      OborPrihS.AsFloat := VozvKol.AsInteger*VozvPrice.AsFloat;
      OborOper.AsInteger := 2;
      Obor.Post;
      Vozv.Next;
    end;
  Vozv.Close;
  Obor.Close;
  PB.Position := PB.Position +1;
  //������� �������
  Obor.Close;
  Obor.Open;
  Izl.Close;
  Izl.ParamByName('dat2').AsDate:= dat2.date;
  Izl.Open;
  Izl.First;
  while not(Izl.Eof) do
    begin
      Obor.Append;
      OborCode.AsInteger := IzlCode.AsInteger;
      Obordata.AsDateTime := IzlOt.AsDateTime;
      OborPrihK.AsInteger := IzlKol.AsInteger;
      OborPrihS.AsFloat := IzlKol.AsInteger*IzlPrice.AsFloat;
      OborOper.AsInteger := 3;
      Obor.Post;
      Izl.Next;
    end;
  Izl.Close;
  Obor.Close;
  PB.Position := PB.Position +1;
  // ������� ����������
  OborRash.Open;
  Cash.Close;
  Cash.ParamByName('dat2').AsDate:= dat2.date;
  Cash.Open;
  Cash.First;
  while not(Cash.Eof) do
    begin
      OborRash.Append;
      OborRashCode.AsInteger := CashCode.AsInteger;
      OborRashdata.AsDateTime := CashDataOtp.AsDateTime;
      OborRashCashK.AsInteger := CashKol.AsInteger;
      OborRashcode_pr.AsInteger := CashCode_pr.AsInteger;
      OborRashCashS.AsFloat := CashKol.AsInteger*CashPrice.AsFloat;
      OborRashOper.AsInteger := 4;
      OborRashCODE_MAST.AsInteger := CashCODE_MAST.AsInteger;
      OborRash.Post;
      Cash.Next;
    end;
  Cash.Close;
  OborRash.Close;
  PB.Position := PB.Position +1;
  // ������� ��������
  OborRash.Open;
  Brak.Close;
  Brak.ParamByName('dat2').AsDate:= dat2.date;
  Brak.Open;
  Brak.First;
  while not(Brak.Eof) do
    begin
      OborRash.Append;
      OborRashCode.AsInteger := BrakCode.AsInteger;
      OborRashdata.AsDateTime := BrakPrizDat.AsDateTime;
      OborRashCashK.AsInteger := BrakKol.AsInteger;
      OborRashCashS.AsFloat := BrakKol.AsInteger*BrakPrice.AsFloat;
      OborRashOper.AsInteger := 10;
      OborRash.Post;
      Brak.Next;
    end;
  Brak.Close;
  OborRash.Close;
  PB.Position := PB.Position +1;
       // �������
  Obor.Open;
  OborotOst.Close;
  OborotOst.open;
  OborotOst.EmptyTable;
  KT := 0;
  PrT := 0;
  Oborrash.close;
  oborrash.Open;
  Oborrash.Filtered := True;
  COD := 0;
  Oborrash.Close;
  Oborrash.Tag := Cod;
  Oborrash.Open;
  KT :=0;
  K := 0;
  TDoh := 0;
  TSumma := 0;
  DataR := Now;

  while not(Obor.Eof) do
    begin
     OborotOst.Append;
     OborotOstCode.AsInteger := OborCode.AsInteger;
     OborotOstKol.AsInteger := OborPrihK.AsInteger;
     OborotOstPrice.AsFloat := OborPrihs.AsFloat/OborPrihK.AsInteger;
     OborotOstData.AsDateTime := OborData.ASDateTime;
     OborotOstOper.AsInteger := OborOper.AsInteger;
     OborotOst.Post;
     Pr := OborotOstPrice.AsFloat;
     if Cod <> OborCode.AsInteger then
       begin
        Cod := OborCode.AsInteger;
        Oborrash.Close;
        Oborrash.Tag := Cod;
        Oborrash.Open;
        K := 0;
        KT := 0;
       end;
     K := K + OborPrihK.AsInteger;
     while ((not(OborRash.Eof))and (K>0)) do
        begin
           if KT = 0 then
              begin
               KT := OborRashCashK.ASInteger;
               if CB3.Checked then PrT := Pr
               else
                 if KT <> 0 then PrT := roundto(OborRashCashS.ASFloat/KT, -2)
                 else            PrT := OborRashCashS.ASFloat;
               DataR := OborRashData.AsDateTime;
               TDoh := 0;
               TSumma := 0;
               if PrT < 0 then PrT := 0;
              end;
           if KT <= K then   //3
             begin
              K := K - Kt;
              OborotOst.Appendrecord([Cod, Pr, OborrashCode_pr.AsInteger,((-1) * KT),OborrashOper.ASInteger,DataR]);
              OborRash.Edit;
              if CB3.Checked then    //2
                begin
                  TSumma := TSumma + (KT * Prt);
                  OborRashDohod.AsFloat := 0;
                  OborRashCashS.AsFloat := TSumma;
                  OborRashNac.AsFloat := 0;
                  TSumma := 0;
                end
              else    //2
                begin
                  OborRashDohod.AsFloat := TDoh + KT * (Prt-Pr);
                  if PR <> 0 then  //1
                    try
                      OborRashNac.AsFloat := ((Prt/Pr)-1) * 100;
                    except
                      OborRashNac.AsFloat := 100;
                    end
                  else  //1
                    OborRashNac.AsFloat := 100;
                end;
              OborRash.Post;
              TDoh := TDoh + KT * (Prt-Pr);
              oborRash.Next;
              KT := 0;
             end
          else //3
             begin
                  KT := KT - K;
                  OborotOst.Appendrecord([Cod, Pr, OborrashCode_pr.AsInteger, ((-1) * K),OborrashOper.ASInteger,DataR]);
                  //OborRash.Edit;
                  //OborRashDohod.AsFloat := K * (Prt-Pr);
                  if CB3.Checked then
                    begin
                      TSumma := TSumma + (K * Prt);
                      //OborRashCashS.AsFloat := TSumma;
                    end;
                  {if PR <> 0 then
                  try
                  OborRashNac.AsFloat := ((Prt/Pr)-1) * 100;
                  except
                  OborRashNac.AsFloat := 100;
                  end
                  else
                  OborRashNac.AsFloat := 100;
                  OborRash.Post;}
                  TDoh := TDoh + K * (Prt-Pr);
                  K := 0;
             end;
        end;
     Obor.Next;
    end;

  PB.Position := PB.Position +1;

  OborRash.Close;
  OborRash.Filtered := False;
  Oborrash.Open;
  OborRash.First;
  Obor.Filtered := False;
  Obor.Close;
  Obor.Open;
  Obor.First;

  while not(Obor.Eof) do
    begin
        D1 := OborData.AsDateTime;
        if (D1 > dat1.date-1) then
           Obor.Next
        else
           Obor.Delete;
    end;

  while not(OborRash.Eof) do
    begin
        D1 := OborRashData.AsDateTime;
        if (D1 > dat1.date-1) then
           OborRash.Next
        else
           OborRash.Delete;
    end;
  PB.Position := PB.Position +1;
   ///////////////////////////////////
  QOstN.Close;
  QOstN.paramByname('dat1').ASDate := Dat1.Date;
  QOstN.Open;
  QOstK.CLose;
  QOstK.paramByname('dat2').ASDate := Dat2.Date;
  QOstK.Open;

  QOPrih.Close;
  QOPrih.Open;


  QORash.Close;
  QORash.Open;


  QostN.First;
  QOstK.First;
  QOPrih.First;
  QORash.First;
  NKOst.Close;
  NKOst.Open;
  NKOst.EmptyTable;
    /////////////       ��������� �������
  While not(QOstN.Eof) do
   begin
    NKOst.Append;
    NKOstCode.AsInteger := QOstNCode.AsInteger;
    NKOStNK.AsInteger := QOstNKol.AsInteger;
    NKOstNS.AsFloat := QOstNSumma.AsFloat;
    NKOst.Post;
    QOstN.Next;
    end;
      //////////////////////        �������� �������
  While not(QOstK.Eof) do
    begin
      NKOst.Append;
      NKOstCode.AsInteger := QOstKCode.AsInteger;
      NKOStKK.AsInteger := QOstKKol.AsInteger;
      if QOstKKol.AsInteger <= 0 then
        NKOstKS.AsFloat := 0
      else
        NKOstKS.AsFloat := QOstKSumma.AsFloat;
      NKOst.Post;
      QOstK.Next;
    end;
  QOstK.Close;
  PB.Position := PB.Position +1;
     /////////////////////     ������� ������ � oborotka
  QOst.Close;
  QOPrih.Close;
  QORash.Close;
  QOst.Open;
  QOPrih.Open;
  QORash.Open;
  Oborotka.Close;
  Oborotka.Open;
  Oborotka.EmptyTable;

  QOPrih.First;
   while not(QOPrih.Eof) do
              begin
                  Oborotka.Append;
                  OborotkaCODE.ASInteger := QOPrihCODE.AsInteger;
                 // OborotkaCode_Post.ASInteger := QOPrihCode_Post.AsInteger;
                  OborotkaNaim.ASString := QOPrihnaim.AsString;
                  OborotkaPrihodK.ASInteger := QOPrihPrihodK.AsInteger;
                  if QOPrihPrihodK.AsInteger <= 0 then
                    OborotkaPrihodS.ASFloat := 0
                  else
                    OborotkaPrihodS.ASFloat := QOPrihPrihods.AsFloat;
                  Oborotka.Post;
                  QOPrih.Next;
              end;

   QORash.First;
   while not(QORash.Eof) do
              begin
                try
                  Oborotka.Append;
                  OborotkaCODE.ASInteger := QORashCODE.AsInteger;
                 //OborotkaCode_Post.ASInteger := QORashCode_Post.AsInteger;
                  OborotkaNaim.ASString := QORashnaim.AsString;
                  OborotkaOper.AsInteger := QORashOper.AsInteger;
                  OborotkaCODE_MAST.AsInteger:=QORashCODE_MAST.AsInteger;
                  if (QORashRashodK.AsInteger <= 0) then
                  begin
                    OborotkaRashodK.ASInteger := 0;
                    OborotkaRashodS.ASFloat := 0;
                    OborotkaDohod.AsFloat := 0;
                    OborotkaNacen.AsFloat := 0;
                  end
                  else
                  begin
                    OborotkaRashodK.ASInteger := QORashRashodK.AsInteger;
                    OborotkaRashodS.ASFloat := QORashRashods.AsFloat;
                    OborotkaDohod.AsFloat := roundto(QORashDohod.AsFloat, -2);
                    OborotkaNacen.AsFloat := roundto(QORashNacen.AsFloat, 0);
                  end;
                  Oborotka.Post;
                except
                end;
                  QORash.Next;
              end;
  QOst.First;
  while not(QOst.Eof) do
              begin
                  Oborotka.Append;
                  OborotkaCODE.ASInteger := QOstCODE.AsInteger;
                //  OborotkaCode_Post.ASInteger := QOstCode_Post.AsInteger;
                  OborotkaNaim.ASString := QOstnaim.AsString;
                  OborotkaNK.ASInteger := QOstNK.AsInteger;
                  OborotkaKK.ASInteger := QOstKK.AsInteger;
                  OborotkaNS.ASFloat := QOstNs.AsFloat;
                  OborotkaKS.ASFloat := QOstKs.AsFloat;
                  Oborotka.Post;
                  QOst.Next;
          end;
  QOst.Close;
  PB.Position := PB.Position +1;
  ///////////////////////
  Oborotka.First;
  while not(Oborotka.EOF) do
        begin
             if OborotkaPrihodK.AsInteger = 0 then
                begin
                     Oborotka.Edit;
                     OborotkaPrihodS.AsFloat := 0;
                     Oborotka.Post;
                end;
             if OborotkaRashodK.AsInteger = 0 then
                begin
                     Oborotka.Edit;
                     OborotkaRashodS.AsFloat := 0;
                     Oborotka.Post;
                end;
             if OborotkaNK.AsInteger = 0 then
                begin
                     Oborotka.Edit;
                     OborotkaNS.AsFloat := 0;
                     Oborotka.Post;
                end;
             if OborotkaKK.AsInteger = 0 then
                begin
                     Oborotka.Edit;
                     OborotkaKS.AsFloat := 0;
                     Oborotka.Post;
                end;
             Oborotka.Next;
        end;
  Oborotka.Close;
  QOPrih.Close;
  QORash.Close;
  PB.Position := PB.Position +1;
end;

procedure TObVed.BitBtn3Click(Sender: TObject);
begin
  case RG.ItemIndex of
    0: begin
          FT2.Close;
          FT2.Open;
          Rep_1.Rep1.Preview;
       end;
    1: begin
       end;
    2: begin
          FM2.Close;
          FM2.paramByname('CODE_MAST').ASInteger := DBL1.KeyValue;
          FM2.Open;
          Rep_2.Rep1.Preview;
       end;
    3: begin
          FGRT2.Close;
          FGRT2.paramByname('CODEGR').ASInteger := DBL2.KeyValue;
          FGRT2.Open;
          Rep_3.Rep1.Preview;
        end;
  end;
end;

procedure TObVed.DBL1DropDown(Sender: TObject);
begin
DataMain.Master.Last;
end;

procedure TObVed.DBL2DropDown(Sender: TObject);
begin
DataMain.GrTovar.Last;
end;

procedure TObVed.FormActivate(Sender: TObject);
begin
  RG.ItemIndex := 0;
  i:=0;
end;

procedure TObVed.FormCreate(Sender: TObject);
begin
if not IBTOborot.InTransaction then  IBTOborot.StartTransaction;
  i:=0;
  dat2.date := now();
end;

procedure TObVed.FormDestroy(Sender: TObject);
begin

if IBTOborot.InTransaction then  IBTOborot.Commit;
end;

procedure TObVed.OborRash_FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
      if OborRash.tag = -1 then
              Accept := true
           else
               Accept := (OborRashCode.AsInteger = OborRash.tag);
end;

procedure TObVed.RGClick(Sender: TObject);
begin
case RG.ItemIndex of
0:  begin
      DBL1.Visible:= False;
      DBL2.Visible:= False;
    end;
1:  begin
      DBL1.Visible:= False;
      DBL2.Visible:= False;
    end;
2:  begin
      DBL1.Visible:= True;
      DBL2.Visible:= False;
    end;
3:  begin
      DBL1.Visible:= False;
      DBL2.Visible:= True;
    end;

end;
end;

end.
