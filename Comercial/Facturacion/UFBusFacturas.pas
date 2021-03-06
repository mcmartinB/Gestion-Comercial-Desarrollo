unit UFBusFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, BonnyQuery, cxTextEdit,
  cxCurrencyEdit, dxBar, cxCalendar,

  dxSkinsCore, dxSkinBlue, dxSkinFoggy, dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinMoneyTwins,
  dxSkinBlueprint, dxSkinBlack, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFBusFacturas = class(TForm)
    tvFacturas: TcxGridDBTableView;
    lvFacturas: TcxGridLevel;
    cxGrid: TcxGrid;
    DS: TDataSource;
    tvCodFactura: TcxGridDBColumn;
    tvFechaFactura: TcxGridDBColumn;
    tvImporteFactura: TcxGridDBColumn;
    tvTipoFactura: TcxGridDBColumn;
    tvTipo: TcxGridDBColumn;
    tvAnulacion: TcxGridDBColumn;
    tvImporteCobrado: TcxGridDBColumn;
    bmxBarManager: TdxBarManager;
    bmx1Bar1: TdxBar;
    dxCancelar: TdxBarLargeButton;
    dxAceptar: TdxBarLargeButton;
    tvImportePdte: TcxGridDBColumn;
    tvCodEmpresa: TcxGridDBColumn;
    tvNumeroFactura: TcxGridDBColumn;
    tvCliente: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure tvTipoFacturaGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure dxAceptarClick(Sender: TObject);
    procedure dxCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvFacturasDblClick(Sender: TObject);
  private
    QFacturas, QCobrado: TBonnyQuery;

    procedure CreaQFacturas;
    procedure CreaQCobrado;
    function EjecutaQFacturas: boolean;
    procedure CamposCalculados;


  public
    sGrupoEmpresa, sCliente, sMoneda, sFactura, sLista, sNumeroFac: string;
    dFechaVencimiento: TDateTime;
  end;

var
  FBusFacturas: TFBusFacturas;

implementation

{$R *.dfm}

uses UDFactura;

procedure TFBusFacturas.CreaQFacturas;
begin
  QFacturas := TBonnyQuery.Create(Self);
  DS.DataSet := QFacturas;
  with QFacturas do
  begin
    SQL.Add(' select cod_empresa_fac_fc, cod_serie_fac_fc, cod_factura_fc, n_factura_fc, fecha_factura_fc, cod_cliente_fc, ');
    SQL.Add('        anulacion_fc, tipo_factura_fc, importe_total_fc ');
    SQL.Add('   from tfacturas_cab ');
    if ( sGrupoEmpresa = 'BAG' ) or ( sGrupoEmpresa = 'SAT' ) then
    begin
      SQL.Add('  where cod_empresa_fac_fc in ');
      SQL.Add('     		(select planta_epl from tempresas, tempresa_plantas ');
      SQL.Add('  		      where empresa_emp = empresa_epl ');
      SQL.Add('  		        and empresa_emp = :grupoempresa ');
      SQL.Add('  		        and contabilizar_emp = 1) ');
    end
    else
    begin
      SQL.Add('  where cod_empresa_fac_fc = :grupoempresa ');
    end;
    SQL.Add('   and moneda_fc  = :moneda ');
    SQL.Add('   and fecha_factura_fc between :fechadesde and :fechahasta ');
{
    SQL.Add('      and( abs( ( importe_total_fc - ( select SUM(importe_cobrado_rf) ');
    SQL.Add(' 	                       from tremesas_fac, tremesas_cab ');
    SQL.Add('                        	where empresa_remesa_rf = empresa_remesa_rc ');
    SQL.Add(' 	                        and n_remesa_rf = n_remesa_rc ');
    SQL.Add('                                 and cod_factura_rf = cod_factura_fc) ) ) > 0.009 ');
    SQL.Add('        or ');
    SQL.Add(' 	(not exists (select * from tremesas_fac ');
    SQL.Add('  		      where cod_factura_rf = cod_factura_fc)) ) ');
}
    SQL.Add('  and  (abs (importe_total_fc - nvl((select SUM(importe_cobrado_rf) from tremesas_fac where cod_factura_rf = cod_factura_fc), 0)) > 0.009) ');
//    SQL.Add('         or ');
//    SQL.Add('        (cod_factura_fc not in (select cod_factura_rf from tremesas_fac)) ) ');

    if sLista <> '' then
      SQL.Add('   and cod_factura_fc not in ( '+ sLista + ' ) ');
    if sNumeroFac <> '' then
      SQL.Add('   and n_factura_fc = :numeroFactura ')
    else
      SQL.Add('   and cod_cliente_fc = :cliente ');

    ParamByName('grupoempresa').DataType := ftString;
    ParamByName('moneda').DataType := ftString;
    if sNumeroFac <> '' then
      ParamByName('numeroFactura').DataType := ftString
    else
      ParamByName('cliente').DataType := ftString;

    Prepare;
  end;
end;

procedure TFBusFacturas.CreaQCobrado;
begin
  QCobrado := TBonnyQuery.Create(Self);
  with QCobrado do
  begin
    SQL.Add(' select NVL(SUM(importe_cobrado_rf), 0) importe_cobrado ');
    SQL.Add(' from tremesas_fac, tremesas_cab ');
    SQL.Add(' where cod_factura_rf = :codfactura ');
    SQL.Add('   and empresa_remesa_rf = empresa_remesa_rc ');
    SQL.Add('   and n_remesa_rf = n_remesa_rc ');
    SQL.Add('   and fecha_remesa_rf = fecha_remesa_rc ');

    Prepare;
  end;
end;

procedure TFBusFacturas.FormShow(Sender: TObject);
begin
  //Creamos aqui las querys para poder cargar la lista (sLista)
  CreaQFacturas;
  CreaQCobrado;

  EjecutaQFacturas;
  CamposCalculados;
  QFacturas.First;
//  tvFacturas.Controller.FocusFirstAvailableItem;
  tvFacturas.DataController.FocusedRowIndex := 0;
//  tvFacturas.Controller.FocusedRowIndex  := 0;
  cxGrid.SetFocus;
end;

function TFBUsFacturas.EjecutaQFacturas: Boolean;
begin
  with QFacturas do
  begin
    if Active then
      Close;
    ParamByName('grupoempresa').AsString := sGrupoEmpresa;
    ParamByName('moneda').AsString := sMoneda;
    ParamByName('fechadesde').AsDateTime := dFechaVencimiento -730;   //Modifacion pedida por Carolina Madrona 01/03/2021 (de un a?o a dos a?os)
    ParamByName('fechahasta').AsDateTime := dFechaVencimiento +180;
    if sNumeroFac <> '' then
      ParamByName('numerofactura').AsString := sNumeroFac
    else
      ParamByName('cliente').AsString := sCliente;

    Open;

    Result := IsEmpty;
  end;
end;

procedure TFBusFacturas.CamposCalculados;
var rImpPendiente, rImpCobrado: Real;
    i: integer;
begin
  tvFacturas.BeginUpdate;
  for i := 0 to tvFacturas.DataController.RecordCount - 1 do
  begin
    //Importe Cobrado
    with QCobrado do
    begin
      if Active then
        Close;

      //ParamByName('empresa').AsString := sGrupoEmpresa;
      //ParamByName('cliente').AsString := sCliente;
      //ParamByName('moneda').AsString := sMoneda;
      ParamByName('codfactura').AsString := tvFacturas.DataController.Values[i,tvCodFactura.index];

      Open;

      rImpCobrado :=  FieldbyName('importe_cobrado').AsFloat;
    end;
    tvFacturas.DataController.SetValue(i, tvImporteCobrado.Index, rImpCobrado);

    //Importe Pendiente
    rImpPendiente := tvFacturas.DataController.Values[i,tvImporteFactura.index] - rImpCobrado;
    tvFacturas.DataController.SetValue(i, tvImportePdte.Index, rImpPendiente);
  end;
  tvFacturas.EndUpdate;
end;

procedure TFBusFacturas.tvTipoFacturaGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if ARecord.Values[tvFacturas.GetColumnByFieldName('anulacion_fc').Index] = 1 then
    AText := 'ANULACION'
  else if ARecord.Values[tvFacturas.GetColumnByFieldName('tipo_factura_fc').Index] = '381' then
    AText := 'ABONO'
  else if ARecord.Values[tvFacturas.GetColumnByFieldName('tipo_factura_fc').Index] = '380' then
    AText := 'FACTURA'
  else
    AText := 'ERROR';
end;


procedure TFBusFacturas.dxAceptarClick(Sender: TObject);
begin
  sFactura := tvFacturas.DataController.GetValue(tvFacturas.DataController.FocusedRecordIndex, tvCodFactura.Index);
  sNumeroFac := tvFacturas.DataController.GetValue(tvFacturas.DataController.FocusedRecordIndex, tvNumeroFactura.Index);
  ModalResult:= mrOk;
end;

procedure TFBusFacturas.dxCancelarClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TFBusFacturas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1:
    begin
      dxAceptarClick(Self);
    end;
    $0D, $28: //vk_return,vk_down
      begin
        Key := 0;
        PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
        Exit;
      end;
    $26: //vk_up
      begin
        Key := 0;
        PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
        Exit;
      end;
    VK_Escape: //vk_escape
    begin
     dxCancelarClick(Self);
    end;
  end;
end;

procedure TFBusFacturas.tvFacturasDblClick(Sender: TObject);
begin
  sFactura := tvFacturas.DataController.GetValue(tvFacturas.DataController.FocusedRecordIndex, tvCodFactura.Index);
  sNumeroFac := tvFacturas.DataController.GetValue(tvFacturas.DataController.FocusedRecordIndex, tvNumeroFactura.Index);
  dxAceptarClick(Self);
end;


end.

