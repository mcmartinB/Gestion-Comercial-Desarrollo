unit ParteProduccionDetQL;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQLParteProduccionDet = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    lblPeriodo: TQRLabel;
    PsQRSysData1: TQRSysData;
    PsQRLabel1: TQRLabel;
    QRLabel1: TQRLabel;
    qrbndTotales: TQRBand;
    qrshpTotal: TQRShape;
    qrlbl5: TQRLabel;
    qrlblPsQRLabel5: TQRLabel;
    qrxpr18: TQRExpr;
    qrxpr23: TQRExpr;
    qrxpr24: TQRExpr;
    qrxpr25: TQRExpr;
    qrgrp1: TQRGroup;
    qrxpr26: TQRExpr;
    qrxpr27: TQRExpr;
    qrxpr28: TQRExpr;
    qrbndPieGroup: TQRBand;
    qrshp1: TQRShape;
    qrxpr33: TQRExpr;
    qrxpr38: TQRExpr;
    qrxpr39: TQRExpr;
    qrxpr40: TQRExpr;
    qrxpr49: TQRExpr;
    qrlbl21: TQRLabel;
    DetailBand1: TQRBand;
    secciones: TQRExpr;
    qrxpr1: TQRExpr;
    qrxpr9: TQRExpr;
    qrxpr13: TQRExpr;
    qrxpr14: TQRExpr;
    qrlbl22: TQRLabel;
    qrlbl11: TQRLabel;
    qrlbl12: TQRLabel;
    qrlbl13: TQRLabel;
    qrlbl14: TQRLabel;
    qrxpr41: TQRExpr;
    qrxpr42: TQRExpr;
    qrxpr43: TQRExpr;
    qrxpr44: TQRExpr;
    qrlbl15: TQRLabel;
    qrlbl16: TQRLabel;
    qrxpr45: TQRExpr;
    qrxpr46: TQRExpr;
    qrxpr47: TQRExpr;
    qrxpr48: TQRExpr;
    qrshp6: TQRShape;
    qrxpr50: TQRExpr;
    qrxpr51: TQRExpr;
    qrlbl17: TQRLabel;
    qrlbl18: TQRLabel;
    qrlbl19: TQRLabel;
    qrlbl20: TQRLabel;
    qrxpr52: TQRExpr;
    qrxpr53: TQRExpr;
    qrxpr54: TQRExpr;
    qrxpr55: TQRExpr;
    qrxpr56: TQRExpr;
    qrxpr57: TQRExpr;
    qrlbl23: TQRLabel;
    qrlbl24: TQRLabel;
    qrlbl25: TQRLabel;
    qrxpr58: TQRExpr;
    qrxpr59: TQRExpr;
    qrlbl26: TQRLabel;
    qrxpr2: TQRExpr;
    qrxpr3: TQRExpr;
    qrxpr4: TQRExpr;
    qrxpr5: TQRExpr;
    qrxpr6: TQRExpr;
    qrxpr7: TQRExpr;
    qrxpr8: TQRExpr;
    qrxpr10: TQRExpr;
    qrshp2: TQRShape;
    qrshp3: TQRShape;
    qrshp4: TQRShape;
    qrxpr11: TQRExpr;
    qrxpr12: TQRExpr;
    qrxpr15: TQRExpr;
    qrxpr16: TQRExpr;
    qrxpr17: TQRExpr;
    qrxpr19: TQRExpr;
    qrxpr20: TQRExpr;
    qrxpr21: TQRExpr;
    qrxpr22: TQRExpr;
    qrxpr29: TQRExpr;
    qrxpr30: TQRExpr;
    qrxpr31: TQRExpr;
    qrxpr32: TQRExpr;
    qrxpr34: TQRExpr;
    qrxpr35: TQRExpr;
    qrxpr36: TQRExpr;
    qrlbl1: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl6: TQRLabel;
    qrlbl7: TQRLabel;
    qrlbl8: TQRLabel;
    qrlbl9: TQRLabel;
    qrlbl10: TQRLabel;
    procedure qrlblPsQRLabel5Print(sender: TObject; var Value: String);
    procedure qrxpr13Print(sender: TObject; var Value: String);
    procedure qrxpr14Print(sender: TObject; var Value: String);
    procedure qrxpr28Print(sender: TObject; var Value: String);
    procedure qrxpr49Print(sender: TObject; var Value: String);
  private

  public
    sEmpresa: string;
    iTipo: integer;
  end;

procedure PreviewReporte(const ABaseDatos, AEmpresa, AProducto, ACentro: string; const AFechaIni, AFechaFin: TDateTime; const ATipo: Integer );

implementation

{$R *.DFM}

uses CReportes, DPreview, UDMbaseDatos, bSQLUtils, UDMAuxDB, Dialogs,
  bTimeUtils, Variants, ParteProduccionDL;


procedure PreviewReporte(const ABaseDatos, AEmpresa, AProducto, ACentro: string; const AFechaIni, AFechaFin: TDateTime; const ATipo: Integer );
var
  QLParteProduccionDet: TQLParteProduccionDet;
begin
  try
    if ParteProduccionDL.OpenDataReporte( ABaseDatos, AEmpresa, AProducto, ACentro, AFechaIni, AFechaFin, ATipo  ) then
    begin
      QLParteProduccionDet := TQLParteProduccionDet.Create(nil);
      QLParteProduccionDet.iTipo:= ATipo;
      if AFechaIni <> AFechaFin then
        QLParteProduccionDet.lblPeriodo.Caption:= 'Parte del ' + FormatDateTime('dd/mm/yyyy', AFechaIni) + ' al ' + FormatDateTime('dd/mm/yyyy', AFechaFin)
      else
        QLParteProduccionDet.lblPeriodo.Caption:= 'Parte del ' + FormatDateTime('dd/mm/yyyy', AFechaIni);
      PonLogoGrupoBonnysa(QLParteProduccionDet, AEmpresa);
      QLParteProduccionDet.sEmpresa := AEmpresa;
      try
        Preview(QLParteProduccionDet);
      except
        FreeAndNil(QLParteProduccionDet);
      end;
      DMBaseDatos.QListado.Close;
    end
    else
    begin
      ShowMessage('Listado sin datos.');
    end;
  finally
    ParteProduccionDL.CloseDataReporte;
  end;
end;

procedure TQLParteProduccionDet.qrlblPsQRLabel5Print(sender: TObject;
  var Value: String);
begin
  if ( Exporting and ( Pos( 'XLS', UpperCase( ExportFilter.ClassName ) ) > 0 ) ) then
    Value:= 'Empresa'
  else
    Value:= 'Emp';
end;

procedure TQLParteProduccionDet.qrxpr14Print(sender: TObject;
  var Value: String);
begin
  if ( Exporting and ( Pos( 'XLS', UpperCase( ExportFilter.ClassName ) ) > 0 ) ) then
    Value:= desCentro( DataSet.fieldByName('empresa').AsString, Value )
  else
    Value:= '';
end;

procedure TQLParteProduccionDet.qrxpr13Print(sender: TObject;
  var Value: String);
begin
  Value:= desProducto( DataSet.fieldByName('empresa').AsString, Value );
end;


procedure TQLParteProduccionDet.qrxpr28Print(sender: TObject;
  var Value: String);
begin
  Value:= desCentro( DataSet.fieldByName('empresa').AsString, Value );
end;

procedure TQLParteProduccionDet.qrxpr49Print(sender: TObject;
  var Value: String);
begin
  Value:= 'TOTAL ' + desCentro( DataSet.fieldByName('empresa').AsString, Value );
end;

end.
