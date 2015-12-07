unit VozvnaklF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, StdCtrls, Mask,  Grids, DBGrids, Db, DBTables,
  Buttons, JvExMask, JvToolEdit, IBCustomDataSet, IBQuery;

  procedure SumTxt1;
  procedure SumText(A : String; P : Real; var S,S1 : String);


type
  TVozvNakl = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    DG: TDBGrid;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PRL: TDBLookupComboBox;
    Label3: TLabel;
    OsnE: TDBEdit;
    DE: TJvDateEdit;
    Q1: TIBQuery;
    Q1SUMMA: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    procedure DGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DGKeyPress(Sender: TObject; var Key: Char);
    procedure DGEnter(Sender: TObject);
    procedure DGExit(Sender: TObject);
    procedure PRLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure PRLDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
  Sk : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VozvNakl: TVozvNakl;

implementation

uses Data, Pro, NomForm, DobTovVozvF, SpravPokup;

{$R *.DFM}

procedure TVozvNakl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_ESCAPE then
   if DataMain.NaklVozvCode_pr.AsInteger = 0 then
      begin
           ShowMessage('�� ������ ���������!');
           Key := 0;
           VozvNakl.ActiveControl := PRL;
      end
   else
      VozvNakl.ModalResult := mrOk;

end;

procedure TVozvNakl.FormActivate(Sender: TObject);
var S : String;
begin

     q1.Prepare;
     With DataMain do
          begin
               Post.Open;
               TNVozv.Open;
          end;
     S := DataMain.Dost;
     SumTxt1;
     VozvNakl.ActiveControl := DE;
     Datamain.TNVozv.First;
     if (not(NasDost(S[3])) and (VozvNakl.Tag <> 1)) then VozvNakl.Tag := 1;
     if VozvNakl.Tag = 1 then begin
        DE.Enabled := False;
        PRL.Enabled := False;
        DBMemo1.Enabled := False;
        OsnE.Enabled := False;
       end
     else
       begin
        DE.Enabled := True;
        PRL.Enabled := True;
        DBMemo1.Enabled := True;
        OsnE.Enabled := True;
       end;
end;

procedure TVozvNakl.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Action := caFree;

end;

procedure TVozvNakl.FormDeactivate(Sender: TObject);
begin
     With DataMain do
          begin
               //Oper.Close;
               Post.Close;
               TNVozv.Close;
          end;
     q1.Close;
     q1.UnPrepare;

        DE.Enabled := True;
        PRL.Enabled := True;
        DBMemo1.Enabled := True;
        OsnE.Enabled := True;

end;



procedure TVozvNakl.DGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var S : String;
begin
S := '';
if VozvNakl.Tag = 0 then
     case Key of
          VK_INSERT : begin
                       Application.CreateForm(TDobTovVozv, DobTovVozv);
                       DobTovVozv.ShowModal;
                       DataMain.TNVozv.ApplyUpdates;
                       DataMain.IBTVozv.CommitRetaining;
                       SumTXT1;
                       DobTovVozv.Release;

                      end;
          VK_DELETE : if MessageDlg('������� �������?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                         begin
                         DataMain.TNVozv.Delete;
                         DataMain.TNVozv.ApplyUpdates;
                         DataMain.IBTVozv.CommitRetaining;
                         DataMain.TNVozv.Refresh;
                         SumTxt1;
                         end;
          VK_ESCAPE : VozvNakl.ActiveControl := DE;
     end;

end;

procedure SumTxt1;
var S,S1 : String;
    P : Real;
begin
     S := VozvNakl.Label11.Caption;
     S1 := '';
     P := 0;

     SumText(DataMain.TNVozv.FieldByName('Nomer').asString,P,S,S1);
     VozvNakl.Label11.Caption := S;

end;

procedure SumText(A : String; P : Real; var S,S1 : String);
begin
with VozvNakl do begin
    Q1.Close;
    Q1.ParamByName('Nakl').AsString := A;
    Q1.Open;
    S := FloatToStr(Q1.FieldByName('Summa').AsFloat);
    S1 := FloatToStr(Round(Q1.FieldByName('Summa').AsFloat*P*100)/100);
end;
end;



procedure TVozvNakl.DGKeyPress(Sender: TObject; var Key: Char);
var A, C : Integer;
    S : String;
begin
  Application.CreateForm(TNomF, NomF);
     if VozvNakl.Tag = 0
      then
        case DG.SelectedIndex of
        2 : case Key of
               #13 : begin
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     C := A*TNVozv.FieldBYName('V_Up').AsInteger;
                     TNVozv.Edit;
                     TNVozv.FieldByName('Up').AsInteger := A;
                     TNVozv.FieldByName('Kol').AsInteger := C;
                     TNVozv.Post;
                     SumTxt1;
                     TNVozv.ApplyUpdates;
                     DataMain.IBTVozv.CommitRetaining;
                     end;
                    End;
               end;
        3 : case Key of
               #13 : begin
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     TNVozv.Edit;
                     TNVozv.FieldByName('Up').AsInteger := 0;
                     TNVozv.FieldByName('Kol').AsInteger := A;
                     TNVozv.Post;
                     SumTxt1;
                     TNVozv.ApplyUpdates;
                     DataMain.IBTVozv.CommitRetaining;
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
                     TNVozv.Edit;
                     TNVozv.FieldByName('Price').AsFloat := StrToFloat(S);
                     TNVozv.Post;
                     TNVozv.ApplyUpdates;
                     DataMain.IBTVozv.CommitRetaining;
                     SumTxt1;
                     end;
                  end;
             End;

        end;
if DataMain.Ost.State = dsBrowse then DataMain.Ost.Refresh;
if DataMain.TNVozv.State = dsBrowse then DataMain.TNVozv.Refresh;
  NomF.Release;
end;



procedure TVozvNakl.DGEnter(Sender: TObject);
begin
     if VozvNakl.Tag = 0 then
     VozvNakl.KeyPreview := False;
end;

procedure TVozvNakl.DGExit(Sender: TObject);
begin
     if VozvNakl.Tag = 0 then
     VozvNakl.KeyPreview := True;
end;

procedure TVozvNakl.PRLDropDown(Sender: TObject);
begin
DataMain.Predpr.Last;
end;

procedure TVozvNakl.PRLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If VozvNakl.Tag = 0 then
     case Key of
          VK_DOWN,VK_UP : if not(VozvNakl.Prl.ListVisible) then Key := 0;
          VK_SPACE : if not(VozvNakl.Prl.ListVisible) then VozvNakl.Prl.DropDown;
          VK_RETURN : begin
                        VozvNakl.Prl.CloseUp(True);
                        VozvNakl.ActiveControl := OsnE;
                      end;
          VK_F6 : begin
            try
                Application.CreateForm(TSprPokup,SprPokup);
                SprPokup.vybor := true;
                SprPokup.FormStyle := fsNormal;
                SprPokup.Visible := false;
                SprPokup.A_WinCr.Execute;
                if SprPokup.ShowModal = mrok then
                begin
                  DataMain.NaklVozv.Edit;
                  DataMain.NaklVozvCode_PR.AsInteger := SprPokup.id_;
                  DataMain.NaklVozv.Post;
                  DataMain.NaklVozv.ApplyUpdates;
                  DataMain.IBTVozv.CommitRetaining;
                  PRL.Update;
                end;
            finally
              SprPokup.Release;
            end;
                  end;
          end;
end;


procedure TVozvNakl.DEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then VozvNakl.ActiveControl := PrL;
end;


procedure TVozvNakl.Timer1Timer(Sender: TObject);
begin
     with DataMain do
         begin
              NaklVozv.Refresh;
              Ost.Refresh;
              TNVozv.Refresh;
         end;

end;



end.
