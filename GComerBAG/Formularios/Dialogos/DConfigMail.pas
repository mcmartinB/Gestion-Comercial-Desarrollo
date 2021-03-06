unit DConfigMail;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, quickrpt, Printers,
  ImgList, ActnList, Grids, Db, DBTables, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent,
  IdMessage, IdExplicitTLSClientServerBase, IdSMTPBase, IdUserPassProvider, IdSASL, IdSASLUserPass, IdSASLLogin,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TFDConfigMail = class(TForm)
    Panel1: TPanel;
    MMensaje: TMemo;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EDireccion: TEdit;
    EAsunto: TEdit;
    SBEnviar: TSpeedButton;
    SBSalir: TSpeedButton;
    SBEstado: TStatusBar;
    Panel3: TPanel;
    lvAdjuntos: TListView;
    ILImages: TImageList;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    AEnvio: TAction;
    ASalir: TAction;
    AHistorico: TAction;
    SGEnviados: TStringGrid;
    QGuardarEnviados: TQuery;
    QPDFs: TQuery;
    QPDFsnombre_p: TStringField;
    QPDFspdf_p: TBlobField;
    IdMessage: TIdMessage;
    IdSMTP: TIdSMTP;
    lblCopia: TLabel;
    edtCopia: TEdit;
    btnACancelar: TSpeedButton;
    btn1: TButton;
    dlgOpen: TOpenDialog;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSASLLogin1: TIdSASLLogin;
    IdUserPassProvider1: TIdUserPassProvider;
    procedure SBEnviarClick(Sender: TObject);
    procedure SBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lvAdjuntosDblClick(Sender: TObject);
    procedure AHistoricoExecute(Sender: TObject);
    procedure EDireccionChange(Sender: TObject);
    procedure btnACancelarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    direccion: string;
    bPregunta: Boolean;
    procedure BorrarFicheros(borrar: boolean);
    procedure ConvertirMensaje(msg: string);
    procedure RellenarDirecciones(direcciones: string);
    procedure GuardarReporte;
    procedure GuardarAlbaranEnviado;
    procedure RellenarCopias(direcciones: string);
  public
    { Public declarations }
    adjuntos: TStringList;
    esFactura: boolean;
    bEnviado, bCancelar, bAlbaran: boolean;


    function AsuntoFactura( const AEmpresa, ACliente: string ): string;
  end;

function EMail( var email: string): boolean;
function EMailAlbaran( var email: string): boolean;

var
  FDConfigMail: TFDConfigMail;
  sEmpresaConfig, sClienteConfig, SSuministroConfig, sCentroConfig, sAlbaranConfig,
  sFechaConfig, sAsunto, sCampoConfig: string;

function EnviarAlbaranes( Report: TQuickRep ): boolean;
function EnviarTransitos( Report: TQuickRep ): boolean;
function EnviarFacturasManuales( Report: TQuickRep ): boolean;
function EnviarInforme( Report: TQuickRep ): boolean;
function EnviarInformeACliente( const Report: TQuickRep; const AEmpresa, ACliente, AAsunto, ACuerpo: string; var ACancelar: Boolean ): boolean;

function AlbaranesSendMail(const ACliente: string; const ATexto, AAdjuntos: TStrings; var ADireccion, ACopia: string): boolean;
//function AlbaranesSendMail(const AAdjuntos: TStrings; var ADireccion, ACopia: string): boolean;

function EMailCliente( const AEmpresa, ACliente: string; const AFacturas: Boolean = False ): string;

implementation

uses MSalidas, DPreview, CVariables, DError, ShellApi, StrUtils, Principal,
  UDMBaseDatos, UDMAuxDB, UDMConfig, CReportes, CGlobal, ShlObj, IdAttachmentFile;

{$R *.DFM}

//   Sacamos la direccion de email del cliente

function EMail( var email: string): boolean;
begin
  email := '';
  with DMBaseDatos.QGeneral do
  begin
    Close;
    SQl.Clear;
    SQl.Add('SELECT ' + sCampoConfig + ' FROM frf_clientes ' +
      'WHERE cliente_c = ' + QuotedStr(sClienteConfig) );
    try
      Open;
    except
      Result := false;
      exit
    end;

    email := Trim( FieldByName(sCampoConfig).AsString );
    Result := email <> '';
    Close;
  end;
end;

function EMailAlbaran( var email: string): boolean;
begin
  email := '';
  if DConfigMail.sClienteConfig <> '' then
  with DMBaseDatos.QGeneral do
  begin
    Close;
    SQl.Clear;
    SQl.Add('SELECT email_alb_c FROM frf_clientes ' +
      'WHERE cliente_c = ' + QuotedStr(sClienteConfig) +
      ' AND email_alb_c IS NOT NULL AND email_alb_c <> '''' ');
    try
      Open;
    except
      Result := false;
      exit
    end;

    if not IsEmpty then
    begin
      email := Trim(FieldByName('email_alb_c').AsString);
    end;
    Close;

    if DConfigMail.sSuministroConfig <> '' then
    with DMBaseDatos.QGeneral do
    begin
      Close;
      SQl.Clear;
      SQl.Add('SELECT email_ds  ');
      SQl.Add('FROM frf_dir_sum  ');
      SQl.Add('WHERE cliente_ds = ' + QuotedStr(sClienteConfig)  );
      SQl.Add(' AND dir_sum_ds = ' + QuotedStr(sSuministroConfig)  );
      SQl.Add(' AND nvl(email_ds,'''') <> ''''  ');
      try
        Open;
      except
        Result := false;
        exit
      end;

      if not IsEmpty then
      begin
        if  Trim( email ) = '' then
        begin
          email := Trim(FieldByName('email_ds').AsString)
        end
        else
        begin
          if Copy( email, Length( email ), 1 ) = ';' then
            email := email + Trim(FieldByName('email_ds').AsString)
         else
             email := email + ';' + Trim(FieldByName('email_ds').AsString);
         end;
      end;
      Close;
    end;

  end;
  Result := email <> '';
end;

function EMailCliente( const AEmpresa, ACliente: string; const AFacturas: Boolean = False ): string;
begin
  with DMBaseDatos.QGeneral do
  begin
    Close;
    SQl.Clear;

    SQl.Add(' select email_alb_c email_alb, email_fac_c email_fac');
    SQl.Add(' from frf_clientes ');
    SQl.Add(' where cliente_c = :cliente ');

    ParamByname('cliente').AsString:= ACliente;

    Open;
    try
      if AFacturas then
      begin
        Result := Trim( FieldByName( 'email_fac' ).AsString );
        if Result = '' then
          Result := Trim( FieldByName( 'email_alb' ).AsString );
      end
      else
      begin
        Result := Trim( FieldByName( 'email_alb' ).AsString );
      end;
    finally
      Close;
    end;
  end;
end;


function EnviarAlbaranes( Report: TQuickRep ): boolean;
var
  aux: string;

begin

     //Creo el formulario
  with TFDConfigMail.Create(Application) do
  begin
    bAlbaran := True;

    aux := Report.ReportTitle;

    //le quito los puntos para que no hayan problemas con el nombre del fichero
    aux := StringReplace(aux, '.', '', [rfReplaceAll, rfIgnoreCase]);
    Report.ReportTitle := Aux;

    Adjuntos.Add( gsDirActual + '\..\temp'  + '\' + Report.ReportTitle + '.pdf');
    if FileExists(gsDirActual + '\..\temp'  + '\' + Report.Hint + '.pdf') then
    begin
      Adjuntos.Add(gsDirActual + '\..\temp'  + '\' + Report.Hint + '.pdf');
    end;

    if not CrearPDF(Report) then
    begin
      ShowError('Existe un problema al crear los albaranes.' + #13#10 +
                'Cierre el programa, reinicie el ordenador y vuelva a lanzarlo.');
      Result := False;
      Free;
      Exit;
    end;

    //Recoger direccion de correo del cliente
    sCampoConfig:= 'email_alb_c';
    EMailAlbaran( Direccion );
    //Rellenamos los campos de la pantalla de env?o de correo
    EDireccion.Text := Direccion;
    edtCopia.Text:= gsDirCorreo;//gsCuentaCorreo;
    if sAsunto <> '' then
    begin
      EAsunto.Text := sAsunto;
      sAsunto:= '';
    end
    else
    begin
      EAsunto.Text := 'Env?o del albar?n n? ' + sAlbaranConfig;
    end;

    //mostrar la pantalla de envio de correo
    ShowModal;
    if bEnviado then
      GuardarAlbaranEnviado;
    Result := bEnviado;
  end;
end;

procedure TFDConfigMail.GuardarAlbaranEnviado;
var dia, hora: string;
begin
  dia := DateToStr(Date);
  hora := TimeToStr(Time);
  with QGuardarEnviados do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO frf_alb_enviados ' +

      'SELECT empresa_sc, cliente_sal_sc, n_albaran_sc, fecha_sc, ' +
      QuotedStr(hora) + ',' + QuotedStr(dia) + ',' + QuotedStr(gsCodigo) +
      ',' + QuotedStr(gsMaquina) + ',' + QuotedStr(EDireccion.Text) + ',' + QuotedStr(edtCopia.Text) +

      ' FROM frf_salidas_c ' +
      ' WHERE empresa_sc = ' + QuotedStr(sEmpresaConfig) +
      ' AND cliente_fac_sc = ' + QuotedStr(sClienteConfig) +
      ' AND n_albaran_sc = ' + sAlbaranConfig +
      ' AND fecha_sc = ' + QuotedStr(sFechaConfig));
    try
      ExecSQL;
    except
      on E: EDBEngineError do
      begin
        ShowError(e);
      end;
    end;
  end;
     //ImprimirReporteAlbaranes;
end;


function EnviarTransitos( Report: TQuickRep ): boolean;
var
  aux: string;
begin
  //Creo el formulario
  with TFDConfigMail.Create(Application) do
  begin
    bAlbaran := False;
    aux := Report.ReportTitle;

    //le quito los puntos para que no hayan problemas con el nombre del fichero
    aux := StringReplace(aux, '.', '', [rfReplaceAll, rfIgnoreCase]);
    Report.ReportTitle := Aux;
    Adjuntos.Add(gsDirActual + '\..\temp'  + '\' + Report.ReportTitle + '.pdf');

    if not CrearPDF(Report) then
    begin
      ShowError('Existe un problema al crear los tr?nsitos.' + #13#10 +
               'Cierre el programa, reinicie el ordenador y vuelva a lanzarlo.');
      Result := False;
      Free;
      Exit;
    end;

    //Recoger direccion de correo del cliente o centro
    Direccion := DireccionEmailCentro( sEmpresaConfig, sCentroConfig );

    //Rellenamos los campos de la pantalla de envio de correo
    EDireccion.Text := Direccion;
    if sAsunto <> '' then
    begin
      EAsunto.Text := sAsunto;
      sAsunto:= '';
    end
    else
    begin
      EAsunto.Text := 'Env?o de albaran de tr?nsito';
    end;

    //mostrar la pantalla de envio de correo
    ShowModal;
    Result := bEnviado;
  end;
end;

function EnviarFacturasManuales( Report: TQuickRep ): boolean;
var
  aux: string;
  slAux: TStringList;
  FDConfigMail: TFDConfigMail;
begin
  //Creo el formulario
  FDConfigMail:= TFDConfigMail.Create(Application);
  try
    with FDConfigMail do
    begin
      bAlbaran := False;
      aux := Report.ReportTitle;

      //le quito los puntos para que no hayan problemas con el nombre del fichero
      aux := StringReplace(aux, '.', '', [rfReplaceAll, rfIgnoreCase]);
      Report.ReportTitle := Aux;
      Adjuntos.Add(gsDirActual + '\..\temp'  + '\' + Report.ReportTitle + '.pdf');

      if not CrearPDF(Report) then
      begin
        ShowError('Existe un problema al crear la factura.' + #13#10 +
                 'Cierre el programa, reinicie el ordenador y vuelva a lanzarlo.');
        Result := False;
        Exit;
      end;

      //Recoger direccion de correo del cliente
      sCampoConfig:= 'email_fac_c';
      EMail( Direccion );
      //Rellenamos los campos de la pantalla de envio de correo
      EDireccion.Text := Direccion;
      if sAsunto <> '' then
      begin
        EAsunto.Text := sAsunto;
        sAsunto:= '';
      end
      else
      begin
        EAsunto.Text := 'Env?o de facturas'
      end;

      //mostrar la pantalla de envio de correo
      slAux:= TStringList.Create;
      MMensaje.Lines.Clear;
      MMensaje.Lines.Add( AsuntoFactura( sEmpresaConfig, sClienteConfig ) );

      ShowModal;
      slAux.AddStrings( MMensaje.Lines );
      Result := bEnviado;
      FreeAndNil( slAux );
    end;
  finally
    FreeAndNil(FDConfigMail  );
  end;
end;

function EnviarInforme( Report: TQuickRep ): boolean;
var
  aux: string;
begin
  if DMConfig.EsUnAlmacen then
  begin
    Result := False;
    Exit;
  end;

     //Creo el formulario
  with TFDConfigMail.Create(Application) do
  begin
    bAlbaran := False;
    aux := Report.ReportTitle;

    //le quito los puntos para que no hayan problemas con el nombre del fichero
    aux := StringReplace(aux, '.', '', [rfReplaceAll, rfIgnoreCase]);
    Report.ReportTitle := Aux;
    Adjuntos.Add(gsDirActual + '\..\temp'  + '\' + Report.ReportTitle + '.pdf');

    if not CrearPDF(Report) then
    begin
      ShowError('Existe un problema al crear el informe en PDF.' + #13#10 +
                'Cierre el programa, reinicie el ordenador y vuelva a lanzarlo.');
      Result := False;
      Free;
      Exit;
    end;

    //Rellenamos los campos de la pantalla de env?o de correo
    EDireccion.Text := '';
    if sAsunto <> '' then
    begin
      EAsunto.Text := sAsunto;
      sAsunto:= '';
    end
    else
    begin
      EAsunto.Text := 'Env?o PDF Gesti?n Comercial.';
    end;

    //mostrar la pantalla de envio de correo
    ShowModal;
    Result := bEnviado;
  end;
end;

function EnviarInformeACliente( const Report: TQuickRep; const AEmpresa, ACliente, AAsunto, ACuerpo: string; var ACancelar: Boolean ): boolean;
var
  aux, sFirma: string;
  FDConfigMail: TFDConfigMail;
begin
  aux := StringReplace(Report.ReportTitle, '.', '', [rfReplaceAll, rfIgnoreCase]);
  sFirma:= AEmpresa +  ' - ' + ACliente +  ' - ' + FormatDateTime( 'dd/mm/yyyy', now );
  aux := UpperCase( Report.ReportTitle ) + '_' + AEmpresa +  '_' + ACliente +  '_' + FormatDateTime( 'ddmmyyyy', now );
  Report.ReportTitle := Aux;
  if not CrearPDF(Report) then
  begin
    ShowError('Existe un problema al crear el informe en PDF.' + #13#10 +
              'Cierre el programa, reinicie el ordenador y vuelva a lanzarlo.');
    Result := False;
  end
  else
  begin
    FDConfigMail:= TFDConfigMail.Create(Application);
    FDConfigMail.btnACancelar.Visible:= True;
    FDConfigMail.Adjuntos.Add(gsDirActual + '\..\temp'  + '\' + Report.ReportTitle + '.pdf');
    //Rellenamos los campos de la pantalla de env?o de correo
    FDConfigMail.Caption:='   ENV?O DE CORREO A ' +  AEmpresa + '/' +  ACliente + ' - ' + desCliente( ACliente );
    FDConfigMail.EDireccion.Text := EMailCliente( AEmpresa, ACliente, True );
    FDConfigMail.edtCopia.Text:= gsDirCorreo;//gsCuentaCorreo;
    FDConfigMail.EAsunto.Text := AAsunto;
    FDConfigMail.MMensaje.Clear;
    FDConfigMail.MMensaje.Lines.Add( ACuerpo );
    FDConfigMail.MMensaje.Lines.Add( sFirma );

    FDConfigMail.bPregunta:= False;
    FDConfigMail.ShowModal;
    Result := FDConfigMail.bEnviado;
    ACancelar:= FDConfigMail.bCancelar;
  end;
end;

function AlbaranesSendMail(const ACliente: string; const ATexto, AAdjuntos: TStrings; var ADireccion, ACopia: string): boolean;
begin
  //Creo el formulario
  with TFDConfigMail.Create(Application) do
  begin
    Adjuntos.AddStrings(AAdjuntos);
    Edireccion.Text := ADireccion;
    edtCopia.Text:= gsDirCorreo;//gsCuentaCorreo;

    MMensaje.Lines.Add('Albaranes enviados');
    MMensaje.Lines.AddStrings( ATexto );
    EAsunto.Text := 'Env?o de albaranes ' + ACliente;

    //mostrar la pantalla de envio
    ShowModal;
    ADireccion := Edireccion.Text;
    ACopia:= edtCopia.Text;
    Result := bEnviado;
  end;
end;

(*
function AlbaranesSendMail(const AAdjuntos: TStrings; var ADireccion, ACopia: string): boolean;
begin
  //Creo el formulario
  with TFDConfigMail.Create(Application) do
  begin
    Adjuntos.AddStrings(AAdjuntos);
    Edireccion.Text := ADireccion;
    EAsunto.Text := 'Env?o de albaranes';

    //mostrar la pantalla de envio
    ShowModal;
    ADireccion := Edireccion.Text;
    Result := enviado;
  end;
end;
*)
procedure TFDConfigMail.FormCreate(Sender: TObject);
begin
     //inicializar variables
  //Application.BringToFront;
  SBEstado.SimpleText := '';
  esFactura := false;
  bEnviado := false;
  bCancelar:= False;
  Adjuntos := TStringList.Create;
  Adjuntos.Clear;

  IdSMTP.Host:= gsHostCorreo;
  IdSMTP.UserName:= gsUsarioCorreo;
  IdSMTP.Password:= gsClaveCorreo;
//  IdSMTP.Port:= 25;
  IdSMTP.Port:= 587;
  idUserPassProvider1.Username :=gsUsarioCorreo;
  idUserPassProvider1.Password := gsClaveCorreo;


  bPregunta:= True;
end;

procedure TFDConfigMail.FormShow(Sender: TObject);
var imagen: integer;
  i: integer;
begin
     //Cargar los ficheros el TListView
  if Adjuntos.Count > 0 then
  begin
    for i := 0 to Adjuntos.Count - 1 do
    begin
             //comprobar si es .doc o .pdf
      if Copy(Adjuntos[i], (Length(Adjuntos[i]) - 2), 3) = 'doc' then
        imagen := 3 //se le pone el icono de Word
      else
        imagen := 1; //se le pone el icono de PDF
      lvAdjuntos.Items.Add;
      lvAdjuntos.Items[lvAdjuntos.Items.Count - 1].Caption := Adjuntos[i];
      lvAdjuntos.Items[lvAdjuntos.Items.Count - 1].ImageIndex := imagen;
    end;
  end;
  if EDireccion.Text = '' then
    EDireccion.SetFocus
  else
    MMensaje.SetFocus;
end;

procedure TFDConfigMail.SBEnviarClick(Sender: TObject);
var i: integer;
begin
  bCancelar:= False;
  if bEnviado then
  begin
    ShowMessage('El mensaje ya ha sido enviado, salga de esta pantalla para enviar otro mensaje');
    Exit;
  end;

  if SGEnviados.Visible then
  begin
    SGEnviados.Visible := false;
  end;

  SBEstado.SimpleText := '';
     //Correo.ClearParameters;

     //Intentamos conectar
  SBEstado.SimpleText := 'Conectando con el servidor de correo';
  Sleep(1500);
  if not IdSMTP.Connected then
  begin
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      ShowMessage('No se puede conectar');
      SBEstado.SimpleText := 'Operaci?n abortada';
      BorrarFicheros(not esFactura);
      Exit;
    end;
  end;

  SBEstado.SimpleText := 'Conexi?n con el servidor de correo realizada';
  Screen.Cursor := crHourGlass;
     //rellenamos parametros para el envio
     //Correo.ClearParameters;
  //IdMessage.From.Name := gsDescripcionCorreo;
  IdMessage.From.Name := gsNombre;
  IdMessage.From.Address := gsCuentaCorreo;
  IdMessage.ReplyTo.EMailAddresses:= gsDirCorreo;

  if pos(';', Edireccion.Text) > 0 then
    RellenarDirecciones(Edireccion.Text)
  else
    IdMessage.Recipients.Add.Address := EDireccion.Text;
  RellenarCopias(edtCopia.Text);
  IdMessage.Subject := EAsunto.Text;
     //Correo.PostMessage.Attachments.Add(Adjuntos);
  for i := 0 to Adjuntos.Count - 1 do
  begin
    if FileExists( Adjuntos[i] ) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, Adjuntos[i])
    end
    else
    begin
      ShowMessage('Error al enviar el correo, no se encuentra el adjunto "' + Adjuntos[i] + '".');
      Screen.Cursor := crDefault;
      SBEstado.SimpleText := 'Operaci?n abortada';
      BorrarFicheros(not esFactura);
      bEnviado := False;
      IdSMTP.Disconnect;
      Exit;
    end;
    //Sleep( 5000 );
  end;


  (*
  if esFactura then
  begin
    BodyFactura
  end
  else
  begin
    for i := 0 to (MMensaje.Lines.Count - 1) do
      IdMessage.Body.Add(MMensaje.Lines[i]);
  end;
  *)
    for i := 0 to (MMensaje.Lines.Count - 1) do
      IdMessage.Body.Add(MMensaje.Lines[i]);

     //Intentamos  enviar
  SBEstado.SimpleText := 'Enviando mensaje';
  try
    IdSMTP.Send(IdMessage);
  except
    on E: Exception do
    begin
      ConvertirMensaje(E.Message);
      Screen.Cursor := crDefault;
      SBEstado.SimpleText := 'Operaci?n abortada';
      BorrarFicheros(not esFactura);
      bEnviado := False;
      try
        IdSMTP.Disconnect;
      except
      end;
      Exit;
    end;
  end;

  GuardarReporte;
  screen.Cursor := crDefault;
  bEnviado := True;
  BorrarFicheros(true and not esFactura);
  if bPregunta then
  begin
    SBEstado.SimpleText := 'Mensaje enviado';
  end
  else
  begin
    Close;
  end;
end;

procedure TFDConfigMail.RellenarCopias(direcciones: string);
var aux: integer;
begin
  IdMessage.BccList.Clear;
  while direcciones <> '' do
  begin
    if pos(';', direcciones) > 0 then
    begin
      IdMessage.BccList.Add.Address := Trim(Copy(direcciones, 0, (pos(';', direcciones) - 1)));
      aux := pos(';', direcciones) + 1;
      direcciones := Copy(direcciones, aux, Length(direcciones));
    end
    else
    begin
      IdMessage.BccList.Add.Address := trim(Copy(direcciones, 0, Length(direcciones)));
      direcciones := '';
    end;
  end;
end;

procedure TFDConfigMail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Adjuntos <> nil then begin
    Adjuntos.Free;
    Adjuntos := nil;
  end;
  Action := caFree;
end;

procedure TFDConfigMail.SBSalirClick(Sender: TObject);
begin
  bCancelar:= False;
  if SGEnviados.Visible then
  begin
    SGEnviados.Visible := False;
    Exit;
  end;
  if IdSMTP.Connected then
    IdSMTP.Disconnect;

  if bPregunta then
  begin
    if not bEnviado then
    begin
         //mensaje de aviso de que no ha sido enviado
      if MessageDlg('El e-mail no ha sido enviado, ?desea salir?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        BorrarFicheros(not esFactura);
        Close;
      end
    end
    else
      Close;
  end
  else
  begin
    BorrarFicheros(not esFactura);
    Close;
  end;
end;

procedure TFDConfigMail.BorrarFicheros(borrar: boolean);
var i: integer;
begin
  if (borrar) and (Adjuntos.count > 0) then
  try
    for i := 0 to Adjuntos.Count - 1 do
    begin
      if FileExists( Adjuntos[i] ) then
        DeleteFile( Adjuntos[i] )
    end;

  except
  end;
end;

//RECOGER LOS POSIBLES ERRORES TANTO AL CONECTARSE COMO AL ENVIAR EL CORREO

procedure TFDConfigMail.ConvertirMensaje(msg: string);
begin
  if msg = '503 No recipients specified' + #$D#$A then
    ShowError('Falta la direcci?n de destino')
  else
    if msg = 'Incomplete Header' then
      ShowError('Falta la direcci?n del remitente')
    else
      if pos('No se puede abrir el archivo', msg) > 0 then
        ShowError(msg)
      else
        ShowError('No se puede enviar el mensaje' + #13 + #10 + '[' + msg + ']');
end;

procedure TFDConfigMail.RellenarDirecciones(direcciones: string);
var aux: integer;
begin
  while direcciones <> '' do
  begin
    if pos(';', direcciones) > 0 then
    begin
      IdMessage.Recipients.Add.Address := Trim(Copy(direcciones, 0, (pos(';', direcciones) - 1)));
      aux := pos(';', direcciones) + 1;
      direcciones := Copy(direcciones, aux, Length(direcciones));
    end
    else
    begin
      IdMessage.Recipients.Add.Address := trim(Copy(direcciones, 0, Length(direcciones)));
      direcciones := '';
    end;
  end;
end;

//guardamos en un fichero de texto los correos enviados y en las tablas
//las facturas o albaranes que hayan sido enviados, para poder ver por mensaje
//enviado o por facturas o albaraes enviados

procedure TFDConfigMail.GuardarReporte;
var manejador: integer;
  archivos: string;
  i: integer;
begin
     //Comprobar si existe el fichero
  if not FileExists(gsDirActual + '\MensajesEnviados.txt') then
  begin
    try
      manejador := FileCreate(gsDirActual + '\MensajesEnviados.txt')
    except
      begin
        ShowError('No se puede grabar el mensaje en el fichero de mensajes enviados');
        Exit;
      end;
    end;
    FileClose(manejador);
  end;
     //A?adir la linea al fichero con los datos del correo enviado: fecha, hora, direccion, adjuntos
  with TStringList.Create do
  begin
    for i := 0 to Adjuntos.count - 1 do
    begin
      if i > 0 then archivos := archivos + ';';
      archivos := archivos + Adjuntos[i];
    end;
    try
      LoadFromFile(gsDirActual + '\MensajesEnviados.txt');
      Add(DateToStr(date) + '|' + TimeToStr(time) + '|' + EDireccion.Text + '|' + IdMessage.Subject + '|' + archivos);
      SaveToFile(gsDirActual + '\MensajesEnviados.txt');
    except
      begin
        ShowError('No se puede grabar el mensaje en el fichero de mensajes enviados');
        Free;
        Exit;
      end;
    end;
    Free;
  end;
end;

procedure TFDConfigMail.lvAdjuntosDblClick(Sender: TObject);
begin
  if lvAdjuntos.Selected <> nil then
    ShellExecute(Handle, nil, PChar(lvAdjuntos.Selected.Caption),
      nil, nil, SW_NORMAL);
end;

procedure TFDConfigMail.AHistoricoExecute(Sender: TObject);
var fichero: TStringList;
  i, j, col, fil: integer;
begin

  if not FileExists(gsDirActual + '\MensajesEnviados.txt') then
  begin
    ShowError('No se ha enviado ning?n correo electr?nico todavia');
    Exit;
  end;
  fichero := TStringList.Create;
  fichero.LoadFromFile(gsDirActual + '\MensajesEnviados.txt');
  //rellenar titulos de columnas
  SGEnviados.Cells[0, 0] := 'Fecha';
  SGEnviados.Cells[1, 0] := 'Hora';
  SGEnviados.Cells[2, 0] := 'Para';
  SGEnviados.Cells[3, 0] := 'Asunto';
  SGEnviados.Cells[4, 0] := 'Adjuntos';
  //rellenar celdas
  fil := 1;
  if Fichero.Count > 10 then
  begin
    for i := (Fichero.Count - 1) downto (Fichero.Count - 10) do
    begin
      col := 0;
      while (pos('|', fichero[i])) > 0 do
      begin
        SGEnviados.Cells[col, fil] := (Trim(Copy(fichero[i], 0, (pos('|', fichero[i]) - 1))));
        j := pos('|', fichero[i]) + 1;
        fichero[i] := Copy(fichero[i], j, Length(fichero[i]));
        inc(col);
      end;
      SGEnviados.Cells[col, fil] := Trim(fichero[i]);
      inc(fil);
    end;
  end
  else
  begin
    for i := (Fichero.Count - 1) downto 0 do
    begin
      col := 0;
      while (pos('|', fichero[i])) > 0 do
      begin
        SGEnviados.Cells[col, fil] := (Trim(Copy(fichero[i], 0, (pos('|', fichero[i]) - 1))));
        j := pos('|', fichero[i]) + 1;
        fichero[i] := Copy(fichero[i], j, Length(fichero[i]));
        inc(col);
      end;
      SGEnviados.Cells[col, fil] := Trim(fichero[i]);
      inc(fil);
    end;
  end;
  SGEnviados.Align := alClient;
  SGEnviados.Visible := True;
  fichero.Free;
end;

procedure TFDConfigMail.EDireccionChange(Sender: TObject);
begin
  SBEnviar.Enabled:= Pos( '@', EDireccion.Text ) > 0;
end;

function TFDConfigMail.AsuntoFactura( const AEmpresa, ACliente: string ): string;
begin
  Result:= '';
  with DMAuxDB.QAux do
  begin
    SQL.Clear;
    SQL.Add( 'select pais_c, banco_c, forma_pago_c, dias_cobro_fp, forma_pago_adonix_fp ');
    SQL.Add( 'from frf_clientes ');
    SQL.Add( '     join frf_forma_pago on forma_pago_c = codigo_fp ');
    SQL.Add( 'where cliente_c = :cliente ');
    ParamByName('cliente').AsString:= ACliente;
    Open;

    try
      if FieldByName('pais_c').AsString = 'ES' then
      begin
        if CGlobal.gProgramVersion = pvBAG then
        begin
          if FieldByName('forma_pago_c').AsString = '64' then
          begin
            Result:= Result + #13 + #10;
            Result:= Result + 'RUEGO TENGAN EN CUENTA QUE SE HA CAMBIADO LOS DATOS BANCARIOS DONDE DEBEN EFECTUAR EL INGRESO, APARECEN DETALLADOS EN LA FACTURA - GRACIAS ' + #13 + #10;
            Result:= Result + #13 + #10;
          end;
        end
        else
        begin
          if FieldByName('forma_pago_c').AsString = '69' then
          begin
            Result:= Result + #13 + #10;
            Result:= Result + 'RUEGO TENGAN EN CUENTA QUE SE HA CAMBIADO LOS DATOS BANCARIOS DONDE DEBEN EFECTUAR EL INGRESO, APARECEN DETALLADOS EN LA FACTURA - GRACIAS ' + #13 + #10;
            Result:= Result + #13 + #10;
          end;
        end;
        Result:= Result + 'Por favor, confirme la recepci?n de este e-mail con otro e-mail indicando, n?mero de factura/albar?n, fecha e importe.' + #13 + #10;;
      end
      else
      begin
        if CGlobal.gProgramVersion = pvBAG then
        begin
          if FieldByName('forma_pago_c').AsString = '64' then
          begin
            Result:= Result + #13 + #10;
            Result:= Result + 'PLEASE TAKE NOTE THAT BANK DETAILS HAS BEEN CHANGED - DETAILED ON THE INVOICE - THANK YOU' + #13 + #10;
            Result:= Result + #13 + #10;
          end;
        end
        else
        begin
          if FieldByName('forma_pago_c').AsString = '69' then
          begin
            Result:= Result + #13 + #10;
            Result:= Result + 'PLEASE TAKE NOTE THAT BANK DETAILS HAS BEEN CHANGED - DETAILED ON THE INVOICE - THANK YOU' + #13 + #10;
            Result:= Result + #13 + #10;
          end;
        end;
        Result:= Result + 'Please confirm the reception of this e-mail with another e-mail indicating, invoice, date, number, and amount.' + #13 + #10;;
      end;
{
      Result:= Result + #13 + #10;
      Result:= Result + 'COMUNICACI?N A CLIENTES' + #13 + #10;
      Result:= Result + 'Sistema de Suministro Inmediato de Informaci?n (SII)' + #13 + #10;
      Result:= Result + #13 + #10;
      Result:= Result + 'Como es sabido, el pr?ximo 1 de julio de 2017 entrar? en vigor el Sistema de Suministro Inmediato de Informaci?n,  ';
      Result:= Result + 'consistente en la obligaci?n de llevar los libros registro de IVA a trav?s de la Sede Electr?nica de la AEAT.' + #13 + #10;
      Result:= Result + #13 + #10;
      Result:= Result + 'Este sistema de suministro de informaci?n, obligatorio para determinados sujetos pasivos (entre ellos, las entidades del Grupo Bonnysa), ';
      Result:= Result + 'implica la remisi?n de determinada informaci?n referida a las facturas emitidas y recibidas, as? como otra informaci?n adicional de relevancia fiscal, ';
      Result:= Result + 'en un breve periodo de tiempo desde su expedici?n o contabilizaci?n.' + #13 + #10;
      Result:= Result + #13 + #10;
      Result:= Result + 'En el marco de este cambio normativo, nos gustar?a trasmitirle nuestro inter?s en revisar los criterios de ';
      Result:= Result + 'facturaci?n aplicados actualmente en el ?mbito de la relaci?n comercial que, S.a.t.';
      Result:= Result + 'Bonnysa y Bonnysa Agroalimentaria mantiene con Ustedes, y verificar que dichos criterios permitir?n el cumplimiento adecuado de las obligaciones ';
      Result:= Result + 'de facturaci?n y llevanza de los libros registro por parte de ambas Compa??as.' + #13 + #10;
      Result:= Result + #13 + #10;
      Result:= Result + 'En este sentido, S.a.t. Bonnysa y Bonnysa Agroalimentaria desea que esta Comunicaci?n sirva para recordar que todos los sujetos ';
      Result:= Result + 'pasivos deber?n emitir factura por las entregas de bienes y prestaciones de servicios que realizan en el desarrollo de su actividad, ';
      Result:= Result + 'as? como la obligaci?n de emitir y remitir al destinatario facturas rectificativas en aquellos supuestos que dan lugar a la modificaci?n ';
      Result:= Result + 'de la base imponible de las operaciones, seg?n lo dispuesto en el art?culo 80 Ley 37/1992, del Impuesto sobre el Valor A?adido ';
      Result:= Result + '(entre las que se encuentran la concesi?n de descuentos y otros ajustes al precio de las operaciones). Nos referimos en particular a las ';
      Result:= Result + 'modificaciones de base imponible que se ponen de manifiesto como consecuencia  la concesi?n de descuentos y otros ajustes al precio de las operaciones.' + #13 + #10;
      Result:= Result + #13 + #10;
      Result:= Result + 'En el ?mbito de las facturas emitidas por entregas de bienes, y seg?n lo dispuesto en el Real Decreto 1619/2012, ';
      Result:= Result + 'por el que se aprueba el Reglamento de facturaci?n, las mismas deber?n ser emitidas por, S.a.t. Bonnysa o Bonnysa Agroalimentaria ';
      Result:= Result + 'antes del d?a 15 del mes siguiente al que se produzca la entrega del producto, por lo que es necesario disponer de toda la ';
      Result:= Result + 'informaci?n necesaria por nuestra parte en el menor tiempo posible para poder emitir la factura en el plazo concedido al efecto.' + #13 + #10;
}
      (*
      Result:= Result + #13 + #10;
      Result:= Result + 'El pasado 07 de julio entro en vigor la ley 15/2010 por la que se regula los plazos m?ximos permitidos para ';
      Result:= Result + 'los pagos a proveedores, siendo estos de 30 d?as a partir de la fecha de la entrega o facturaci?n de la ';
      Result:= Result + 'mercanc?a (r?gimen especial para productos agroalimentarios perecederos), rogamos tengan a bien adecuar su ';
      Result:= Result + 'forma de pago actual a la regulada por ley. ';
      *)
    finally
      Close;
    end;
  end;
end;

procedure TFDConfigMail.btnACancelarClick(Sender: TObject);
begin
  bCancelar:= True;
  if SGEnviados.Visible then
  begin
    SGEnviados.Visible := False;
    Exit;
  end;
  if IdSMTP.Connected then
    IdSMTP.Disconnect;

  if bPregunta then
  begin
    if not bEnviado then
    begin
         //mensaje de aviso de que no ha sido enviado
      if MessageDlg('El e-mail no ha sido enviado, ?desea salir?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        BorrarFicheros(not esFactura);
        Close;
      end
    end
    else
      Close;
  end
  else
  begin
    BorrarFicheros(not esFactura);
    Close;
  end;
end;

(*
const
  CSIDL_DESKTOP    = $0000;
  CSIDL_PERSONAL   = $0005;
  CSIDL_MYPICTURES = $0027;
  CSIDL_MYMUSIC    = $000d;
  CSIDL_MYVIDEO    = $000e;
  CSIDL_WINDOWS    = $0024;
  CSIDL_SYSTEM     = $0025;
*)

function GetSpecialFolderPath(Folder: Integer; ForceDir: Boolean): string;
// Uses ShlObj
var
  Path: array [0..255] of char;
begin
  SHGetSpecialFolderPath(0, @Path[0], Folder, ForceDir);
  Result := Path;
end;

procedure TFDConfigMail.btn1Click(Sender: TObject);
var
  sRuta: string;
  imagen: Integer;
begin
  sRuta:= GetSpecialFolderPath( $0005, false );
  dlgOpen.InitialDir:= sRuta;
  if dlgOpen.Execute then
  begin
    if FileExists(dlgOpen.FileName) then
    begin
      Adjuntos.Add( dlgOpen.FileName );

      if Copy(dlgOpen.FileName, (Length(dlgOpen.FileName)) - 2, 3) = 'pdf' then
        imagen := 1 //se le pone el icono de PDF
      else
        imagen := 0;
      lvAdjuntos.Items.Add;
      lvAdjuntos.Items[lvAdjuntos.Items.Count-1].Caption := dlgOpen.FileName;
      lvAdjuntos.Items[lvAdjuntos.Items.Count-1].ImageIndex := imagen;
    end;
  end;


end;

end.


