unit ProverkaF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TProv = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Prov: TProv;

implementation

uses Data;

{$R *.DFM}

procedure TProv.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
         { VK_RETURN : if Trim(Edit1.Text) = Trim(DataMain.Why.FieldByName('Par').AsString) then
                         Prov.ModalResult := mrOk
                      else
                          Begin
                               Prov.Edit1.Text := '';
                               Prov.ActiveControl := Edit1;
                          End;   }
          VK_ESCAPE : Prov.ModalResult := mrCancel;
     End;
end;

procedure TProv.FormActivate(Sender: TObject);
begin
     Prov.Edit1.text := '';
end;

end.
