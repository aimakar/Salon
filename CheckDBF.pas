unit CheckDBF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TCheckDB = class(TForm)
    LB: TListBox;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CheckDB: TCheckDB;

implementation

uses Data;

{$R *.DFM}

procedure TCheckDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TCheckDB.FormActivate(Sender: TObject);
var I, K : Integer;
begin
{
with Datamain do
     if Session1.Active then
     begin
      try
      LB.Clear;
      except
      end;
      K := Session1.Databases[0].DataSetCount;
      for I := 1 to K do
          begin
               LB.Items.Add(Session1.DataBases[0].Datasets[i-1].Name);
          end;
     end;
LB.Update;
}

end;

procedure TCheckDB.Timer1Timer(Sender: TObject);
var I, K :Integer;
begin
{
with Datamain do
     if Session1.Active then
     begin
      try
      LB.Clear;
      except
      end;
      K := Session1.Databases[0].DataSetCount;
      for I := 1 to K do
          begin
               LB.Items.Add(Session1.DataBases[0].Datasets[i-1].Name);
          end;
     end;
LB.Update;
}
end;

end.
