unit Tovar_GroupF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TTovar_Group = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    T_Name : string;
    T_ID : integer;
  end;

var
  Tovar_Group: TTovar_Group;

implementation

uses Data;

{$R *.DFM}

procedure TTovar_Group.FormCreate(Sender: TObject);
begin
    // DataMain.Tovar_GR.Open;
end;

procedure TTovar_Group.FormDestroy(Sender: TObject);
begin
   //  DataMain.Tovar_GR.Close;
end;

procedure TTovar_Group.N1Click(Sender: TObject);
var S : string;
    ID : integer;
begin
  if InputQuery('������� ������������ �������� ������', '�������� ������:', S) then
  begin
    DataMain.ConfigVit.Open;
    ID := DataMain.ConfigVit.FieldByName('TGR_ID').AsInteger;
    DataMain.ConfigVit.Edit;
    DataMain.ConfigVit.FieldByName('TGR_ID').AsInteger := ID + 1;
    DataMain.ConfigVit.Post;
    DataMain.ConfigVit.Close;
    ID := ID + 1;

{    Datamain.Tovar_GR.Append;
    DataMain.Tovar_GRID.AsInteger := ID;
    DataMain.Tovar_GRName.AsString := trim(AnsiUpperCase(S));
    DataMain.Tovar_GR.Post; }
  end;
end;

procedure TTovar_Group.N2Click(Sender: TObject);

var S : string;
    ID : integer;
begin
 { S := DataMain.Tovar_GRName.AsString;
  ID := DataMain.Tovar_GRID.AsInteger;
  if InputQuery('������� ������������ �������� ������', '�������� ������:', S) then
  begin
    Datamain.Tovar_GR.Edit;
    DataMain.Tovar_GRName.AsString := trim(AnsiUpperCase(S));
    DataMain.Tovar_GR.Post;
  end;   }
end;



procedure TTovar_Group.N3Click(Sender: TObject);
begin
   {  if not (DataMain.Tovar_GR.IsEmpty) and (MessageDLG('������� ������� ������?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
         DataMain.Tovar_GR.Delete;
    end;   }
end;

procedure TTovar_Group.N5Click(Sender: TObject);
begin
    { if not(DataMain.Tovar_GR.IsEmpty) then
     begin
          T_Name := DataMain.Tovar_GRName.AsString;
          T_ID := DataMain.Tovar_GRID.AsInteger;
          ModalResult := mrOk;
     end;  }
end;

procedure TTovar_Group.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then ModalResult := mrCancel;
end;

end.
