unit BrakFormF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, StdCtrls, Buttons, DBTables, ExtCtrls,  FileCtrl,
  ActnList, XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, JvExDBGrids, JvDBGrid, IBTable, IBQuery;
    procedure Prin;
type
  TBrakForm = class(TForm)
    ActionManager1: TActionManager;
    A_Ins: TAction;
    A_Edit: TAction;
    A_Del: TAction;
    Action1: TAction;
    Action3: TAction;
    A_WinCr: TAction;
    ActionToolBar1: TActionToolBar;
    ToB: TAction;
    JvDBGrid1: TJvDBGrid;
    A_Refr: TAction;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure A_PrintExecute(Sender: TObject);
    procedure ToBExecute(Sender: TObject);
    procedure A_InsExecute(Sender: TObject);
    procedure A_DelExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure A_EditExecute(Sender: TObject);
    procedure A_RefrExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrakForm: TBrakForm;
  Dost : String;

implementation

uses Data, Pro, BrakTF, Sklad;

{$R *.DFM}

procedure TBrakForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then
        begin
             BrakForm.Release;
        end;


end;

procedure TBrakForm.ToBExecute(Sender: TObject);
var S,S1: String;
begin
 if MessageDlg('������� �����?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      With DataMain do
        if not (trim(BrNaklPRIZ.AsString)='1') and ( BRNaklSumma.AsFloat>0) then
            begin
             Tovar.Open;
             Ost.Open;
             Ost.First;
             BRTN.Open;
             BRTN.First;
             while not(BRTN.EOF) do
              begin
               Ost.Locate('Code', BRTNCode.AsInteger,[]);
               Ost.Edit;
               OstKol2.AsInteger := OstKol2.AsInteger - BRTNKol.AsInteger;
               Ost.post;
               BRTN.Next;
              end;
             BRTN.Close;
             BrNakl.Edit;
             BrNaklPriz.AsString := '1';
             BrNaklPrizDat.AsDateTime := Now;
             BrNakl.Post;
             BrNakl.ApplyUpdates;
             DataMain.IBT.CommitRetaining;
             DataMain.IBTBR.CommitRetaining;
             BrakForm.ToB.Enabled := False;
            end;
  A_refr.Execute;
end;

procedure TBrakForm.FormActivate(Sender: TObject);
begin
     With DataMain do
          begin
              if not IBTBR.InTransaction then  IBTBR.StartTransaction;
              if not IBT.InTransaction then  IBT.StartTransaction;
              BRNakl.Open;
              Ost.Open;
          end;
  Dost := DataMain.dost;


end;

procedure TBrakForm.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn;  State: TGridDrawState);
var a: String;
begin
if DataMain.BRNakl.RecordCount<>0 then
begin
a := DataMain.BRNaklPriz.AsString[1];
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


procedure Prin;
begin
end;


procedure TBrakForm.Action1Execute(Sender: TObject);
var S : string;
begin
if InputQuery('����� �� ������','������� �����',S) then
                  With Datamain.BrNakl do
                       begin
                            DisableControls;
                            Locate('Nomer',S,[loPartialKey]);
                            enableControls;
                       end;
end;

procedure TBrakForm.A_DelExecute(Sender: TObject);
var i : integer;
  L : boolean;
begin
                 if not(trim(DataMain.BRNakl.FieldByName('Priz').AsString)='1')  then
                  if MessageDlg('������� ���������?',
                     mtConfirmation, [mbNo, mbYes], 0) = mrYes then
                        With DataMain do begin
                           Tovar.Open;
                           Ost.Open;
                           BRTN.Open;
                           BRTN.First;
                           While not(DataMain.BRTN.Eof) do
                             begin
                             I := BRTNKol.AsInteger;
                             if not(Ost.Locate('Code', BRTN.FieldByName('Code').AsInteger,[])) and not(I=0) then
                                begin
                                  BRTN.Next;
                                  L := True;
                                end
                             else
                                begin
                                  Ost.Edit;
                                  OstKol1.AsInteger := OstKol1.AsInteger + I;
                                  Ost.Post;
                                  BRTN.Delete;
                                  BRTN.ApplyUpdates;
                                  DataMain.IBT.CommitRetaining;
                                  DataMain.IBTBR.CommitRetaining;
                                end;
                             end;
                           if not(L) then BRNakl.Delete;
                             BrNakl.ApplyUpdates;
                             DataMain.IBTBR.CommitRetaining;
                        end;
  A_refr.Execute;
end;

procedure TBrakForm.A_EditExecute(Sender: TObject);
begin
               if Datamain.BRNakl.IsEmpty
                      then
                          ShowMessage('�� �������� �� �����, ��� ������ ���!')
                      else
                          With DataMain do
                              begin
                                Application.CreateForm(TBrakT, BrakT);
                                   if (trim(BRNaklPriz.AsString)='1') then BrakT.tag := 1 else BrakT.tag := 0;
                                   BrakT.Label2.Caption := BRNaklNomer.AsString;
                                   BrakT.DE.Text := BRNaklOt.AsString;
                                   BrakT.ShowModal;
                                   if BRNakl.State = dsBrowse then BRNakl.Edit;
                                   BRNakl.FieldByName('Ot').AsString := BrakT.DE.Text;
                                   BRNakl.FieldByName('Summa').AsFloat := StrToFloat(Trim(BrakT.Label11.Caption));
                                   BRNakl.Post;
                                   BrNakl.ApplyUpdates;
                                   DataMain.IBTBR.CommitRetaining;
                                   BrakT.Release;
                              end;
A_refr.Execute;
end;

procedure TBrakForm.A_InsExecute(Sender: TObject);
var I : integer;
S1, S : string;
begin
  Datamain.ConfigVit.open;
  I := Datamain.ConfigVit.FieldByName('Nomer19').AsInteger + 1;
  Datamain.ConfigVit.Edit;
  Datamain.ConfigVit.FieldByName('Nomer19').AsInteger := I;
  Datamain.ConfigVit.Post;
  Datamain.ConfigVit.Close;
  S1 := '-����';
  S := IntToStr(I) + S1;
  With DataMain.BRNakl do
  begin
    Append;
    FieldByName('Nomer').AsString := S;
    FieldByName('Ot').AsDateTime := Now;
    FieldByName('Priz').AsString := '0';
    Post;
  //  ApplyUpdates;
    try
      Application.CreateForm(TBrakT, BrakT);
      BrakT.Label2.Caption := FieldByName('Nomer').AsString;
      BrakT.DE.Text := FieldByName('Ot').AsString;
      BrakT.ShowModal;
      Edit;
      FieldByName('Ot').AsString := BrakT.DE.Text;
      FieldByName('Summa').AsFloat := StrToFloat(Trim(BrakT.Label11.Caption));
      Post;
      ApplyUpdates;
      DataMain.IBT.CommitRetaining;
      DataMain.IBTBR.CommitRetaining;
    finally
      BrakT.Release;
    end;
  end;
A_refr.Execute;
end;

procedure TBrakForm.A_PrintExecute(Sender: TObject);
begin
  Prin;
end;

procedure TBrakForm.A_RefrExecute(Sender: TObject);
var s : string;
//dataset : TIBTable;
//dataset : TIBDataSet;
nomer: string;
begin
{  with datamain do
  begin
    dataset := datamain.BrNakl;
    dataset.DisableControls;
    if not dataset.IsEmpty then S := dataset.fieldbyName('nomer').AsString else s := '';
    dataset.Close;
    dataset.Open;
    if S <> '' then  dataset.Locate('nomer', s, []);
    dataset.EnableControls;
  end;    }
    with datamain do
    begin
      if BRNakl.RecordCount = 0 then exit;
      nomer := BrNakl.FieldByName('NOMER').AsString;
      BRNakl.Close;
      BRNakl.Open;
      BRNakl.Locate('NOMER', nomer, []);
    end;
end;

procedure TBrakForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DataMain.Ost.Close;
DataMain.Ost.Open;
if  DataMain.IBT.InTransaction then  DataMain.IBT.Commit;
if  DataMain.IBTBR.InTransaction then  DataMain.IBTBR.Commit;

    Action := caFree;
end;

end.
