unit AddKolF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask;

type
  TAddKol = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Up: TMaskEdit;
    Kol: TMaskEdit;
    Label5: TLabel;
    procedure KolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddKol: TAddKol;

implementation

uses Data;

{$R *.DFM}

procedure TAddKol.KolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var I,I1 : Integer;
begin
case Key of
     VK_RETURN : begin
                  With DataMain.Tovar do
                       begin
                            try
                               I1 := StrToInt(Trim(AddKol.Kol.Text));
                            except
                               I1 := 0;
                            end;
                           // Refresh;
                            I := FieldByName('Ost1').AsInteger;
                            if (trim(FieldByName('Vid').AsString)='0') and (I < I1) then
                              begin
                               ShowMessage('Попробуйте еще раз!');
                               AddKol.Kol.Text := '0';
                              end
                            else
                              begin
                               AddKol.Up.Text := '0';
                               AddKol.ModalResult := mrOk;
                              end;
                       end;
                 end;
     VK_ESCAPE : AddKol.ModalResult := mrCancel;
     VK_TAB : begin
                   AddKol.Kol.Text := '0';
                   AddKol.ActiveControl := Up;
              end;

end;

end;

procedure TAddKol.UpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var I,I1 : Integer;
begin
case Key of
     VK_RETURN : begin
                  With DataMain.Tovar do
                       begin
                         if not(StrToInt(Trim(AddKol.Up.Text))=0) then begin
                            try
                               I1 := StrToInt(Trim(AddKol.Up.Text));
                            except
                               I1 := 0;
                            end;
                            I1 := I1*FieldByName('Up').AsInteger;
                            Refresh;
                            I := FieldByName('Ost1').AsInteger;
                            if I < I1 then
                              begin
                               ShowMessage('Попробуйте еще раз!');
                               AddKol.Up.Text := '0';
                              end
                            else
                              begin
                              AddKol.Kol.Text := IntToStr(I1);
                              AddKol.ModalResult := mrOk;
                              end;
                         end
                         else AddKol.ActiveControl := Kol;

                       end;
                 end;
     VK_ESCAPE : AddKol.ModalResult := mrCancel;
     VK_TAB : begin
                   AddKol.Up.Text := '0';
                   AddKol.ActiveControl := Kol;
              end;
              //for commit

end;

end;

end.
