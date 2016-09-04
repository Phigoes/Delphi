unit U_Teste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TF_Teste = class(TForm)
    MemoRX: TMemo;
    Timer1: TTimer;
    Panel1: TPanel;
    Limpar: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Teste: TF_Teste;

implementation

uses U_Main;

{$R *.dfm}

procedure TF_Teste.Timer1Timer(Sender: TObject);
var
  vNumCartao: string;
begin
  if F_Principal.ComPort1.Connected then
    F_Principal.ComPort1.ReadStr(vNumCartao, 100);
  MemoRX.Text := MemoRX.Text + vNumCartao;
end;

procedure TF_Teste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Desaloca formulario da memória  e ativa a catraca
  F_Principal.T_Catraca.Enabled := True;
  Action := caFree;
  F_Teste := nil;
end;

procedure TF_Teste.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TF_Teste.LimparClick(Sender: TObject);
begin
  MemoRX.Clear;
end;

end.
