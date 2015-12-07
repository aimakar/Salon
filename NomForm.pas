unit NomForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask;

type
  TNomF = class(TForm)
    Edit1: TMaskEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NomF: TNomF;
  a : String;

implementation

uses Pro;

{$R *.DFM}

procedure TNomF.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
         VK_RETURN : NomF.ModalResult := mrOk;
         VK_ESCAPE : NomF.ModalResult := mrCancel;
     end;
end;

procedure TNomF.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
     case Key of
          '1' .. '9', '0' : NomF.Edit1.Text := NomF.Edit1.Text + Key;
          ',' : If Edit1.EditMask = '9999999,99;; ' then NomF.Edit1.Text := NomF.Edit1.Text + ',';
          '.' : NomF.Edit1.Text := Edit1.Text + ',';
     end;
end;

procedure TNomF.FormActivate(Sender: TObject);
begin
     a := NomF.Edit1.Text;
     NomF.Edit1.Text := a;
end;

end.
