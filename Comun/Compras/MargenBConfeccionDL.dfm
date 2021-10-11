object DLMargenBConfeccion: TDLMargenBConfeccion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 721
  Width = 595
  object qryPaletsConfeccionados: TQuery
    DatabaseName = 'DBRF'
    SQL.Strings = (
      
        'SELECT rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_produc' +
        'tos.descripcion_p,'
      
        '       frf_productos_proveedor.descripcion_breve_pp, rf_palet_pb' +
        '.categoria, rf_palet_pb.calibre,'
      '       Count(*) Palets,'
      '       Sum(rf_palet_pb.peso_bruto) Peso,'
      '       Sum(rf_palet_pb.cajas) cajas'
      
        'FROM   frf_productos, frf_productos_proveedor, frf_proveedores, ' +
        'rf_palet_pb '
      'WHERE rf_palet_pb.empresa = frf_proveedores.empresa_p '
      '  AND rf_palet_pb.proveedor = frf_proveedores.proveedor_p '
      '  AND rf_palet_pb.empresa = frf_productos_proveedor.empresa_pp '
      
        '  AND rf_palet_pb.producto = frf_productos_proveedor.producto_pp' +
        ' '
      
        '  AND rf_palet_pb.proveedor = frf_productos_proveedor.proveedor_' +
        'pp '
      
        '  AND rf_palet_pb.variedad = frf_productos_proveedor.variedad_pp' +
        ' '
      '  AND rf_palet_pb.empresa = frf_productos.empresa_p '
      '  AND rf_palet_pb.producto = frf_productos.producto_p '
      '  AND rf_palet_pb.status='#39'S'#39
      
        'GROUP BY rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_prod' +
        'uctos.descripcion_p, frf_productos_proveedor.descripcion_breve_p' +
        'p, rf_palet_pb.categoria, rf_palet_pb.calibre'
      'ORDER BY frf_productos.descripcion_p, rf_palet_pb.calibre ')
    Left = 40
    Top = 224
  end
  object qryEnvase: TQuery
    DatabaseName = 'BDProyecto'
    SQL.Strings = (
      
        'SELECT rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_produc' +
        'tos.descripcion_p,'
      
        '       frf_productos_proveedor.descripcion_breve_pp, rf_palet_pb' +
        '.categoria, rf_palet_pb.calibre,'
      '       Count(*) Palets,'
      '       Sum(rf_palet_pb.peso_bruto) Peso,'
      '       Sum(rf_palet_pb.cajas) cajas'
      
        'FROM   frf_productos, frf_productos_proveedor, frf_proveedores, ' +
        'rf_palet_pb '
      'WHERE rf_palet_pb.empresa = frf_proveedores.empresa_p '
      '  AND rf_palet_pb.proveedor = frf_proveedores.proveedor_p '
      '  AND rf_palet_pb.empresa = frf_productos_proveedor.empresa_pp '
      
        '  AND rf_palet_pb.producto = frf_productos_proveedor.producto_pp' +
        ' '
      
        '  AND rf_palet_pb.proveedor = frf_productos_proveedor.proveedor_' +
        'pp '
      
        '  AND rf_palet_pb.variedad = frf_productos_proveedor.variedad_pp' +
        ' '
      '  AND rf_palet_pb.empresa = frf_productos.empresa_p '
      '  AND rf_palet_pb.producto = frf_productos.producto_p '
      '  AND rf_palet_pb.status='#39'S'#39
      
        'GROUP BY rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_prod' +
        'uctos.descripcion_p, frf_productos_proveedor.descripcion_breve_p' +
        'p, rf_palet_pb.categoria, rf_palet_pb.calibre'
      'ORDER BY frf_productos.descripcion_p, rf_palet_pb.calibre ')
    Left = 192
    Top = 216
  end
  object kmtEnvases: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.51'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 304
    Top = 214
  end
  object qryEanProducto: TQuery
    DatabaseName = 'BDProyecto'
    SQL.Strings = (
      
        'SELECT rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_produc' +
        'tos.descripcion_p,'
      
        '       frf_productos_proveedor.descripcion_breve_pp, rf_palet_pb' +
        '.categoria, rf_palet_pb.calibre,'
      '       Count(*) Palets,'
      '       Sum(rf_palet_pb.peso_bruto) Peso,'
      '       Sum(rf_palet_pb.cajas) cajas'
      
        'FROM   frf_productos, frf_productos_proveedor, frf_proveedores, ' +
        'rf_palet_pb '
      'WHERE rf_palet_pb.empresa = frf_proveedores.empresa_p '
      '  AND rf_palet_pb.proveedor = frf_proveedores.proveedor_p '
      '  AND rf_palet_pb.empresa = frf_productos_proveedor.empresa_pp '
      
        '  AND rf_palet_pb.producto = frf_productos_proveedor.producto_pp' +
        ' '
      
        '  AND rf_palet_pb.proveedor = frf_productos_proveedor.proveedor_' +
        'pp '
      
        '  AND rf_palet_pb.variedad = frf_productos_proveedor.variedad_pp' +
        ' '
      '  AND rf_palet_pb.empresa = frf_productos.empresa_p '
      '  AND rf_palet_pb.producto = frf_productos.producto_p '
      '  AND rf_palet_pb.status='#39'S'#39
      
        'GROUP BY rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_prod' +
        'uctos.descripcion_p, frf_productos_proveedor.descripcion_breve_p' +
        'p, rf_palet_pb.categoria, rf_palet_pb.calibre'
      'ORDER BY frf_productos.descripcion_p, rf_palet_pb.calibre ')
    Left = 192
    Top = 272
  end
  object dsConfeccionados: TDataSource
    Left = 104
    Top = 56
  end
  object qryProducto: TQuery
    DatabaseName = 'BDProyecto'
    SQL.Strings = (
      
        'SELECT rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_produc' +
        'tos.descripcion_p,'
      
        '       frf_productos_proveedor.descripcion_breve_pp, rf_palet_pb' +
        '.categoria, rf_palet_pb.calibre,'
      '       Count(*) Palets,'
      '       Sum(rf_palet_pb.peso_bruto) Peso,'
      '       Sum(rf_palet_pb.cajas) cajas'
      
        'FROM   frf_productos, frf_productos_proveedor, frf_proveedores, ' +
        'rf_palet_pb '
      'WHERE rf_palet_pb.empresa = frf_proveedores.empresa_p '
      '  AND rf_palet_pb.proveedor = frf_proveedores.proveedor_p '
      '  AND rf_palet_pb.empresa = frf_productos_proveedor.empresa_pp '
      
        '  AND rf_palet_pb.producto = frf_productos_proveedor.producto_pp' +
        ' '
      
        '  AND rf_palet_pb.proveedor = frf_productos_proveedor.proveedor_' +
        'pp '
      
        '  AND rf_palet_pb.variedad = frf_productos_proveedor.variedad_pp' +
        ' '
      '  AND rf_palet_pb.empresa = frf_productos.empresa_p '
      '  AND rf_palet_pb.producto = frf_productos.producto_p '
      '  AND rf_palet_pb.status='#39'S'#39
      
        'GROUP BY rf_palet_pb.entrega, frf_proveedores.nombre_p, frf_prod' +
        'uctos.descripcion_p, frf_productos_proveedor.descripcion_breve_p' +
        'p, rf_palet_pb.categoria, rf_palet_pb.calibre'
      'ORDER BY frf_productos.descripcion_p, rf_palet_pb.calibre ')
    Left = 200
    Top = 336
  end
  object kmtPaletsConfeccionados: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.51'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 216
    Top = 33
  end
  object kmtLineas: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.51'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 40
    Top = 30
  end
end
