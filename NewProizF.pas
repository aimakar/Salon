unit NewProizF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons;

type
  TNewProiz = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewProiz: TNewProiz;

implementation

uses Data;

{$R *.DFM}

procedure TNewProiz.BitBtn1Click(Sender: TObject);
begin
NewProiz.ModalResult := mrOk;
end;

procedure TNewProiz.BitBtn2Click(Sender: TObject);
begin
NewProiz.ModalResult := mrCancel;
end;

end.
