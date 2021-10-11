unit DInfSalidasPreguntar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFDInfSalidasPreguntar = class(TForm)
    lblMsg: TLabel;
    btnSi: TButton;
    btnNo: TButton;
    cbxFirma: TCheckBox;
    cbxOriginalEmpresa: TCheckBox;
    procedure btnSiClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    bResult: Boolean;
  end;

  function Preguntar( const AOpcion: integer; var AFirma, AOriginal: Boolean ): boolean;

implementation

{$R *.dfm}

uses UDMConfig, CVariables;

function Preguntar( const AOpcion: integer; var AFirma, AOriginal: Boolean ): boolean;
var
  FDInfSalidasPreguntar: TFDInfSalidasPreguntar;
begin
  FDInfSalidasPreguntar:= TFDInfSalidasPreguntar.Create( Nil );
  with FDInfSalidasPreguntar do
  begin
    bResult:= False;
    case AOpcion  of
      0: begin
           lblMsg.Caption:= '�DESEA IMPRIMIR EL ALBAR�N DE SALIDA?';
           cbxFirma.Visible:= gbFirmar;
           cbxFirma.Checked:= False;
           cbxOriginalEmpresa.Visible:= False;
           cbxOriginalEmpresa.Checked:= not cbxOriginalEmpresa.Visible;
           if cbxOriginalEmpresa.Visible = False then
           begin
             cbxFirma.Top:=  cbxOriginalEmpresa.Top;
           end;
         end;
      1: begin
           lblMsg.Caption:= '�DESEA IMPRIMIR LA CMR?';
           cbxFirma.Visible:= False;
           cbxFirma.Checked:= False;
           cbxOriginalEmpresa.Visible:= False;
           cbxOriginalEmpresa.Checked:= True;
         end;
      2: begin
           lblMsg.Caption:= '�DESEA IMPRIMIR LA FACTURA PROFORMA?';
           cbxFirma.Visible:= False;
           cbxFirma.Checked:= False;
           cbxOriginalEmpresa.Visible:= False;
           cbxOriginalEmpresa.Checked:= True;
         end;
      3: begin
           lblMsg.Caption:= '�DESEA IMPRIMIR LA CARTA DE PORTE ?';
           cbxFirma.Visible:= False;
           cbxFirma.Checked:= False;
           cbxOriginalEmpresa.Visible:= False;
           cbxOriginalEmpresa.Checked:= True;
         end;
    end;
    ShowModal;
    result:= bResult;
    AFirma:= cbxFirma.Checked;
    AOriginal:= cbxOriginalEmpresa.Checked;
  end;
  FreeAndNil( FDInfSalidasPreguntar );
end;

procedure TFDInfSalidasPreguntar.btnSiClick(Sender: TObject);
begin
  bResult:= True;
  Close;
end;

procedure TFDInfSalidasPreguntar.btnNoClick(Sender: TObject);
begin
  bResult:= False;
  Close;
end;

procedure TFDInfSalidasPreguntar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
  begin
    key:= 0;
    btnSi.Click;
  end
  else
  if key = VK_ESCAPE then
  begin
    key:= 0;
    btnNo.Click;
  end;
end;

end.
