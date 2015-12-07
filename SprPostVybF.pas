unit SprPostVybF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls;

type
  TSprPostVyb = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    S : String;
    { Public declarations }
  end;

var
  SprPostVyb: TSprPostVyb;

implementation

uses Data;

{$R *.DFM}

procedure TSprPostVyb.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
       VK_RETURN :
        begin
             DataMain.Post.Refresh;
             ActiveControl := DBGrid1;
        end;
       VK_TAB : ActiveControl := DBGrid1;
     end;
end;

procedure TSprPostVyb.FormActivate(Sender: TObject);
begin
     DataMain.Post.Filtered := True;
end;

procedure TSprPostVyb.FormDeactivate(Sender: TObject);
begin
     DataMain.Post.Filtered := False;
end;

procedure TSprPostVyb.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then SprPostVyb.ModalResult := mrOk;
end;

procedure TSprPostVyb.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case KEY of
          VK_RETURN : begin
                        SPrPostVyb.Tag := DataMain.PostCode_Post.AsInteger;
                        S := Trim(DataMain.PostNaim.AsString);
                        SprPostVyb.ModalResult := mrOk;
                      end;
          VK_TAB : ActiveControl := Edit1;
     end;
end;

end.
