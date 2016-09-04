unit U_Splash;

interface

uses
  Windows, SysUtils, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, jpeg, Buttons,
  Classes;

type
  TF_Splash = class(TForm)
    Image1: TImage;
    L_Carrega: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fechar2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    path: String;
    Resposta: Integer;

end;

var
  F_Splash: TF_Splash;

implementation

uses U_Main;

{$R *.dfm}

procedure TF_Splash.Fechar2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Splash.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Troca o Enter(#13) por Tab, quando a tecla for enter, seta o focu no proximo componente 
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TF_Splash.FormActivate(Sender: TObject);
var Tempo: Integer;
    DataAux: TDateTime;
begin
  Tempo := 2000;
  L_Carrega.Caption := 'carregando sistema ...';
  Refresh;
  Sleep(Tempo);
  L_Carrega.Caption := 'carregando banco de dados ...';
  Refresh;
  Sleep(Tempo);
  Resposta := mrOK;
end;

end.
