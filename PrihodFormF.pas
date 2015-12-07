unit PrihodFormF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, StdCtrls, Buttons, DBTables, ExtCtrls, FileCtrl,
  JvExDBGrids, JvDBGrid, ActnList, ToolWin, ActnMan, ActnCtrls, XPStyleActnCtrls;
    procedure Prin;
type
  TPrihodForm = class(TForm)
    DBGrid1: TJvDBGrid;
    ActionManager1: TActionManager;
    ActionToolBar1: TActionToolBar;
    A_Ins: TAction;
    A_Edit: TAction;
    A_Del: TAction;
    Action1: TAction;
    Action3: TAction;
    A_WinCr: TAction;
    A_Prov: TAction;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure A_EditExecute(Sender: TObject);
    procedure A_InsExecute(Sender: TObject);
    procedure A_DelExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure A_WinCrExecute(Sender: TObject);
    procedure A_ProvExecute(Sender: TObject);
    procedure CreateWindowHandle(const Params: TCreateParams);override;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrihodForm: TPrihodForm;
  Dost : String;
implementation

uses Data,  Pro, PrihodNaklF, Sklad;

{$R *.DFM}

procedure refr;
var
  nomer: string;
begin
with datamain do
    begin
      if NaklpRIH.RecordCount = 0 then exit;
      nomer := NaklPrih.FieldByName('NOMER').AsString;
      NaklPrih.Close;
      NaklPrih.Open;
      NaklPrih.Locate('NOMER', nomer, []);
    end;

end;

procedure TPrihodForm.CreateWindowHandle(const Params: TCreateParams);
var Comp:TPrihodForm;
begin
  inherited;
  Comp:=TPrihodForm(Application.Components[Application.ComponentCount-1]);
  Comp.Visible:=false;
end;

procedure TPrihodForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var a: string;
begin
if DataMain.NaklPrih.RecordCount <>0 then
begin
try
a := DataMain.NaklPrihPriz.AsString[1];
with DBGrid1.Canvas do
  begin
     if (a='1') and (not (gdFocused in State)) then
      begin
       Font.Color := clGreen;
       FillRect (Rect);
       TextOut(Rect.Left,Rect.Top, Column.Field.Text);
      end
     else DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     if gdFocused in State then
      begin
       if a='1' then A_prov.Enabled := False
       else          A_Prov.Enabled := True;
      end;
  end;
except on E: Exception do
    ShowMessage('������: ' + E.Message);
end;
end;
end;


procedure TPrihodForm.Action1Execute(Sender: TObject);
var S : string;
begin
 if InputQuery('����� �� ������','������� �����',S) then
                  With Datamain.NaklPrih do
                       begin
                            DisableControls;
                            Locate('Nomer',S,[loPartialKey]);
                            enableControls;
                       end;
end;

procedure TPrihodForm.Action2Execute(Sender: TObject);
begin
  Prin;
end;

procedure TPrihodForm.Action3Execute(Sender: TObject);
begin
  PrihodForm.Release;
end;

procedure TPrihodForm.A_DelExecute(Sender: TObject);
begin
  if not(trim(DataMain.NaklPrih.FieldByName('Priz').AsString) = '1' )  then
                  if MessageDlg('������� ���������?',
                     mtConfirmation, [mbNo, mbYes], 0) = mrYes then
                        With DataMain do begin
                           Tovar.Open;
                           Ost.Open;
                           TNPrih.Open;
                           TNPrih.First;
                           While not(DataMain.TNPrih.Eof) do
                              TNPrih.Delete;
                              NaklPrih.Delete;
                              TNPrih.ApplyUpdates;
                              NaklPrih.ApplyUpdates;
                              IBTPrih.CommitRetaining;
                         //  TNPrih.Close;
                         //  Ost.Close;
                         //  Tovar.Close;
                        end;
end;

procedure TPrihodForm.A_EditExecute(Sender: TObject);
begin
  if not Datamain.NaklPrih.IsEmpty then
    With DataMain do
    try
      Application.CreateForm(TPrihodNakl, PrihodNakl);
      NaklPrih.Edit;
      NaklPrihOperacDat.AsDateTime := Now;
      NaklPrihOtk.AsString := '1';
      NaklPrih.Post;
      NaklPrih.ApplyUpdates;
      IBTPrih.CommitRetaining;
      if (trim(NaklPrih.FieldByName('Priz').AsString) = '1') then PrihodNakl.tag := 1 else PrihodNakl.tag := 0;
      PrihodNakl.Label2.Caption := NaklPrih.FieldByName('Nomer').AsString;
      PrihodNakl.DE.Text := NaklPrih.FieldByName('Ot').AsString;
      PrihodNakl.ShowModal;
      if NaklPrih.State = dsBrowse then NaklPrih.Edit;
      NaklPrih.FieldByName('Ot').AsString := PrihodNakl.DE.Text;
      NaklPrih.FieldByName('Summa').AsFloat := StrToFloat(Trim(PrihodNakl.Label11.Caption));
      NaklPrihOtk.AsString := '0';
      NaklPrih.Post;
      NaklPrih.ApplyUpdates;
      IBTPrih.CommitRetaining;
      refr;
    finally
      PrihodNakl.Release;
    end;
end;

procedure TPrihodForm.A_InsExecute(Sender: TObject);
var S1, S : string;
begin
  try
                        Application.CreateForm(TPrihodNakl, PrihodNakl);
                        S1 := '-����';
                        Datamain.NaklPrih.DisableControls;
                        DataMain.NaklPrih.Filtered := False;
                        DataMain.NaklPrih.Last;
                        PrihodNakl.Tag := 0;
                        //DataMain.NaklPrih.Refresh;

                        With DataMain.NaklPrih do
                            begin
                                 Datamain.Config.Open;
                                 DataMain.Config.Edit;
                                 S := Trim(Datamain.ConfigNomer6.AsString);
                                 IncNom(S,S1);
                                 DataMain.ConfigNomer6.AsString := S;
                                 DataMain.Config.Post;
                                 DataMain.Config.Close;
                                 Append;
                                 FieldByName('Prov1D').AsDateTime := Now;
                                 FieldByName('Nomer').AsString := S;
                                 FieldByName('Ot').AsDateTime := Date();
                                 FieldByName('Priz').AsString := '0';
                                 FieldByName('Otk').AsString := '1';
                                 Post;
                                 PrihodNakl.Label2.Caption := FieldByName('Nomer').AsString;
                                 PrihodNakl.DE.Text := FieldByName('Ot').AsString;
                                 DataMain.NaklPrih.EnableControls;
                                 PrihodNakl.ShowModal;
                                 Edit;
                                 FieldByName('Ot').AsString := PrihodNakl.DE.Text;
                                 FieldByName('Summa').AsFloat := StrToFloat(Trim(PrihodNakl.Label11.Caption));
                                 FieldByName('Otk').AsString := '0';
                                 Post;
                                 ApplyUpdates;
                                 DataMain.IBTPrih.CommitRetaining;
                                 DataMain.IBT.CommitRetaining;
                                 refr;
                            end;
  finally
    Prihodnakl.Release;
  end;
end;

procedure TPrihodForm.A_ProvExecute(Sender: TObject);
var
nomer:string;
begin
  if MessageDlg('����� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    With DataMain do
    if (not (trim(NaklPrihpriz.AsString) = '1')) and ( NaklPrihSumma.AsFloat>0) then
    begin
      Tovar.Open;
      Ost.Open;
      Ost.First;
      TNPrih.Open;
      TNPrih.First;
      while not(TNPrih.EOF) do
      begin
      //  Ost.FindKey([TNPrihCode.AsInteger]);
        Ost.Locate('Code', TNPrihCode.AsInteger,[]);
        Ost.Edit;
        OstKol2.AsInteger := OstKol2.AsInteger + TNPrihKol.AsInteger;
        OstKol1.AsInteger := OstKol1.AsInteger + TNPrihKol.AsInteger;
        Ost.post;
        TNPrih.Next;
      end;
    //  TNPrih.Close;
   //   Tovar.Close;
      NaklPrih.Edit;
      NaklPrihProv2D.AsDateTime := Now;
      NaklPrihPriz.AsString := '1';
      NaklPrih.Post;
      NaklPrih.ApplyUpdates;
      IBTPrih.CommitRetaining;
      IBT.CommitRetaining;
      A_Prov.Enabled := False;
    end;
    DataMain.IBTPrih.CommitRetaining;


end;

procedure TPrihodForm.A_WinCrExecute(Sender: TObject);
begin
  Dost := DataMain.Dost;
  With DataMain do
  begin
  if not IBT.InTransaction then  IBT.StartTransaction;
  if not IBTPrih.InTransaction then  IBTPrih.StartTransaction;
    Post.Open;
    NaklPrih.Open;
  end;
end;

procedure TPrihodForm.Timer1Timer(Sender: TObject);
begin
     DataMain.NaklPrih.Refresh;
end;

procedure TPrihodForm.FormDestroy(Sender: TObject);
begin
//  CloseData;

end;

procedure Prin;
begin
end;


procedure TPrihodForm.FormActivate(Sender: TObject);
begin
DataMain.Ost.Open;
end;

procedure TPrihodForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  DataMain.Ost.Close;
  DataMain.Ost.Open;
  if  DataMain.IBTPrih.InTransaction then  DataMain.IBTPrih.Commit;
  if  DataMain.IBT.InTransaction then  DataMain.IBT.Commit;
     Action := caFree;
end;

procedure TPrihodForm.DBGrid1TitleClick(Column: TColumn);
begin
     if not((Column.FieldName = 'PrNaim') or (Column.FieldName = 'COMMENT')) then
     DataMain.NaklPrih.IndexName := Column.FieldName;
end;

end.
