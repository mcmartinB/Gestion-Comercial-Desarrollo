�
 TDLLISTPRODUCTOSINFACTURAR 0   TPF0TDLListProductoSinFacturarDLListProductoSinFacturarOldCreateOrderLeft�Top� Height� Width�  TQueryQListProductoSinFacturarDatabaseName
BDProyectoSQL.Strings[select empresa_sc , producto_sl, cliente_sal_sc, centro_salida_sc, n_albaran_sc, fecha_sc, O       sum( case when categoria_sl = '1' then kilos_sl else 0 end ) kilos_cat1,O       sum( case when categoria_sl = '2' then kilos_sl else 0 end ) kilos_cat2,O       sum( case when categoria_sl = '3' then kilos_sl else 0 end ) kilos_cat3,^       sum( case when categoria_sl in ( '1', '2', '3' ) then kilos_sl else 0 end ) kilos_total!from frf_salidas_c, frf_salidas_lwhere empresa_sc = '050'and fecha_sc = '1/5/2005'and n_factura_sc is nulland empresa_sl = '050''and centro_salida_sl = centro_salida_scand n_albaran_sl = n_albaran_scand fecha_sl = fecha_scand producto_sl = 'T'!and categoria_sl in ('1','2','3')group by 1,2,3,4,5,6order by 1,2,3,4,5,6 Left0Top TStringField"QListProductoSinFacturarempresa_sc	FieldName
empresa_sc	FixedChar	Size  TStringField#QListProductoSinFacturarproducto_slDisplayWidth	FieldNameproducto_sl	FixedChar	Size  TStringField&QListProductoSinFacturarcliente_sal_sc	FieldNamecliente_sal_sc	FixedChar	Size  TStringField(QListProductoSinFacturarcentro_salida_sc	FieldNamecentro_salida_sc	FixedChar	Size  TIntegerField$QListProductoSinFacturarn_albaran_sc	FieldNamen_albaran_sc  
TDateField QListProductoSinFacturarfecha_sc	FieldNamefecha_sc  TFloatField"QListProductoSinFacturarkilos_cat1	FieldName
kilos_cat1  TFloatField"QListProductoSinFacturarkilos_cat2	FieldName
kilos_cat2  TFloatField"QListProductoSinFacturarkilos_cat3	FieldName
kilos_cat3  TFloatField#QListProductoSinFacturarkilos_total	FieldNamekilos_total    