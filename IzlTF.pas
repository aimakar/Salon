unit IzlTF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, StdCtrls, Mask, JvToolEdit, Grids, DBGrids, Db, DBTables,
  Buttons, JvExMask, IBCustomDataSet, IBQuery;

  procedure SumTxt1;
  procedure SumText(A : String; P : Real; var S,S1 : String);


type
  TIzlT = class(TForm)
    Label1: TLabel;
    Label2: TLabel;

    DBMemo1: TDBMemo;
    Label6: TLabel;
    DG: TDBGrid;
    Label9: TLabel;
    Label11: TLabel;
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
    procedure DEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);

  private
 
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IzlT: TIzlT;

implementation

uses Data, Pro, NomForm, DobTovIzlF;

{$R *.DFM}


procedure TIzlT.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_ESCAPE then
      IzlT.ModalResult := mrOk;

end;

procedure TIzlT.FormActivate(Sender: TObject);
var S : String;
begin
     q1.Prepare;
     With DataMain do
          begin
             IzlTN.Open;
          end;
     S := DataMain.dost;
     SumTxt1;
     IzlT.ActiveControl := DE;
     Datamain.IzlTN.First;
     if (not(NasDost(S[42])) and (IzlT.Tag <> 1)) then IzlT.Tag := 1;
     if IzlT.Tag = 1 then
       begin
        DE.Enabled := False;
        DBMemo1.Enabled := False;
       end
     else
       begin
        DE.Enabled := True;
        DBMemo1.Enabled := True;
       end;
  Application.CreateForm(TNomF, NomF);
end;

procedure TIzlT.FormDeactivate(Sender: TObject);
begin
     With DataMain do
          begin
            IzlTN.First;
            while not(IzlTN.Eof) do if IzlTNKol.AsInteger = 0 then IzlTN.Delete else IzlTN.Next;
                IzlTN.ApplyUpdates;
                DataMain.IBTIzl.CommitRetaining;
               IzlTN.Close;
          end;
     q1.Close;
     q1.UnPrepare;
     DE.Enabled := True;
     DBMemo1.Enabled := True;
     NomF.Release;



end;



procedure TIzlT.DGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var S : String;
begin
S := '';
if IzlT.Tag = 0 then
     case Key of
          VK_INSERT : begin
                       DataMain.IzlTn.OnCalcFields := nil;
                       Application.CreateForm(TDobTovIzl, DobTovIzl);
                       DobTovIzl.ShowModal;
                       SumTXT1;
                       DobTovIzl.Release;
                       DataMain.IzlTn.OnCalcFields := DataMain.IzlTNCalcFields;
                       DataMain.IzlTN.ApplyUpdates;
                       DataMain.IBTIzl.CommitRetaining;
                       Datamain.IzlTN.Refresh;
                      end;
          VK_DELETE : if MessageDlg('������� �������?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                         begin
                           DataMain.IzlTN.Delete;
                           DataMain.IzlTN.ApplyUpdates;
                           DataMain.IBTIzl.CommitRetaining;
                           DataMain.IzlTN.Refresh;
                           SumTxt1;
                         end;
          VK_ESCAPE : IzlT.ActiveControl := DE;
     end;

end;

procedure SumTxt1;
var S,S1 : String;
begin
     S := IzlT.Label11.Caption;
     S1 := '';
     SumText(DataMain.IzlTNNomer.asString,0,S,S1);
     IzlT.Label11.Caption := S;
end;

procedure SumText(A : String; P : Real; var S,S1 : String);
begin
with IzlT do begin
    Q1.Close;
    Q1.ParamByName('Nakl').AsString := A;
    Q1.Open;
    S := FloatToStr(Q1.FieldByName('Summa').AsFloat);
    S1 := FloatToStr(Q1.FieldByName('Summa').AsFloat*P);
end;
end;



procedure TIzlT.DGKeyPress(Sender: TObject; var Key: Char);
var S : String;
begin
     if IzlT.Tag = 0
      then
        case DG.SelectedIndex of
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
                     IzlTN.Edit;
                     IzlTN.FieldByName('Price').AsFloat := StrToFloat(S);
                     IzlTN.Post;
                     IzlTn.ApplyUpdates;
                     DataMain.IBTIzl.CommitRetaining;
                     SumTxt1;
                     end;
                  end;
             End;

        end;
if DataMain.Ost.State = dsBrowse then DataMain.Ost.Refresh;
if DataMain.IzlTN.State = dsBrowse then DataMain.IzlTN.Refresh;


end;

//end;


procedure TIzlT.DGEnter(Sender: TObject);
begin
     if IzlT.Tag =0 then
     IzlT.KeyPreview := False;
end;

procedure TIzlT.DGExit(Sender: TObject);
begin
     if IzlT.Tag =0 then
     IzlT.KeyPreview := True;
end;



procedure TIzlT.DEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then IzlT.ActiveControl := DG;
end;


procedure TIzlT.Timer1Timer(Sender: TObject);
begin
     with DataMain do
         begin
              IzlNakl.Refresh;
              Ost.Refresh;
              IzlTN.Refresh;
         end;

end;

end.
