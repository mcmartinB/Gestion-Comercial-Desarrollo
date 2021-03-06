object DMRecepcionForm: TDMRecepcionForm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 605
  Width = 601
  object QTransito: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 40
    Top = 24
  end
  object QTransitoRemoto: TQuery
    DatabaseName = 'BDCentral'
    RequestLive = True
    SQL.Strings = (
      '')
    Left = 120
    Top = 24
  end
  object QLinea: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 40
    Top = 72
  end
  object QLineaRemota: TQuery
    DatabaseName = 'BDCentral'
    DataSource = DSTransitoRemoto
    SQL.Strings = (
      '')
    UniDirectional = True
    Left = 216
    Top = 80
  end
  object QPaletCabLocal: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 32
    Top = 257
  end
  object QPaletCabRemota: TQuery
    DatabaseName = 'BDCentral'
    SQL.Strings = (
      '')
    Left = 168
    Top = 257
  end
  object QPaletDetLocal: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 32
    Top = 329
  end
  object QPaletDetRemota: TQuery
    DatabaseName = 'BDCentral'
    Left = 168
    Top = 329
  end
  object QPaletPbRemota: TQuery
    DatabaseName = 'BDCentral'
    DataSource = DSTransitoRemoto
    Left = 160
    Top = 193
  end
  object QBorrarPaletCabLocal: TQuery
    DatabaseName = 'BDProyecto'
    Left = 40
    Top = 409
  end
  object QBorrarPaletDetLocal: TQuery
    DatabaseName = 'BDProyecto'
    Left = 40
    Top = 473
  end
  object qryPaletCabSGP: TQuery
    DatabaseName = 'DBSGP'
    Left = 344
    Top = 265
  end
  object qryPaletDetSGP: TQuery
    DatabaseName = 'DBSGP'
    Left = 344
    Top = 337
  end
  object qryBorrarPaletCabSGP: TQuery
    DatabaseName = 'DBSGP'
    SQL.Strings = (
      '')
    Left = 344
    Top = 409
  end
  object qryBorrarPaletDetSGP: TQuery
    DatabaseName = 'DBSGP'
    Left = 352
    Top = 489
  end
  object QBorrarPaletPb: TQuery
    DatabaseName = 'BDCentral'
    DataSource = DSTransitoRemoto
    Left = 264
    Top = 188
  end
  object DSTransitoRemoto: TDataSource
    DataSet = QTransitoRemoto
    Left = 216
    Top = 24
  end
  object QPaletPbLocal: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSTransitoRemoto
    RequestLive = True
    Left = 40
    Top = 196
  end
  object QInsertarPaletLog: TQuery
    DatabaseName = 'BDCentral'
    Left = 168
    Top = 401
  end
  object QBorrarPaletPbLocal: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSTransitoRemoto
    RequestLive = True
    Left = 40
    Top = 140
  end
  object QBuscarPaletCabLocal: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSTransitoRemoto
    RequestLive = True
    Left = 336
    Top = 132
  end
  object QBuscarPaletDetLocal: TQuery
    DatabaseName = 'BDProyecto'
    DataSource = DSTransitoRemoto
    RequestLive = True
    Left = 464
    Top = 132
  end
  object qryPaletCabSGPLocal: TQuery
    DatabaseName = 'DBSGP'
    Left = 456
    Top = 257
  end
  object qryPaletDetSGPLocal: TQuery
    DatabaseName = 'DBSGP'
    Left = 464
    Top = 337
  end
  object QAux: TQuery
    DatabaseName = 'BDProyecto'
    RequestLive = True
    Left = 184
    Top = 476
  end
end
