unit Plan_AddF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, JvExComCtrls,
  JvDateTimePicker, Mask, JvExMask, JvToolEdit, JvSpin, ActnList,
  XPStyleActnCtrls, ActnMan, DB, DBTables, DateUtils, IBQuery, IBCustomDataSet,
  IBTable;

type
  TPlan_Add = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    JCE: TJvComboEdit;
    Label1: TLabel;
    JvDateEdit1: TJvDateEdit;
    TE_S: TJvTimeEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TE_d: TJvTimeEdit;
    Edit1: TEdit;
    ActionManager1: TActionManager;
    A_WinCr: TAction;
    A_Save: TAction;
    Query1_: TQuery;
    Query2_: TQuery;
    Table1_: TTable;
    Table1_CODE_PR: TFloatField;
    Table1_OT: TDateField;
    Table1_TM_S: TStringField;
    Table1_TM_E: TStringField;
    Table1_TYPE_: TSmallintField;
    Table1_COMMENT: TStringField;
    Table1_PRIZ: TSmallintField;
    Table1_ID_NAKL: TFloatField;
    RadioGroup1: TRadioGroup;
    Table1_ID: TFloatField;
    Label6: TLabel;
    JCEM: TJvComboEdit;
    Table1_CODE_MAST: TFloatField;
    Table1: TIBTable;
    Query1: TIBQuery;
    Query2: TIBQuery;
    Table1TM_S: TIBStringField;
    Table1TM_E: TIBStringField;
    Table1CODE_PR: TIntegerField;
    Table1TYPE_: TSmallintField;
    Table1PRIZ: TSmallintField;
    Table1ID_NAKL: TIntegerField;
    Table1OT: TDateField;
    Table1ID: TIntegerField;
    Table1CODE_MAST: TIntegerField;
    Table1COMMENT: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure A_SaveExecute(Sender: TObject);
    procedure A_WinCrExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Enter(Sender: TObject);
    procedure RadioGroup1Exit(Sender: TObject);
    procedure JCEButtonClick(Sender: TObject);
    procedure JCEMButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    code_pr, code_mast : integer;
    comment, prnaim : string;
    dat1 : tdate;
    tm1, tm2 : ttime;
    type_ : integer;
    priz : integer;
    vid : integer;
    rg_o, id : integer;
  end;

var
  Plan_Add: TPlan_Add;

implementation

uses Data, SpravPokup, SpravMaster;

{$R *.dfm}

procedure TPlan_Add.A_SaveExecute(Sender: TObject);
var i : integer;
  fts, ftd : string;
 nfts, nftd : ttime;
begin
  try
    Table1.Open;
    if (vid = 0) or (vid = 2) then
    begin
      with dataMain do
      begin
        ConfigVit.Open;
        i := Configvit.fieldByName('zrozn').asinteger;
        ConfigVit.Edit;
        Configvit.fieldByName('zrozn').ASInteger := i + 1;
        ConfigVit.Post;
        ConfigVit.Close;
      end;
      Table1.Append;
      Table1id.ASInteger := i;
    end
    else
    begin
      Table1.Locate('id', id,[]);
      Table1.Edit;
    end;
    Table1code_pr.AsInteger := code_pr;
    Table1code_mast.AsInteger := code_mast;
    Table1ot.AsDateTime := JvDateedit1.date;
    //Table1tm_s.AsString := timetostr(TE_S.Time);
    nfts := TE_S.Time;
    DateTimeToString(fts, 'hh:mm', nfts);
    Table1tm_s.AsString := fts;

    //Table1tm_e.AsString := timetostr(TE_S.Time+TE_d.Time);
    nftd := TE_S.Time+TE_d.Time;
    DateTimeToString (ftd,'hh:mm', nftd);
    Table1tm_e.AsString := ftd;
    table1type_.AsInteger := RadioGroup1.ItemIndex;
    Table1comment.AsString := trim(Edit1.Text);
    Table1.Post;
    Table1.Close;
    ModalResult := mrOk;
  except on E: Exception do
  begin
    ShowMessage('������ ��������� ������' + #13 + E.Message);
    Table1.Close;
  end;
  end;
end;

procedure TPlan_Add.A_WinCrExecute(Sender: TObject);
begin
 // label5.Caption:= inttostr(vid);
  if vid = 1 then                // �������������� �� ������ ������
  begin
    with Query1 do
    begin
      Close;
      ParamByName('id').AsInteger := id;
      Open;
      if not IsEmpty then        // ��������� ���� �� ������
      begin
        Jce.Text := FieldByName('naim').ASString;
        JCEM.Text := FieldByName('naimm').ASString;
        Edit1.Text := FieldByName('comment').ASString;
        code_pr :=  FieldByName('code_pr').AsInteger;
        code_mast :=  FieldByName('code_mast').AsInteger;
      end;
      JvDateedit1.date := dat1;
      TE_S.Time := tm1;
      TE_D.Time := tm2 -  tm1;
      RadioGroup1.ItemIndex := type_;
      Close;
    end;
  end
  else
  if vid = 2 then             // �������������� ������ ������
  begin
    JvDateedit1.date := dat1;
    TE_S.Time := tm1;
    TE_D.Time := tm2 - tm1;
  end
  else
  if vid = 3 then
  begin
    JvDateedit1.date := dat1;
    TE_S.Time := tm1;
    TE_D.Time := tm2 - tm1;
    with datamain.Find_Predpr do
    begin
      Close;
      Open;
      Locate('code_pr', id, []);
      Jce.Text := FieldByName('naim').ASString;
      //JceM.Text := FieldByName('naimm').ASString;
      Edit1.Text := '���� ��������. ���: ' + FieldByName('tel').ASString;
      code_pr :=  id;
      Close;
    end;
    jce.Enabled := false;
    jceM.Enabled := false;
    JvDateedit1.Enabled := false;
    te_s.Enabled := false;
    te_d.Enabled := false;
    edit1.Enabled := false;
    RadioGroup1.Enabled := false;
    BitBtn1.Enabled := false;

  end;


end;

procedure TPlan_Add.BitBtn1Click(Sender: TObject);
begin
  A_Save.Execute;
end;

procedure TPlan_Add.FormCreate(Sender: TObject);
begin
  TE_D.Time := strtotime('00:30');
  vid := 0;
end;

procedure TPlan_Add.JCEButtonClick(Sender: TObject);
begin
  try
    Application.CreateForm(TSprPokup, SprPokup);
    SprPokup.vybor := true;
    SprPokup.close_t:=false;
    SprPokup.FormStyle := fsNormal;
    SprPokup.Visible := false;
    SprPokup.A_WinCr.Execute;
    if SprPokup.ShowModal = mrOk then
    begin
      code_pr := SprPokup.id_;
      JCE.Text := SprPokup.n_;
    end;
  finally
    SprPokup.Release;
  end;

end;

procedure TPlan_Add.JCEMButtonClick(Sender: TObject);
begin
    try
    Application.CreateForm(TSprMaster, SprMaster);
    SprMaster.vyborM := true;
    SprMaster.close_t:=false;
    SprMaster.FormStyle := fsNormal;
    SprMaster.Visible := false;
    SprMaster.A_WinCr.Execute;
    if SprMaster.ShowModal = mrOk then
    begin
      code_mast := SprMaster.idM_;
      JCEM.Text := SprMaster.nM_;
    end;
  finally
    SprMaster.Release;
  end;
end;

procedure TPlan_Add.RadioGroup1Enter(Sender: TObject);
begin
  rg_o := radiogroup1.ItemIndex;
  
end;

procedure TPlan_Add.RadioGroup1Exit(Sender: TObject);
begin
  if RG_O <> RadioGroup1.ItemIndex then
  case RadioGroup1.ItemIndex of
    0 :   TE_D.Time := strtotime('00:30');
    1 :   TE_D.Time := strtotime('00:05');
  end;
  TE_D.Refresh;
end;

end.
