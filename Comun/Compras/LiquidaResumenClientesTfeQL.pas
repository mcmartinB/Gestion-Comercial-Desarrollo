unit LiquidaResumenClientesTfeQL;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, grimgctrl, DB;

type
  TQLLiquidaResumenClientesTfe = class(TQuickRep)
    QRBand5: TQRBand;
    qrlblTitulo: TQRLabel;
    SummaryBand1: TQRBand;
    qrgrpCabStatus: TQRGroup;
    qrbndPieStatus: TQRBand;
    QRExpr11: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr53: TQRExpr;
    grpagefooter: TQRBand;
    q12: TQRLabel;
    q9: TQRLabel;
    qTotalDestrioTfe: TQRLabel;
    q1: TQRLabel;
    qTotalPeso: TQRLabel;
    procedure qrgrpCabStatusBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndPieStatusBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
     bProvLiq: boolean;
  public

  end;
  var rTotalDestrioTfe, rTotalPeso: Real;

  var QLLiquidaResumenClientesTfe: TQLLiquidaResumenClientesTfe;
  procedure PrevisualizarResumenClientesTfe( const AOwner: TComponent; const AEmpresa: string; const APrecios, AProvLiq: boolean;
                                             ATotalDestrioTfe, ATotalPeso:Real );

implementation

{$R *.DFM}

uses LiquidaEntregaDL, UDMAuxDB,  DPreview, CReportes;


procedure PrevisualizarResumenClientesTfe( const AOwner: TComponent; const AEmpresa: string; const APrecios, AProvLiq: boolean;
                                           ATotalDestrioTfe, ATotalPeso:Real );
var
  sAux: string;
begin
  QLLiquidaResumenClientesTfe := TQLLiquidaResumenClientesTfe.Create(AOwner);
  QLLiquidaResumenClientesTfe.bProvLiq := AProvLiq;
  PonLogoGrupoBonnysa(QLLiquidaResumenClientesTfe, AEmpresa);
  sAux:= QLLiquidaResumenClientesTfe.DataSet.FieldByName('res_anyo_semana').AsString;
  QLLiquidaResumenClientesTfe.qrlblTitulo.Caption:= 'RESUMEN POR CLIENTE ' + AEmpresa  + ' - SEMANA ' + sAux;
  QLLiquidaResumenClientesTfe.ReportTitle:= 'RESUMEN_POR_CLIENTE_' + AEmpresa  + '_SEMANA_' + sAux;
  rTotalDestrioTfe := ATotalDestrioTfe;
  rTotalPeso := ATotalPeso;
  //Preview(QLLiquidaResumenClientesTfe);
end;

procedure TQLLiquidaResumenClientesTfe.qrbndPieStatusBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qTotalPeso.Caption := FormatFloat('###,###,###,##0;-###,###,###,##0;0', rTotalPeso + rTotalDestrioTfe);
end;

procedure TQLLiquidaResumenClientesTfe.qrgrpCabStatusBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qTotalDestrioTfe.Caption := FormatFloat('###,###,###,##0;-###,###,###,##0;0', rTotalDestrioTfe);
end;

end.

