unit U_RelAluno;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit,
  JvExControls, JvXPCore, JvXPButtons, DB, ADODB, Menus;

type
  TF_RelAluno = class(TForm)
    RG_Opcoes: TRadioGroup;
    RG_Escolha: TRadioGroup;
    CB_Codigo: TComboBox;
    CB_Escolha: TComboBox;
    Qry: TADOQuery;
    Panel4: TPanel;
    SB_Visualizar: TSpeedButton;
    SB_Limpar: TSpeedButton;
    Panel5: TPanel;
    SB_Sair: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_VisualizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_LimparClick(Sender: TObject);
    procedure CarregaAlunos;
    procedure RG_OpcoesClick(Sender: TObject);
    procedure SB_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelAluno: TF_RelAluno;

implementation

uses U_Main, U_QR_RelAluno;

{$R *.dfm}

procedure TF_RelAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Desaloca Formulario da memória
  Action := caFree;
  F_RelAluno := nil;
end;

procedure TF_RelAluno.SB_VisualizarClick(Sender: TObject);
var vSubtitulo, vEstoque, vProduto, vInstrucao: String;
begin
  if RG_Opcoes.ItemIndex = 1 then
  begin
    //Faz consistencia dos campos que devem ser preenchidos
    if Trim(CB_Escolha.Text) = '' then
    begin
      MessageDlg('O aluno não pode ser em branco.',MTWarning,[mbok],0);
      CB_Escolha.SetFocus;
      Abort;
    end;
    //Monta a instrução do select e monta o subtitulo
    vInstrucao := 'select * from aluno where codigo = ' + CB_Codigo.Items[CB_Escolha.ItemIndex];
    vSubtitulo := vSubtitulo + 'Aluno: ' + CB_Codigo.Items[CB_Escolha.ItemIndex] + ' - ' + CB_Escolha.Text;
  end
  else
  begin
    //Monta a instrução do select e monta o subtitulo
    vInstrucao := 'select * from aluno';
    vSubtitulo := 'Todos os alunos';
  end;

  F_QR_RelAluno := TF_QR_RelAluno.Create(Application);
  F_QR_RelAluno.ADODataSet1.CommandText := vInstrucao; //Carrega o SQL de instrução
  F_QR_RelAluno.ADODataSet1.Open;
  F_QR_RelAluno.QRL_TituloCabecario.Caption := DisplayNome; //Atribui o nome do cabeçários
  F_QR_RelAluno.QRL_Titulo.Caption          := vSubtitulo;  //Atribui o subtitulo
  F_QR_RelAluno.PreviewModal;
	F_QR_RelAluno.Free;
  F_QR_RelAluno := Nil;
end;

procedure TF_RelAluno.FormKeyPress(Sender: TObject; var Key: Char);
begin
  F_Principal.tabEnter(sender, Key);
end;

procedure TF_RelAluno.SB_LimparClick(Sender: TObject);
begin
  RG_Opcoes.ItemIndex := 0;
end;

procedure TF_RelAluno.CarregaAlunos;
begin
  //Traz todos os alunos no combobox ordenado por nome
  CB_Codigo.Items.Clear;
  CB_Escolha.Items.Clear;
  Qry.SQL.Clear;
  Qry.SQL.Add('select codigo, nome from aluno order by nome');
  Qry.Open;
  Qry.First;
  while not(Qry.Eof) do
  begin
    CB_Codigo.Items.Add(Qry.FieldByName('codigo').AsString);
    CB_Escolha.Items.Add(Qry.FieldByName('nome').AsString);
    Qry.Next;
  end;
  Qry.Close;
end;

procedure TF_RelAluno.RG_OpcoesClick(Sender: TObject);
begin
  //Dependendo da opção escolhida habilitaos controles de aluno, do contrário, desabilita os mesmos
  if RG_Opcoes.ItemIndex = 0 then
  begin
    RG_Escolha.Enabled := False;
    CB_Escolha.Enabled := False;
    CB_Codigo.Clear;
    CB_Escolha.Clear;
  end
  else
  begin
    RG_Escolha.Enabled := True;
    CB_Escolha.Enabled := True;
    CarregaAlunos;
  end;
end;

procedure TF_RelAluno.SB_SairClick(Sender: TObject);
begin
  Close;
end;

end.
