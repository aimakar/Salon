unit AddKolIzlF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask;

type
  TAddKolIzl = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Up: TMaskEdit;
    Kol: TMaskEdit;
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
  AddKolIzl: TAddKolIzl;

implementation

uses Data;

{$R *.DFM}

procedure TAddKolIzl.KolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var I,I1 : Integer;
begin
case Key of
     VK_RETURN : begin
                  With DataMain.Tovar do
                       begin
                            try
                               I1 := StrToInt(Trim(AddKolIzl.Kol.Text));
                            except
                               I1 := 0;
                            end;
                            //Refresh;
                            if I1 = 0 then AddKolIzl.ActiveControl := Up else AddKolIzl.ModalResult := mrOk;
                       end;
                 end;
     VK_ESCAPE : AddKolIzl.ModalResult := mrCancel;
     VK_TAB : begin
                   AddKolIzl.Kol.Text := '0';
                   AddKolIzl.ActiveControl := Up;
              end;

end;

end;

procedure TAddKolIzl.UpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var I,I1 : Integer;
begin
case Key of
     VK_RETURN : begin
                  With DataMain.Tovar do
                       begin
                         if not(StrToInt(Trim(AddKolIzl.Up.Text))=0) then begin
                            try
                               I1 := StrToInt(Trim(AddKolIzl.Up.Text));
                            except
                               I1 := 0;
                            end;
                            I1 := I1*FieldByName('Up').AsInteger;
                            Refresh;
                            if  I1=0 then AddKolIzl.ActiveControl := Kol
                            else
                              begin
                              AddKolIzl.Kol.Text := IntToStr(I1);
                              AddKolIzl.ModalResult := mrOk;
                              end;
                         end;

                       end;
                 end;
     VK_ESCAPE : AddKolIzl.ModalResult := mrCancel;
     VK_TAB : begin
                   AddKolIzl.Up.Text := '0';
                   AddKolIzl.ActiveControl := Kol;
              end;

end;

end;

end.
