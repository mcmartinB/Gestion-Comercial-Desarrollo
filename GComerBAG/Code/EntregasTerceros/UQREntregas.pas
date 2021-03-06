unit UQREntregas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TQREntregas = class(TQuickRep)
    bndDetalle: TQRBand;
    bndTitulo: TQRBand;
    PageFooterBand1: TQRBand;
    PsQRSysData1: TQRSysData;
    QRSysData1: TQRSysData;
    QRDBText2: TQRDBText;
    QRSysData2: TQRSysData;
    bndLineas: TQRSubDetail;
    bndCabLineas: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    bndPieEntradas: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    bndPieLineas: TQRBand;
    QRShape1: TQRShape;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRDBText23: TQRDBText;
    adjudicacion_ec: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBarCode: TQRImage;
    QRLabel23: TQRLabel;
    fecha_llegada_ec: TQRDBText;
    centro_llegada_ec: TQRDBText;
    QRLabel24: TQRLabel;
    categoria_el: TQRDBText;
    codigo_ec: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    calibre_el: TQRDBText;
    bndCabGastos: TQRBand;
    QRShape4: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    bndGastos: TQRSubDetail;
    tipo_ge: TQRDBText;
    importe_ge: TQRDBText;
    fecha_fac_ge: TQRDBText;
    ref_fac_ge: TQRDBText;
    bndPieGastos: TQRBand;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    unidad_precio_el: TQRDBText;
    unidades_el: TQRDBText;
    QRLabel33: TQRLabel;
    bndCabPacking: TQRBand;
    QRShape5: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    bndPacking: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    bndPiePacking: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    nota_ge: TQRDBText;
    QRLabel44: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    Desproveedor_ec: TQRDBText;
    QRLabel9: TQRLabel;
    status: TQRDBText;
    QRLabel17: TQRLabel;
    calibre: TQRDBText;
    bndResumenSatus: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    bndCabResumenSatus: TQRBand;
    QRShape3: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    bndPieResumenStatus: TQRBand;
    bndCabCalibrePacking: TQRBand;
    QRShape9: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    bndCalibrePacking: TQRSubDetail;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    bndPieCalibrePacking: TQRBand;
    qredes: TQRDBText;
    qrlDes: TQRLabel;
    qretipo_palet: TQRDBText;
    qrltipo_palet: TQRLabel;
    qrx1: TQRExpr;
    qrl2: TQRLabel;
    qrx2: TQRExpr;
    qrlblKilosEntrega: TQRLabel;
    qrlblUnidadesEntrega: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlblPrecioKiloGasto: TQRLabel;
    qrlblPrecioUnidadGasto: TQRLabel;
    qrlblPrecioKiloGastos: TQRLabel;
    qrlblPrecioUnidadGastos: TQRLabel;
    qrlblImporte: TQRLabel;
    qrlblImporteLinea: TQRLabel;
    qrlblImporteLineas: TQRLabel;
    qrdbtxtalmacen_ec: TQRDBText;
    qrlbl2: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrlbl5: TQRLabel;
    qrdbtxtcalibre: TQRDBText;
    qrdbtxtvehiculo_ec: TQRDBText;
    qrdbtxtbarco_ec: TQRDBText;
    qrlbl6: TQRLabel;
    qrlbl7: TQRLabel;
    qrdbtxtfecha_llegada_ec: TQRDBText;
    procedure bndCabLineasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndLineasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure bndTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRPackingListBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure unidad_precio_elPrint(sender: TObject; var Value: String);
    procedure QRGastosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure tipo_gePrint(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure Desproveedor_ecPrint(sender: TObject; var Value: String);

    procedure bndCabCalibrePackingBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndCabResumenSatusBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndCabGastosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndGastosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlblImporteLineaPrint(sender: TObject; var Value: String);
    procedure qrlblImporteLineasPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure qrdbtxtbarco_ecPrint(sender: TObject; var Value: String);
  private
    rKilosEntrega, rUnidadesEntrega, rImporteGastos: real;
    rImporteLineas: real;

  public
    //procedure PonBarCode( const ACodigo: String);
  end;

implementation

{$R *.DFM}

uses UMDEntregas, UDMAuxDB, UDMConfig, bMath;


procedure TQREntregas.bndCabLineasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListEntregasL.IsEmpty;
end;

procedure TQREntregas.bndLineasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListEntregasL.IsEmpty;
  rKilosEntrega:= rKilosEntrega + bndLineas.DataSet.FieldByName('kilos_el').AsFloat;
  rUnidadesEntrega:= rUnidadesEntrega + bndLineas.DataSet.FieldByName('unidades_el').AsFloat;
end;

procedure TQREntregas.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value:= DesEmpresa( Value );
end;

{
procedure TQREntregas.PonBarCode( const ACodigo: String);
begin
  Barcode.Text:= ACodigo;
  Barcode.Top:= 0;
  Barcode.Left:= 0;
  Barcode.Height:= 35;
  Barcode.Typ:= bcCode39Extended;
  Barcode.ShowText:= bcoCode;
  try
    Barcode.DrawBarcode( QRBarCode.Canvas );
  except
  end;
end;
}

procedure TQREntregas.bndTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //PonBarCode( MDEntregas.QListEntregasC.FieldByName('codigo_ec').AsSTring );
end;

procedure TQREntregas.QRDBText11Print(sender: TObject; var Value: String);
begin
  Value:= DesVariedad( bndLineas.DataSet.FieldByName('empresa_el').AsString,
               bndLineas.DataSet.FieldByName('proveedor_el').AsString,
               bndLineas.DataSet.FieldByName('producto_el').AsString,
               bndLineas.DataSet.FieldByName('variedad_el').AsString );
end;

procedure TQREntregas.QRPackingListBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListPackingList.IsEmpty;
end;

procedure TQREntregas.unidad_precio_elPrint(sender: TObject;
  var Value: String);
begin
  if Value = '1' then
    Value:= 'Caja'
  else
  if Value = '2' then
    Value:= 'Und.'
  else
    Value:= 'Kg.'
end;

procedure TQREntregas.bndCabGastosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListGastosEntregas.IsEmpty;
  rImporteGastos:= 0;
end;

procedure TQREntregas.bndGastosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListGastosEntregas.IsEmpty;
  rImporteGastos:= rImporteGastos + bndGastos.DataSet.fieldbyName('importe_ge').AsFloat;
  if rUnidadesEntrega <> 0 then
  begin
    qrlblPrecioUnidadGasto.Caption:= FormatFloat( '#,##0.000', bndGastos.DataSet.fieldbyName('importe_ge').AsFloat/ rUnidadesEntrega ) + '?/u' ;
  end
  else
  begin
    qrlblPrecioUnidadGasto.Caption:= '--';
  end;
  if rKilosEntrega <> 0 then
  begin
    qrlblPrecioKiloGasto.Caption:= FormatFloat( '#,##0.000', bndGastos.DataSet.fieldbyName('importe_ge').AsFloat/ rKilosEntrega ) + '?/Kg' ;
  end
  else
  begin
    qrlblPrecioKiloGasto.Caption:= '--';
  end;
end;

procedure TQREntregas.QRGastosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListGastosEntregas.IsEmpty;
  qrlblKilosEntrega.Caption:= FormatFloat('#,##0', rKilosEntrega ) + 'Kg';
  qrlblUnidadesEntrega.Caption:= FormatFloat('#,##0', rUnidadesEntrega ) + 'U';
  if rUnidadesEntrega <> 0 then
  begin
    qrlblPrecioUnidadGastos.Caption:= FormatFloat( '#,##0.000', rImporteGastos/ rUnidadesEntrega ) + '?/u' ;
  end
  else
  begin
    qrlblPrecioUnidadGastos.Caption:= '--';
  end;
  if rKilosEntrega <> 0 then
  begin
    qrlblPrecioKiloGastos.Caption:= FormatFloat( '#,##0.000', rImporteGastos/ rKilosEntrega ) + '?/Kg' ;
  end
  else
  begin
    qrlblPrecioKiloGastos.Caption:= '--';
  end;  
end;

procedure TQREntregas.tipo_gePrint(sender: TObject; var Value: String);
begin
  Value:= Value + ' ' + desTipoGastos( Value );
end;

procedure TQREntregas.QRLabel6Print(sender: TObject; var Value: String);
begin
  (*if ( DMConfig.EsValenciaBonde or DMConfig.EsTenerifeBonde ) then
    Value:= '';
  *)
end;

procedure TQREntregas.Desproveedor_ecPrint(sender: TObject;
  var Value: String);
begin
  Value:= desProveedor( DataSet.FieldByName('empresa_ec').AsString,
                        DataSet.FieldByName('proveedor_ec').AsString)
end;

procedure TQREntregas.bndCabResumenSatusBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListStatusPacking.IsEmpty;
end;

procedure TQREntregas.bndCabCalibrePackingBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand:= not MDEntregas.TListCalibrePacking.IsEmpty;
end;      

procedure TQREntregas.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= DataSet.FieldByName('observaciones_ec').AsString <> '';
end;

procedure TQREntregas.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rKilosEntrega:= 0;
  rUnidadesEntrega:= 0;
  rImporteLineas:= 0;
end;


procedure TQREntregas.qrlblImporteLineaPrint(sender: TObject;
  var Value: String);
var
  rAux: Real;
begin
  if bndLineas.DataSet.FieldByName('unidad_precio_el').AsString = '1' then
  begin
    rAux:= bndLineas.DataSet.FieldByName('cajas_el').AsFloat *  bndLineas.DataSet.FieldByName('precio_el').AsFloat;
  end
  else
  begin
    if bndLineas.DataSet.FieldByName('unidad_precio_el').AsString = '2' then
    begin
      rAux:= bndLineas.DataSet.FieldByName('unidades_el').AsFloat *  bndLineas.DataSet.FieldByName('precio_el').AsFloat;
    end
    else
    begin
      rAux:= bndLineas.DataSet.FieldByName('kilos_el').AsFloat *  bndLineas.DataSet.FieldByName('precio_el').AsFloat;
    end;
  end;

  value:= FormatFloat('#,##0', rAux );
  rImporteLineas:= rImporteLineas + rAux;
end;

procedure TQREntregas.qrlblImporteLineasPrint(sender: TObject;
  var Value: String);
begin
  Value:= FormatFloat('#,##0', rImporteLineas );
end;

procedure TQREntregas.QRDBText7Print(sender: TObject; var Value: String);
begin
  if DataSet.FieldByName('almacenes').AsInteger = 1 then
  begin
    Value:= DataSet.FieldByName('almacen').AsString;
  end;
end;

procedure TQREntregas.QRDBText8Print(sender: TObject; var Value: String);
begin
  if DataSet.FieldByName('almacenes').AsInteger = 1 then
  begin
    Value:= desProveedorAlmacen( DataSet.FieldByName('empresa_ec').AsString, DataSet.FieldByName('proveedor_ec').AsString, DataSet.FieldByName('almacen').AsString );
  end;
end;

procedure TQREntregas.qrdbtxtbarco_ecPrint(sender: TObject;
  var Value: String);
begin
  Value := desAduana(Value);
end;

end.
