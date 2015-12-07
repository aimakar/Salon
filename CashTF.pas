unit CashTF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, StdCtrls, Mask, Grids, DBGrids, Db, DBTables,
  Buttons, JvToolEdit, ComCtrls, JvExMask, Variants, JvBaseEdits, JvDBControls,
  IBCustomDataSet, IBTable, IBQuery;

  procedure SumTxt1;
  procedure UstSkidka;


type
  TCashT = class(TForm)
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DG: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Panel3: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    ED: TMaskEdit;
    SB1: TSpeedButton;
    Label3: TLabel;
    DBText2: TDBText;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DE: TJvDateEdit;
    Label5: TLabel;
    Label8: TLabel;
    karted: TJvDBCalcEdit;
    Label10: TLabel;
    Label13: TLabel;
    MST: TDBLookupComboBox;
    PRL: TDBLookupComboBox;
    Table1: TIBTable;
    Table1CODE: TIntegerField;
    Table1NOMER: TIBStringField;
    Table1KOL: TIntegerField;
    Table1UP: TIntegerField;
    Table1SK: TIntegerField;
    Table1BONUS: TIntegerField;
    Q1: TIBQuery;
    Q1BONUS: TLargeintField;
    Q1SUMMA: TFloatField;
    Table1PRICE: TFloatField;
    Table1PRICEB: TFloatField;
    Table1PRICE_PRIH: TFloatField;
    Table1Price_B: TFloatField;
    Table1_: TIBDataSet;
    Table1_CODE: TIntegerField;
    Table1_NOMER: TIBStringField;
    Table1_KOL: TIntegerField;
    Table1_UP: TIntegerField;
    Table1_SK: TIntegerField;
    Table1_BONUS: TIntegerField;
    Table1_PRICE: TFloatField;
    Table1_PRICEB: TFloatField;
    Table1_PRICE_PRIH: TFloatField;
    Table1_Price_B: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    procedure DGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DGKeyPress(Sender: TObject; var Key: Char);
    procedure EDExit(Sender: TObject);
    procedure DGEnter(Sender: TObject);
    procedure DGExit(Sender: TObject);
    procedure EDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PRLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DE2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Table1_FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SB1Click(Sender: TObject);
    procedure EDEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CBFactClick(Sender: TObject);
    procedure Osh;
    procedure Table1__FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure PRLDropDown(Sender: TObject);
    procedure MSTDropDown(Sender: TObject);
    procedure Table1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
  Sk : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CashT: TCashT;
  Podstroka, Dost : String;
  Fact_Sk : integer = 0;

implementation

uses Data, Pro, NomForm, CashFormF,  DobTovCF, SpravPokup;

{$R *.DFM}

procedure TCashT.Osh;
var L : Boolean;
begin
// Запись признака ошибки
with DataMain.CashNakl do
begin
   L := False;
   if State = dsBrowse then
   begin
        Edit;
        L := True;
   end;
   try
      FieldByName('Osh').AsString := '1';
   except
   end;
   Post;
   ApplyUpdates;
   DataMain.IBTCash.CommitRetaining;
   if L then Edit;
end;
end;


procedure TCashT.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_ESCAPE then
 begin
   if ((DataMain.CashnaklCode_pr.AsInteger = 0) and (CashT.tag <> 1) and (not DataMain.Predpr.IsEmpty)) then
      begin
           ShowMessage('Не выбран покупатель!');
           Key := 0;
           CashT.ActiveControl := PRL;

      end
   else
      CashT.ModalResult := mrOk;
 end
else
    if Key=VK_F9 then
      begin
          SumTXT1;
          DataMain.CashNakl.Edit;
          try
          DataMain.CashNaklSUMMA.AsFloat := StrToFloat(Label11.Caption);
          except
          DataMain.CashNaklSUMMA.AsFloat := 0;
          end;
          DataMain.CashNakl.Post;
          DataMain.CashNakl.ApplyUpdates;
          DataMain.IBTCash.CommitRetaining;
      end;

end;

procedure TCashT.MSTDropDown(Sender: TObject);
begin
DataMain.Master.Last;
end;

procedure TCashT.FormActivate(Sender: TObject);
begin
     Visible := False;
     With DataMain do
     begin
      // if ((CashNaklRazrL.AsString='1') or (CashNaklOpl.AsString='1')) then CashT.tag := 1 else CashT.tag := 0;
     {  Oper.Close;
       Oper.Filtered :=False;
       Oper.Filter := '[CodeOper] = 2';
       Oper.Filtered := True;
       Oper.Open;  }

       CashTN.Open;
       CashTN.Refresh;
     end;
    Dost := DataMain.Dost;
     Try
       Label11.Caption := FloatToStr(DataMain.CashNaklSUMMA.AsFloat);
     Except
       Label11.Caption := '0';
     end;
     CashT.ActiveControl := DE;
     Datamain.CashTN.First;
     if ((not(NasDost(Dost[47]))) and (CashT.Tag<>1)) then CashT.Tag := 1;
     if CashT.Tag = 1 then
       begin
        DE.Enabled := False;
        PRL.Enabled := False;
        MST.Enabled := False;
        DBMemo1.Enabled := False;
        ED.Enabled := False;
        SB1.Enabled := False;
        DBEdit1.Enabled := False;
       end
     else
       begin
        DBEdit1.Enabled := True;
        DE.Enabled := True;
        PRL.Enabled := True;
        MST.Enabled := True;
        DBMemo1.Enabled := True;
        ED.Enabled := True;
        SB1.Enabled := True;
       end;
  SK := Ed.Text;
//  DataMain.Oper.Open;
  Visible := True;
end;

procedure TCashT.FormDeactivate(Sender: TObject);
begin
     With DataMain do
          begin
          if Sk <> Ed.text then
           begin
               ustskidka;
               sumtxt1;
           end;
//               Oper.Close;
               CashTN.Close;
          end;
     q1.Close;
        DE.Enabled := True;
        PRL.Enabled := True;
        MST.Enabled := True;
        DBMemo1.Enabled := True;
        ED.Enabled := True;
//        BitBtn2.Enabled := True;
        SB1.Enabled := True;
end;



procedure TCashT.DGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var S : String;
    L : Boolean;
    Year, Month, Day: Word;
    K1, K2, I, I1 : Integer;
begin
S := '';
if CashT.Tag = 0 then
     case Key of
          VK_INSERT : begin
                       DataMain.Tovar.Filtered := true;
                       DataMain.CashTn.OnCalcFields := nil;
                       Application.CreateForm(TDobTovC, DobTovC);
                       DobTovC.ShowModal;
                       ustSkidka;
                       SumTXT1;
                       DataMain.CashTn.OnCalcFields := DataMain.CashTNCalcFields;
                       DataMain.CashTN.ApplyUpdates;
                       DataMain.IBTCash.CommitRetaining;
                       Datamain.CashTN.Refresh;
                       DataMain.Tovar.Filtered := false;

                       DobTovC.Release;
                      end;
          VK_DELETE : if MessageDlg('Удалить позицию?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                         begin
                           DataMain.Ost.Locate('Code', DataMain.CashTNCode.AsInteger,[]);
                           DataMain.Tovar.Open;
                           DataMain.Tovar.Locate('Code', DataMain.CashTNCode.AsInteger,[]);
                           if DataMain.Tovarvid.asInteger = 0 then         //если это товар
                           begin
                             DataMain.Ost.Edit;
                             DataMain.OstKol1.AsInteger := DataMain.CashTNKol.AsInteger+DataMain.OstKol1.AsInteger;
                             DataMain.Ost.Post;
                           end;
                           DataMain.Tovar.Close;
                           DataMain.CashTN.Delete;
                           DataMain.CashTN.ApplyUpdates;
                           DataMain.IBT.CommitRetaining;
                           DataMain.IBTCash.CommitRetaining;
                           DataMain.CashTN.Refresh;
                           SumTxt1;
                         end;
          VK_ESCAPE : CashT.ActiveControl := ED;
          VK_F6 : if InputQuery('Поиск по наименованию','Введите подстроку',Podstroka) then
                  With Datamain.CashTN do
                       begin
                            DisableControls;
                            L := not(Eof);
                            while L do begin
                              if Pos(AnsiUpperCase(Podstroka),AnsiUpperCase(FieldByName('Naim').AsString))=0 then
                                 Next
                              else
                                  L :=False;
                              if Eof then L := False;
                            end;
                            enableControls;
                       end;

     end
else
    if KEY = VK_F6 then
       begin
          if InputQuery('Поиск по наименованию','Введите подстроку',Podstroka) then
                  With Datamain.CashTN do
                       begin
                            DisableControls;
                            L := not(Eof);
                            while L do begin
                              if Pos(AnsiUpperCase(Podstroka),AnsiUpperCase(FieldByName('Naim').AsString))=0 then
                                 Next
                              else
                                  L :=False;
                              if Eof then L := False;
                            end;
                            enableControls;
                       end;

       end;


end;



procedure SumTxt1;
var S,S1 : String;
begin
with CashT do begin
    Q1.Close;
    Q1.ParamByName('Nakl').AsString := Datamain.CashNaklNomer.AsString;
    Q1.Open;
    Q1.First;
    try
    Label11.Caption := Q1.FieldByName('summa').AsString;
    except
    Label11.Caption := '0';
    end;
    try
     Label8.Caption := Q1.FieldByName('bonus').AsString;
    except
      Label8.Caption := '0';
    end;
    Q1.Close;
end;
end;


procedure TCashT.DGKeyPress(Sender: TObject; var Key: Char);
var A,B,C : Integer;
    S : String;
begin
     if CashT.Tag = 0
      then
        case DG.SelectedIndex of
        2 : case Key of
               #13 : begin
                  B := DataMain.CashTN.FieldByName('Kol').AsInteger;
                  Application.CreateForm(TNomF, NomF);
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     C := A*CashTN.FieldBYName('V_Up').AsInteger;
                     Ost.Refresh;
                     if C <= CashTN.FieldByName('Ost').AsInteger+B
                      then
                          begin
                               Ost.Locate('Code', CashTN.FieldBYName('Code').AsInteger,[]);
                               Ost.Edit;
                               Ost.FieldByName('Kol1').AsInteger := Ost.FieldByName('Kol1').AsInteger + B - C;
                               Ost.Post;
                               CashTN.Edit;
                               CashTN.FieldByName('Up').AsInteger := A;
                               CashTN.FieldByName('Kol').AsInteger := C;
                               CashTN.Post;
                               CashTN.ApplyUpdates;
                               DataMain.IBT.CommitRetaining;
                               DataMain.IBTCash.CommitRetaining;
                               SumTxt1;
                          end
                      else
                          ShowMessage ('На складе нет данного количества товара!'+#13+#13+
                           'Остаток '+IntToStr(CashTN.FieldByName('Ost').AsInteger+B));
                     end;
                   NomF.Release;
                   end;
             End;
        3 : case Key of
               #13 : begin
                  B := DataMain.CashTN.FieldByName('Kol').AsInteger;
                  Application.CreateForm(TNomF, NomF);
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     Ost.Refresh;
                     if A <= CashTN.FieldByName('Ost').AsInteger+B
                      then
                          begin
                               Ost.Locate('Code', CashTN.FieldBYName('Code').AsInteger,[]);
                               Ost.Edit;
                               Ost.FieldByName('Kol1').AsInteger := Ost.FieldByName('Kol1').AsInteger + B - A;
                               Ost.Post;
                               CashTN.Edit;
                               CashTN.FieldByName('Up').AsInteger := 0;
                               CashTN.FieldByName('Kol').AsInteger := A;
                               CashTN.Post;
                               CashTN.ApplyUpdates;
                               DataMain.IBT.CommitRetaining;
                               DataMain.IBTCash.CommitRetaining;
                               SumTxt1;
                          end
                      else
                          ShowMessage ('На складе нет данного количества товара!'+#13+#13+
                           'Остаток '+IntToStr(CashTN.FieldByName('Ost').AsInteger+B));
                     end;
                   NomF.Release;
                   end;
             End;
        4 : case Key of
               #13 : begin
                  Application.CreateForm(TNomF,NomF);
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999,99;; ';
                  if NomF.ShowModal = mrOk then
                     with datamain do
                     begin
                     S := '';
                     S := NomF.Edit1.Text;
                     TrimAll(S);
                     CashTN.Edit;
                     CashTN.FieldByName('Price').AsFloat := StrToFloat(S);
                     CashTN.FieldByName('Sk').AsFloat := 100 - StrToFloat(S)/CashTNPriceB.AsFloat * 100;
                     CashTN.Post;
                     CashTN.ApplyUpdates;
                     DataMain.IBTCash.CommitRetaining;
                     SumTxt1;
                     end;
                     NomF.Release;
                  end;
             End;

        end;
if DataMain.Ost.State = dsBrowse then DataMain.Ost.Refresh;
if DataMain.CashTN.State = dsBrowse then DataMain.CashTN.Refresh;


end;

//end;

procedure TCashT.EDExit(Sender: TObject);
begin
if Sk <> Ed.Text then
 begin
   ustskidka;
   sumtxt1;
   DataMain.CashTN.Refresh;
   Sk := Ed.Text;
 end;
end;

procedure TCashT.DGEnter(Sender: TObject);
begin
     if CashT.Tag = 0 then
     CashT.KeyPreview := False;
end;

procedure TCashT.DGExit(Sender: TObject);
begin
     if CashT.Tag = 0 then
     CashT.KeyPreview := True;
end;

procedure TCashT.EDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if Key=VK_RETURN then
        begin
             ustskidka;
             sumtxt1;
             DataMain.CashTN.Refresh;
             Sk := Ed.Text;
        end

end;

procedure TCashT.PRLDropDown(Sender: TObject);
begin
DataMain.Predpr.Last;
end;

procedure TCashT.PRLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var NameI : String;
    I : Integer;
begin
     If CashT.Tag = 0 then
     case Key of
          VK_DOWN,VK_UP : if not(CashT.Prl.ListVisible) then Key := 0;
          VK_SPACE : if not(CashT.Prl.ListVisible) then
                     begin
                          CashT.Prl.DropDown;

                     end;
          VK_RETURN : begin
                        CashT.Prl.CloseUp(True);
                        DataMain.CashNakl.Edit;
                        DataMain.CashNaklPrim.AsString := DataMain.PredprVydan.AsString;
                        Datamain.CashNakl.Post;
                        DataMain.CashNakl.ApplyUpdates;
                        DataMain.IBTCash.CommitRetaining;
                      end;
          VK_F6 : begin
              try
                Application.CreateForm(TSprPokup, SprPokup);
                SprPokup.vybor := true;
                SprPokup.FormStyle := fsNormal;
                SprPokup.Visible := false;
                SprPokup.A_WinCr.Execute;
                if SprPokup.ShowModal = mrOk then
                begin
                  DataMain.CashNakl.Edit;
                  DataMain.CashNaklCode_Pr.AsInteger := SprPokup.id_;
                  DataMain.CashNakl.Post;
                  DataMain.CashNakl.ApplyUpdates;
                  DataMain.IBTCash.CommitRetaining;
                  PRL.Update;
                end;
              finally
                SprPokup.Release;
              end;
                  end;
          end;
end;

procedure TCashT.DEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then CashT.ActiveControl := PrL;
end;

procedure TCashT.DE2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then CashT.ActiveControl := DE;
end;

procedure TCashT.Table1__FilterRecord(DataSet: TDataSet; var Accept: Boolean);
var S : String;
begin
        S := Table1Nomer.AsString;
        Delete(S,Pos('-',S),Length(S));
        if StrToInt(S) = Table1.Tag then Accept := True else Accept := False;


end;

procedure TCashT.Table1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
var S : String;
begin
S := Table1Nomer.AsString;
        Delete(S,Pos('-',S),Length(S));
        if StrToInt(S) = Table1.Tag then Accept := True else Accept := False;
end;

procedure TCashT.Table1_FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
        S := Table1Nomer.AsString;
        Delete(S,Pos('-',S),Length(S));
        if StrToInt(S) = Table1.Tag then Accept := True else Accept := False;

end;

procedure UstSkidka;
var S : String;
    I : Integer;
    R, pr, skid : Real;
begin
S := Trim(CashT.ED.Text);
Fact_Sk := 0;
if not((Datamain.CashNaklRazrL.AsString='1') or (Datamain.CashNaklOpl.AsString='1')) then
  with CashT do
   begin
     Try
     I := (100-StrToInt(Trim(S))-Fact_Sk);
     except
     I := 0;
     end;
     Table1.Open;
     Table1.First;
     while not(Table1.eof) do
          BEGIN
            R := Table1Price_B.AsFloat;
        //    showmessage(floattostr(i));
            pr := R*I/100;
            Table1.Edit;
            Table1Price.AsFloat := R*I/100;
            Table1Price_Prih.AsFloat := Table1Price.AsFloat;
            Skid := Round((100 - pr * 100/r)*100)/100;
            Table1Sk.AsFloat := skid;
            Table1.Post;
            Table1.Next;
          end;
     Table1.Close;
   end;
   DataMain.IBT.CommitRetaining;
   DataMain.CashTN.Edit;
   DataMain.CashTn.Cancel;
end;


procedure TCashT.SB1Click(Sender: TObject);
var R : Real;
    S2 : String;
begin
               Table1.Open;
               S2 := DataMain.CashNaklNOMER.AsString;
               Delete(S2,Pos('-',S2),Length(S2));
               Table1.tag := StrToInt(S2);
               Table1.Filtered := True;
               Table1.First;
               while not(Table1.eof) do
                     BEGIN
                          R := Table1.FieldByname('Price').AsFloat * (100-Fact_Sk)/100;
                          Table1.Edit;
                          Table1.FieldByname('Price').AsFloat := Round(R*10)/10;
                          Table1.Post;
                          Table1.Next;
                     end;
               Table1.Close;
     Datamain.CashTN.Refresh;
     sumtxt1;
end;

procedure TCashT.EDEnter(Sender: TObject);
begin
     Sk := Ed.Text;
//     UpDown1.Enabled := True;
end;

procedure TCashT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//DataMain.IBT.CommitRetaining;
end;

procedure TCashT.FormCreate(Sender: TObject);
begin
     q1.Prepare;
end;

procedure TCashT.FormDestroy(Sender: TObject);
begin
     Q1.Close;
     Q1.UnPrepare;
end;

procedure TCashT.CBFactClick(Sender: TObject);
var L : boolean;
begin
if CashT.Visible then
begin
  ustSkidka;
  sumtxt1;
end;
end;

end.
