program Salon;

uses
  Forms,
  Windows,
  SysUtils,
  HTMLHelpViewer ,
  Sklad in 'Sklad.pas' {Main},
  Pro in 'Pro.pas' {Pro},
  SpravTov in 'SpravTov.pas' {SprTov},
  SprNovTov in 'SprNovTov.pas' {NewTov},
  SprNewGrTov in 'SprNewGrTov.pas' {NewGroup},
  RedGrTov in 'RedGrTov.pas' {Pereim},
  SpravPokup in 'SpravPokup.pas' {SprPokup},
  SprNewPredpr in 'SprNewPredpr.pas' {NewPredpr},
  SprPostF in 'SprPostF.pas' {SprPost},
  NewPostF in 'NewPostF.pas' {NewPost},
  SpravProiz in 'SpravProiz.pas' {SprProiz},
  NewProizF in 'NewProizF.pas' {NewProiz},
  ProverkaF in 'ProverkaF.pas' {Prov},
  NomForm in 'NomForm.pas' {NomF},
  Data in 'Data.pas' {DataMain: TDataModule},
  AddKolF in 'AddKolF.pas' {AddKol},
  IzlFormF in 'IzlFormF.pas' {IzlForm},
  IzlTF in 'IzlTF.pas' {IzlT},
  AddKolIzlF in 'AddKolIzlF.pas' {AddKolIzl},
  BrakFormF in 'BrakFormF.pas' {BrakForm},
  BrakTF in 'BrakTF.pas' {BrakT},
  PrihodFormF in 'PrihodFormF.pas' {PrihodForm},
  PrihodNaklF in 'PrihodNaklF.pas' {PrihodNakl},
  VozvFormF in 'VozvFormF.pas' {VozvForm},
  VozvnaklF in 'VozvnaklF.pas' {VozvNakl},
  CashFormF in 'CashFormF.pas' {CashForm},
  CashTF in 'CashTF.pas' {CashT},
  DobTovCF in 'DobTovCF.pas' {DobTovC},
  InvF in 'InvF.pas' {Inv},
  DobTovVozvF in 'DobTovVozvF.pas' {DobTovVozv},
  DobTovPrihF in 'DobTovPrihF.pas' {DobTovPrih},
  OplDataF in 'OplDataF.pas' {OplData},
  PassDlgF in 'PassDlgF.pas' {PassDlg},
  KartF in 'KartF.pas' {Kart},
  SprPostVybF in 'SprPostVybF.pas' {SprPostVyb},
  DobTovBrF in 'DobTovBrF.pas' {DobTovBr},
  DobTovIzlF in 'DobTovIzlF.pas' {DobTovIzl},
  CheckDBF in 'CheckDBF.pas' {CheckDB},
  SprPVF in 'SprPVF.pas' {SprPV},
  NacMsgDlgF in 'NacMsgDlgF.pas' {NacMsgDlg},
  VvodNaimF in 'VvodNaimF.pas' {VvodNaim},
  TovMoveF in 'TovMoveF.pas' {TovMove},
  Tovar_GroupF in 'Tovar_GroupF.pas' {Tovar_Group},
  Spr_RekvF in 'Forms\Spr_RekvF.pas' {Spr_Rekv},
  Plan1F in 'Forms\Plan1F.pas' {Plan1},
  Plan_AddF in 'Dialogs\Plan_AddF.pas' {Plan_Add},
  Vvod_OplF in 'Dialogs\Vvod_OplF.pas' {Vvod_Opl},
  Find_StrF in 'Dialogs\Find_StrF.pas' {Find_Str},
  Plan2F in 'Forms\Plan2F.pas' {Plan2},
  SpravMaster in 'SpravMaster.pas' {SprMaster},
  SprNewMaster in 'SprNewMaster.pas' {NewMaster},
  OtchMF in 'OtchMF.pas' {OtchM},
  ObVedF in 'ObVedF.pas' {ObVed},
  Rep1F in 'Rep1F.pas' {Rep_1},
  Rep2F in 'Rep2F.pas' {Rep_2},
  Rep3F in 'Rep3F.pas' {Rep_3};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Система управления';
  Application.HelpFile := GetCurrentDir + '\Help.chm';
  Application.CreateForm(TDataMain, DataMain);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TOtchM, OtchM);
  Application.CreateForm(TObVed, ObVed);
  Application.CreateForm(TRep_1, Rep_1);
  Application.CreateForm(TRep_2, Rep_2);
  Application.CreateForm(TRep_3, Rep_3);
  Application.Run;

end.
