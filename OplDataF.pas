unit OplDataF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TOplData = class(TForm)
    Dat1: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OplData: TOplData;

implementation

{$R *.DFM}

procedure TOplData.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if KEY = VK_ESCAPE then OplData.ModalResult := mrCancel;
end;

procedure TOplData.BitBtn1Click(Sender: TObject);
begin
     OplData.ModalResult := mrOk;
end;

procedure TOplData.BitBtn2Click(Sender: TObject);
begin
     OplData.ModalResult := mrCancel;
end;

procedure TOplData.FormCreate(Sender: TObject);
begin
     dat1.date := now;
end;

end.
