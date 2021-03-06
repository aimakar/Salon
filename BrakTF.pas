unit BrakTF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, StdCtrls, Mask,  Grids, DBGrids, Db, DBTables,
  Buttons, JvExMask, JvToolEdit, IBCustomDataSet, IBQuery;

  procedure SumTxt1;
  procedure SumText(A : String; P : Real; var S,S1 : String);


type
  TBrakT = class(TForm)
    Label1: TLabel;
    Label2: TLabel;

    DBMemo1: TDBMemo;
    Label6: TLabel;
    DG: TDBGrid;
    Label9: TLabel;
    Label11: TLabel;
    DE: TJvDateEdit;
    Q: TIBQuery;
    Q1: TIBQuery;
    QCODE: TIntegerField;
    Q1SUMMA: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DGKeyPress(Sender: TObject; var Key: Char);
    procedure DGEnter(Sender: TObject);
    procedure DGExit(Sender: TObject);

    procedure DEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
  Sk : String;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  BrakT: TBrakT;
  Dost : String;

implementation

uses Data, Pro, NomForm, DobTovBrF;

{$R *.DFM}

procedure TBrakT.FormActivate(Sender: TObject);
begin
     q.Prepare;
     q1.Prepare;
     With DataMain do
          begin
               BRTN.Open;
          end;
     Dost := DataMain.dost;
     SumTxt1;
     BrakT.ActiveControl := DE;
     Datamain.BRTN.First;
     if (Not(NasDost(Dost[27])) and (BrakT.Tag <> 1)) then BrakT.Tag := 1;
     if BrakT.Tag = 1 then begin
        DE.Enabled := False;
        DBMemo1.Enabled := False;
       end
     else
       begin
        DE.Enabled := True;
        DBMemo1.Enabled := True;
       end;
end;

procedure TBrakT.FormDeactivate(Sender: TObject);
begin
     With DataMain do
          begin
             //  Oper.Close;
               BRTN.Close;
          end;
     q.Close;
     q1.Close;
     q.UnPrepare;
     q1.UnPrepare;

        DE.Enabled := True;
        DBMemo1.Enabled := True;

end;



procedure TBrakT.DGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var S : String;
begin
S := '';
if BrakT.Tag = 0 then
     case Key of
          VK_INSERT : begin
                     DataMain.BrTn.OnCalcFields := nil;
                     Application.CreateForm(TDobTovBr, DobTovBr);
                     DobTovBr.ShowModal;
                     SumTXT1;
                     DataMain.BrTn.OnCalcFields := DataMain.BrTNCalcFields;
                     DataMain.BRTN.ApplyUpdates;
                     DataMain.IBTBR.CommitRetaining;
                     DataMain.BRTN.Refresh;
                     DobTovBr.Release;
                     end;
          VK_DELETE : if MessageDlg('������� �������?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                         begin
                         DataMain.Ost.Locate('Code', DataMain.BRTNCode.AsInteger,[]);
                         DataMain.Ost.Edit;
                         DataMain.Ost.FieldByName('Kol1').AsInteger := DataMain.BRTN.FieldByName('Kol').AsInteger+DataMain.Ost.FieldByName('Kol1').AsInteger;
                         DataMain.Ost.Post;
                         DataMain.BRTN.Delete;
                         DataMain.BRTN.ApplyUpdates;
                         DataMain.IBTBR.CommitRetaining;
                         DataMain.BRTN.Refresh;
                         SumTxt1;
                         end;
          VK_ESCAPE : BrakT.ActiveControl := DE;
     end;
end;

procedure SumTxt1;
var S,S1 : String;
begin
     S := BrakT.Label11.Caption;
     S1 := '';
     SumText(DataMain.BRTN.FieldByName('Nomer').asString,0,S,S1);
     BrakT.Label11.Caption := S;
end;

procedure SumText(A : String; P : Real; var S,S1 : String);
begin
with BrakT do begin
    Q1.Close;
    Q1.ParamByName('Nakl').AsString := A;
    Q1.Open;
    S := FloatToStr(Q1.FieldByName('Summa').AsFloat);
    S1 := FloatToStr(Q1.FieldByName('Summa').AsFloat*P);
end;
end;



procedure TBrakT.DGKeyPress(Sender: TObject; var Key: Char);
var A,B,C : Integer;
    S : String;
begin
     if BrakT.Tag = 0
      then
        case DG.SelectedIndex of
        2 : case Key of
               #13 : begin
                  B := DataMain.BRTN.FieldByName('Kol').AsInteger;
                  try
                  Application.CreateForm(TNomF, NomF);

                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     C := A*BRTN.FieldBYName('V_Up').AsInteger;
                     Ost.Refresh;
                    // Ost.FindKey([BRTN.FieldBYName('Code').AsInteger]);
                       Ost.Locate('Code', BRTN.FieldBYName('Code').AsInteger,[]);
                     if C <= BRTN.FieldByName('Ost').AsInteger+B
                      then
                          begin
                               Ost.Edit;
                               Ost.FieldByName('Kol1').AsInteger := Ost.FieldByName('Kol1').AsInteger + B - C;
                               Ost.Post;
                               BRTN.Edit;
                               BRTN.FieldByName('Up').AsInteger := A;
                               BRTN.FieldByName('Kol').AsInteger := C;
                               BRTN.Post;
                               BRTN.ApplyUpdates;
                               DataMain.IBT.CommitRetaining;
                               DataMain.IBTBR.CommitRetaining;
                               SumTxt1;
                          end
                      else
                          ShowMessage ('�� ������ ��� ������� ���������� ������!'+#13+#13+
                           '������� '+IntToStr(BRTN.FieldByName('Ost').AsInteger+B));
                     end;
                  finally
                    NomF.Release;
                  end;
                   end;
             End;
        3 : case Key of
               #13 : begin
                  B := DataMain.BRTN.FieldByName('Kol').AsInteger;
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     Ost.Refresh;
                   //  Ost.FindKey([BRTN.FieldBYName('Code').AsInteger]);
                       Ost.Locate('Code', BRTN.FieldBYName('Code').AsInteger,[]);
                     if A <= BRTN.FieldByName('Ost').AsInteger+B
                      then
                          begin
                               Ost.Edit;
                               Ost.FieldByName('Kol1').AsInteger := Ost.FieldByName('Kol1').AsInteger + B - A;
                               Ost.Post;
                               BRTN.Edit;
                               BRTN.FieldByName('Up').AsInteger := 0;
                               BRTN.FieldByName('Kol').AsInteger := A;
                               BRTN.Post;
                               BRTN.ApplyUpdates;
                               DataMain.IBT.CommitRetaining;
                               DataMain.IBTBR.CommitRetaining;
                               SumTxt1;
                          end
                      else
                          ShowMessage ('�� ������ ��� ������� ���������� ������!'+#13+#13+
                           '������� '+IntToStr(BRTN.FieldByName('Ost').AsInteger+B));
                     end;
                   end;
             End;
        4 : case Key of
               #13 : begin
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999,99;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     S := '';
                     S := NomF.Edit1.Text;
                     TrimAll(S);
                     BRTN.Edit;
                     BRTN.FieldByName('Price').AsFloat := StrToFloat(S);
                     BRTN.Post;
                     BRTN.ApplyUpdates;
                     DataMain.IBTBR.CommitRetaining;
                     SumTxt1;
                     end;
                  end;
             End;

        end;
if DataMain.Ost.State = dsBrowse then DataMain.Ost.Refresh;
if DataMain.BRTN.State = dsBrowse then DataMain.BRTN.Refresh;


end;

procedure TBrakT.DGEnter(Sender: TObject);
begin
    if BrakT.Tag = 0 then BrakT.KeyPreview := False;
end;

procedure TBrakT.DGExit(Sender: TObject);
begin
     if BrakT.Tag = 0 then BrakT.KeyPreview := True;
end;

procedure TBrakT.DEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then BrakT.ActiveControl := DG;
end;


procedure TBrakT.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_Escape then BrakT.Modalresult := mrOk;
end;

end.
