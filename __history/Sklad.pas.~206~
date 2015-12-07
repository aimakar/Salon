unit Sklad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, Db, DBTables, Buttons, ToolWin,
  StdCtrls, DBCtrls, JvPageList, JvNavigationPane, JvExControls, ActnList,
  XPStyleActnCtrls, ActnMan, JvButton, strutils, JvTFManager, JvTFGlance,
  JvTFWeeks, JvTFDays, ComObj, ActiveX, Variants, JvExStdCtrls,
  JvControlPanelButton, Grids, DBGrids, JvExDBGrids, JvDBGrid, HTMLHelpViewer;



type
  TMain = class(TForm)
    JvNavigationPane1: TJvNavigationPane;
    JvNavPanelPage1: TJvNavPanelPage;
    JvNavPanelHeader1: TJvNavPanelHeader;
    JvNavPanelButton1: TJvNavPanelButton;
    ActionManager1: TActionManager;
    N2: TAction;
    JvNavPanelButton2: TJvNavPanelButton;
    N3: TAction;
    N8: TAction;
    N41: TAction;
    JvNavPanelButton4: TJvNavPanelButton;
    JvNavPanelButton6: TJvNavPanelButton;
    JvNavPanelButton8: TJvNavPanelButton;
    N9: TAction;
    N47: TAction;
    N28: TAction;
    JvNavPanelPage3: TJvNavPanelPage;
    JvNavPanelPage5: TJvNavPanelPage;
    N124: TAction;
    N125: TAction;
    N127: TAction;
    N129: TAction;
    A_Inv: TAction;
    A_About: TAction;
    JvNavPanelPage6: TJvNavPanelPage;
    JvNavPanelButton12: TJvNavPanelButton;
    JvNavPanelHeader3: TJvNavPanelHeader;
    JvNavPanelHeader4: TJvNavPanelHeader;
    A_Address: TAction;
    JvNavPanelButton15: TJvNavPanelButton;
    A_Plan_Kl: TAction;
    A_Plan_Ring: TAction;
    JvNavPanelButton16: TJvNavPanelButton;
    JvNavPanelHeader5: TJvNavPanelHeader;
    JvNavPanelButton18: TJvNavPanelButton;
    A_Spr_Tovar: TAction;
    A_Spr_predpr: TAction;
    JvNavPanelButton19: TJvNavPanelButton;
    A_Rekv: TAction;
    JvNavPanelButton20: TJvNavPanelButton;
    A_Spr_proiz: TAction;
    JvNavPanelButton17: TJvNavPanelButton;
    A_Spr_Post: TAction;
    JvNavPanelButton21: TJvNavPanelButton;
    StatusBar1: TStatusBar;
    JvNavPanelButton3: TJvNavPanelButton;
    A_Spr_Master: TAction;
    JvNavPanelPage2: TJvNavPanelPage;
    JvNavPanelHeader2: TJvNavPanelHeader;
    JvNavPanelButton5: TJvNavPanelButton;
    JvNavPanelButton7: TJvNavPanelButton;
    JvNavPanelButton9: TJvNavPanelButton;
    procedure N22Click(Sender: TObject);
    procedure StatusBar1DblClick(Sender: TObject);
    procedure N160Click(Sender: TObject);
    procedure N2Execute(Sender: TObject);
    procedure N3Execute(Sender: TObject);
    procedure N8Execute(Sender: TObject);
    procedure N9Execute(Sender: TObject);
    procedure N28Execute(Sender: TObject);
    procedure A_Spr_TovarExecute(Sender: TObject);
    procedure A_Spr_predprExecute(Sender: TObject);
    procedure A_RekvExecute(Sender: TObject);
    procedure A_Spr_proizExecute(Sender: TObject);
    procedure A_Spr_PostExecute(Sender: TObject);
    procedure A_Plan_KlExecute(Sender: TObject);
    procedure A_Plan_RingExecute(Sender: TObject);
    procedure A_InvExecute(Sender: TObject);
    procedure A_Spr_MasterExecute(Sender: TObject);
    procedure JvNavPanelButton5Click(Sender: TObject);
    procedure JvNavPanelButton7Click(Sender: TObject);
    procedure JvNavPanelButton9Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

  function CheckExcelInstall : boolean;
  function CheckExcelRun: boolean;
  function RunExcel(DisableAlerts:boolean=true; Visible: boolean=true): boolean;
  function NewBook(AutoRun:boolean=true):boolean;
  procedure MerCen(ran: string);

var
  Main: TMain;
  MyExcel: OleVariant;
const
  ExcelApp = 'Excel.Application';
  xlCenter = -4108;
  xlEdgeBottom = 9;
  xlEdgeLeft = 7;
  xlEdgeRight = 10;
  xlEdgeTop = 8;
implementation

uses  Data, SpravTov, SpravPokup, SprPostF, SpravProiz,
  IzlFormF, BrakFormF, PrihodFormF, VozvFormF,
  CashFormF, Pro, CheckDBF, Tovar_GroupF, Spr_RekvF,
  Plan1F, InvF, Plan2F, SpravMaster, OtchMF, ObVedF;
{$R *.DFM}

procedure TMain.N22Click(Sender: TObject);
begin
  if MessageDlg('Вы хотите выйти?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Main.Close;
end;

procedure TMain.N28Execute(Sender: TObject);
begin
  try
    if not Assigned(IzlForm) then
      Application.CreateForm(TIzlForm, IzlForm);
    IzlForm.A_WinCr.Execute;
    IzlForm.Show;
  except
    IzlForm := nil;
    N28.Execute;
  end;
end;

procedure TMain.N8Execute(Sender: TObject);
begin
  try
    if not Assigned(CashForm) then
      Application.CreateForm(TCashForm, CashForm);
    CashForm.A_WinCr.Execute;
    CashForm.Show;
  except
    CashForm := nil;
    N8.Execute;
  end;
end;

procedure TMain.A_Spr_TovarExecute(Sender: TObject);
begin
  try
    if not Assigned(SprTov) then
    Application.CreateForm(TSprTov, SprTov);
    SprTov.A_WinCr.Execute;
    SprTov.Show;
  except
    SprTov := nil;
    A_Spr_Tovar.Execute;
  end;
end;

procedure TMain.A_Spr_predprExecute(Sender: TObject);
begin
  try
    if not Assigned(SprPokup) then
    Application.CreateForm(TSprPokup, SprPokup);
    SprPokup.A_WinCr.Execute;
    SprPokup.Show;
    SprPokup.close_t:=true;
  except
    SprPokup := nil;
    A_Spr_predpr.Execute;
  end;
end;

procedure TMain.A_Spr_MasterExecute(Sender: TObject);
begin
  try
    if not Assigned(SprMaster) then
    Application.CreateForm(TSprMaster, SprMaster);
    SprMaster.A_WinCr.Execute;
    SprMaster.Show;
    SprMaster.close_t:=true;
  except
     SprMaster := nil;
     A_Spr_Master.Execute;
  end;
end;

procedure TMain.A_Spr_proizExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TSprProiz, SprProiz);
    SprProiz.A_WinCr.Execute;
    SprProiz.Show;
  except
    SprProiz := nil;
    A_Spr_proiz.Execute;

  end;
end;

procedure TMain.A_Spr_PostExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TSprPost, SprPost);
    SprPost.A_WinCr.Execute;
    SprPost.Show;
  except
    SprPost := nil;
    A_Spr_Post.Execute;
  end;
end;

procedure TMain.A_InvExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TInv, Inv);
    Inv.ShowModal;
  finally
    Inv.Release;
  end;
end;

procedure TMain.A_Plan_KlExecute(Sender: TObject);
begin
  try
    if not Assigned(Plan1) then
      Application.CreateForm(TPlan1, Plan1);
    Plan1.t_ := 0;
    Plan1.A_WinCr.Execute;
    Plan1.Show;
  except
    Plan1 := nil;
    A_Plan_Kl.Execute;
  end;

end;

procedure TMain.A_Plan_RingExecute(Sender: TObject);
begin
  try
    if not Assigned(Plan2) then
      Application.CreateForm(TPlan2, Plan2);
    Plan2.t_ := 1;
    Plan2.A_WinCr.Execute;
    Plan2.Show;
  except
    Plan2 := nil;
    A_Plan_Ring.Execute;
  end;

end;

procedure TMain.A_RekvExecute(Sender: TObject);
begin
  try
     Application.CreateForm(TSpr_Rekv, Spr_Rekv);
     Spr_Rekv.A_WinCR.Execute;
     Spr_Rekv.ShowModal;
  finally
     Spr_Rekv.release;
  end;
end;

procedure TMain.FormActivate(Sender: TObject);
begin
if DataMain.IBT.InTransaction then DataMain.IBT.Commit;
Main.Caption:=Main.Caption+'                                     База: '+DataMain.Base;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
CloseData;
end;

function CheckExcelInstall:boolean;
var
  ClassID: TCLSID;
  Rez : HRESULT;
begin
// Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(ExcelApp)), ClassID);
  if Rez = S_OK then  // Объект найден
    Result := true
  else
    Result := false;
end;

function CheckExcelRun: boolean;
begin
  try
    MyExcel:=GetActiveOleObject(ExcelApp);
    Result:=True;
  except
    Result:=false;
  end;
end;

function RunExcel(DisableAlerts:boolean=true; Visible: boolean=true): boolean;
begin
  try
{проверяем установлен ли Excel}
    if CheckExcelInstall then
      begin
        MyExcel:=CreateOleObject(ExcelApp);
//показывать/не показывать системные сообщения Excel
        MyExcel.Application.DisplayAlerts:= false;//DisableAlerts;
        MyExcel.Visible:=Visible;
       // SetForegroundWindow(MyExcel.Hwnd);
        Result:=true;
      end
    else
      begin
        MessageBox(0,'Приложение MS Excel не установлено на этом компьютере','Ошибка',MB_OK+MB_ICONERROR);
        Result:=false;
      end;
  except
    Result:=false;
  end;
end;

function NewBook(AutoRun:boolean=true):boolean; // создаёт новую книгу
begin
  if CheckExcelRun then
    begin
      MyExcel.WorkBooks.add;
      Result:=true;
    end
  else
   if AutoRun then
     begin
       RunExcel;
       MyExcel.WorkBooks.add;
       Result:=true;
     end
   else
     Result:=false;
end;

procedure MerCen(ran: string);    // объединяет ячейки и центрирует текст
begin
  MyExcel.Range[ran].Select;
  MyExcel.Selection.HorizontalAlignment := xlCenter;
  MyExcel.Selection.VerticalAlignment := xlCenter;
  MyExcel.Selection.WrapText:= false;
  MyExcel.Selection.Orientation := 0;
  MyExcel.Selection.ShrinkToFit := False;
  MyExcel.Selection.MergeCells := False;
  MyExcel.Selection.Merge;
end;

procedure TMain.JvNavPanelButton5Click(Sender: TObject);
var i,k: integer;
begin
 if not DataMain.IBT.InTransaction then  DataMain.IBT.StartTransaction;
 NewBook(true);
 for k := 1 to 3 do
  begin
    MyExcel.Cells[1,k].Interior.Color := clGreen;
    MyExcel.Cells[1,k].Font.Size:=13;
    MyExcel.Cells[1,k].Font.Bold:=true;
  end;
 MyExcel.Cells[1,1]:='Наименование';
 MyExcel.Cells[1,2]:='Операт. количество';
 MyExcel.Cells[1,3]:='Факт. количество';
 MyExcel.Columns.Range['A:A'].ColumnWidth := 81;
 MyExcel.Columns.Range['B:B'].ColumnWidth := 23;
 MyExcel.Columns.Range['C:C'].ColumnWidth := 20;
 DataMain.Otch_o.Close;
 DataMain.Otch_o.Open;
 i:=2;
 try
 while not DataMain.Otch_o.Eof do
  begin
    MyExcel.Cells[i,1]:= DataMain.Otch_o.FieldByName('naim').AsString;
    MyExcel.Cells[i,2]:= DataMain.Otch_o.FieldByName('kol1').AsString;
    MyExcel.Cells[i,3]:= DataMain.Otch_o.FieldByName('kol2').AsString;
    i:=i+1;
    DataMain.Otch_o.Next;
  end;
 except

 end;
 SetForegroundWindow(MyExcel.Hwnd);
 MyExcel:=UnAssigned;
 if DataMain.IBT.InTransaction then  DataMain.IBT.Commit;
end;

procedure TMain.JvNavPanelButton7Click(Sender: TObject);
begin
try
    Application.CreateForm(TOtchM, OtchM);
    OtchM.ShowModal;
  finally
    OtchM.Release;
  end;
end;

procedure TMain.JvNavPanelButton9Click(Sender: TObject);
begin
try
    if not Assigned(ObVed) then
      Application.CreateForm(TObVed, ObVed);
      ObVed.Show;
  except
     ObVed := nil;
  end;
end;

procedure TMain.N9Execute(Sender: TObject);
begin
  try
    if not Assigned(BrakForm) then
    Application.CreateForm(TBrakForm, BrakForm);
    BrakForm.A_WinCr.Execute;
    BrakForm.Show;
  except
    BrakForm := nil;
    N9.Execute;
  end;
end;

procedure TMain.N2Execute(Sender: TObject);
begin
  try
    if not Assigned(PrihodForm) then
      Application.CreateForm(TPrihodForm, PrihodForm);
    PrihodForm.A_WinCr.Execute;
    PrihodForm.Show;
  except
    PrihodForm := nil;
    N2.Execute;
  end;
end;

procedure TMain.N3Execute(Sender: TObject);
begin
  try
   if not DataMain.IBT.InTransaction then  DataMain.IBT.StartTransaction;
    if not Assigned(VozvForm) then
      Application.CreateForm(TVozvForm, VozvForm);
    VozvForm.A_WinCr.Execute;
    VozvForm.Show;
  except
    VozvForm := nil;
    N3.Execute;
  end;
end;

procedure TMain.StatusBar1DblClick(Sender: TObject);
begin
     Application.CreateForm(TCheckDB,CheckDB);
end;

procedure TMain.N160Click(Sender: TObject);
begin
  if not Assigned(Tovar_Group) then
    Application.CreateForm(TTovar_Group, Tovar_Group);
  Tovar_Group.ShowModal;
  Tovar_Group.Release;
  Tovar_Group := nil;

end;

end.
