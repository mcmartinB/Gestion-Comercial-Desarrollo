object MDEntregas: TMDEntregas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 571
  Width = 622
  object QEntregasC: TQuery
    AfterOpen = QEntregasCAfterOpen
    BeforeClose = QEntregasCBeforeClose
    BeforeDelete = QEntregasCBeforeDelete
    AfterDelete = QEntregasCAfterDelete
    DatabaseName = 'BDProyecto'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM frf_entregas_c'
      'ORDER BY fecha_ec DESC')
    Left = 32
    Top = 8
  end
  object DSMaestro: TDataSource
    DataSet = QEntregasC
    Left = 120
    Top = 8
  end
  object TEntregasL: TTable
    BeforePost = TEntregasLBeforePost
    AfterPost = TEntregasLAfterPost
    AfterDelete = TEntregasLAfterDelete
    DatabaseName = 'BDProyecto'
    IndexFieldNames = 'codigo_el'
    MasterFields = 'codigo_ec'
    MasterSource = DSMaestro
    TableName = 'frf_entregas_l'
    Left = 208
    Top = 8
  end
  object QListEntregasC: TQuery
    DatabaseName = 'BDProyecto'
    SQL.Strings = (
      'SELECT * '
      'FROM frf_entregas_c'
      'ORDER BY fecha_ec DESC')
    Left = 40
    Top = 224
  end
  object DSListMaestro: TDataSource
    DataSet = QListEntregasC
    Left = 128
    Top = 224
  end
  object TListEntregasL: TTable
    DatabaseName = 'BDProyecto'
    IndexFieldNames = 'codigo_el'
    MasterFields = 'codigo_ec'
    MasterSource = DSListMaestro
    ReadOnly = True
    TableName = 'frf_entregas_l'
    Left = 216
    Top = 224
  end
  object QTotalLineas: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    SQL.Strings = (
      
        'select sum(palets_el) palets, sum(cajas_el) cajas, sum(kilos_el)' +
        ' kilos'
      'from frf_entregas_l'
      'where codigo_el = :codigo_ec')
    Left = 368
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object QGastosEntregas: TQuery
    BeforePost = QGastosEntregasBeforePost
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    RequestLive = True
    Left = 208
    Top = 60
  end
  object TListGastosEntregas: TTable
    DatabaseName = 'BDProyecto'
    IndexFieldNames = 'codigo_ge'
    MasterFields = 'codigo_ec'
    MasterSource = DSListMaestro
    TableName = 'frf_gastos_entregas'
    Left = 216
    Top = 384
  end
  object TListPackingList: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSListMaestro
    SQL.Strings = (
      'select sscc, lote, '
      '          sum(cajas) cajas, '
      '          sum(peso_bruto) peso_bruto, '
      '          sum(peso) peso'
      'from rf_palet_pb'
      'where entrega = :codigo_ec'
      'and status <> '#39'B'#39
      'group by sscc, lote'
      'order by sscc, lote ')
    Left = 216
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object TListStatusPacking: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSListMaestro
    SQL.Strings = (
      'select sscc, lote, '
      '          sum(cajas) cajas, '
      '          sum(peso_bruto) peso_bruto, '
      '          sum(peso) peso'
      'from rf_palet_pb'
      'where entrega = :codigo_ec'
      'and status <> '#39'B'#39
      'group by sscc, lote'
      'order by sscc, lote ')
    Left = 304
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object TListCalibrePacking: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSListMaestro
    SQL.Strings = (
      'select sscc, lote, '
      '          sum(cajas) cajas, '
      '          sum(peso_bruto) peso_bruto, '
      '          sum(peso) peso'
      'from rf_palet_pb'
      'where entrega = :codigo_ec'
      'and status <> '#39'B'#39
      'group by sscc, lote'
      'order by sscc, lote ')
    Left = 400
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object TListFechasPacking: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSListMaestro
    SQL.Strings = (
      'select sscc, lote, '
      '          sum(cajas) cajas, '
      '          sum(peso_bruto) peso_bruto, '
      '          sum(peso) peso'
      'from rf_palet_pb'
      'where entrega = :codigo_ec'
      'and status <> '#39'B'#39
      'group by sscc, lote'
      'order by sscc, lote ')
    Left = 216
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object QAux: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 448
    Top = 160
  end
  object QFacturaPlatano: TQuery
    BeforePost = QGastosEntregasBeforePost
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    RequestLive = True
    Left = 208
    Top = 116
  end
  object qryCategoriaPacking: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSListMaestro
    SQL.Strings = (
      'select sscc, lote, '
      '          sum(cajas) cajas, '
      '          sum(peso_bruto) peso_bruto, '
      '          sum(peso) peso'
      'from rf_palet_pb'
      'where entrega = :codigo_ec'
      'and status <> '#39'B'#39
      'group by sscc, lote'
      'order by sscc, lote ')
    Left = 404
    Top = 338
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object QTotalFacturaCompra: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    SQL.Strings = (
      
        'select sum(palets_el) palets, sum(cajas_el) cajas, sum(kilos_el)' +
        ' kilos'
      'from frf_entregas_l'
      'where codigo_el = :codigo_ec')
    Left = 322
    Top = 175
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object TEntregasRel: TTable
    DatabaseName = 'BDProyecto'
    IndexFieldNames = 'codigo_er'
    MasterFields = 'codigo_ec'
    MasterSource = DSMaestro
    TableName = 'frf_entregas_rel'
    Left = 280
    Top = 8
  end
  object QCalidad: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from frf_entregas_calidad'
      'where codigo_eca = :codigo_ec')
    Left = 320
    Top = 68
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
    object QCalidadcodigo_eca: TStringField
      FieldName = 'codigo_eca'
      Origin = '"COMER.SAT".frf_entregas_calidad.codigo_eca'
      FixedChar = True
      Size = 12
    end
    object QCalidadempresa_eca: TStringField
      FieldName = 'empresa_eca'
      Origin = '"COMER.SAT".frf_entregas_calidad.empresa_eca'
      FixedChar = True
      Size = 3
    end
    object QCalidadcliente_eca: TStringField
      FieldName = 'cliente_eca'
      Origin = '"COMER.SAT".frf_entregas_calidad.cliente_eca'
      FixedChar = True
      Size = 3
    end
    object QCalidadproducto_eca: TStringField
      DisplayWidth = 3
      FieldName = 'producto_eca'
      Origin = '"COMER.SAT".frf_entregas_calidad.producto_eca'
      FixedChar = True
      Size = 3
    end
    object QCalidadenvase_eca: TStringField
      DisplayWidth = 9
      FieldName = 'envase_eca'
      Origin = '"COMER.SAT".frf_entregas_calidad.envase_eca'
      FixedChar = True
      Size = 9
    end
    object QCalidadfecha_eca: TDateField
      FieldName = 'fecha_eca'
      Origin = '"COMER.SAT".frf_entregas_calidad.fecha_eca'
    end
    object QCalidadporcentaje_eca: TFloatField
      FieldName = 'porcentaje_eca'
      Origin = '"COMER.SAT".frf_entregas_calidad.porcentaje_eca'
    end
    object QCalidaddesCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'desCliente'
      Size = 30
      Calculated = True
    end
    object QCalidaddesEnvase: TStringField
      FieldKind = fkCalculated
      FieldName = 'desEnvase'
      Size = 30
      Calculated = True
    end
  end
  object QMaterial: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM  frf_entregas_mat'
      'where codigo_em = :codigo_ec')
    Left = 320
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ec'
        ParamType = ptUnknown
      end>
  end
  object QDestrioCalidad: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSMaestro
    SQL.Strings = (
      
        'select codigo_eca, empresa_eca, cliente_eca, envase_eca, fecha_e' +
        'ca, porcentaje_eca'
      'from frf_entregas_calidad')
    Left = 440
    Top = 108
  end
  object TListEntregasRel: TTable
    DatabaseName = 'BDProyecto'
    IndexFieldNames = 'codigo_er'
    MasterFields = 'codigo_ec'
    MasterSource = DSListMaestro
    ReadOnly = True
    TableName = 'frf_entregas_rel'
    Left = 216
    Top = 432
  end
end
