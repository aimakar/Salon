unit PassDlgF;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Dialogs;

type
  TPassDlg = class(TForm)
    Label1: TLabel;
    Pass: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label2: TLabel;
    RePass: TEdit;
    procedure OKBtnClick(Sender: TObject);
    procedure PassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RePassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassDlg: TPassDlg;

implementation

{$R *.DFM}

procedure TPassDlg.OKBtnClick(Sender: TObject);
begin
     if Pass.Text = RePass.Text then PassDLG.ModalResult := mrOk
     else
         begin
              ShowMessage('Вы забыли свой пароль!');
              PassDlg.ActiveControl := Pass;
         end;
end;

procedure TPassDlg.PassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then PassDLG.ActiveControl := RePass;
end;

procedure TPassDlg.RePassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then PassDLG.ActiveControl := OkBtn;
end;

end.
 
