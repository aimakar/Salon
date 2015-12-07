unit NacMsgDlgF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
  TNacMsgDlg = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    NacEdit1: TJvCalcEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NacMsgDlg: TNacMsgDlg;

implementation

{$R *.DFM}

end.
