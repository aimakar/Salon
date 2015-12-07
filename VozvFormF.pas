unit VozvFormF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, StdCtrls, Buttons, DBTables, ExtCtrls,  FileCtrl, ToolWin,
  ActnMan, ActnCtrls, JvExDBGrids, JvDBGrid, ActnList, XPStyleActnCtrls;
type
  TVozvForm = class(TForm)
    ActionManager1: TActionManager;
    A_Ins: TAction;
    A_Edit: TAction;
    A_Del: TAction;
    Action1: TAction;
    Action3: TAction;
    DBGrid1: TJvDBGrid;
    ActionToolBar1: TActionToolBar;
    Action4: TAction;
    A_WinCR: TAction;
    A_Prov: TAction;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure A_EditExecute(Sender: TObject);
    procedure A_DelExecute(Sender: TObject);
    procedure A_InsExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure A_WinCRExecute(Sender: TObject);
    procedure A_ProvExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VozvForm: TVozvForm;
  Dost : String;
implementation

uses Data,  Pro, VozvnaklF;

{$R *.DFM}
procedure refr;
var
  nomer: string;
begin
with datamain do
    begin
      if NaklVozv.RecordCount = 0 then exit;
      nomer := NaklVozv.FieldByName('NOMER').AsString;
      NaklVozv.Close;
      NaklVozv.Open;
      NaklVozv.Locate('NOMER', nomer, []);
    end;

end;

procedure TVozvForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    VozvForm.Release;
  end;

end;

procedure TVozvForm.FormActivate(Sender: TObject);
begin
  With DataMain do
  begin
    Post.Open;
    NaklVozv.Open;
    Ost.Open;

  end;
end;

procedure TVozvForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var c : Boolean;
a: string;
begin
if DataMain.NaklVozv.RecordCount<>0 then
Begin
a := trim(DataMain.NaklVozvPriz.AsString[1]);
//ex := DataMain.NaklVozvExp.AsBoolean;

with DBGrid1.Canvas do begin
     if (a='1') and (not (gdFocused in State)) then
      begin
       Font.Color := clGreen;
       FillRect (Rect);
       TextOut(Rect.Left,Rect.Top,Column.Field.Text);
       c := false;
      end
     else DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     if gdFocused in State then
      begin
       if (a='1') then
          A_Prov.Enabled := False
       else
          A_Prov.Enabled := True;
      end;

end;
End;

end;

procedure TVozvForm.Action1Execute(Sender: TObject);
var s : string;
begin
if InputQuery('����� �� ������','������� �����',S) then
                  With Datamain.NaklVozv do
                       begin
                            DisableControls;
                            Locate('Nomer',S,[loPartialKey]);
                            enableControls;
                       end;
end;

procedure TVozvForm.Action4Execute(Sender: TObject);
var l : boolean;
var s : string;
begin
             L := True;
               if InputQuery('����� �� �������','������� ���������',S) then
                  With Datamain.NaklVozv do
                       begin
                            Tag := 0;
                            DisableControls;
                            while L do
                                  if Pos(AnsiUpperCase(S),AnsiUpperCase(FieldByName('Naim').aSsTRING)) <> 0 then
                                    L := False
                                  else
                                    begin
                                      Next;
                                      L := not(Eof);
                                    end;
                            enableControls;
                       end;

end;

procedure TVozvForm.A_DelExecute(Sender: TObject);
begin
                 if not(trim(DataMain.NaklVozvPriz.AsString)='1' )  then
                  if MessageDlg('������� ���������?',
                     mtConfirmation, [mbNo, mbYes], 0) = mrYes then
                        With DataMain do begin
                           Tovar.Open;
                           Ost.Open;
                           TNVozv.Open;
                           TNVozv.First;
                           While not(DataMain.TNVozv.Eof) do
                            TNVozv.Delete;
                            NaklVozv.Delete;
                            NaklVozv.ApplyUpdates;
                            TNVozv.ApplyUpdates;
                            DataMain.IBTVozv.CommitRetaining;
                        //   TNVozv.Close;
                        //    Ost.Close;
                        //    Tovar.Close;

                        end;
      Refr;
end;

procedure TVozvForm.A_EditExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TVozvNakl, VozvNakl);
    With DataMain do
    begin
      if (trim(NaklVozvPriz.AsString)='1') then VozvNakl.tag := 1 else VozvNakl.tag := 0;
      VozvNakl.Label2.Caption := NaklVozvNomer.AsString;
      VozvNakl.DE.Text := NaklVozvOt.AsString;
      VozvNakl.ShowModal;
      if NaklVozv.State = dsBrowse then NaklVozv.Edit;
      NaklVozvOperacDat.AsdateTime := Now;
      NaklVozvOt.AsString := VozvNakl.DE.Text;
      NaklVozvSumma.AsFloat := StrToFloat(Trim(VozvNakl.Label11.Caption));
      NaklVozv.Post;
      NaklVozv.ApplyUpdates;
      DataMain.IBTVozv.CommitRetaining;
    end;
  finally
    VozvNakl.Release;
  end;
  Refr;
end;

procedure TVozvForm.A_InsExecute(Sender: TObject);
var s1, s : string;
begin
  try
    Application.CreateForm(TVozvNakl, VozvNakl);
    Datamain.NaklVozv.DisableControls;
    VozvNakl.Tag := 0;
    S1 := '-��';
    Datamain.ConfigVit.Open;
    DataMain.ConfigVit.Refresh;
    DataMain.ConfigVit.Edit;
    S := Trim(Datamain.ConfigVit.FieldByName('Nomer4').AsString);
    IncNom(S,S1);
    DataMain.ConfigVit.FieldByName('Nomer4').AsString := S;
    DataMain.ConfigVit.Post;
    Datamain.ConfigVit.Close;
    With DataMain.NaklVozv do
    begin
      Append;
      FieldByName('OperacDat').AsdateTime := Now;
      FieldByName('Prov1D').AsdateTime := Now;
      FieldByName('Nomer').AsString := S;
      FieldByName('Ot').AsDateTime := Date();
      FieldByName('Priz').AsString := '0';
      Post;
      VozvNakl.Label2.Caption := FieldByName('Nomer').AsString;
      VozvNakl.DE.Text := FieldByName('Ot').AsString;
      DataMain.NaklVozv.EnableControls;
      VozvNakl.ShowModal;
      Edit;
      FieldByName('Ot').AsString := VozvNakl.DE.Text;
      FieldByName('Summa').AsFloat := StrToFloat(Trim(VozvNakl.Label11.Caption));
      Post;
      DataMain.NaklVozv.ApplyUpdates;
      DataMain.IBTVozv.CommitRetaining;
      DataMain.IBT.CommitRetaining;
    end;
  finally
    VozvNakl.Release;
  end;
  Refr;
end;

procedure TVozvForm.A_ProvExecute(Sender: TObject);
begin
 if MessageDlg('������� �����?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  With DataMain do
  if (not (trim(NaklVozvPriz.AsString) = '1')) and (NaklVozvSumma.AsFloat>0) then
  begin
    Tovar.Open;
    Ost.Open;
    Ost.First;
    TNVozv.Open;
    TNVozv.First;
    while not(TNVozv.EOF) do
    begin
      Ost.Locate('Code', TNVozvCode.AsInteger,[]);
      Ost.Edit;
      OstKol2.AsInteger := OstKol2.AsInteger + TNVozvKol.AsInteger;
      OstKol1.AsInteger := OstKol1.AsInteger + TNVozvKol.AsInteger;
      Ost.post;
      TNVozv.Next;
    end;
    NaklVozv.Edit;
    NaklVozvPriz.AsString := '1';
    NaklVozvPrizDat.AsDateTime := Now;
    NaklVozvProv2D.AsDateTime := Now;
    NaklVozv.Post;
    NaklVozv.ApplyUpdates;
    DataMain.IBTVozv.CommitRetaining;
  end;

end;

procedure TVozvForm.A_WinCRExecute(Sender: TObject);
begin
  Dost := DataMain.dost;
end;

procedure TVozvForm.Timer1Timer(Sender: TObject);
begin
  DataMain.NaklVozv.Refresh;
end;

procedure TVozvForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TVozvForm.FormCreate(Sender: TObject);
begin
if not DataMain.IBTVozv.InTransaction then DataMain.IBTVozv.StartTransaction;
if not DataMain.IBT.InTransaction then DataMain.IBT.StartTransaction;
end;

procedure TVozvForm.FormDestroy(Sender: TObject);
begin
DataMain.Ost.Close;
DataMain.Ost.Open;
if DataMain.IBTVozv.InTransaction then DataMain.IBTVozv.Commit;
if DataMain.IBT.InTransaction then DataMain.IBT.Commit;
end;

end.
