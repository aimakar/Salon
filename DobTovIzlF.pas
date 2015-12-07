unit DobTovIzlF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Variants, DB;

type
  TDobTovIzl = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  DobTovIzl: TDobTovIzl;
  IndexVal : Integer;
  IndexValP, ssp : Real;
  ssd,sp : String;

implementation

uses Data, AddKolIzlF, SprNovTov, Pro, IzlTF;

{$R *.DFM}

procedure TDobTovIzl.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var d : String;
    S : Boolean;
begin
     Case Key of
          VK_RETURN : begin
                    DBGRid1.Height := 217;
                    DBGrid2.DataSource := DataMain.TovarDS;
                    DBGRid2.Visible := True;
                    DBGrid2.Enabled := True;
                    DobTovIzl.Update;
                    DBGRid2.Update;
                    DobTovIzl.ActiveControl := DBGrid2;
                      end;
          VK_F6     : begin
                         if InputQuery('����� �� ��������','������� �������� ������ �������',ssd) then
                            With DataMain.GRTovar do
                                 begin
                                  DisableControls;
                                  S := True;
                                  While (S and not(Eof)) do
                                        if Pos(AnsiUpperCase(ssD),AnsiUpperCase(FieldByName('Naim').AsString))=0 then
                                           Next
                                        else
                                           S := False;
                                  EnableControls;
                                 end;
                      end;

     end;

end;

procedure TDobTovIzl.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var I,acs,at,I1 : Integer;
    T: real;
    NameI,bn,bc1,bc2,bs,bnt,Sk1 : String;
    cp,cn,cpb,F : Real;
    L,s : Boolean;
begin
     case Key of
          VK_RETURN : begin
                    I := DataMain.TovarCode.AsInteger;
                    T := DataMain.TovarPrihod.AsFloat;
                    L := Datamain.IzlTn.Locate('Code;Nomer',VarArrayOf([I,DataMain.IzlNaklNomer.AsString]),[]);
                    if not(L) then
                     begin
                      AddKolIzl.Up.Text := '0';
                      AddKolIzl.Kol.Text := '0';
                     end
                    else
                     begin
                      AddKolIzl.Up.Text := Datamain.IzlTnUP.AsString;
                      AddKolIzl.Kol.Text := Datamain.IzlTnKol.AsString;
                     end;
                    AddKolIzl.Label1.Caption := DataMain.TovarNaim.AsString;
                    AddKolIzl.Label2.Caption := '������� '+ Trim(DataMain.TovarOst1.AsString)+
                    ' (� �������� �� '+Trim(DataMain.TovarUp.AsString)+' ����.)';
                    if (AddKolIzl.ShowModal = mrOk) then
                         if not(L) then
                         begin
                         I1 := StrToInt(Trim(AddKolIzl.Kol.Text));
                          Datamain.IzlTn.Append;
                          DataMAin.IzlTnCode.AsInteger :=I;
                          Datamain.IzlTnPrice.AsFloat := T;//DataMain.TovarPrihod.AsFloat;
                          Datamain.IzlTnKol.AsInteger := StrToInt(Trim(AddKolIzl.Kol.Text));
                          Datamain.IzlTnUp.AsInteger := StrToInt(Trim(AddKolIzl.Up.Text));
                          Datamain.IzlTn.Post;
                          DataMain.IzlTN.ApplyUpdates;
                          DataMain.IBTIzl.CommitRetaining;
                         end
                         else
                         begin
                           I1 := StrToInt(Trim(AddKolIzl.Kol.Text));
                           Datamain.IzlTn.Edit;
                           Datamain.IzlTnKol.AsInteger := StrToInt(Trim(AddKolIzl.Kol.Text));
                           Datamain.IzlTnUp.AsInteger := StrToInt(Trim(AddKolIzl.Up.Text));
                           Datamain.IzlTn.Post;
                           DataMain.IzlTN.ApplyUpdates;
                           DataMain.IBTIzl.CommitRetaining;
                         end;
                         DataMain.IzlTn.Refresh;
                      end;
          VK_F6    : begin
                         if InputQuery('����� �� ��������','������� �������� ������',ssd) then
                            With DataMain.Tovar do
                                 begin
                                  DisableControls;
                                  S := True;
                                  While (S and not(Eof)) do
                                        if Pos(AnsiUpperCase(ssD),AnsiUpperCase(FieldByName('Naim').AsString))=0 then
                                           Next
                                        else
                                           S := False;
                                  EnableControls;
                                 end;
                      end;
          VK_F7    : begin
                         if InputQuery('����� �� ����','������� ���� ������',sp) then
                            With DataMain.Tovar do
                                 begin
                                  DisableControls;
                                  S := True;
                                  Try
                                  Ssp := Round(StrToFloat(sp)*100);
                                  except
                                  SSp := 0;
                                  ShowMessage('����� ���� ����� ����!');
                                  end;
                                  While (S and not(Eof)) do
                                        if FieldByname('Price_B').AsCurrency <> ssp/100 then
                                           Next
                                        else
                                           S := False;
                                  EnableControls;
                                 end;
                      end;


          VK_TAB : DobTovIzl.ActiveControl := DBGrid1;
          VK_F3 : Begin
                    DataMain.Tovar.Edit;
                    if NewTov.ShowModal = mrOk then begin
                       if DataMain.Tovar.State <> dsBrowse then
                        DataMain.Tovar.Post;
                        DataMain.Tovar.ApplyUpdates;
                        DataMain.IBTIzl.CommitRetaining;
                     end
                    else
                       if DataMain.Tovar.State <> dsBrowse then
                        DataMain.Tovar.Cancel;
                  end;
     end;

end;

procedure TDobTovIzl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key=VK_ESCAPE then
        if DobTovIzl.ActiveControl = DBGrid2 then
        begin
           DobTovIzl.ActiveControl := DBGrid1;
           DBGrid1.Height := 449;
           DBGRid2.Enabled := False;
           DBGRid2.Visible := False;
           DBGrid2.DataSource := nil;
           DobTovIzl.Update;
           DBGRid2.Update;
        end
        else
           DobTovIzl.ModalResult := mrOk;
end;

procedure TDobTovIzl.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key=VK_DELETE then
        With DataMain do begin
          {if DataMain.Tovarvid.asInteger = 0 then
            begin
             Ost.Locate('Code',DataMain.IzlTnCODE.AsInteger,[]);
             Ost.Edit;
             OstKol1.AsInteger := OstKol1.AsInteger + IzlTnKol.AsInteger;
             Ost.Post;
            end;     }
             IzlTn.Delete;
             IzlTn.ApplyUpdates;
             DataMain.IBTIzl.CommitRetaining;
             DataMain.IBT.CommitRetaining;
             IzlTn.Refresh;
        end;

end;

procedure TDobTovIzl.FormActivate(Sender: TObject);
begin
  DataMain.GrTovar.Open;
  DataMain.Tovar.Open;
  DBGrid1.Height := 449;
  DobTovIzl.ActiveControl := DBGrid1;
  DBGRid2.Enabled := False;
  DBGRid2.Visible := False;
  DBGrid2.DataSource := nil;
  DobTovIzl.Update;
  DBGRid2.Update;

  Application.CreateForm(TAddKolIzl, AddKolIzl);
  Application.CreateForm(TNewTov, NewTov);


end;

procedure TDobTovIzl.FormDeactivate(Sender: TObject);
begin
DataMain.GrTovar.Close;
AddKolIzl.Release;
NewTov.Release;

end;

end.
