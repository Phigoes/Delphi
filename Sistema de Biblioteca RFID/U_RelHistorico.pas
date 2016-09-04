unit U_RelHistorico;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit,
  DB, ADODB;

type
  TF_RelHistorico = class(TForm)
    Qry: TADOQuery;
    Panel4: TPanel;
    SB_Visualizar: TSpeedButton;
    SB_Limpar: TSpeedButton;
    Panel5: TPanel;
    SB_Sair: TSpeedButton;
    P_Escolha: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DE_Data1: TDateEdit;
    DE_Data2: TDateEdit;
    RG_Opcoes: TRadioGroup;
    RG_Escolha: TRadioGroup;
    CB_Escolha: TComboBox;
    CB_Codigo: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_VisualizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_LimparClick(Sender: TObject);
    procedure SB_SairClick(Sender: TObject);
    procedure CarregaAlunos;
    procedure RG_OpcoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelHistorico: TF_RelHistorico;

implementation

uses U_Main, U_QR_RelHistorico;

{$R *.dfm}

procedure TF_RelHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Desaloca Formulario da memória
  Action := caFree;
  F_RelHistorico := nil;
end;

procedure TF_RelHistorico.CarregaAlunos;
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

procedure TF_RelHistorico.SB_VisualizarClick(Sender: TObject);
var
  vSubtitulo, vInstrucao: String;
begin
  //Faz consistencia dos campos que devem ser preenchidos
  if DE_Data1.Text='  /  /    ' then
  begin
    MessageDlg('A data inicial não pode ser em branco.',MTWarning,[mbok],0);
    DE_Data1.SetFocus;
    Abort;
  end;
  if DE_Data2.Text='  /  /    ' then
  begin
    MessageDlg('A data final não pode ser em branco.',MTWarning,[mbok],0);
    DE_Data2.SetFocus;
    Abort;
  end;
  if DE_Data2.Date < DE_Data1.Date then
  begin
    MessageDlg('A data inicial não pode ser maior que a data final.',MTWarning,[mbok],0);
    DE_Data1.SetFocus;
    Abort;
  end;
  if (RG_Opcoes.ItemIndex = 1) and
     (CB_Escolha.ItemIndex = -1) then
  begin
    MessageDlg('O aluno não pode ser em branco.',MTWarning,[mbok],0);
    CB_Escolha.SetFocus;
    Abort;
  end;
  //Monta a instrução do select
  vInstrucao := 'select a.nome,'             +
                '       a.matricula,'        +
                '       a.rfid,'             +
                '       l.dataentrada'       +
                '  from aluno a,'            +
                '       logacesso l'         +
                ' where l.aluno = a.codigo'  +
                '   and l.dataentrada>=#' + FormatDateTime('mm/dd/yyyy', DE_Data1.Date) + '#' +
                '   and l.dataentrada<=#' + FormatDateTime('mm/dd/yyyy', DE_Data2.Date + 1) + '#';
  //Conforme a escolha, inclui final da instrução e monta o subtitulo
  if RG_Opcoes.ItemIndex = 0 then
    vInstrucao := vInstrucao +  ' order by l.dataentrada'
  else
    vInstrucao := vInstrucao +  '   and l.aluno = ' + CB_Codigo.Items[CB_Escolha.ItemIndex] +
                                ' order by l.dataentrada';
  if RG_Opcoes.ItemIndex = 1 then
    vSubtitulo := vSubtitulo + '  -  Aluno: ' + CB_Escolha.Text
  else
    vSubtitulo := 'Entrada de: ' + DE_Data1.Text + ' a ' + DE_Data2.Text;
  F_QR_RelHistorico := TF_QR_RelHistorico.Create(Application);
  F_QR_RelHistorico.ADODataSet1.CommandText := vInstrucao;  //Carrega o SQL de instrução
  F_QR_RelHistorico.ADODataSet1.Open;
  F_QR_RelHistorico.QRL_TituloCabecario.Caption := DisplayNome; //Atribui o nome do cabeçários
  F_QR_RelHistorico.QRL_Titulo.Caption          := vSubtitulo; //Atribui o subtitulo
  F_QR_RelHistorico.PreviewModal;
	F_QR_RelHistorico.Free;
  F_QR_RelHistorico := nil;
end;

procedure TF_RelHistorico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  F_Principal.tabEnter(sender, Key);
end;

procedure TF_RelHistorico.SB_LimparClick(Sender: TObject);
begin
  DE_Data1.Clear;
  DE_Data2.Clear;
  RG_Opcoes.ItemIndex := 0;
end;

procedure TF_RelHistorico.SB_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TF_RelHistorico.RG_OpcoesClick(Sender: TObject);
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

end.
