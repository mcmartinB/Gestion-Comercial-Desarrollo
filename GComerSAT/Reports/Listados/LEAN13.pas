unit LEAN13;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db,
  DBTables;

type
  TQRLEan13 = class(TQuickRep)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRSysData2: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    PsQRLabel1: TQRLabel;
    PsQRSysData1: TQRSysData;
    PsDescripcion_e: TQRDBText;
    QEnvases: TQuery;
    QTipoPalet: TQuery;
    QUndConsumo: TQuery;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    PsQRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    agrupacion_e: TQRDBText;
    ean14_e: TQRDBText;
    QRLabel3: TQRLabel;
    {    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
          var PrintBand: Boolean);}
    procedure QRSysData2Print(sender: TObject; var Value: string);
    procedure envase_ePrint(sender: TObject; var Value: string);
    procedure QRLEan13BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure agrupacion_ePrint(sender: TObject; var Value: String);
  private
    function undconsumo(emp, codigo: string): string;
    function tipopalet(codigo: string): string;
    function tipoenvase(emp, codigo: string): string;
  public

  end;

var
  QRLEan13: TQRLEan13;

implementation

uses CVariables, UDMBaseDatos;

{$R *.DFM}

procedure TQRLEan13.QRLEan13BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  i: Integer;
begin

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].ClassType = TQRDBText then
      TQRDBText(Components[i]).DataSet := DataSet;
  end;

  QundConsumo.Close;
  QTipoPalet.Close;
  QEnvases.Close;
  QundConsumo.Prepare;
  QTipoPalet.Prepare;
  QEnvases.Prepare;

end;

procedure TQRLEan13.QRSysData2Print(sender: TObject; var Value: string);
begin
  if Tag > 0 then
    Value := Value + ' de ' + IntToStr(Tag);
end;

procedure TQRLEan13.envase_ePrint(sender: TObject; var Value: string);
var
  envase: integer;
  aux: string;
begin

  aux := '';
  //Value:=DMBaseDatos.QListado.FieldByName('envase_e').AsString+'-'+Value;
  try
    envase := DMBaseDatos.QListado.FieldByName('agrupacion_e').AsInteger;
  except
    envase := 0;
  end;
  case envase of
    0:
      begin
        value := '(-ERROR-) ' + value;
        aux := 'FALTA AGRUPACIÓN';
      end;

    1:
      begin
        value := '(U) ' + value;
        aux :=
          UndConsumo(DMBaseDatos.QListado.FieldByName('empresa_e').AsString,
          DMBaseDatos.QListado.FieldByName('envase_e').AsString);
      end;
    2:
      begin
        value := '(E) ' + value;
        aux :=
          TipoEnvase(DMBaseDatos.QListado.FieldByName('empresa_e').AsString,
          DMBaseDatos.QListado.FieldByName('envase_e').AsString);
      end;
    3:
      begin
        value := '(P) ' + value;
        aux := TipoPalet(DMBaseDatos.QListado.FieldByName('envase_e').AsString);
      end;
  end;

  value := value + ' ' + aux

end;

function TQRLEan13.tipoenvase(emp, codigo: string): string;
begin
  try
    QEnvases.close;
    QEnvases.ParamByName('envase').AsString := codigo;
    QEnvases.Open;
  except
    result := 'desconocido';
    exit;
  end;

  if QEnvases.Fields[0].AsString = '' then
  begin
    result := 'desconocido';
    exit;
  end;

  result := QEnvases.Fields[0].AsString;
end;

function TQRLEan13.tipopalet(codigo: string): string;
begin
  try
    QTipoPalet.close;
    QTipoPalet.ParamByName('codigo').AsString := codigo;
    QTipoPalet.Open;
  except
    result := 'desconocido';
    exit;
  end;

  if QTipoPalet.Fields[0].AsString = '' then
  begin
    result := 'desconocido';
    exit;
  end;

  result := QTipoPalet.Fields[0].AsString;
end;

function TQRLEan13.undconsumo(emp, codigo: string): string;
begin
  try
    QUndConsumo.close;
    QUndConsumo.ParamByName('emp').AsString := emp;
    QUndConsumo.ParamByName('codigo').AsString := codigo;
    QUndConsumo.Open;
  except
    result := 'desconocido';
    exit;
  end;

  if QUndConsumo.Fields[0].AsString = '' then
  begin
    result := 'desconocido';
    exit;
  end;

  result := QUndConsumo.Fields[0].AsString;
end;

procedure TQRLEan13.agrupacion_ePrint(sender: TObject; var Value: String);
begin
  If Value = '0' then
    Value:= 'Unidad Consumo'
  else
  If Value = '1' then
    Value:= 'Caja'
  else
  If Value = '2' then
    Value:= 'Formato Palet';
end;

end.
