unit Vvod_OplF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnList, PlatformDefaultStyleActnCtrls, ActnMan,
  Buttons, Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
  TVvod_Opl = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    summa1: TJvCalcEdit;
    summa2: TJvCalcEdit;
    karted: TJvCalcEdit;
    BonusEd: TJvCalcEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ActionManager1: TActionManager;
    A_Refr: TAction;
    A_WinCr: TAction;
    procedure A_WinCrExecute(Sender: TObject);
    procedure A_RefrExecute(Sender: TObject);
    procedure kartedChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nomer, predpr : string;
    id_kart,  s2, code_pr, bonus : integer;
    s1 : real;
  end;

var
  Vvod_Opl: TVvod_Opl;

implementation

uses Data;

{$R *.dfm}

procedure TVvod_Opl.A_RefrExecute(Sender: TObject);
begin
  if id_kart > 0 then
  with datamain do
  begin
    Find_Predpr.Close;
    Find_predpr.Open;
    Find_Predpr.First;
    if Find_predpr.Locate('code_pr', code_pr, []) then
    begin
      bonus := Find_PredprBonus.AsInteger;
    end
    else
      bonus := 0;

    bonusEd.Value := bonus;

    Find_Predpr.Close;
    BitBtn2.Enabled := ((bonus >= s2) and (s2 > 0));
  end;
end;

procedure TVvod_Opl.A_WinCrExecute(Sender: TObject);
begin
  Edit1.Text := nomer;
  Edit2.Text := predpr;
  summa1.Value := s1;
  karted.Value := id_kart;
  summa2.Value := s2;

  if id_kart > 0 then A_refr.Execute;

end;

procedure TVvod_Opl.kartedChange(Sender: TObject);
begin
  id_kart := round(karted.Value);
end;

end.
