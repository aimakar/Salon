unit SprNewMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, JvExMask, JvToolEdit, JvDBControls;

type
  TNewMaster = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    JvDBDateEdit1: TJvDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewMaster: TNewMaster;

implementation

uses Data;

{$R *.dfm}

procedure TNewMaster.BitBtn1Click(Sender: TObject);
begin
  NewMaster.ModalResult := mrOk;

end;

procedure TNewMaster.BitBtn2Click(Sender: TObject);
begin
NewMaster.ModalResult := mrCancel;

end;

end.
