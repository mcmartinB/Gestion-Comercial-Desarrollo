unit StockFrutaConfeccionadaDL;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDLStockFrutaConfeccionada = class(TDataModule)
    QListadoConfeccionado: TQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure DesPreparaQuery;
    procedure PreparaQueryStockConfeccionado( const ACliente: string; const ANumericos: Boolean  );
    procedure PreparaQueryPaletsConfeccionados( const ACliente: string; const ANumericos: Boolean  );
  public
    { Public declarations }
    function  DatosQueryStock( const AEmpresa, ACentro, ACliente: string; const ANumericos: Boolean  ): boolean;
    function  DatosQueryConfeccionado( const AEmpresa, ACentro, ACliente: string;
      const AFechaDesde, AFechaHasta: TDateTime; const ANumericos: Boolean  ): boolean;
  end;

implementation

{$R *.dfm}

uses UDMConfig;

procedure TDLStockFrutaConfeccionada.DesPreparaQuery;
begin
  QListadoConfeccionado.Close;
  if QListadoConfeccionado.Prepared then
    QListadoConfeccionado.UnPrepare;
end;

procedure TDLStockFrutaConfeccionada.PreparaQueryStockConfeccionado( const ACliente: string; const ANumericos: Boolean );
begin
  DesPreparaQuery;
  with QListadoConfeccionado do
  begin
      SQL.Clear;
      SQL.Add(' select x1.ean13_det ean13, x2.producto_e producto, ');
      SQL.Add('        x2.envase_e envase, x2.descripcion_e descripcion, ');
      SQL.Add('        count(distinct x0.ean128_cab) palets, ');
      SQL.Add('        sum(x1.unidades_det) cajas, ');
      SQL.Add('        sum( case when nvl( x1.peso_det, 0 ) = 0 ');
      SQL.Add('                       then round ( x1.unidades_det * x3.peso_neto_e,2 ) ');
      SQL.Add('                       else x1.peso_det end ) peso ');
      SQL.Add(' from   rf_Palet_Pc_Cab x0, ');
      SQL.Add('        rf_Palet_Pc_Det x1, ');
      SQL.Add('        frf_ean13 x2, ');
      SQL.Add('        frf_envases x3 ');
      SQL.Add(' Where  x0.empresa_cab = :empresa ');
      SQL.Add('   and  x0.centro_cab = :centro ');
      if ACliente <> '' then
        SQL.Add('   and  x0.cliente_cab = :cliente ');
      if not ANumericos then
        SQL.Add('   and  x0.cliente_cab > ''999'' ');
      SQL.Add('   and  x0.status_cab in (''S'',''P'') ');
      SQL.Add('   and  x1.ean128_det = x0.ean128_cab ');
      SQL.Add('   and  x2.empresa_e = :empresa ');
      SQL.Add('   and  x2.codigo_e = x1.ean13_det ');
      SQL.Add('   and  x2.calibre_e = x1.calibre_det ');
      SQL.Add('   and  x3.empresa_e = :empresa ');
      SQL.Add('   and  x3.envase_e = x2.envase_e ');
      SQL.Add(' group by x1.ean13_det, x2.producto_e, x2.envase_e, x2.descripcion_e ');
      SQL.Add(' order by x2.producto_e, x2.envase_e, x2.descripcion_e ');
      Prepare;
  end;
end;

procedure TDLStockFrutaConfeccionada.PreparaQueryPaletsConfeccionados( const ACliente: string; const ANumericos: Boolean );
begin
  DesPreparaQuery;
  with QListadoConfeccionado do
  begin
      SQL.Clear;
      SQL.Add(' select x1.ean13_det ean13, x2.producto_e producto, ');
      SQL.Add('        x2.envase_e envase, x2.descripcion_e descripcion, ');
      SQL.Add('        count(distinct x0.ean128_cab) palets, ');
      SQL.Add('        sum(x1.unidades_det) cajas, ');
      SQL.Add('        sum( case when nvl( x1.peso_det, 0 ) = 0 ');
      SQL.Add('                       then round ( x1.unidades_det * x3.peso_neto_e,2 ) ');
      SQL.Add('                       else x1.peso_det end ) peso ');
      SQL.Add(' from   rf_Palet_Pc_Cab x0, ');
      SQL.Add('        rf_Palet_Pc_Det x1, ');
      SQL.Add('        frf_ean13 x2, ');
      SQL.Add('        frf_envases x3 ');
      SQL.Add(' Where  x0.empresa_cab = :empresa ');
      SQL.Add('   and  x0.centro_cab = :centro ');
      if ACliente <> '' then
        SQL.Add('   and  x0.cliente_cab = :cliente ');
      if not ANumericos then
        SQL.Add('   and  x0.cliente_cab > ''999'' ');
      SQL.Add('   and  x1.ean128_det = x0.ean128_cab ');
      SQL.Add('   and  x1.fecha_alta_det >= :fechaini and x1.fecha_alta_det < :fechafin ');
      SQL.Add('   and  x2.empresa_e = :empresa ');
      SQL.Add('   and  x2.codigo_e = x1.ean13_det ');
      SQL.Add('   and  x2.calibre_e = x1.calibre_det ');
      SQL.Add('   and  x3.empresa_e = :empresa ');
      SQL.Add('   and  x3.envase_e = x2.envase_e ');
      SQL.Add(' group by x1.ean13_det, x2.producto_e, x2.envase_e, x2.descripcion_e ');
      SQL.Add(' order by x2.producto_e, x2.envase_e, x2.descripcion_e ');
      Prepare;
  end;
end;

procedure TDLStockFrutaConfeccionada.DataModuleDestroy(Sender: TObject);
begin
  DesPreparaQuery;
end;

function TDLStockFrutaConfeccionada.DatosQueryStock( const AEmpresa, ACentro, ACliente: string; const ANumericos: Boolean  ): boolean;
begin
  PreparaQueryStockConfeccionado( ACliente, ANumericos );
  with QListadoConfeccionado do
  begin
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    if ACliente <> '' then
      ParamByName('cliente').AsString:= ACliente;
    Open;
    result:= not IsEmpty;
  end;
end;

function TDLStockFrutaConfeccionada.DatosQueryConfeccionado( const AEmpresa, ACentro, ACliente: string;
  const AFechaDesde, AFechaHasta: TDateTime; const ANumericos: Boolean  ): boolean;
begin
  PreparaQueryPaletsConfeccionados( ACliente, ANumericos );
  with QListadoConfeccionado do
  begin
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    if ACliente <> '' then
      ParamByName('cliente').AsString:= ACliente;
    //Como el campo de la BD contine la informacion de la hora no vale con una simple igualdad
    ParamByName('fechaIni').AsDateTime:= AFechaDesde;
    ParamByName('fechaFin').AsDateTime:= AFechaHasta + 1;

    Open;
    result:= not IsEmpty;
  end;
end;

end.
