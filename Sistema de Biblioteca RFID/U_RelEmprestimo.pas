unit U_RelEmprestimo;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit,
  DB, ADODB;

type
  TF_RelEmprestimo = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_VisualizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_LimparClick(Sender: TObject);
    procedure SB_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelEmprestimo: TF_RelEmprestimo;

implementation

uses U_Main, U_QR_RelEmprestimo;

{$R *.dfm}

procedure TF_RelEmprestimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Desaloca Formulario da memória
  Action := caFree;
  F_RelEmprestimo := nil;
end;

procedure TF_RelEmprestimo.SB_VisualizarClick(Sender: TObject);
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
  //Monta a instrução do select
  vInstrucao := 'select a.nome,'             +
                '       a.matricula,'        +
                '       l.titulo,'           +
                '       i.data_emprestimo,'  +
                '       i.data_devolvido'    +
                '  from aluno a,'            +
                '       livro l,'            +
                '       movimentacao m,'     +
                '       movitem i'           +
                ' where m.codigo = i.codigo' +
                '   and m.aluno  = a.codigo' +
                '   and i.livro  = l.codigo' +
                '   and i.data_emprestimo >=#' + FormatDateTime('mm/dd/yyyy', DE_Data1.Date) + '#' +
                '   and i.data_emprestimo <=#' + FormatDateTime('mm/dd/yyyy', DE_Data2.Date) + '#';
  //Conforme a escolha, inclui final da instrução e monta o subtitulo
  case RG_Opcoes.ItemIndex of
    0: begin
         vInstrucao := vInstrucao +  ' order by i.data_emprestimo';
         vSubtitulo := 'Emprestimos de: ' + DE_Data1.Text + ' a ' + DE_Data2.Text;
       end;

    1: begin
         vInstrucao := vInstrucao +  '   and i.data_devolvido is null' +
                                     ' order by i.data_emprestimo';
         vSubtitulo := 'Emprestimos de: ' + DE_Data1.Text + ' a ' + DE_Data2.Text + '  -  não devolvidos';
       end;

    2: begin
         vInstrucao := vInstrucao +  '   and i.data_devolvido is not null' +
                                     ' order by i.data_emprestimo';
         vSubtitulo := 'Emprestimos de: ' + DE_Data1.Text + ' a ' + DE_Data2.Text + '  -  devolvidos';
       end;
  end;
  //Cria o formulário do relatório
  F_QR_RelEmprestimo := TF_QR_RelEmprestimo.Create(Application);
  F_QR_RelEmprestimo.ADODataSet1.CommandText := vInstrucao; //Carrega o SQL de instrução
  F_QR_RelEmprestimo.ADODataSet1.Open;
  F_QR_RelEmprestimo.QRL_TituloCabecario.Caption := DisplayNome; //Atribui o nome do cabeçários
  F_QR_RelEmprestimo.QRL_Titulo.Caption          := vSubtitulo; //Atribui o subtitulo
  F_QR_RelEmprestimo.PreviewModal;
	F_QR_RelEmprestimo.Free;
  F_QR_RelEmprestimo := nil;
end;

procedure TF_RelEmprestimo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  F_Principal.tabEnter(Sender, Key);
end;

procedure TF_RelEmprestimo.SB_LimparClick(Sender: TObject);
begin
  //Limpa os campos datas e seta a opção em todos
  DE_Data1.Clear;
  DE_Data2.Clear;
  RG_Opcoes.ItemIndex := 0;
end;

procedure TF_RelEmprestimo.SB_SairClick(Sender: TObject);
begin
  Close;
end;

end.
