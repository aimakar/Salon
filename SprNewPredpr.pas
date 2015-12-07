unit SprNewPredpr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
   DB, IBDatabase, IBCustomDataSet, IBQuery, ActnList,
  PlatformDefaultStyleActnCtrls, ActnMan, JvToolEdit, JvDBControls, JvExMask,
  JvBaseEdits, JvExDBGrids, JvDBGrid, DBTables, JvDataSource;

type
  TNewPredpr = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBText1: TDBText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label14: TLabel;
    ActionManager1: TActionManager;
    A_WinCr: TAction;
    A_Refr: TAction;
    ID_KartED: TJvDBCalcEdit;
    Label15: TLabel;
    BonusEd: TJvDBCalcEdit;
    Label16: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    Panel2: TPanel;
    dat1: TJvDateEdit;
    dat2: TJvDateEdit;
    SpeedButton1: TSpeedButton;
    A_Refr_Stat: TAction;
    JvDBGrid1: TJvDBGrid;
    A_Edit: TAction;
    SpeedButton2: TSpeedButton;
    A_Refr_Bonus: TAction;
    SpeedButton3: TSpeedButton;
    Q_Stat: TIBQuery;
    DataSource1: TJvDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure A_WinCrExecute(Sender: TObject);
    procedure A_Refr_StatExecute(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure A_EditExecute(Sender: TObject);
    procedure A_Refr_BonusExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    code : integer;
  end;

var
  NewPredpr: TNewPredpr;

implementation

uses Data, Pro, CashTF;

{$R *.DFM}

procedure TNewPredpr.BitBtn2Click(Sender: TObject);
begin
     NewPredpr.ModalResult := mrCancel;
end;

procedure TNewPredpr.A_EditExecute(Sender: TObject);
begin
  With DataMain do
  if not Q_Stat.IsEmpty then
    try
      Application.CreateForm(TCashT, CashT);
      CashT.PC1.ActivePage := CashT.PC1.Pages[1];
      CashT.Label2.Caption := Q_Stat.FieldByName('nomer').AsString;
      CashT.DE.Text := Q_Stat.FieldByName('Ot').AsString;
      CashT.ED.Text := Q_Stat.FieldByName('Skidka').AsString;
      CashT.ShowModal;
      if CashNakl.State = dsBrowse then CashNakl.Edit;
      CashNaklOt.AsString := CashT.DE.Text;
      Try
        CashNaklSkidka.AsInteger := StrToInt(Trim(CashT.ED.Text));
      except
        CashNaklSkidka.AsInteger := 0;
      end;
      Try
        CashNaklSumma.AsFloat := StrToFloat(Trim(CashT.Label11.Caption));
      Except
        CashNaklSumma.AsFloat := 0;
      end;
      CashNakl.Post;
      CashNakl.ApplyUpdates;
      DataMain.IBT.CommitRetaining;
    finally
      CashT.Release;
    end;

end;

procedure TNewPredpr.A_Refr_BonusExecute(Sender: TObject);
var sum : real;
  bon : integer;
begin
  // �������� ������� �� �������
  // ��������� � �/� ���� ���� �������, � � ������� �� ������� - �����
    BonusEd.Value := DataMain.Set_bonus(code);
end;

procedure TNewPredpr.A_Refr_StatExecute(Sender: TObject);
begin
  with Q_Stat do
  begin
    DisableControls;
    Close;
    Q_Stat.ParamByName('dat1').AsDate := dat1.Date;
    Q_Stat.ParamByName('dat2').AsDate := dat2.Date;
    Q_Stat.ParamByName('code_pr').AsInteger := code;
    Open;
    EnableControls;
  end;
end;

procedure TNewPredpr.A_WinCrExecute(Sender: TObject);
begin
  if code = 0 then //�������� ������ �������
  begin
//
  end;
  try


{    Q_Main.Close;
    Q_Main.Params.ParamValues['code'] := code;
    Q_Main.Open;
    Q_main.Close;}
  except on E: Exception do
    ShowMessage('������: ' + E.Message);
  end;
  dat1.Date := now - 90;
  A_Refr_Stat.Execute;
end;

procedure TNewPredpr.BitBtn1Click(Sender: TObject);
begin
     NewPredpr.ModalResult := mrOk;
end;

procedure TNewPredpr.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit2;
     end;
end;

procedure TNewPredpr.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit3;
     end;

end;

procedure TNewPredpr.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit4;
     end;

end;

procedure TNewPredpr.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit11;
     end;

end;

procedure TNewPredpr.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit5;
     end;

end;

procedure TNewPredpr.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit6;
     end;

end;

procedure TNewPredpr.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit8;
     end;

end;

procedure TNewPredpr.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := BitBtn1;
     end;

end;

procedure TNewPredpr.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit7;
     end;

end;

procedure TNewPredpr.DBEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN : NewPredpr.ActiveControl := DBEdit9;
     end;

end;

procedure TNewPredpr.FormCreate(Sender: TObject);
begin
//  IB.Close;
 // IB.DatabaseName := DataMain.base;
//  IB.Params := DataMain.bpar;
  with Q_Stat do
  begin
  //  DisableControls;
    Close;
    Q_Stat.ParamByName('dat1').AsDate := dat1.Date;
    Q_Stat.ParamByName('dat2').AsDate := dat2.Date;
    Q_Stat.ParamByName('code_pr').AsInteger := code;
    Open;
//    EnableControls;
  end;

end;

procedure TNewPredpr.JvDBGrid1DblClick(Sender: TObject);
begin
  if not Q_Stat.IsEmpty then A_Edit.Execute;

end;

end.
