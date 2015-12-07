unit IzlFormF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, StdCtrls, Buttons, DBTables, ExtCtrls, FileCtrl, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, JvExDBGrids, JvDBGrid, ibtable;
    procedure Prin;
    
type
  TIzlForm = class(TForm)
    ActionManager1: TActionManager;
    A_Ins: TAction;
    A_Edit: TAction;
    A_Del: TAction;
    Action1: TAction;
    Action3: TAction;
    A_WinCr: TAction;
    ActionToolBar1: TActionToolBar;
    ToB: TAction;
    A_Refr: TAction;
    JvDBGrid1: TJvDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure A_PrintExecute(Sender: TObject);
    procedure ToBExecute(Sender: TObject);
    procedure A_InsExecute(Sender: TObject);
    procedure A_EditExecute(Sender: TObject);
    procedure A_DelExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure A_RefrExecute(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IzlForm: TIzlForm;
  Dost : String;

implementation

uses Data, Pro, IzlTF, Sklad;

{$R *.DFM}


procedure TIzlForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then
        begin
             IzlForm.Release;
        end;

end;

procedure TIzlForm.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var a: String;
begin
if DataMain.IzlNakl.RecordCount <>0 then
begin
a := DataMain.IzlNaklPriz.AsString[1];
with JvDBGrid1.Canvas do begin
     if (a='1') and (not (gdFocused in State)) then
      begin
       Font.Color := clGreen;
       FillRect (Rect);
       TextOut(Rect.Left,Rect.Top,Column.Field.Text);
      end
     else JvDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     if gdFocused in State then
      begin
       if a='1' then ToB.Enabled := False
       else          ToB.Enabled := True;
      end;
end;
end;

end;

procedure TIzlForm.ToBExecute(Sender: TObject);
var S,S1: String;
begin
if MessageDlg('������� �������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    with DataMain do
     if not(trim(IzlNaklPriz.ASString)='1') and (IzlNaklSumma.AsFloat>0) then
     begin
     Tovar.Open;
     Ost.Open;
     IzlTn.Open;
     IzlTn.First;
     while not(IzlTn.EOF) do
          begin
              // Ost.FindKey([IzlTnCode.AsInteger]);
               Ost.Locate('Code', IzlTNCode.AsInteger,[]);
               Ost.Edit;
               OstKol2.AsInteger := OstKol2.AsInteger + IzlTnKol.AsInteger;
               OstKol1.AsInteger := OstKol1.AsInteger + IzlTnKol.AsInteger;
               Ost.post;
               IzlTn.Next;
          end;
             //  IzlTn.Close;
             //  Tovar.Close;
      IzlNakl.Edit;
      IzlNaklPrizdat.AsDateTime := Now;
      IzlNaklPriz.AsString := '1';
      IzlNakl.Post;
      IzlNakl.ApplyUpdates;
      DataMain.IBT.CommitRetaining;
      DataMain.IBTIzl.CommitRetaining;
      IzlForm.ToB.Enabled := False;
     end;
  A_Refr.Execute;
end;

procedure TIzlForm.FormActivate(Sender: TObject);
begin
     With DataMain do
          begin

               IzlNakl.Open;
               Ost.Open;
          end;
  Dost := DataMain.Dost;
end;

procedure TIzlForm.FormDeactivate(Sender: TObject);
begin
//  CloseData;


end;

procedure Prin;
var s,S1 : String;
begin
end;


procedure TIzlForm.Action1Execute(Sender: TObject);
var S : string;
begin
if InputQuery('����� �� ������','������� �����',S) then
                  With Datamain.IzlNakl do
                       begin
                            DisableControls;
                            Locate('Nomer',S,[loPartialKey]);
                            enableControls;
                       end;
end;

procedure TIzlForm.A_DelExecute(Sender: TObject);
begin
                 if not(trim(DataMain.IzlNakl.FieldByName('Priz').AsString)='1')  then
                  if MessageDlg('������� ���������?',
                     mtConfirmation, [mbNo, mbYes], 0) = mrYes then
                        With DataMain do
                        begin
                           Tovar.Open;
                           Ost.Open;
                           IzlTN.Open;
                           IzlTN.First;
                           While not(DataMain.IzlTN.Eof) do
                              IzlTN.Delete;
                              IzlNakl.Delete;
                              IzlTn.ApplyUpdates;
                              IzlNakl.ApplyUpdates;
                              DataMain.IBT.CommitRetaining;
                              DataMain.IBTIzl.CommitRetaining;
                         //  IzlTN.Close;
                           Ost.Close;
                           Tovar.Close;
                        end;
    A_Refr.Execute;
end;

procedure TIzlForm.A_EditExecute(Sender: TObject);
begin
               if Datamain.IzlNakl.IsEmpty
                      then
                          ShowMessage('�� �������� �� �����, ��� ������ ���!')
                      else
                          With DataMain do
                              begin
                                Application.CreateForm(TIzlT, IzlT);
                                   if (trim(IzlNaklPriz.AsString)='1') then IzlT.tag := 1 else IzlT.tag := 0;
                                   IzlT.Label2.Caption := IzlNakl.FieldByName('Nomer').AsString;
                                   IzlT.DE.Text := IzlNakl.FieldByName('Ot').AsString;
                                   IzlT.ShowModal;
                                   if IzlNakl.State = dsBrowse then IzlNakl.Edit;
                                   IzlNakl.FieldByName('Ot').AsString := IzlT.DE.Text;
                                   IzlNakl.FieldByName('Summa').AsFloat := StrToFloat(Trim(IzlT.Label11.Caption));
                                   IzlNakl.Post;
                                   IzlNakl.ApplyUpdates;
                                   DataMain.IBTIzl.CommitRetaining;
                                   IzlT.Release;
                              end;
     A_Refr.Execute;
end;

procedure TIzlForm.A_InsExecute(Sender: TObject);
var i : integer;
S, S1 : string;
begin
                        Datamain.ConfigVit.open;
                        I := Datamain.ConfigVit.FieldByName('Nomer18').AsInteger + 1;
                        Datamain.ConfigVit.Edit;
                        Datamain.ConfigVit.FieldByName('Nomer18').AsInteger := I;
                        Datamain.ConfigVit.Post;
                        Datamain.ConfigVit.Close;
                        S1 := '-���';
                        S := IntToStr(I) + S1;
                        With DataMain.IzlNakl do
                            begin
                                 Append;
                                 FieldByName('Nomer').AsString := S;
                                 FieldByName('Ot').AsDateTime := Date();
                                 FieldByName('Priz').AsString := '0';
                                 Post;
                                 Application.CreateForm(TIzlT, IzlT);
                                 IzlT.Label2.Caption := FieldByName('Nomer').AsString;
                                 IzlT.DE.Text := FieldByName('Ot').AsString;
                                 IzlT.ShowModal;
                                 Edit;
                                 FieldByName('Ot').AsString := IzlT.DE.Text;
                                 FieldByName('Summa').AsFloat := StrToFloat(Trim(IzlT.Label11.Caption));
                                 Post;
                                 ApplyUpdates;
                                 DataMain.IBT.CommitRetaining;
                                 DataMain.IBTIzl.CommitRetaining;
                                 IzlT.Release;
                            end;
    A_Refr.Execute;
end;

procedure TIzlForm.A_PrintExecute(Sender: TObject);
begin
  Prin;

end;

procedure TIzlForm.A_RefrExecute(Sender: TObject);
var s : string;
dataset : tibtable;
begin
  with datamain do
  begin
    dataset := datamain.IzlNakl;
    dataset.DisableControls;
    if not dataset.IsEmpty then S := dataset.fieldbyName('nomer').AsString else s := '';
    dataset.Close;
    dataset.Open;
    if S <> '' then  dataset.Locate('nomer', s, []);
    dataset.EnableControls;
  end;
end;

procedure TIzlForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DataMain.Ost.Close;
DataMain.Ost.Open;
if  DataMain.IBT.InTransaction then  DataMain.IBT.Commit;
if  DataMain.IBTIzl.InTransaction then  DataMain.IBTIzl.Commit;
  Action := caFree;
end;

procedure TIzlForm.FormCreate(Sender: TObject);
begin
if not DataMain.IBT.InTransaction then  DataMain.IBT.StartTransaction;
if not DataMain.IBTIzl.InTransaction then  DataMain.IBTIzl.StartTransaction;
end;

end.
