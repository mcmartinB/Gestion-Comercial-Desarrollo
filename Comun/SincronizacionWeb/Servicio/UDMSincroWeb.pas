unit UDMSincroWeb;

interface

uses
  SvcMgr,
  SysUtils,
  Classes,
  Controls,
  SqlExpr,


  SincronizacionBonny,
  ConexionInformix,
  ConexionAWSAurora;


type
  TFDMSincroWeb = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    Fichero: TStringList;

    FConexionInformix: TConexionInformix;
    FConexionAWSAurora: TConexionAWSAurora;
    FSincroBonnyAurora: TSincronizacionBonny;

    FProximaEjecucion: TDateTime; // Hora de la proxima ejecucion

    function GetComputerNetName: String;

  public

    procedure Ejecutar;
    property Sincronizacion: TSincronizacionBonny read FSincroBonnyAurora;
    property ProximaEjecucion: TDateTime read FProximaEjecucion;

  end;

var
  FDMSincroWeb: TFDMSincroWeb;

implementation

uses
  DateUtils,
  Windows,
  ConexionInformixConstantes;

{$R *.dfm}

{ TDataModule2 }

procedure TFDMSincroWeb.DataModuleCreate(Sender: TObject);
begin
  Fichero := TStringList.Create;

  FConexionInformix := TConexionInformix.Create(nil);
  FConexionAWSAurora := TConexionAWSAurora.Create(nil);

  FSincroBonnyAurora := TSincronizacionBonny.Create(FConexionInformix, FConexionAWSAurora);
  FSincroBonnyAurora.Usuario := _INFORMIX_USER_;
  FSincroBonnyAurora.Maquina := GetComputerNetName;
end;

procedure TFDMSincroWeb.DataModuleDestroy(Sender: TObject);
begin
  Fichero.Free;
  FSincroBonnyAurora.Fin;
  FSincroBonnyAurora.Free;
  FConexionInformix.Free;
  FConexionAWSAurora.Free;
end;


procedure TFDMSincroWeb.Ejecutar;
var
  dir: String;
begin
    Fichero.Clear;
    try
      FSincroBonnyAurora.Sincronizar;
    except
      on E: Exception do
      begin
        Fichero.Add(E.Message);
      end;
    end;

    dir := ParamStr(0);
    dir := extractfiledir(dir);
    Fichero.SaveToFile(dir + '\SincroWeb.log');
end;

function TFDMSincroWeb.GetComputerNetName: String;
var
  ComputerName: Array [0 .. 256] of char;
  Size: DWORD;
begin
  Size := 256;
  GetComputerName(ComputerName, Size);
  Result := ComputerName;
end;

end.
