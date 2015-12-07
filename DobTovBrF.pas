unit DobTovBrF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Variants, DB;

type
  TDobTovBr = class(TForm)
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
  DobTovBr: TDobTovBr;
  IndexVal : Integer;
  IndexValP, ssp : Real;
  ssd,sp : String;

implementation

uses Data, AddKolF, SprNovTov, Pro, BrakTF;

{$R *.DFM}

procedure TDobTovBr.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
                    DobTovBr.Update;
                    DBGRid2.Update;
                    DobTovBr.ActiveControl := DBGrid2;
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

procedure TDobTovBr.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var I,acs,at,I1 : Integer;
    T: real;
    NameI,bn,bc1,bc2,bs,bnt,Sk1 : String;
    cp,cn,cpb,F : Real;
    L,s : Boolean;
begin
  Application.CreateForm(TAddKol, AddKol);
     case Key of
          VK_RETURN : begin
                    I := DataMain.TovarCode.AsInteger;
                    T := DataMain.TovarPrihod.AsFloat;
                    L := Datamain.BrTn.Locate('Code;Nomer',VarArrayOf([I,DataMain.BrNaklNomer.AsString]),[]);
                    if not(L) then
                     begin
                      AddKol.Up.Text := '0';
                      AddKol.Kol.Text := '0';
                     end
                    else
                     begin
                      AddKol.Up.Text := Datamain.BrTnUP.AsString;
                      AddKol.Kol.Text := Datamain.BrTnKol.AsString;
                      if DataMain.TovarVid.AsInteger = 0 then
                      begin
                        DataMain.Ost.Locate('Code', I,[]);
                        DataMain.Ost.Refresh;
                        Datamain.Ost.Edit;
                        Datamain.OstKol1.AsInteger := DataMain.Ostkol1.AsInteger+Datamain.BrTnKol.Asinteger;
                        DataMain.Ost.Post;
                      end;
                     end;
                    AddKol.Label1.Caption := DataMain.TovarNaim.AsString;
                    AddKol.Label2.Caption := '������� '+ Trim(DataMain.TovarOst1.AsString)+
                    ' (� �������� �� '+Trim(DataMain.TovarUp.AsString)+' ����.)';
                    if (AddKol.ShowModal = mrOk) then
                         if not(L) then
                         begin
                           I1 := StrToInt(Trim(AddKol.Kol.Text));
                           With DataMain.Ost do
                           begin
                                Locate('Code', I,[]);
                                //Refresh;
                              If (trim(DataMain.Tovar.FieldByName('Vid').AsString)='0') and (FieldByName('Kol1').AsInteger < I1)
                              then ShowMessage('��������')
                              else
                              begin
                                 Edit;
                                 if (trim(DataMain.Tovar.FieldByName('Vid').AsString)='0') then  //���� ��� �����
                                 FieldByName('Kol1').AsInteger := FieldByName('Kol1').AsInteger - StrToInt(Trim(AddKol.Kol.Text));
                                 Post;
                                 Datamain.BrTn.Append;
                                 DataMAin.BrTnCode.AsInteger :=I;
                                 Datamain.BrTnPrice.AsFloat := T;//DataMain.TovarPrihod.AsFloat;
                                 Datamain.BrTnKol.AsInteger := StrToInt(Trim(AddKol.Kol.Text));
                                 Datamain.BrTnUp.AsInteger := StrToInt(Trim(AddKol.Up.Text));
                                 Datamain.BrTn.Post;
                                 DataMain.BRTN.ApplyUpdates;
                                 DataMain.IBT.CommitRetaining;
                                 DataMain.IBTBR.CommitRetaining;
                              end;
                           end;
                          // DataMain.Tovar.Refresh;
                         end
                         else
                         begin
                           I1 := StrToInt(Trim(AddKol.Kol.Text));
                           With DataMain.Ost do
                           begin
                              Locate('Code', I,[]);
                              Refresh;
                              if DataMain.TovarVid.AsInteger = 0 then
                              begin
                              If FieldByName('Kol1').AsInteger < I1 then ShowMessage('��������') else
                              begin
                                 Edit;
                                 FieldByName('Kol1').AsInteger := FieldByName('Kol1').AsInteger - StrToInt(Trim(AddKol.Kol.Text));
                                 Post;
                              end;
                                 Datamain.BrTn.Edit;
                                 Datamain.BrTnKol.AsInteger := StrToInt(Trim(AddKol.Kol.Text));
                                 Datamain.BrTnUp.AsInteger := StrToInt(Trim(AddKol.Up.Text));
                                 Datamain.BrTn.Post;
                                 DataMain.BRTN.ApplyUpdates;
                                 DataMain.IBT.CommitRetaining;
                                 DataMain.IBTBR.CommitRetaining;
                              end;
                           end;
                           DataMain.Tovar.Refresh;
                           DataMain.BrTn.Refresh;
                         end
                    else
                        if L then
                        begin
                           I1 := DataMain.BrTnKOL.AsInteger;
                           With DataMain.Ost do
                           begin
                              //FindKey([I]);
                              Locate('Code', I,[]);
                              Refresh;
                              If FieldByName('Kol1').AsInteger < I1 then
                                begin
                                   ShowMessage('��������');
                                   Datamain.BrTn.Delete;
                                   DataMain.BRTN.ApplyUpdates;
                                   DataMain.IBT.CommitRetaining;
                                   DataMain.IBTBR.CommitRetaining;
                                end
                              else
                              begin
                                if DataMain.TovarVid.AsInteger = 0 then
                                begin
                                 Edit;
                                 FieldByName('Kol1').AsInteger := FieldByName('Kol1').AsInteger - DataMain.BrTnKol.AsInteger;
                                 Post;
                                end;
                              end;
                           end;

                        end;
                       DataMain.BRTN.Refresh;
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
                                        if FieldByname('Prihod').AsCurrency <> ssp/100 then
                                           Next
                                        else
                                           S := False;
                                  EnableControls;
                                 end;
                      end;


          VK_TAB : DobTovBr.ActiveControl := DBGrid1;
          VK_F3 : Begin
                    DataMain.Tovar.Edit;
                    Application.CreateForm(TNewTov, NewTov);
                    if NewTov.ShowModal = mrOk then begin
                       if DataMain.Tovar.State <> dsBrowse then
                        DataMain.Tovar.Post;
                        DataMain.Tovar.ApplyUpdates;
                        DataMain.IBT.CommitRetaining;
                     end
                    else
                       if DataMain.Tovar.State <> dsBrowse then
                        DataMain.Tovar.Cancel;
                    NewTov.Release;
                  end;
     end;
  AddKol.Release;

end;

procedure TDobTovBr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key=VK_ESCAPE then
        if DobTovBr.ActiveControl = DBGrid2 then
        begin
           DobTovBr.ActiveControl := DBGrid1;
           DBGrid1.Height := 449;
           DBGRid2.Enabled := False;
           DBGRid2.Visible := False;
           DBGrid2.DataSource := nil;
           DobTovBr.Update;
           DBGRid2.Update;
        end
        else
           DobTovBr.ModalResult := mrOk;
end;

procedure TDobTovBr.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key=VK_DELETE then
        With DataMain do begin
          if DataMain.TovarVid.AsInteger = 0 then
          begin
             Ost.Locate('Code',DataMain.BrTnCODE.AsInteger,[]);
             Ost.Edit;
             OstKol1.AsInteger := OstKol1.AsInteger + BrTnKol.AsInteger;
             Ost.Post;
          end;
          BrTn.Delete;
          BrTn.ApplyUpdates;
          DataMain.IBT.CommitRetaining;
          DataMain.IBTBR.CommitRetaining;
          BRtN.Refresh;
        end;

end;

procedure TDobTovBr.FormActivate(Sender: TObject);
begin
  DataMain.GrTovar.Open;
  DataMain.Tovar.Open;
  DBGrid1.Height := 449;
  DobTovBr.ActiveControl := DBGrid1;
  DBGRid2.Enabled := False;
  DBGRid2.Visible := False;
  DBGrid2.DataSource := nil;
  DobTovBr.Update;
  DBGRid2.Update;
end;

procedure TDobTovBr.FormDeactivate(Sender: TObject);
begin
DataMain.GrTovar.Close;
end;

end.
