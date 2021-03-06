unit LFExpediciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ActnList,
  ComCtrls, Db, CGestionPrincipal, BEdit,
  BCalendarButton, BSpeedButton, BGridButton, BCalendario, Grids, DBGrids,
  BGrid, Derror, DBTables;

type
  TFLExpediciones = class(TForm)
    Panel1: TPanel;
    GBFecha: TGroupBox;
    Desde: TLabel;
    ListaAcciones: TActionList;
    BAceptar: TAction;
    BCancelar: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GBEmpresa: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    BGBEmpresa: TBGridButton;
    BGBCentro: TBGridButton;
    BGBProducto: TBGridButton;
    EProducto: TBEdit;
    ECentro: TBEdit;
    EEmpresa: TBEdit;
    STEmpresa: TStaticText;
    STCentro: TStaticText;
    STProducto: TStaticText;
    MEDesde: TBEdit;
    BCBDesde: TBCalendarButton;
    MEHasta: TBEdit;
    BCBHasta: TBCalendarButton;
    RejillaFlotante: TBGrid;
    CalendarioFlotante: TBCalendario;
    ADesplegarRejilla: TAction;
    RGEuropa: TRadioGroup;
    Label4: TLabel;
    Label14: TLabel;
    QListadosExpedicion2: TQuery;
    QListadosExpedicion: TQuery;
    procedure BBAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADesplegarRejillaExecute(Sender: TObject);
    procedure PonNombre(Sender: TObject);
    procedure MEHastaExit(Sender: TObject);
    procedure EHastaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function seleccionarDetalle(): boolean;
    function seleccionarResumen(): boolean;
    function funcTiempo(tipo: Byte; fecha: string): string;
    function TodosLosCampos: Boolean;
    procedure InformeDetalle;
    procedure InformeResumen;
  public
    { Public declarations }
    empresa, centro, producto, factura: string;
  end;

var
  Autorizado: boolean;

implementation

uses bDialogs, UDMAuxDB, Principal, CVariables, DPreview, CReportes,
  CAuxiliarDB, LExpediciones, LExpedicionesResumen,
  UDMBaseDatos, bTimeUtils, bSQLUtils;

{$R *.DFM}

//                         ****  BOTONES  ****

function TFLExpediciones.TodosLosCampos: Boolean;
begin
  result := not ((Trim(EEmpresa.Text) = '') or (Trim(ECentro.Text) = '') or
                 (Trim(MEHasta.Text) = '') or (Trim(MEDesde.Text) = ''));
end;

procedure TFLExpediciones.BBAceptarClick(Sender: TObject);
begin
  if not TodosLosCampos then
  begin
    Advertir('Faltan campos de obligada inserci?n ...');
    Exit;
  end;

  if not CerrarForm(true) then Exit;

  if EProducto.Text  = '' then
   InformeResumen
  else
    InformeDetalle;
end;



procedure TFLExpediciones.InformeDetalle;
begin
  empresa := desEmpresa(EEmpresa.Text);
  centro := desCentro(EEmpresa.Text, ECentro.Text);
  producto := desProducto(EEmpresa.Text, EProducto.Text);

  if not seleccionarDetalle then
  begin
    Advertir('Problemas al seleccionar los datos del informe.');
    Exit;
  end;

  try
    QListadosExpedicion.Open;
  except
    on e: EDBEngineError do
    begin
      ShowError(e);
      Exit;
    end;
  end;

  //Comprobar que no este vacia la tabla
  if QListadosExpedicion.IsEmpty then
  begin
    QListadosExpedicion.Close;
    QListadosExpedicion.SQL.Clear;
    QListadosExpedicion.SQL.add(' drop table tmp_expediciones ');
    try
      QListadosExpedicion.ExecSQL;
    except
    end;
    ShowError('No se han encontrado datos para los valores introducidos.');
    EEmpresa.SetFocus;
    Exit;
  end;

  //Crear REPORT
  QRLExpediciones := TQRLExpediciones.Create(Application);

  QRLExpediciones.LabelProducto := Trim(STProducto.Caption);
  QRLExpediciones.LabelCentro := 'Centro expedici?n: ' + Trim(STCentro.Caption);
  QRLExpediciones.LabelSemana := 'Semana n?. ' +
    funcTiempo(1, MEDesde.Text) + '   Del ' +
    funcTiempo(2, MEDesde.Text) + ' al ' +
    funcTiempo(2, MEHasta.Text) + ' de ' +
    funcTiempo(3, MEDesde.Text);
  QRLExpediciones.LabelComunicado := 'N?mero de orden de comunicaci?n: ' +
    funcTiempo(1, MEDesde.Text) + '/' +
    Copy(funcTiempo(3, MEDesde.Text), 3, 2);
  PonLogoGrupoBonnysa(QRLExpediciones, EEmpresa.Text);
  Preview(QRLExpediciones);
  QListadosExpedicion.Close;
  QListadosExpedicion.SQL.Clear;
  QListadosExpedicion.SQL.add(' drop table tmp_expediciones ');
  try
    QListadosExpedicion.ExecSQL;
  except
  end;
end;

procedure TFLExpediciones.InformeResumen;
begin
  empresa := desEmpresa(EEmpresa.Text);
  centro := desCentro(EEmpresa.Text, ECentro.Text);
  producto := 'TODOS LOS PRODUCTOS';

  if not seleccionarResumen then
  begin
    Advertir('Problemas al seleccionar los datos del informe.');
    Exit;
  end;

  try
    QListadosExpedicion.Open;
  except
    on e: EDBEngineError do
    begin
      ShowError(e);
      Exit;
    end;
  end;

  //Comprobar que no este vacia la tabla
  if QListadosExpedicion.IsEmpty then
  begin
    QListadosExpedicion.Close;
    QListadosExpedicion.SQL.Clear;
    QListadosExpedicion.SQL.add(' drop table tmp_expediciones ');
    try
      QListadosExpedicion.ExecSQL;
    except
    end;
    ShowError('No se han encontrado datos para los valores introducidos.');
    EEmpresa.SetFocus;
    Exit;
  end;

  //Crear REPORT
  QRLExpedicionesResumen := TQRLExpedicionesResumen.Create(Application);
  try
    QRLExpedicionesResumen.LabelProducto := Trim(STProducto.Caption);
    QRLExpedicionesResumen.LabelCentro := 'Centro expedici?n: ' + Trim(STCentro.Caption);
    QRLExpedicionesResumen.LabelSemana := 'Semana n?. ' +
      funcTiempo(1, MEDesde.Text) + '   Del ' +
      funcTiempo(2, MEDesde.Text) + ' al ' +
      funcTiempo(2, MEHasta.Text) + ' de ' +
      funcTiempo(3, MEDesde.Text);
    QRLExpedicionesResumen.LabelComunicado := 'N?mero de orden de comunicaci?n: ' +
      funcTiempo(1, MEDesde.Text) + '/' +
      Copy(funcTiempo(3, MEDesde.Text), 3, 2);
    PonLogoGrupoBonnysa(QRLExpedicionesResumen, EEmpresa.Text);

    Preview(QRLExpedicionesResumen);
  except
    FreeAndNil( QRLExpedicionesResumen );
  end;
  QListadosExpedicion.Close;
  QListadosExpedicion.SQL.Clear;
  QListadosExpedicion.SQL.add(' drop table tmp_expediciones ');
  try
    QListadosExpedicion.ExecSQL;
  except
  end;
end;

procedure TFLExpediciones.BBCancelarClick(Sender: TObject);
begin
  if CerrarForm(false) then Close;
end;

//                          **** FORMULARIO ****

procedure TFLExpediciones.FormCreate(Sender: TObject);
begin
  FormType := tfOther;
  BHFormulario;

  EEmpresa.Tag := kEmpresa;
  ECentro.Tag := kCentro;
  EProducto.Tag := kProducto;
  MEDesde.Tag := kCalendar;
  MEHasta.Tag := kCalendar;
  gRF := rejillaFlotante;
  RejillaFlotante.DataSource := DMBaseDatos.DSQDespegables;
  gCF := calendarioFlotante;

  EEmpresa.Text:= gsDefEmpresa;
  ECentro.Text:= gsDefCentro;
  //EProducto.Text:= gsDefProducto;


  MEDesde.Text := DateTostr( LunesAnterior( Date - 6 )  );
  MEHasta.Text := DateTostr(LunesAnterior( Date - 6 ) + 6 );
  CalendarioFlotante.Date := Date;
end;

procedure TFLExpediciones.FormActivate(Sender: TObject);
begin
  ActiveControl := EEmpresa;
end;

procedure TFLExpediciones.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
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
  end;
end;

procedure TFLExpediciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  gRF := nil;
  gCF := nil;
  if FPrincipal.MDIChildCount = 1 then
  begin
    FormType := tfDirector;
    BHFormulario;
  end;
  BEMensajes('');
  Action := caFree;
end;

//                     ****  CAMPOS DE EDICION  ****

procedure TFLExpediciones.MEHastaExit(Sender: TObject);
begin
  if StrToDate(MEHasta.Text) < StrToDate(MEDesde.Text) then
  begin
    MessageDlg('Debe escribir un rango de fechas correcto',
      mtError, [mbOk], 0);
    MEDesde.SetFocus;
  end;
end;

procedure TFLExpediciones.EHastaExit(Sender: TObject);
begin
   {  if StrToInt(EHasta.Text) < StrToInt(EDesde.Text) then
     begin
          MessageDlg('Debe escribir un rango de cosecheros correcto',
                           mtError,[mbOk],0);
          EDesde.SetFocus;
     end;}
end;

//                      ****  FUNCIONES ESPECIFICAS  ****

procedure TFLExpediciones.ADesplegarRejillaExecute(Sender: TObject);
begin
  case ActiveControl.Tag of
    kEmpresa: DespliegaRejilla(BGBEmpresa);
    kProducto: DespliegaRejilla(BGBProducto, [EEmpresa.Text]);
    kCentro: DespliegaRejilla(BGBCentro, [EEmpresa.Text]);
    kCalendar:
      begin
        if MEDesde.Focused then
          DespliegaCalendario(BCBDesde)
        else
          DespliegaCalendario(BCBHasta);
      end;
  end;
end;

procedure TFLExpediciones.PonNombre(Sender: TObject);
begin
    if (gRF <> nil) then
      if esVisible( gRF ) then
        Exit;
    if (gCF <> nil) then
      if esVisible( gCF ) then
        Exit;
  case TComponent(Sender).Tag of
    kEmpresa:
    begin
      STEmpresa.Caption := desEmpresa(Eempresa.Text);
      PonNombre(Eproducto);
      PonNombre(Ecentro);
    end;
    kProducto:
    begin
      if Eproducto.Text = '' then
      begin
        STProducto.Caption := 'TODOS LOS PRODUCTOS - RESUMEN';
      end
      else
      begin
        STProducto.Caption := desProducto(Eempresa.Text, Eproducto.Text);
      end;
    end;
    kCentro: STCentro.Caption := desCentro(Eempresa.Text, Ecentro.Text);
  end;
end;

function TFLExpediciones.seleccionarDetalle: boolean;
var
  auxComunitario: string;
begin
  case RGEuropa.ItemIndex of
    0: auxComunitario := ' And ((es_comunitario_c = ' + QuotedStr('S') +
      ') OR (es_comunitario_c IS NULL)) AND    pais_c <> ' + QuotedStr('ES') + ' ';
    1: auxComunitario := ' And es_comunitario_c = ' + QuotedStr('N') + ' ';
    2: auxComunitario := ' AND    pais_c = ' + QuotedStr('ES') + ' ';
  end;

  with QListadosExpedicion do
  begin
    if Active then Close;
    //                                                                         *
    // SALIDAS                                                                 *
    //                                                                         *
    SQL.Clear;
    SQL.Add(' SELECT empresa_sl, centro_salida_sl, n_albaran_sl, fecha_sl, ' +
      '       pais_c, vehiculo_sc, SUM(kilos_sl) kilos ' +
      ' FROM   frf_salidas_c, frf_salidas_l, frf_clientes ' +
            //FILTRAR POR PARAMETROS DE ENTRADA
      ' where  empresa_sc = ' + QuotedStr(EEmpresa.Text) + ' ' +
      ' And    centro_salida_sc = ' + QuotedStr(ECentro.Text) + ' ' +
      ' and    fecha_sc between ' + SQLDate(MEDesde.Text) +
      '                     and ' + SQLDate(MEHasta.Text) + ' ' +
            //RELACION MAESTRO-DETALLE SALIDAS
      ' and    empresa_sl = empresa_sc ' +
      ' And    centro_salida_sl = centro_salida_sc ' +
      ' and    fecha_sl = fecha_sc ' +
      ' and    n_albaran_sl = n_albaran_sc ' +
            //FILTRAR POR PARAMETROS DE ENTRADA
      ' And    producto_sl = ' + QuotedStr(EProducto.Text) + ' ' +
            //RELACION SALIDAS - CLIENTE
      ' And    (cliente_sl = cliente_c) ' +
            //FILTRAR POR PAIS

      auxComunitario +

      //NO QUIERO LAS LINEAS QUE VENGAN DE UN TRANSITO AL EXTANJERO
      ' and not ( nvl(es_transito_sc,0) = 1 and (select pais_c from frf_clientes where cliente_sal_sc = cliente_c) <> ''ES'' ) '+

      //NO QUIERO LAS LINEAS QUE VENGAN DE UN TRANSITO AL EXTANJERO
      ' AND NOT EXISTS ' +
      '      (SELECT * FROM FRF_TRANSITOS_L ' +
      '       WHERE EMPRESA_TL = ' + QuotedStr(EEmpresa.Text) + ' ' +
      '        AND CENTRO_ORIGEN_TL = CENTRO_ORIGEN_SL ' +
      '        AND REFERENCIA_TL = REF_TRANSITOS_SL ' +
      '        AND FECHA_TL <= ' + QuotedStr(MEHasta.Text) + ' ' +
      '        AND ( CENTRO_DESTINO_TL IN ' +
      '              ( select centro_c from frf_centros where nvl(pais_c,''ES'') <> ''ES'' ) ) ' +

      '        AND PRODUCTO_TL = ' + QuotedStr(EProducto.Text) + ') ' +
            //Agrupar
      ' GROUP BY empresa_sl,centro_salida_sl,n_albaran_sl, fecha_sl, ' +
      '         pais_c, vehiculo_sc ' +
      ' INTO TEMP tmp_expediciones');

    try
      ExecSQL;
    except
      result := false;
      exit;
    end;

    //                                                                         *
    // TRANSITOS SOLO LOS COMUNITARIOS                                                               *
    //                                                                         *
    if RGEuropa.ItemIndex = 0 then
    begin
      SQL.Clear;
      SQL.Add(' INSERT INTO tmp_expediciones ');
      SQL.Add(' select empresa_tc,centro_tc,referencia_tc,fecha_tc,' +
        '              ( select pais_c from frf_centros where empresa_c = ' + QuotedStr(EEmpresa.Text) +
                                                        ' and centro_c = centro_destino_tc ) pais, ' +
        '              vehiculo_tc, sum(kilos_tl) kilos ' +
        ' from frf_transitos_c, frf_transitos_l ' +
               //FILTRADO POR PARAMETROS DE ENTRADA
        ' WHERE empresa_tc = ' + QuotedStr(EEmpresa.Text) + ' ' +
        ' And   centro_tc = ' + QuotedStr(ECentro.Text) + ' ' +
        ' and   fecha_tc between ' + SQLDate(MEDesde.Text) +
        '                    and ' + SQLDate(MEHasta.Text) + ' ' +
               //FILTRADO POR VALORES ESTATICOS -> CENTRO ALEMANIA
        ' and centro_destino_tc in ( select centro_c from frf_centros where nvl(pais_c,''ES'') <> ''ES'' ) '+
               //REALCION MAESTRO-DETALLE TRANSITOS
        ' and empresa_tl = empresa_tc ' +
        ' and centro_tl = centro_tc ' +
        ' and referencia_tl = referencia_tc ' +
        ' and fecha_tl = fecha_tc ' +
               //FILTRADO POR PARAMETROS DE ENTRADA
        ' And producto_tl = ' + QuotedStr(EProducto.Text) + ' ' +
               //AGRUPAR
        ' group by 1,2,3,4,5,6 ');
      try
        ExecSQL;
      except
        result := false;
        exit;
      end;

    end;

    SQL.Clear;
    SQL.Add(' SELECT empresa_sl, centro_salida_sl,fecha_sl, ' +
      '        pais_c, SUM(kilos) As Kilos, vehiculo_sc ');
    SQL.Add(' FROM tmp_expediciones ');
    SQL.Add(' GROUP BY empresa_sl, centro_salida_sl,fecha_sl,pais_c,vehiculo_sc');
    SQL.Add(' ORDER BY empresa_sl, centro_salida_sl,fecha_sl,vehiculo_sc');
    result := true;
  end;
end;

function TFLExpediciones.seleccionarResumen: boolean;
var
  auxComunitario: string;
begin
  case RGEuropa.ItemIndex of
    0: auxComunitario := ' And ((es_comunitario_c = ' + QuotedStr('S') +
      ') OR (es_comunitario_c IS NULL)) AND    pais_c <> ' + QuotedStr('ES') + ' ';
    1: auxComunitario := ' And es_comunitario_c = ' + QuotedStr('N') + ' ';
    2: auxComunitario := ' AND    pais_c = ' + QuotedStr('ES') + ' ';
  end;

  with QListadosExpedicion do
  begin
    if Active then Close;
    //                                                                         *
    // SALIDAS                                                                 *
    //                                                                         *
    SQL.Clear;
    SQL.Add(' SELECT empresa_sl, centro_salida_sl, producto_sl, pais_c, SUM(kilos_sl) kilos ' +
      ' FROM   frf_salidas_c, frf_salidas_l, frf_clientes ' +
            //FILTRAR POR PARAMETROS DE ENTRADA
      ' where  empresa_sc = ' + QuotedStr(EEmpresa.Text) + ' ' +
      ' And    centro_salida_sc = ' + QuotedStr(ECentro.Text) + ' ' +
      ' and    fecha_sc between ' + SQLDate(MEDesde.Text) +
      '                     and ' + SQLDate(MEHasta.Text) + ' ' +
            //RELACION MAESTRO-DETALLE SALIDAS
      ' and    empresa_sl = empresa_sc ' +
      ' And    centro_salida_sl = centro_salida_sc ' +
      ' and    fecha_sl = fecha_sc ' +
      ' and    n_albaran_sl = n_albaran_sc ' +
            //RELACION SALIDAS - CLIENTE
      ' And    (cliente_sl = cliente_c) ' +
            //FILTRAR POR PAIS

      auxComunitario +

      //NO QUIERO LAS LINEAS QUE VENGAN DE UN TRANSITO AL EXTANJERO
      ' and not ( nvl(es_transito_sc,0) = 1 and (select pais_c from frf_clientes where cliente_sal_sc = cliente_c) <> ''ES'' ) '+

      //NO QUIERO LAS LINEAS QUE VENGAN DE UN TRANSITO AL EXTANJERO
      ' AND NOT EXISTS ' +
      '      (SELECT * FROM FRF_TRANSITOS_L ' +
      '       WHERE EMPRESA_TL = ' + QuotedStr(EEmpresa.Text) + ' ' +
      '        AND CENTRO_ORIGEN_TL = CENTRO_ORIGEN_SL ' +
      '        AND REFERENCIA_TL = REF_TRANSITOS_SL ' +
      '        AND FECHA_TL <= ' + QuotedStr(MEHasta.Text) + ' ' +
      '        AND ( CENTRO_DESTINO_TL IN ' +
      '              ( select centro_c from frf_centros where nvl(pais_c,''ES'') <> ''ES'' ) )  ) ' +
            //Agrupar
      ' GROUP BY empresa_sl,centro_salida_sl, producto_sl, pais_c ' +
      ' INTO TEMP tmp_expediciones');

    try
      ExecSQL;
    except
      result := false;
      exit;
    end;

    //                                                                         *
    // TRANSITOS SOLO LOS COMUNITARIOS                                                               *
    //                                                                         *
    if RGEuropa.ItemIndex = 0 then
    begin
      SQL.Clear;
      SQL.Add(' INSERT INTO tmp_expediciones ');
      SQL.Add(' select empresa_tc,centro_tc, producto_tl, ' +
        '              ( select pais_c from frf_centros where empresa_c = ' + QuotedStr(EEmpresa.Text) + ' and centro_c = centro_destino_tc ) pais, ' +
        '              sum(kilos_tl) kilos ' +
        ' from frf_transitos_c, frf_transitos_l ' +
               //FILTRADO POR PARAMETROS DE ENTRADA
        ' WHERE empresa_tc = ' + QuotedStr(EEmpresa.Text) + ' ' +
        ' And   centro_tc = ' + QuotedStr(ECentro.Text) + ' ' +
        ' and   fecha_tc between ' + SQLDate(MEDesde.Text) +
        '                    and ' + SQLDate(MEHasta.Text) + ' ' +
               //FILTRADO POR VALORES ESTATICOS -> CENTRO ALEMANIA
        ' and centro_destino_tc in ( select centro_c from frf_centros where nvl(pais_c,''ES'') <> ''ES'' ) '+
               //REALCION MAESTRO-DETALLE TRANSITOS
        ' and empresa_tl = empresa_tc ' +
        ' and centro_tl = centro_tc ' +
        ' and referencia_tl = referencia_tc ' +
        ' and fecha_tl = fecha_tc ' +
               //FILTRADO POR PARAMETROS DE ENTRADA
               //AGRUPAR
        ' group by 1,2,3,4 ');
      try
        ExecSQL;
      except
        result := false;
        exit;
      end;

    end;

    SQL.Clear;
    SQL.Add(' SELECT empresa_sl, centro_salida_sl, producto_sl, ' +
      '        pais_c, SUM(kilos) As Kilos ');
    SQL.Add(' FROM tmp_expediciones ');
    SQL.Add(' GROUP BY empresa_sl, centro_salida_sl,producto_sl, pais_c');
    SQL.Add(' ORDER BY empresa_sl, centro_salida_sl,producto_sl, pais_c');

    result := true;
  end;
end;

function TFLExpediciones.funcTiempo(tipo: Byte; fecha: string): string;
var fec: TDate;
  Year, Month, Day: Word;
  cad, cad2: string;
begin
  fec := StrToDate(fecha);
  case tipo of
    1: begin
        cad := IntToStr(Semana(fec));
        if Length(cad) = 1 then
          funcTiempo := '0' + cad
        else funcTiempo := cad;
      end;
    2: begin
        DecodeDate(fec, year, month, day);
        cad := IntToStr(day);

        if length(cad) = 1 then
          cad := '0' + cad;
        cad2 := IntToStr(month);
        if length(cad2) = 1 then
          funcTiempo := cad + '/0' + cad2
        else funcTiempo := cad + '/' + cad2;

      end;
    3: begin
        DecodeDate(fec, year, month, day);
        funcTiempo := IntToStr(year);
      end;
  end;
end;

end.
