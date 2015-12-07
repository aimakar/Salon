unit DobTovCF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Variants, DB, JvExDBGrids,
  JvDBGrid;

type
  TDobTovC = class(TForm)
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
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
  DobTovC: TDobTovC;
  IndexVal : Integer;
  IndexValP, ssp : Real;
  ssd,sp : String;

implementation

uses Data, AddKolF, SprNovTov, Pro, CashTF;

{$R *.DFM}

procedure TDobTovC.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
                    DobTovC.Update;
                    DBGRid2.Update;
                    DobTovC.ActiveControl := DBGrid2;
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

procedure TDobTovC.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var I,acs,at,I1, Vup : Integer;
    T, TB :Real;
    NameI,bn,bc1,bc2,bs,bnt,Sk1,ss : String;
    cp,cn,cpb,F : Real;
    L,s : Boolean;
begin
Application.CreateForm(TAddKol, AddKol);
case Key of
  VK_RETURN : begin
  I := DataMain.TovarCode.AsInteger;
  T := DataMain.TovarPrihod.AsFloat;
  TB:= DataMain.TovarPrice_B.AsFloat;
  Vup:=DataMain.TovarUP.AsInteger;
  AddKol.Label5.Caption := '�.�.�.: '+DataMain.TovarRZT.AsString;
  // �������� ���� �� � ���� ��������� ��������� �����
  L := Datamain.CashTn.Locate('Code;Nomer',VarArrayOf([I,DataMain.CashNaklNomer.AsString]),[]);

  if not(L) then    // ������ ��� � ���������
   begin
    AddKol.Up.Text := '0';
    AddKol.Kol.Text := '0';
   end
  else        // ����� �c�� � ���������
   begin
    AddKol.Up.Text := Datamain.CashTnUP.AsString;
    AddKol.Kol.Text := Datamain.CashTnKol.AsString;
    DataMain.Tovar.Locate('Code', I,[]);
    if DataMain.Tovarvid.asInteger = 0 then         //���� ��� �����
      begin
        DataMain.Ost.Locate('Code', I,[]);
        DataMain.Ost.Refresh;
        DataMain.Ost.Edit;
        Datamain.Ost.Cancel;
        Datamain.Ost.Edit;
        Datamain.OstKol1.AsInteger := DataMain.Ostkol1.AsInteger+Datamain.CashTnKol.Asinteger;
        DataMain.Ost.Post;
      end;
   end;

  AddKol.Label1.Caption := DataMain.TovarNaim.AsString;
  AddKol.Label2.Caption := '������� '+ Trim(DataMain.TovarOst1.AsString)+
  ' (� �������� �� '+Trim(DataMain.TovarUp.AsString)+' ����.)';

///////////////////////////////////////////////////////////////////////////
  if (AddKol.ShowModal = mrOk) then
       if not(L) then   // ������ ��� � ���������
         begin
           I1 := StrToInt(Trim(AddKol.Kol.Text));
           With DataMain.Ost do
             begin
              Locate('Code', I,[loCaseInsensitive]);
              //Edit;
              //Cancel;
              //Refresh;
              If (trim(DataMain.Tovar.FieldByName('Vid').AsString)='0') and (FieldByName('Kol1').AsInteger < I1)
              then ShowMessage('��������')
              else
                begin
                 Edit;
                 if (trim(DataMain.Tovar.FieldByName('Vid').AsString)='0') then  //���� ��� �����
                 FieldByName('Kol1').AsInteger := FieldByName('Kol1').AsInteger - StrToInt(Trim(AddKol.Kol.Text));
                 Post;
                 Datamain.CashTn.Append;
                 DataMAin.CashTNCode.AsInteger :=I;
                 Datamain.CashTnPrice.AsFloat := DataMain.TovarPrice_B.AsFloat;
                 Datamain.CashTnPrice_Prih.AsFloat := T; //DataMain.TovarPrihod.AsFloat;
                 Datamain.CashTnKol.AsInteger := StrToInt(Trim(AddKol.Kol.Text));
                 Datamain.CashTnUp.AsInteger := StrToInt(Trim(AddKol.Up.Text));
                 Datamain.CashTnV_Up.AsInteger :=DataMain.TovarUP.AsInteger;
                 Datamain.CashTnBonus.AsInteger := DataMain.TovarBonus.AsInteger;
                 Datamain.CashTn.Post;
                 Datamain.CashTn.ApplyUpdates;
                 DataMain.IBT.CommitRetaining;
                 DataMain.IBTCash.CommitRetaining;
                end;
             end;
         end
       else // L    ����� ���� � ���������
       begin
         With DataMain.Ost do
         begin
            Locate('Code', I,[]);
            Edit;
            Cancel;
  //                              Refresh;
            If (trim(DataMain.Tovar.FieldByName('Vid').AsString)='0') and (FieldByName('Kol1').AsInteger < I1) then
            ShowMessage('��������')
            else
              begin
                 Edit;
                 if (trim(DataMain.Tovar.FieldByName('Vid').AsString)='0') then
                 FieldByName('Kol1').AsInteger := FieldByName('Kol1').AsInteger - StrToInt(Trim(AddKol.Kol.Text));
              //   ApplyUpdates;
                 Post;
                 Datamain.CashTn.Edit;
                 Datamain.CashTnKol.AsInteger := StrToInt(Trim(AddKol.Kol.Text));
                 Datamain.CashTnUp.AsInteger := StrToInt(Trim(AddKol.Up.Text));
                 Datamain.CashTn.Post;
                 DataMain.CashTN.ApplyUpdates;
                 DataMain.IBT.CommitRetaining;
                 DataMain.IBTCash.CommitRetaining;
              end;
         end;
       end
  else  // AddKol.ShowModal <> mrOk
      if L then
      begin
        I1 := DataMain.CashTNKOL.AsInteger;
        DataMain.Tovar.Locate('Code', I,[]);
        if DataMain.Tovarvid.asInteger = 0 then
        begin
         With DataMain.Ost do
           begin
              Locate('Code', I,[]);
              Edit;
              Cancel;
              //Refresh;
              If FieldByName('Kol1').AsInteger < I1 then
                begin
                   ShowMessage('��������');
                   Datamain.CashTN.Delete;
                   DataMain.CashTN.ApplyUpdates;
                   DataMain.IBT.CommitRetaining;
                   DataMain.IBTCash.CommitRetaining;
                end
              else
                begin
                   Edit;
                   FieldByName('Kol1').AsInteger := FieldByName('Kol1').AsInteger - DataMain.CashTNKol.AsInteger;
                   Post;
                end;
           end;
        end;
      end;
      DataMain.CashTn.Refresh;
      DataMain.Ost.Refresh;
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
                                  end;
                                  While (S and not(Eof)) do
                                        if FieldByname('Price_B').AsCurrency <> ssp/100 then
                                           Next
                                        else
                                           S := False;
                                  EnableControls;
                                 end;
                      end;


          VK_TAB : DobTovC.ActiveControl := DBGrid1;
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

procedure TDobTovC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key=VK_ESCAPE then
        if DobTovC.ActiveControl = DBGrid2 then
        begin
           DobTovC.ActiveControl := DBGrid1;
           DBGrid1.Height := 449;
           DBGRid2.Enabled := False;
           DBGRid2.Visible := False;
           DBGrid2.DataSource := nil;
           DobTovC.Update;
           DBGRid2.Update;
        end
        else
           DobTovC.ModalResult := mrOk;
end;

procedure TDobTovC.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key=VK_DELETE then
        With DataMain do begin
        if DataMain.Tovarvid.asInteger = 0 then
        begin
             Ost.Locate('Code',DataMain.CashTNCODE.AsInteger,[]);
             Ost.Edit;
             OstKol1.AsInteger := OstKol1.AsInteger + CashTNKol.AsInteger;
             Ost.Post;
        end;
             CashTN.Delete;
             CashTN.ApplyUpdates;
             DataMain.IBT.CommitRetaining;
             DataMain.IBTCash.CommitRetaining;
             CashTn.Refresh;
        end;

end;

procedure TDobTovC.FormActivate(Sender: TObject);
begin
  DataMain.Tovar.Open;
  DataMain.GrTovar.Open;
  DBGrid1.Height := 449;
  DobTovC.ActiveControl := DBGrid1;
  DBGRid2.Enabled := False;
  DBGRid2.Visible := False;
  DBGrid2.DataSource := nil;
  DobTovC.Update;
  DBGRid2.Update;


end;

procedure TDobTovC.FormDeactivate(Sender: TObject);
begin
// DataMain.GrTovar.Close;
end;

end.
