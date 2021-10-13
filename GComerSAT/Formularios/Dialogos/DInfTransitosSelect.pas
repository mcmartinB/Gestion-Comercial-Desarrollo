unit DInfTransitosSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFDInfTransitosSelect = class(TForm)
    btnSi: TButton;
    btnNo: TButton;
    cbxAlbaran: TCheckBox;
    cbxCRM: TCheckBox;
    cbxFacturaTransito: TCheckBox;
    cbxCertificadoLAME: TCheckBox;
    procedure btnSiClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    bAlbaran: boolean;
  public
    { Public declarations }
    iResult: Integer;

  end;



//function Seleccionar( const AFactura, ACertificadoLame: boolean ): Integer;
procedure Seleccionar2( var AAlbaran, ACRM, AFactura, ACertificado, ACertificadoLame: boolean );

implementation

uses UDMConfig;

{$R *.dfm}
{
function Seleccionar( const AFactura, ACertificadoLame: boolean ): Integer;
var
  FDInfTransitosSelect: TFDInfTransitosSelect;
begin
  FDInfTransitosSelect:= TFDInfTransitosSelect.Create( nil );
  with FDInfTransitosSelect do
  begin
    rbFactura.Visible:= AFactura;
    rbLame.Enabled := ACertificadoLame;
    iResult:= 0;
    ShowModal;
    result:= iResult;
  end;
  FreeAndNil( FDInfTransitosSelect );
end;
}

procedure Seleccionar2 ( var AAlbaran, ACRM, AFActura, ACertificado, ACertificadoLame: boolean);
var FDInfTransitosSelect: TFDInfTransitosSelect;
begin
  FDInfTransitosSelect:= TFDInfTransitosSelect.Create( nil );
  with FDInfTransitosSelect do
  begin
    cbxCertificadoLAME.Enabled := ACertificadoLame;
    ShowModal;

    if cbxAlbaran.Checked then
      begin
        AAlbaran := true;
      end;

    if cbxCRM.Checked then
      begin
        ACRM := true;
      end;

      if cbxFacturaTransito.Checked then
      begin
        AFActura := true;
      end;

      if cbxCertificadoLAME.Checked then
      begin
        ACertificado := true;
      end;
      //

  end;
end;

procedure TFDInfTransitosSelect.btnSiClick(Sender: TObject);
begin
  {if rbAlbaran.Checked then
    iResult:= 1
  else
  if rbCMR.Checked then
    iResult:= 2
  else
  if rbFactura.Checked then
    iResult:= 3
  else
  if rbLame.Checked then
    iResult:= 4;
  }
  Close;
end;

procedure TFDInfTransitosSelect.btnNoClick(Sender: TObject);
begin
  iResult:= 0;
  Close;
end;

procedure TFDInfTransitosSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
