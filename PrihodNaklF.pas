unit PrihodNaklF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, StdCtrls, Mask,  Grids, DBGrids, Db, DBTables,
  Buttons, JvExMask, JvToolEdit, IBCustomDataSet, IBQuery;

  procedure SumTxt1;
  procedure SumText(A : String; P : Real; var S,S1 : String);


type
  TPrihodNakl = class(TForm)
    DG: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DE: TJvDateEdit;
    Label12: TLabel;
    PRL: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    Label11: TLabel;
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
    procedure GRKCloseUp(Sender: TObject);
    procedure PRLDropDown(Sender: TObject);

  private
  Sk : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrihodNakl: TPrihodNakl;

implementation

uses Data, Pro, NomForm, DobTovPrihF,
  NewPostF, SprNewPredpr, SprPostVybF;

{$R *.DFM}



procedure TPrihodNakl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_ESCAPE then
   if DataMain.NaklPrihCode_pr.AsInteger = 0 then
      begin
           ShowMessage('Не выбран поставщик!');
           Key := 0;
           PrihodNakl.ActiveControl := PRL;
      end
   else
      PrihodNakl.ModalResult := mrOk;

end;

procedure TPrihodNakl.FormActivate(Sender: TObject);
var S : String;
begin
     q1.Prepare;
     With DataMain do
          begin
               Post.Open;
               TNPrih.Open;
          end;
     S := DataMain.dost;
     SumTxt1;
     PrihodNakl.ActiveControl := DE;
     Datamain.TNPrih.First;
     if (not(NasDost(S[22])) and (PrihodNakl.Tag <> 1)) then PrihodNakl.Tag := 1;
     if PrihodNakl.Tag = 1 then begin
        DE.Enabled := False;
        PRL.Enabled := False;
        DBMemo1.Enabled := False;
       end
     else
       begin
        DE.Enabled := True;
        PRL.Enabled := True;
        DBMemo1.Enabled := True;
       end;
end;

procedure TPrihodNakl.FormDeactivate(Sender: TObject);
begin
     With DataMain do
          begin
         //   Oper.Close;
            TNPrih.Close;
          end;
     q1.Close;
     q1.UnPrepare;
        DE.Enabled := True;
        PRL.Enabled := True;
        DBMemo1.Enabled := True;
end;



procedure TPrihodNakl.DGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var S : String;
    L : Boolean;
begin
S := '';
if PrihodNakl.Tag = 0 then
     case Key of
          VK_INSERT : begin
                     DataMain.TnPrih.OnCalcFields := nil;
                     Application.CreateForm(TDobTovPrih, DobTovPrih);
                     DobTovPrih.ShowModal;
                     SumTXT1;
                     DataMain.TnPrih.OnCalcFields := DataMain.TNPrihCalcFields;
                     DataMain.TNPrih.ApplyUpdates;
                     DataMain.IBTPrih.CommitRetaining;
                     Datamain.TNPrih.Refresh;
                     DobTovPrih.Release;
                     end;
          VK_DELETE : begin if MessageDlg('Удалить позицию?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                         begin
                         DataMain.TNPrih.Delete;
                         end;
                         DataMain.TNPrih.ApplyUpdates;
                         DataMain.IBTPrih.CommitRetaining;
                         Datamain.TNPrih.Refresh;
                       SumTxt1;
                        end;

          VK_ESCAPE : PrihodNakl.ActiveControl := DE;
          VK_F6 : if InputQuery('Поиск по наименованию','Введите подстроку',S) then
                  With Datamain.TnPrih do
                       begin
                            DisableControls;
                            L := not(Eof);
                            while L do begin
                              if Pos(AnsiUpperCase(S),AnsiUpperCase(FieldByName('Naim').AsString))=0 then
                                 Next
                              else
                                  L :=False;
                              if Eof then L := False;
                            end;
                            enableControls;
                       end;


     end
else
    if Key = VK_F6 then
                  if InputQuery('Поиск по наименованию','Введите подстроку',S) then
                  With Datamain.TnPrih do
                       begin
                            DisableControls;
                            L := not(Eof);
                            while L do begin
                              if Pos(AnsiUpperCase(S),AnsiUpperCase(FieldByName('Naim').AsString))=0 then
                                 Next
                              else
                                  L :=False;
                              if Eof then L := False;
                            end;
                            enableControls;
                       end;


end;

procedure SumTxt1;
var S,S1 : String;
    P : Real;
begin
     S := PrihodNakl.Label11.Caption;
     S1 := '';
     P := 1;

     SumText(DataMain.NaklPrihNomer.asString,P,S,S1);
     PrihodNakl.Label11.Caption := S;
end;

procedure SumText(A : String; P : Real; var S,S1 : String);
begin
with PrihodNakl do begin
    Q1.Close;
    Q1.ParamByName('Nakl').AsString := A;
    Q1.Open;
    S := FloatToStr(Q1Summa.AsFloat);
end;
end;



procedure TPrihodNakl.DGKeyPress(Sender: TObject; var Key: Char);
var A,B,C : Integer;
    S : String;
begin
     if PrihodNakl.Tag = 0
      then
        case DG.SelectedIndex of
        2 : case Key of
               #13 : begin
                  B := DataMain.TNPrih.FieldByName('Kol').AsInteger;
                  Application.CreateForm(TNomF, NomF);
                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     C := A*TNPrih.FieldBYName('V_Up').AsInteger;
                     TNPrih.Edit;
                     TNPrih.FieldByName('Up').AsInteger := A;
                     TNPrih.FieldByName('Kol').AsInteger := C;
                     TNPrih.Post;
                     TNPrih.ApplyUpdates;
                     DataMain.IBTPrih.CommitRetaining;
                     SumTxt1;
                     end;
                   NomF.Release;
                    End;
               end;
        3 : case Key of
               #13 : begin
                  B := DataMain.TNPrih.FieldByName('Kol').AsInteger;
                  Application.CreateForm(TNomF, NomF);

                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     A := StrToInt(Trim(NomF.Edit1.Text));
                     TNPrih.Edit;
                     TNPrih.FieldByName('Up').AsInteger := 0;
                     TNPrih.FieldByName('Kol').AsInteger := A;
                     TNPrih.Post;
                     TNPrih.ApplyUpdates;
                     DataMain.IBTPrih.CommitRetaining;
                     SumTxt1;
                     end;
                   NomF.Release;
                   end;
             End;
        4 : case Key of
               #13 : begin
                  Application.CreateForm(TNomF, NomF);

                  NomF.Edit1.Text := '';
                  NomF.Edit1.EditMask := '99999,99;; ';
                  if NomF.ShowModal = mrOk
                   then
                     with datamain do begin
                     S := '';
                     S := NomF.Edit1.Text;
                     TrimAll(S);
                     TNPrih.Edit;
                     TNPrih.FieldByName('Price').AsFloat := StrToFloat(S);
                     TNPrih.Post;
                     TNPrih.ApplyUpdates;
                     DataMain.IBTPrih.CommitRetaining;
                     SumTxt1;
                     end;
                  NomF.Release;
                  end;
             End;

        end;
if DataMain.Ost.State = dsBrowse then DataMain.Ost.Refresh;
if DataMain.TNPrih.State = dsBrowse then DataMain.TNPrih.Refresh;


end;

//end;


procedure TPrihodNakl.DGEnter(Sender: TObject);
begin
if PrihodNakl.Tag=0 then
     PrihodNakl.KeyPreview := False;
end;

procedure TPrihodNakl.DGExit(Sender: TObject);
begin
if PrihodNakl.Tag=0 then
     PrihodNakl.KeyPreview := True;
end;

procedure TPrihodNakl.PRLDropDown(Sender: TObject);
begin
DataMain.Post.Last;
end;

procedure TPrihodNakl.PRLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var NameI : String;
    I : Integer;
begin
     If PrihodNakl.Tag = 0 then
     case Key of
          VK_DOWN,VK_UP : if not(PrihodNakl.Prl.ListVisible) then Key := 0;
          VK_SPACE : if not(PrihodNakl.Prl.ListVisible) then PrihodNakl.Prl.DropDown;
          VK_RETURN : begin
                        PrihodNakl.Prl.CloseUp(True);
                      end;
          VK_F6 : begin
                Application.CreateForm(TSprPostVyb,SprPostVyb);
                SprPostVyb.ShowModal;
                if SprPostVyb.Tag <> 0 then begin
                DataMain.NaklPrih.Edit;
                DataMain.NaklPrihCode_PR.AsInteger := SprPostVyb.Tag;
                DataMain.NaklPrih.Post;
                DataMain.NaklPrih.ApplyUpdates;
                DataMain.IBTPrih.CommitRetaining;
                PRL.Update;
                end;
                SprPostVyb.Release;
                  end;
          end;
     If PrihodNakl.Tag = 0 then
     case Key of
          VK_INSERT : begin
            Application.CreateForm(TNewPost, NewPost);
                    NewPost.Caption := 'Добаление нового поставщика';
                    NewPost.CheckBox1.Enabled := True;
                    NewPost.CheckBox2.Enabled := True;
                    With DataMain do
                         begin
                              Post.Refresh;
                              NameI := Post.IndexName;
                              Post.IndexName := '';
                              Post.Last;
                              I := Post.FieldByName('Code_Post').AsInteger;
                              Post.IndexName := NameI;
                              Post.Append;
                              Post.FieldByName('Code_Post').AsInteger := I+1;
                              Post.FieldByName('Cons').AsInteger :=0;
                              Post.Post;
                              Post.ApplyUpdates;
                              DataMain.IBT.CommitRetaining;
                              Post.Edit;
//                                   Timer1.Enabled :=False;

                              if NewPost.ShowModal = mrCancel then
                                 begin
                                      Post.Cancel;
                                      Post.Delete;
                                      Post.ApplyUpdates;
                                      DataMain.IBT.CommitRetaining;
                                 end
                              else
                                  Post.post;
                                  Post.ApplyUpdates;
                                  DataMain.IBT.CommitRetaining;
//                                   Timer1.Enabled :=True;

                              If NewPost.CheckBox1.Checked then begin
                                 Predpr.Open;
                                 NameI := Predpr.Indexname;
                                 Predpr.IndexName :='';
                                 Predpr.Last;
                                 I := Predpr.FieldByName('Code_Pr').AsInteger;
                                 Predpr.IndexName :=NameI;
                                 Predpr.Append;
                                 Predpr.FieldByName('Code_Pr').AsInteger := I+1;
                                 Predpr.FieldByName('Naim').AsString := Post.FieldByName('Naim').AsString;
                                 Predpr.Post;
                                 Post.ApplyUpdates;
                                 DataMain.IBT.CommitRetaining;
                                 if MessageDlg('Желаете отредактировать данные клиента?',
                                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                                 begin
                                  Application.CreateForm(TNewPredpr, NewPredpr);
                                      Predpr.Edit;
                                      NewPredpr.ShowModal;
                                      Predpr.Post;
                                      Post.ApplyUpdates;
                                      DataMain.IBT.CommitRetaining;
                                  NewPredpr.Release;
                                 end;
                                 Predpr.Close;
                              end;
                              If NewPost.CheckBox2.Checked then begin
                                 Proiz.Open;
                                 NameI := Proiz.IndexName;
                                 Proiz.IndexName := '';
                                 Proiz.Last;
                                 I := Proiz.FieldByName('Code_Proiz').AsInteger;
                                 Proiz.IndexName := NameI;
                                 Proiz.Append;
                                 Proiz.FieldByName('Code_Proiz').AsInteger := I+1;
                                 Proiz.FieldByName('Naim').AsString := Post.FieldByName('Naim').AsString;
                                 Proiz.FieldByName('Naim').AsString := Post.FieldByName('Prim').AsString;
                                 Proiz.Post;
                                 Post.ApplyUpdates;
                                 DataMain.IBT.CommitRetaining;
                                 Proiz.Close;
                              end;
                         end;
                         NewPost.Release;
                      end;
          VK_DOWN,VK_UP : if not(PrihodNakl.Prl.ListVisible) then Key := 0;
          VK_SPACE : if not(PrihodNakl.Prl.ListVisible) then PrihodNakl.Prl.DropDown;
          VK_RETURN : begin
                        PrihodNakl.Prl.CloseUp(True);
                      end;
          end;
end;


procedure TPrihodNakl.DEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then PrihodNakl.ActiveControl := PrL;
end;


procedure TPrihodNakl.Timer1Timer(Sender: TObject);
begin
     with DataMain do
         begin
              NaklPrih.Refresh;
              Ost.Refresh;
              TNPrih.Refresh;
         end;

end;

procedure TPrihodNakl.GRKCloseUp(Sender: TObject);
begin
     SumTXT1;
end;

end.
