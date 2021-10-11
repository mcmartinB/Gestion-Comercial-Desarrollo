object DPTransitoActivar: TDPTransitoActivar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 329
  Width = 339
  object QProceso: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    SQL.Strings = (
      
        'select empresa_sc empresa, centro_salida_sc centro, cliente_fac_' +
        'sc cliente, '
      
        '       fecha_sc fecha, n_albaran_sc albaran, producto_sl product' +
        'o, envase_sl envase, '
      
        '       moneda_sc moneda, sum(kilos_sl) kilos, sum(cajas_sl) caja' +
        's, '
      '       sum(importe_neto_sl) importe '
      'from frf_salidas_c, frf_salidas_l'
      'where empresa_sc = '#39'078'#39
      'and fecha_sc between '#39'1/12/2007'#39' and '#39'31/12/2007'#39
      'and nvl(n_factura_sc,0) = 0 '
      '--'
      'and centro_salida_sc = '#39'1'#39
      'and cliente_fac_sc = '#39'MER'#39
      '--'
      'and empresa_sl = '#39'078'#39
      'and centro_salida_sl = centro_salida_sc'
      'and n_albaran_sl = n_albaran_sc'
      'and fecha_sl = fecha_sc'
      '--'
      'and producto_sl = '#39'K'#39
      '--'
      
        'group by empresa_sc, centro_salida_sc, cliente_fac_sc, fecha_sc,' +
        ' n_albaran_sc, '
      '       producto_sl, envase_sl, moneda_sc'
      
        'order by empresa_sc, centro_salida_sc, cliente_fac_sc, fecha_sc,' +
        ' n_albaran_sc, '
      '       producto_sl, envase_sl')
    Left = 32
    Top = 40
  end
  object qryPaletsComer: TQuery
    DatabaseName = 'BDProyecto'
    SQL.Strings = (
      
        'select empresa_sc empresa, centro_salida_sc centro, cliente_fac_' +
        'sc cliente, '
      
        '       fecha_sc fecha, n_albaran_sc albaran, producto_sl product' +
        'o, envase_sl envase, '
      
        '       moneda_sc moneda, sum(kilos_sl) kilos, sum(cajas_sl) caja' +
        's, '
      '       sum(importe_neto_sl) importe '
      'from frf_salidas_c, frf_salidas_l'
      'where empresa_sc = '#39'078'#39
      'and fecha_sc between '#39'1/12/2007'#39' and '#39'31/12/2007'#39
      'and nvl(n_factura_sc,0) = 0 '
      '--'
      'and centro_salida_sc = '#39'1'#39
      'and cliente_fac_sc = '#39'MER'#39
      '--'
      'and empresa_sl = '#39'078'#39
      'and centro_salida_sl = centro_salida_sc'
      'and n_albaran_sl = n_albaran_sc'
      'and fecha_sl = fecha_sc'
      '--'
      'and producto_sl = '#39'K'#39
      '--'
      
        'group by empresa_sc, centro_salida_sc, cliente_fac_sc, fecha_sc,' +
        ' n_albaran_sc, '
      '       producto_sl, envase_sl, moneda_sc'
      
        'order by empresa_sc, centro_salida_sc, cliente_fac_sc, fecha_sc,' +
        ' n_albaran_sc, '
      '       producto_sl, envase_sl')
    Left = 32
    Top = 120
  end
  object qryPaletsSGP: TQuery
    DatabaseName = 'DBSGP'
    SQL.Strings = (
      
        'select empresa_sc empresa, centro_salida_sc centro, cliente_fac_' +
        'sc cliente, '
      
        '       fecha_sc fecha, n_albaran_sc albaran, producto_sl product' +
        'o, envase_sl envase, '
      
        '       moneda_sc moneda, sum(kilos_sl) kilos, sum(cajas_sl) caja' +
        's, '
      '       sum(importe_neto_sl) importe '
      'from frf_salidas_c, frf_salidas_l'
      'where empresa_sc = '#39'078'#39
      'and fecha_sc between '#39'1/12/2007'#39' and '#39'31/12/2007'#39
      'and nvl(n_factura_sc,0) = 0 '
      '--'
      'and centro_salida_sc = '#39'1'#39
      'and cliente_fac_sc = '#39'MER'#39
      '--'
      'and empresa_sl = '#39'078'#39
      'and centro_salida_sl = centro_salida_sc'
      'and n_albaran_sl = n_albaran_sc'
      'and fecha_sl = fecha_sc'
      '--'
      'and producto_sl = '#39'K'#39
      '--'
      
        'group by empresa_sc, centro_salida_sc, cliente_fac_sc, fecha_sc,' +
        ' n_albaran_sc, '
      '       producto_sl, envase_sl, moneda_sc'
      
        'order by empresa_sc, centro_salida_sc, cliente_fac_sc, fecha_sc,' +
        ' n_albaran_sc, '
      '       producto_sl, envase_sl')
    Left = 120
    Top = 120
  end
end
