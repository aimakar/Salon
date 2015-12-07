unit Spr_RekvF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ActnList, XPStyleActnCtrls, ActnMan,
  Mask, DBCtrls, DB, DBTables;

type
  TSpr_Rekv = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionManager1: TActionManager;
    A_WinCr: TAction;
    A_Save: TAction;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    procedure A_WinCrExecute(Sender: TObject);
    procedure A_SaveExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Spr_Rekv: TSpr_Rekv;

implementation

uses Data, Sklad;

{$R *.dfm}

procedure TSpr_Rekv.A_SaveExecute(Sender: TObject);
begin
  DataMain.Rekv.Post;
  DataMain.Rekv.ApplyUpdates;
  DataMain.Rekv.Refresh;
  ModalResult := mrok;
end;

procedure TSpr_Rekv.A_WinCrExecute(Sender: TObject);
begin
  DataMain.Rekv.Open;
  if DataMain.Rekv.IsEmpty then DataMain.Rekv.Append else DataMain.Rekv.Edit;

end;

procedure TSpr_Rekv.BitBtn1Click(Sender: TObject);
begin
  A_Save.Execute;
end;

procedure TSpr_Rekv.FormActivate(Sender: TObject);
begin

//Main.
end;

procedure TSpr_Rekv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if DataMain.IBT.InTransaction then  DataMain.IBT.Commit;
end;

procedure TSpr_Rekv.FormCreate(Sender: TObject);
begin
if not DataMain.IBT.InTransaction then DataMain.IBT.StartTransaction;
end;

procedure TSpr_Rekv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_F1 then
          begin
             Application.HelpJump('');
          end;
end;

end.
