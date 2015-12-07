unit Rep1F;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, qrpctrls;

type
  TRep_1 = class(TForm)
    Rep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRPDBText1: TQRPDBText;
    QRPDBText2: TQRPDBText;
    QRPDBText3: TQRPDBText;
    QRPDBText4: TQRPDBText;
    QRPDBText5: TQRPDBText;
    QRPDBText6: TQRPDBText;
    QRPDBText7: TQRPDBText;
    QRPDBText8: TQRPDBText;
    QRPDBText9: TQRPDBText;
    QRPDBText10: TQRPDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRExpr1Print(sender: TObject; var Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rep_1: TRep_1;

implementation

uses ObVedF;

{$R *.dfm}

procedure TRep_1.QRExpr1Print(sender: TObject; var Value: string);
begin
  Value := DateToStr(ObVed.dat1.date)+'   -   '+DateToStr(ObVed.dat2.date);
end;

end.
