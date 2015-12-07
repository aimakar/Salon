unit SprPostF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables, Menus, ToolWin, ActnMan, ActnCtrls,
  ActnList, XPStyleActnCtrls, IBCustomDataSet, IBQuery;

type
  TSprPost = class(TForm)
    DBGrid1: TDBGrid;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ActionManager1: TActionManager;
    A_WinCr: TAction;
    A_Ins: TAction;
    A_Edit: TAction;
    A_Del: TAction;
    A_Exit: TAction;
    ActionToolBar1: TActionToolBar;
    A_Nac: TAction;
    A_Find: TAction;
    Query1: TIBQuery;
    Query2: TIBQuery;
    Query3: TIBQuery;
    Query2CODE_POST: TIntegerField;
    Query3CODE_PR: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PostNac;
    procedure A_InsExecute(Sender: TObject);
    procedure A_EditExecute(Sender: TObject);
    procedure A_DelExecute(Sender: TObject);
    procedure A_ExitExecute(Sender: TObject);
    procedure A_NacExecute(Sender: TObject);
    procedure A_FindExecute(Sender: TObject);
    procedure A_WinCrExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SprPost: TSprPost;

implementation

uses Data, NewPostF, SprNewPredpr, Sklad, NacMsgDlgF, Pro;

{$R *.DFM}

procedure TSprPost.A_EditExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TNewPost, NewPost);
    NewPost.CheckBox1.Enabled := False;
    NewPost.CheckBox2.Enabled := False;
    NewPost.Caption := '�������� � �������������� �������� � ����������';
    DataMain.Post.Edit;
    if NewPost.ShowModal = mrCancel then
      DataMain.Post.Cancel
    else
      DataMain.Post.Post;
  finally
    NewPost.Release;
  end;
  DataMain.Post.ApplyUpdates;
  DataMain.IBT.CommitRetaining;
end;

procedure TSprPost.A_DelExecute(Sender: TObject);
var S : Boolean;
begin
  if MessageDlg('������� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    S := False;
          Query1.Close;
          Query1.ParamByName('code_post').AsInteger:= DataMain.PostCODE_Post.AsInteger;
          Query1.Open;
          S:= Query1.RecordCount>0;
          Query2.Close;
          Query2.ParamByName('code_post').AsInteger:= DataMain.PostCODE_Post.AsInteger;
          Query2.Open;
          S:= Query2.RecordCount>0;
    if not(S) then
      DataMain.Post.Delete
    else
      ShowMessage('�� ������� ���������� ���� ��������, �������� ����������!');
  end;
  DataMain.Post.ApplyUpdates;
  DataMain.IBT.CommitRetaining;
end;

procedure TSprPost.A_ExitExecute(Sender: TObject);
begin
  SprPost.Release;
end;

procedure TSprPost.A_FindExecute(Sender: TObject);
var S : string;
    SavePlace: TBookmark;
    L : Boolean;
begin
     if InputQuery('����� �� ���������', '������� �������� ����������', S) then
     begin
       SavePlace := DataMain.Post.GetBookmark;
       DataMain.Post.DisableControls;
       DataMain.Post.First;
       L := True;
       while (not DataMain.Post.EOF) and L do
       begin
         L := not(Pos(AnsiUpperCase(S), AnsiUpperCase(DataMain.PostNaim.AsString)) > 0);
         if L then
         DataMain.Post.Next;
       end;
       if L then DataMain.Post.GotoBookmark(SavePlace);
       DataMain.Post.FreeBookmark(SavePlace);
       DataMain.Post.EnableControls;
     end;
end;

procedure TSprPost.A_InsExecute(Sender: TObject);
var i : integer;
begin
  try
    Application.CreateForm(TNewPost, NewPost);
    NewPost.Caption := '���������� ������ ����������';
    NewPost.CheckBox1.Enabled := True;
    NewPost.CheckBox2.Enabled := True;
    With DataMain do
    begin
      Post.Refresh;
      ConfigVit.Open;
      I := ConfigVit.FieldByName('Nomer16').AsInteger + 1;
      ConfigVit.Edit;
      ConfigVit.FieldByName('Nomer16').AsInteger := I;
      ConfigVit.post;
      ConFigVit.Close;
      Post.Append;
      PostCode_Post.AsInteger := I;
      PostCons.AsInteger :=0;
      Post.Post;
      Post.Edit;
      if NewPost.ShowModal = mrCancel then
      begin
        Post.Cancel;
        Post.Delete;
      end
      else
      begin
        Post.post;
      end;
      If NewPost.CheckBox1.Checked then
      begin
        Predpr.Open;
        ConfigVit.Open;
        I := ConfigVit.FieldByName('Nomer15').AsInteger + 1;
        ConfigVit.Edit;
        ConfigVit.FieldByName('Nomer15').AsInteger := I;
        ConfigVit.post;
        ConFigVit.Close;
        Predpr.Append;
        PredprCode_Pr.AsInteger := I;
        PredprNaim.AsString := PostNaim.AsString;
        Predpr.Post;
        if MessageDlg('������� ��������������� ������ �������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          try
            Predpr.Edit;
            NewPredpr.ShowModal;
            Predpr.Post;
          finally
            NewPredpr.Release;
          end;
        end;
        Predpr.ApplyUpdates;
        DataMain.IBT.CommitRetaining;
        Predpr.Close;
      end;
      If NewPost.CheckBox2.Checked then
      begin
        Proiz.Open;
        ConfigVit.Open;
        I := ConfigVit.FieldByName('Nomer17').AsInteger + 1;
        ConfigVit.Edit;
        ConfigVit.FieldByName('Nomer17').AsInteger := I;
        ConfigVit.post;
        ConFigVit.Close;
        Proiz.Append;
        ProizCode_Proiz.AsInteger := I;
        ProizNaim.AsString := PostNaim.AsString;
        ProizPrim.AsString := PostPrim.AsString;
        Proiz.Post;
        Proiz.ApplyUpdates;
        DataMain.IBT.CommitRetaining;
        Proiz.Close;
      end;
    end;
  finally
    NewPost.Release;
  end;
  DataMain.Post.ApplyUpdates;
  DataMain.IBT.CommitRetaining;
  DataMain.Post.Refresh;
end;

procedure TSprPost.A_NacExecute(Sender: TObject);
begin
  PostNac;

end;

procedure TSprPost.A_WinCrExecute(Sender: TObject);
begin
//
end;

procedure TSprPost.FormActivate(Sender: TObject);
begin
if not DataMain.IBT.InTransaction then  DataMain.IBT.StartTransaction;
     DataMain.Post.Active := True;
end;

procedure TSprPost.FormDeactivate(Sender: TObject);
begin
     DataMain.Post.Close;
end;

procedure TSprPost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if  DataMain.IBT.InTransaction then DataMain.IBT.Commit;
     Action := caFree;
end;

procedure TSprPost.PostNac;
var Dost :String;
begin
// ��������� ������� ��� ����������.
try
  Application.CreateForm(TNacMsgDlg, NacMsgDlg);
  if NacMsgDlg.ShowModal = mrOk then
  begin
    Query1.ParamByName('nacen').Value := NacMsgDlg.NacEdit1.Value;
    Query1.ParamByName('code_post').Value := DataMain.PostCode_post.Value;
    Query1.ExecSql;
    ShowMessage('���� �����������');
  end;
finally
  NacMsgDlg.Release;
end

end;



end.
