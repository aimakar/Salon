unit SprNovTov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, JvToolEdit, JvDBControls, Db, DBTables, ExtCtrls,
   Buttons, JvExMask, JvBaseEdits, IBCustomDataSet, IBQuery;

type
  TNewTov = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBRadioGroup1: TDBRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label20: TLabel;
    Label14: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    IBQuery1: TIBQuery;
    DBEdit1: TDBEdit;
    PrihPrice: TDBEdit;
    NacB: TDBEdit;
    PriceB: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit7: TDBEdit;
    BonusED: TJvDBCalcEdit;
    procedure PrihPriceExit(Sender: TObject);
    procedure NacBChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrihPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NacBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PriceBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2DropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewTov: TNewTov;

implementation

uses Data, NewPostF, SprNewPredpr, NewProizF, KartF, Tovar_GroupF;

{$R *.DFM}

procedure TNewTov.PrihPriceExit(Sender: TObject);
begin
  DataMain.TovarPrice_B.AsFloat := DataMain.TovarPrihod.AsFloat * DataMain.TovarNacen.AsFloat;
end;

procedure TNewTov.NacBChange(Sender: TObject);
begin
     If NacB.Modified then
       DataMain.TovarPrice_B.AsFloat := DataMain.TovarPrihod.AsFloat * DataMain.TovarNacen.AsFloat;
end;

procedure TNewTov.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_ESCAPE : NewTov.ModalResult := mrCancel;
     end;
end;

procedure TNewTov.Button2Click(Sender: TObject);
begin
     NewTov.ModalResult := mrCancel;
end;

procedure TNewTov.Button1Click(Sender: TObject);
var I : integer;
    S : String;
begin
     i:=0;
     S:='';
     With DataMain do begin

if Tovar.FieldByName('Code_PR').AsInteger=0 then
   begin
     S := '�� ������ �������������!'+#13;
     I := 1;
   end;
{if Tovar.FieldByName('Code_Post').AsInteger=0 then
   begin
     S := S+'�� ������ ���������!';
     I := 1;
   end;}

If i = 0 then
   Begin
        IBQuery1.Close;
        IBQuery1.ParamByName('Code').AsInteger:=DataMain.Tovar.FieldByName('Code').AsInteger;
        IBQuery1.Open;
        if not(IBQuery1.RecordCount > 0) then
           Ost.AppendRecord([Tovar.FieldByName('Code').asInteger,nil,nil]);
           NewTov.ModalResult := mrOk;
   end
   else ShowMessage(S);
     end;

end;

procedure TNewTov.FormActivate(Sender: TObject);
begin
    // DataMain.Tovar.Edit;
     DataMain.Proiz.Open;
     DataMain.Post.Open;
     NewTov.ActiveControl := DBEdit1;
end;

procedure TNewTov.CBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_Return : NewTov.ActiveControl :=PrihPrice;
     end;
end;

procedure TNewTov.PrihPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_Return : begin
                    NewTov.ActiveControl := NacB;
                    DataMain.Tovar.FieldByName('Price_B').AsFloat := DataMain.Tovar.FieldByName('Prihod').AsFloat * DataMain.Tovar.FieldByName('Nacen').AsFloat;
                    DataMain.Tovar.ApplyUpdates;
                    DataMain.IBT.CommitRetaining;
                      end;
     end;

end;

procedure TNewTov.NacBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_Return : BEGIN
                    NewTov.ActiveControl :=PriceB;
                    DataMain.Tovar.FieldByName('Price_B').AsFloat := DataMain.Tovar.FieldByName('Prihod').AsFloat * DataMain.Tovar.FieldByName('Nacen').AsFloat;
                    DataMain.Tovar.ApplyUpdates;
                    DataMain.IBT.CommitRetaining;
                      end;

     end;

end;

procedure TNewTov.PriceBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_Return : NewTov.ActiveControl := DBEdit7;
     end;

end;

procedure TNewTov.SNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_Return : NewTov.ActiveControl := Button1;
     end;

end;

procedure TNewTov.DBLookupComboBox2DropDown(Sender: TObject);
begin
DataMain.Proiz.Open;
DataMain.Proiz.Last;
end;

procedure TNewTov.DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var I : Integer;
    NameI : String;
begin
     case Key of
          VK_DOWN,VK_UP : if not(DBLookupComboBox2.ListVisible) then Key := 0;
          VK_SPACE : if not(DBLookupComboBox2.ListVisible) then DBLookupComboBox2.DropDown;
          VK_RETURN : begin
                        DBLookupComboBox2.CloseUp(True);
                      end;
          VK_INSERT : Begin
                    Application.CreateForm(TNewProiz, NewProiz);
                    NewProiz.Caption := '���������� ������ �������������';
                    NewProiz.CheckBox1.Enabled := True;
                    NewProiz.CheckBox2.Enabled := True;
                    With DataMain do
                         begin
                              Proiz.Refresh;
                              NameI := Proiz.IndexName;
                              Proiz.IndexName := '';
                              Proiz.Last;
                              I := Proiz.FieldByName('Code_Proiz').AsInteger;
                              Proiz.IndexName := NameI;
                              Proiz.Append;
                              Proiz.FieldByName('Code_Proiz').AsInteger := I+1;
                              Proiz.Post;
                              Proiz.ApplyUpdates;
                              DataMain.IBT.CommitRetaining;
                              Proiz.Edit;
                              if NewProiz.ShowModal = mrCancel then
                                 begin
                                      Proiz.Cancel;
                                      Proiz.Delete;
                                 end
                              else
                                  Proiz.post;
                              Proiz.ApplyUpdates;
                              DataMain.IBT.CommitRetaining;
                              If NewProiz.CheckBox1.Checked then begin
                                 Predpr.Open;
                                 NameI := Predpr.IndexName;
                                 Predpr.IndexName := '';
                                 Predpr.Last;
                                 I := Predpr.FieldByName('Code_Pr').AsInteger;
                                 Predpr.IndexName := NameI;
                                 Predpr.Append;
                                 Predpr.FieldByName('Code_Pr').AsInteger := I+1;
                                 Predpr.FieldByName('Naim').AsString := Proiz.FieldByName('Naim').AsString;
                                 Predpr.Post;
                                 Predpr.ApplyUpdates;
                                 DataMain.IBT.CommitRetaining;
                                 if MessageDlg('������� ��������������� ������ �������?',
                                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
                                      Predpr.Edit;
                                      NewPredpr.ShowModal;
                                      Predpr.Post;
                                      Predpr.ApplyUpdates;
                                      DataMain.IBT.CommitRetaining;
                                 end;
                              end;
                              If NewProiz.CheckBox2.Checked then begin
                                 Post.Open;
                                 NameI := Post.IndexName;
                                 Post.IndexName := '';
                                 Post.Last;
                                 I := Post.FieldByName('Code_Post').AsInteger;
                                 Post.IndexName := NameI;
                                 Post.Append;
                                 Post.FieldByName('Code_Post').AsInteger := I+1;
                                 Post.FieldByName('Naim').AsString := Proiz.FieldByName('Naim').AsString;
                                 Post.FieldByName('Naim').AsString := Proiz.FieldByName('Prim').AsString;
                                 Post.Post;
                                 Post.ApplyUpdates;
                                 DataMain.IBT.CommitRetaining;
                                 NewProiz.Release;
                              end;
                         end;
                      end;
     end;

end;



end.
