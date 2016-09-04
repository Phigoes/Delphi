unit U_Pesquisa;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Provider, DB,
  DBClient, DBLocal, Buttons, ADODB, Types, Mask;

type
  TF_Pesquisa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    E_Procura: TEdit;
    CB_Por: TComboBox;
    P_Painel: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    ADODS_Pesquisa: TADODataSet;
    DBG_Pesquisa: TDBGrid;
    Bt_Aceitar: TBitBtn;
    Bt_Cancelar: TBitBtn;
    E_ProcuraData: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_ProcuraChange(Sender: TObject);
    procedure CB_PorChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_PesquisaDblClick(Sender: TObject);
    procedure FieldsObras;
    procedure FieldsAluno;
    procedure FieldsMovimentos;
    procedure Bt_AceitarClick(Sender: TObject);
    procedure Bt_CancelarClick(Sender: TObject);
    procedure E_ProcuraDataChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Campos, Tamanhos, Tipos: TStringList;
    Comandos: String;
  end;

var
  F_Pesquisa: TF_Pesquisa;

implementation

uses U_Main;

{$R *.dfm}

procedure TF_Pesquisa.FieldsMovimentos;
begin
  //Acerta o nome da coluna e ajusta o tamanho das colunas
  ADODS_Pesquisa.FieldByName('codigo').DisplayLabel := 'Nº Emprestimo';
  ADODS_Pesquisa.FieldByName('nome').DisplayLabel   := 'Aluno';
  ADODS_Pesquisa.FieldByName('data').DisplayLabel   := 'Data Empréstimo';

  ADODS_Pesquisa.FieldByName('codigo').DisplayWidth :=10;
  ADODS_Pesquisa.FieldByName('nome').DisplayWidth   :=40;
  ADODS_Pesquisa.FieldByName('data').DisplayWidth   :=12;
end;

procedure TF_Pesquisa.FieldsObras;
begin
  //Acerta o nome da coluna e ajusta o tamanho das colunas
  ADODS_Pesquisa.FieldByName('codigo').DisplayLabel  := 'Código';
  ADODS_Pesquisa.FieldByName('titulo').DisplayLabel  := 'Título';
  ADODS_Pesquisa.FieldByName('area').DisplayLabel    := 'Área';
  ADODS_Pesquisa.FieldByName('autor').DisplayLabel   := 'Autor';
  ADODS_Pesquisa.FieldByName('editora').DisplayLabel := 'Editora';

  ADODS_Pesquisa.FieldByName('codigo').DisplayWidth  := 10;
  ADODS_Pesquisa.FieldByName('titulo').DisplayWidth  := 40;
  ADODS_Pesquisa.FieldByName('area').DisplayWidth    := 30;
  ADODS_Pesquisa.FieldByName('autor').DisplayWidth   := 17;
  ADODS_Pesquisa.FieldByName('editora').DisplayWidth := 25;
end;

procedure TF_Pesquisa.FieldsAluno;
begin
  //Acerta o nome da coluna e ajusta o tamanho das colunas
  ADODS_Pesquisa.FieldByName('codigo').DisplayLabel    := 'Código';
  ADODS_Pesquisa.FieldByName('rfid').DisplayLabel      := 'RFID';
  ADODS_Pesquisa.FieldByName('nome').DisplayLabel      := 'Nome';
  ADODS_Pesquisa.FieldByName('matricula').DisplayLabel := 'Matrícula';

  ADODS_Pesquisa.FieldByName('codigo').DisplayWidth    := 10;
  ADODS_Pesquisa.FieldByName('rfid').DisplayWidth      := 10;
  ADODS_Pesquisa.FieldByName('nome').DisplayWidth      := 40;
  ADODS_Pesquisa.FieldByName('matricula').DisplayWidth := 30;
end;

procedure TF_Pesquisa.FormCreate(Sender: TObject);
begin
  //Criando as variaveis que serão usadas como paramêtros na pesquisa
  Campos   := TStringList.Create;
  Tamanhos := TStringList.Create;
  Tipos    := TStringList.Create;
end;

procedure TF_Pesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Desalocando variaveis e formulário da memória
  Tipos.Free;
  Tamanhos.Free;
  Campos.Free;
  Action     := caFree;
end;

procedure TF_Pesquisa.E_ProcuraChange(Sender: TObject);
var
  Aux: String;
begin
  if Trim(E_Procura.Text) = '' then
    Exit;
  if (StrToIntDef(E_Procura.Text, -1) = -1) and //Checar Integer
     (Tipos.Strings[CB_Por.ItemIndex] = 'I')  then
  begin
    ShowMessage('Favor, somente números.');
    E_Procura.Clear;
    E_Procura.SetFocus;
    Exit;
  end;
  if (StrToIntDef(E_Procura.Text, -1) = -1) and //Checar Data
     (Tipos.Strings[CB_Por.ItemIndex] = 'D')  then
  begin
    ShowMessage('Data inválida.');
    E_Procura.Clear;
    E_Procura.SetFocus;
    Exit;
  end;
  //quando houver relacionamento de tabelas, retira o alias do começo do campo
  Aux := StringReplace(Campos.Strings[CB_Por.ItemIndex], 'a.', '', []);
  Aux := StringReplace(Aux, 'm.', '', []);
  Aux := StringReplace(Aux, 'l.', '', []);
  Aux := StringReplace(Aux, 'i.', '', []);
  ADODS_Pesquisa.Locate(Aux, Trim(E_Procura.Text), [loPartialKey]);
end;

procedure TF_Pesquisa.CB_PorChange(Sender: TObject);
begin
  ADODS_Pesquisa.Close;
  ADODS_Pesquisa.CommandText := Comandos + Campos.Strings[CB_Por.ItemIndex];
  ADODS_Pesquisa.Open;
  case P_Painel.Tag of
    1:FieldsObras;
    2:FieldsAluno;
    3:FieldsMovimentos;
  end;
  if Tipos.Strings[CB_Por.ItemIndex] = 'D' then
  begin
    E_ProcuraData.Visible := True;
    E_Procura.Visible     := False;
  end
  else
  begin
    E_ProcuraData.Visible := False;
    E_Procura.Visible     := True;
  end;
end;

procedure TF_Pesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  F_Principal.TabEnter(Sender, Key);
end;

procedure TF_Pesquisa.DBG_PesquisaDblClick(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TF_Pesquisa.Bt_AceitarClick(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TF_Pesquisa.Bt_CancelarClick(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TF_Pesquisa.E_ProcuraDataChange(Sender: TObject);
begin
  if E_ProcuraData.Text='  /  /    ' then
    Exit;
  if Length(Trim(E_ProcuraData.Text)) = 10 then
    ADODS_Pesquisa.Locate(Campos.Strings[CB_Por.ItemIndex],Trim(E_ProcuraData.Text),[]);
end;

end.
