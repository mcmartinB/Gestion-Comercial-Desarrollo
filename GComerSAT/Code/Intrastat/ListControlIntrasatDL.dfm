object DLListControlIntrasat: TDLListControlIntrasat
  OldCreateOrder = False
  Height = 143
  Width = 197
  object QListControlIntrasat: TQuery
    DatabaseName = 'BDProyecto'
    SQL.Strings = (
      '--SALIDAS QUE NO PROVIENEN DE UN TRANSITO DE ALICANTE'
      'select centro_salida_sl centro, '
      '       es_comunitario_c comunitario,'
      '       pais_c pais,'
      
        '       (select estomate_p from frf_productos where empresa_p = '#39 +
        '050'#39' and producto_p = producto_sl ) estomate,'
      '       producto_sl producto, '
      '       cliente_sl cliente,'
      '       0 transito,'
      '       fecha_sl fecha,'
      '       n_albaran_sl referencia,'
      '       categoria_sl categoria,'
      '       sum(kilos_sl) kilos'
      'from frf_salidas_l, frf_clientes'
      'where empresa_sl = '#39'050'#39
      'and fecha_sl between '#39'1/5/2005'#39' and '#39'31/5/2005'#39
      ''
      '    --SALIDAS DIRECTAS '
      'AND ( ( ref_transitos_sl is null ) OR '
      '    --SALIDAS QUE NO PROVENGAN DE UN TRANSITO DE ALICANTE '
      '      ( not exists ( select * from frf_transitos_l '
      '                     where empresa_tl = '#39'050'#39' '
      '                       and centro_tl = '#39'1'#39' '
      '                       and referencia_tl = ref_transitos_sl '
      
        '                       and fecha_tl between '#39'1/3/2005'#39' and '#39'1/6/' +
        '2005'#39' '
      '                       and centro_origen_tl = centro_origen_sl '
      '                   ) '
      '      ) '
      '    ) '
      ''
      'and empresa_c = '#39'050'#39
      'and cliente_c = cliente_sl'
      'and pais_c <> '#39'ES'#39
      'group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10'
      ''
      'UNION'
      ''
      '--TRANSITOS DE ALICANTE'
      'select centro_tl centro, '
      '       '#39'S'#39' comunitario,'
      
        '       case when centro_destino_tl = '#39'D'#39' then '#39'DE'#39' else '#39'GB'#39' end' +
        ' pais,'
      
        '       (select estomate_p from frf_productos where empresa_p = '#39 +
        '050'#39' and producto_p = producto_tl ) estomate,'
      '       producto_tl producto, '
      '       centro_destino_tl cliente,'
      '       1 transito,'
      '       fecha_tl fecha,'
      '       referencia_tl referencia,'
      '       categoria_tl categoria,'
      '       sum(kilos_tl) kilos'
      'from frf_transitos_l '
      'where empresa_tl = '#39'050'#39
      'and fecha_tl between '#39'1/5/2005'#39' and '#39'31/5/2005'#39
      'and centro_tl = '#39'1'#39
      ''
      'group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10'
      'order by 1, 2, 3, 4 desc, 4, 5, 6, 7, 8, 9, 10')
    Left = 48
    Top = 24
    object QListControlIntrasatempresa: TStringField
      FieldName = 'empresa'
      Size = 3
    end
    object QListControlIntrasatcentro: TStringField
      FieldName = 'centro'
      FixedChar = True
      Size = 1
    end
    object QListControlIntrasatcomunitario: TStringField
      FieldName = 'comunitario'
      FixedChar = True
      Size = 1
    end
    object QListControlIntrasatpais: TStringField
      FieldName = 'pais'
      FixedChar = True
      Size = 2
    end
    object QListControlIntrasatrepresentante: TStringField
      FieldName = 'representante'
      Size = 2
    end
    object QListControlIntrasatestomate: TStringField
      FieldName = 'estomate'
      FixedChar = True
      Size = 1
    end
    object QListControlIntrasatproducto: TStringField
      DisplayWidth = 3
      FieldName = 'producto'
      FixedChar = True
      Size = 3
    end
    object QListControlIntrasatcliente: TStringField
      FieldName = 'cliente'
      FixedChar = True
      Size = 3
    end
    object QListControlIntrasattransito: TIntegerField
      FieldName = 'transito'
    end
    object QListControlIntrasatfecha: TDateField
      FieldName = 'fecha'
    end
    object QListControlIntrasatreferencia: TIntegerField
      FieldName = 'referencia'
    end
    object QListControlIntrasatcategoria: TStringField
      FieldName = 'categoria'
      FixedChar = True
      Size = 2
    end
    object QListControlIntrasatkilos: TFloatField
      FieldName = 'kilos'
    end
    object QListControlIntrasatcajas: TCurrencyField
      FieldName = 'cajas'
    end
    object QListControlIntrasatpalets: TCurrencyField
      FieldName = 'palets'
    end
    object QListControlIntrasatneto: TCurrencyField
      FieldName = 'neto'
    end
  end
end
