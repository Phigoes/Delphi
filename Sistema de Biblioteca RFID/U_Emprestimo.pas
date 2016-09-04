unit U_Emprestimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, Grids, DBGrids, ADODB,
  ExtCtrls;

type
  TF_Emprestimo = class(TForm)
    DS_Movimentacao: TDataSource;
    DBG_MovItem: TDBGrid;
    ADODS_Movimentacao: TADODataSet;
    ADODS_Aluno: TADODataSet;
    DS_Aluno: TDataSource;
    ADODS_Movimentacaocodigo: TAutoIncField;
    ADODS_Movimentacaoaluno: TIntegerField;
    ADODS_Livro: TADODataSet;
    DS_Livro: TDataSource;
    ADODS_MovimentacaoMatricula: TStringField;
    ADODS_MovimentacaoRfid: TStringField;
    ADODS_Movimentacaodata: TDateTimeField;
    ADODS_MovItem: TADODataSet;
    DS_MovItem: TDataSource;
    ADODS_MovItemcodigo: TAutoIncField;
    ADODS_MovItemlivro: TIntegerField;
    ADODS_MovItemdata_emprestimo: TDateTimeField;
    ADODS_MovItemdata_devolucao: TDateTimeField;
    ADODS_MovItemdata_devolvido: TDateTimeField;
    ADODS_MovItemTituloLivro: TStringField;
    P_IncluiLivro: TPanel;
    E_CodLivro: TEdit;
    Label4: TLabel;
    L_TituloLivro: TLabel;
    Btn_PesqLivro: TBitBtn;
    Panel4: TPanel;
    SB_Incluir: TSpeedButton;
    SB_Excluir: TSpeedButton;
    ADOQ_Aux: TADOQuery;
    P_Botoes: TPanel;
    Btn_Incluir: TSpeedButton;
    Btn_Excluir: TSpeedButton;
    Btn_Salvar: TSpeedButton;
    Btn_Cancelar: TSpeedButton;
    Btn_Pesquisar: TSpeedButton;
    Btn_Sair: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    T_Aluno: TTimer;
    L_Aluno: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure ADODS_MovimentacaoAfterInsert(DataSet: TDataSet);
    procedure Btn_PesquisarClick(Sender: TObject);
    procedure Btn_IncluirClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_SalvarClick(Sender: TObject);
    procedure ADODS_MovItemBeforeInsert(DataSet: TDataSet);
    procedure DS_MovimentacaoStateChange(Sender: TObject);
    procedure Btn_PesqLivroClick(Sender: TObject);
    procedure SB_IncluirClick(Sender: TObject);
    procedure SomenteNumeros(Sender: TObject; var Key: Char);
    procedure E_CodLivroExit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure SB_ExcluirClick(Sender: TObject);
    procedure ADODS_MovItemBeforeDelete(DataSet: TDataSet);
    procedure ADODS_MovimentacaoBeforeDelete(DataSet: TDataSet);
    procedure T_AlunoTimer(Sender: TObject);
    procedure ADODS_MovimentacaoalunoChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function LivroDisponivel(pCodLivro: String): Boolean;
    function LivroCadastrado(pCodLivro: String): Boolean;
    procedure PreencheNomeLivro(pCodLivro: String);
    procedure LivroEmprestado;

  public
    { Public declarations }
  end;

var
  F_Emprestimo: TF_Emprestimo;

implementation

uses U_Main, U_Pesquisa;

{$R *.dfm}

procedure TF_Emprestimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Fecha as tabelas abertas, desabilita o timer, desaloca formulario da memória e ativa a catraca
  T_Aluno.Enabled := False;
  ADODS_MovItem.Close;
  ADODS_Movimentacao.Close;
  ADODS_Aluno.Close;
  ADODS_Livro.Close;
  F_Principal.T_Catraca.Enabled := True;  
  Action := caFree;
  F_Emprestimo := nil;
end;

procedure TF_Emprestimo.Btn_CancelarClick(Sender: TObject);
begin
  ADODS_Movimentacao.Cancel;
end;

procedure TF_Emprestimo.Btn_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Emprestimo.ADODS_MovimentacaoAfterInsert(DataSet: TDataSet);
begin
  //depois q houver o comando insert, preenche os campos abaixo
  ADODS_Movimentacaodata.AsDateTime := Date;
  E_CodLivro.Clear;
  L_TituloLivro.Caption := '';
  DBLookupComboBox1.SetFocus;
end;

procedure TF_Emprestimo.Btn_PesquisarClick(Sender: TObject);
begin
  //Formulario da pesquisa é criado e parametrizado conforme a pesquisa
  F_Pesquisa := TF_Pesquisa.Create(Self);
  with F_Pesquisa do
  begin
    P_Painel.Tag := 3;
    CB_Por.Items.Add('Nº Emprestimo');
    Campos.Add('m.codigo');
    Tipos.Add('I');
    CB_Por.Items.Add('Nome');
    Campos.Add('a.nome');
    Tipos.Add('S');
    CB_Por.Items.Add('Data do Empréstimo');
    Campos.Add('m.data');
    Tipos.Add('D');
    CB_Por.ItemIndex := 2;
    Comandos := 'SELECT m.codigo, a.nome,  m.data FROM movimentacao m, aluno a where m.aluno=a.codigo order by ';
    ADODS_Pesquisa.CommandText := 'SELECT m.codigo, a.nome, m.data FROM movimentacao m, aluno a where m.aluno=a.codigo order by data desc';
    ADODS_Pesquisa.Open;
    CB_Por.OnChange(nil);
    FieldsMovimentos;
    if ShowModal = MrCancel then
    begin
      ADODS_Pesquisa.Close;
      SysUtils.Abort;
    end;
    ADODS_Movimentacao.Locate('codigo', IntToStr(ADODS_Pesquisa.FieldByName('codigo').AsInteger), []);
    ADODS_Pesquisa.Close;
    E_CodLivro.Clear;
    L_TituloLivro.Caption := '';
  end;
end;

procedure TF_Emprestimo.Btn_IncluirClick(Sender: TObject);
begin
  ADODS_Movimentacao.Insert;
end;

procedure TF_Emprestimo.Btn_ExcluirClick(Sender: TObject);
begin
  ADODS_Movimentacao.Delete;
end;

procedure TF_Emprestimo.Btn_SalvarClick(Sender: TObject);
begin
  ADODS_Movimentacao.Post;
end;

procedure TF_Emprestimo.ADODS_MovItemBeforeInsert(DataSet: TDataSet);
begin
  if DS_Movimentacao.State in [dsInsert, dsEdit] then
    ADODS_Movimentacao.Post;
end;

procedure TF_Emprestimo.DS_MovimentacaoStateChange(Sender: TObject);
begin
  //dependendo do estado em que se encontra o componente de acesso a banco, os botões da barra são habilitados e desabilitados.
  case DS_Movimentacao.State of
    dsBrowse   : begin
                   Btn_Incluir.Enabled  := True;
                   Btn_Excluir.Enabled  := True;
                   Btn_Salvar.Enabled   := False;
                   Btn_Cancelar.Enabled := False;
                 end;
    dsInsert   : begin
                   Btn_Incluir.Enabled  := False;
                   Btn_Excluir.Enabled  := False;
                   Btn_Salvar.Enabled   := True;
                   Btn_Cancelar.Enabled := True;
                 end;
    dsEdit     : begin
                   Btn_Incluir.Enabled  := False;
                   Btn_Excluir.Enabled  := False;
                   Btn_Salvar.Enabled   := True;
                   Btn_Cancelar.Enabled := True;
                 end;
    dsInactive : begin
                   Btn_Incluir.Enabled  := False;
                   Btn_Excluir.Enabled  := False;
                   Btn_Salvar.Enabled   := False;
                   Btn_Cancelar.Enabled := False;
                 end;
  end;
end;

procedure TF_Emprestimo.Btn_PesqLivroClick(Sender: TObject);
begin
  //Formulario da pesquisa é criado e parametrizado conforme a pesquisa
  F_Pesquisa := TF_Pesquisa.Create(Self);
  with F_Pesquisa do
  begin
    P_Painel.Tag := 1;
    CB_Por.Items.Add('Código');
    Campos.Add('codigo');
    Tipos.Add('I');
    CB_Por.Items.Add('Título');
    Campos.Add('titulo');
    Tipos.Add('S');
    CB_Por.Items.Add('Área');
    Campos.Add('area');
    Tipos.Add('S');
    CB_Por.Items.Add('Autor');
    Campos.Add('autor');
    Tipos.Add('S');
    CB_Por.Items.Add('Editora');
    Campos.Add('editora');
    Tipos.Add('S');
    CB_Por.ItemIndex := 0;
    Comandos := 'SELECT codigo, titulo, area, autor, editora FROM livro order by ';
    ADODS_Pesquisa.CommandText := 'SELECT codigo, titulo, area, autor, editora FROM livro ORDER BY codigo';
    ADODS_Pesquisa.Open;
    FieldsObras;
    if ShowModal = MrCancel then // se o resultado da tela for MrCancel(botão cancel ou botão close), o sistema para e não executa o resto dos comandos abaixo
    begin
      ADODS_Pesquisa.Close;
      SysUtils.Abort;
    end;
    E_CodLIvro.Text       := ADODS_Pesquisa.FieldByName('Codigo').AsString;
    L_TituloLivro.Caption := ADODS_Pesquisa.FieldByName('Titulo').AsString;
    ADODS_Movimentacao.Locate('Codigo', IntToStr(ADODS_Pesquisa.FieldByName('Codigo').AsInteger), []);
    ADODS_Pesquisa.Close;
  end;
end;

procedure TF_Emprestimo.SB_IncluirClick(Sender: TObject);
  procedure LimpaLivro;  //Função para limpar os campos de pesquisa de livros
  begin
    L_TituloLivro.Caption := '';
    E_CodLivro.Clear;
    E_CodLivro.SetFocus;
  end;

var
  EmprestimoFechado : Boolean;
begin
  if not(ADODS_Movimentacaoaluno.IsNull) and
        (E_CodLivro.Text <> '') then
  begin
    EmprestimoFechado := False;
    ADODS_MovItem.DisableControls;
    ADODS_MovItem.First;
    while not(ADODS_MovItem.Eof) do
    begin
      if not(ADODS_MovItemdata_devolvido.IsNull) then
        EmprestimoFechado := True;
      ADODS_MovItem.Next;
    end;
    ADODS_MovItem.EnableControls;
    if (EmprestimoFechado) and (ADODS_MovItem.RecordCount > 0)then  // se já houver livro devolvido no empréstimo, não pode mais realizar inserção de livro nesse empréstimo
    begin
      MessageDlg('Já existe devolução realizada nesse empréstimo.',MTWarning,[mbok],0);
      LimpaLivro;
      SysUtils.Abort;
    end;

    if ADODS_MovItem.RecordCount = MaxLivroPermitido then  //verifica se o limite de empréstimo já foi emprestado.
    begin
      MessageDlg('Limite de empréstimo excedido. O limite é de ' + IntToStr(MaxLivroPermitido) + ' Unidades.',MTWarning,[mbok],0);
      LimpaLivro;
      SysUtils.Abort;
    end;
    if LivroDisponivel(E_CodLivro.Text) then //se o livro estiver disponivel, faz a inserção no empréstimo, do contrário exibe mensagem
    begin
      ADODS_MovItem.Insert;
      ADODS_MovItemlivro.AsInteger            := StrToInt(E_CodLIvro.Text);
      ADODS_MovItemdata_emprestimo.AsDateTime := Date;
      ADODS_MovItemdata_devolucao.AsDateTime  := Date + 7;
      ADODS_MovItem.Post;
      LimpaLivro;
    end
    else
    begin
      MessageDlg('Livro emprestado.',MTWarning,[mbok],0);
      LimpaLivro;
    end;
  end
end;

procedure TF_Emprestimo.SomenteNumeros(Sender: TObject; var Key: Char);
begin
  //Permite que somente seje digitado os numeros de 0 a 9 e a tecla backspace
  if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;
end;

function TF_Emprestimo.LivroCadastrado(pCodLivro: String): Boolean;
begin
  //Verifica se o livro esta cadastrado, retornando true se cadastrado e false ao contrário
  try
    ADOQ_Aux.Close;
    ADOQ_Aux.SQL.Clear;
    ADOQ_Aux.SQL.Add('select codigo');
    ADOQ_Aux.SQL.Add('  from livro');
    ADOQ_Aux.SQL.Add(' where codigo=' + pCodLivro);
    ADOQ_Aux.Open;
    if ADOQ_Aux.IsEmpty then
      Result := False
    else
      Result := True;
  finally
    ADOQ_Aux.Close;
  end;
end;

function TF_Emprestimo.LivroDisponivel(pCodLivro: String): Boolean;
begin
  //Verifica se o livro não esta emprestado, retornando true se estiver livre ou false se estiver emprestado
  try
    ADOQ_Aux.Close;
    ADOQ_Aux.SQL.Clear;
    ADOQ_Aux.SQL.Add('select m.codigo,');
    ADOQ_Aux.SQL.Add('       m.aluno,');
    ADOQ_Aux.SQL.Add('       i.livro,');
    ADOQ_Aux.SQL.Add('       i.data_devolucao,');
    ADOQ_Aux.SQL.Add('       i.data_emprestimo');
    ADOQ_Aux.SQL.Add('  from movimentacao m,');
    ADOQ_Aux.SQL.Add('       movitem i');
    ADOQ_Aux.SQL.Add(' where i.livro=' + pCodLivro);
    ADOQ_Aux.SQL.Add('   and i.data_devolvido is null');
    ADOQ_Aux.Open;
    if ADOQ_Aux.IsEmpty then
      Result := True
    else
      Result := False;
  finally
    ADOQ_Aux.Close;
  end;
end;

procedure TF_Emprestimo.PreencheNomeLivro(pCodLivro: String);
begin
  //Preenche o nome do livro se encontrar o livro cadastrado
  try
    ADOQ_Aux.Close;
    ADOQ_Aux.SQL.Clear;
    ADOQ_Aux.SQL.Add('select titulo');
    ADOQ_Aux.SQL.Add('  from livro');
    ADOQ_Aux.SQL.Add(' where codigo=' + pCodLivro);
    ADOQ_Aux.Open;
    L_TituloLivro.Caption := ADOQ_Aux.FieldByName('titulo').AsString;
  finally
    ADOQ_Aux.Close;
  end;
end;

procedure TF_Emprestimo.LivroEmprestado;
begin
  SB_Incluir.Enabled    := False;
  L_TituloLivro.Caption := 'O livro de código' + E_CodLivro.Text + 'já esta emprestado.';
  E_CodLivro.Clear;
end;

procedure TF_Emprestimo.E_CodLivroExit(Sender: TObject);
begin
  if not(ADODS_Movimentacaoaluno.IsNull) and
        (E_CodLivro.Text <> '') then
  begin
    if LivroCadastrado(E_CodLivro.Text) then     //Verifica se o livro esta cadastrado
    begin
      PreencheNomeLivro(E_CodLivro.Text);     // Preenche o nome do livro
    end
    else
    begin
      L_TituloLivro.Caption := 'Livro não cadastrado.';
      E_CodLivro.Clear;
      E_COdLivro.SetFocus;
    end;
  end
  else
  begin
    L_TituloLivro.Caption := '';
  end;
end;

procedure TF_Emprestimo.DBLookupComboBox1Exit(Sender: TObject);
begin
  if (not ADODS_Movimentacaoaluno.IsNull) and
     (ADODS_Movimentacao.State in [dsInsert, dsEdit])then
    ADODS_Movimentacao.Post;
end;

procedure TF_Emprestimo.SB_ExcluirClick(Sender: TObject);
begin
  //verifica se existe item antes de excluir
  if ADODS_MovItem.RecordCount > 0 then
    ADODS_MovItem.Delete;
end;

procedure TF_Emprestimo.ADODS_MovItemBeforeDelete(DataSet: TDataSet);
begin
  //Não deixa excluir item se houver item com devolução realizada
  if not(ADODS_MovItemdata_devolvido.IsNull) then
  begin
    MessageDlg('O livro já foi devolvido, não pode ser excluido..',MTWarning,[mbok],0);
    SysUtils.Abort;
  end;
  if MessageDlg('Confirma a exclusão do livro?',MTConfirmation,[MBYes,MBNo],0) = MRNo then
    SysUtils.Abort;
end;

procedure TF_Emprestimo.ADODS_MovimentacaoBeforeDelete(DataSet: TDataSet);
begin
  //Não deixará excluir o empréstimo se houver livro emprestádo
  if ADODS_MovItem.RecordCount > 0 then
  begin
    MessageDlg('O empréstimo não pode ser excluido, delete primeiro os livros.',MTWarning,[mbok],0);
    SysUtils.Abort;
  end;
  if MessageDlg('Confirma a exclusão do empréstimo?',MTConfirmation,[MBYes,MBNo],0) = MRNo then
    SysUtils.Abort;
end;

procedure TF_Emprestimo.T_AlunoTimer(Sender: TObject);
var
  vNumCartao: String;
begin
  //Verifica se já existe RFID cadastrado e exibe mensagem e não permite o cadastro, do contrário ele permite o cadastro
  vNumCartao := '';
  if F_Principal.ComPort1.Connected then
    F_Principal.ComPort1.ReadStr(vNumCartao,100);
  if (vNumCartao <> '') and
     (DS_Movimentacao.State = dsInsert) then
  begin
    vNumCartao := StringReplace(vNumCartao,''#2'', '', [rfReplaceAll]);
    vNumCartao := StringReplace(vNumCartao,''#3'', '', [rfReplaceAll]);
    try
      ADOQ_Aux.Close;
      ADOQ_Aux.SQL.Clear;
      ADOQ_Aux.SQL.Add('select codigo');
      ADOQ_Aux.SQL.Add('  from aluno');
      ADOQ_Aux.SQL.Add(' where rfid=' + QuotedStr(vNumCartao));
      ADOQ_Aux.Open;
      if ADOQ_Aux.IsEmpty then
      begin
        L_Aluno.Caption := 'Aluno não cadastrado';
      end
      else
      begin
        ADODS_Movimentacaoaluno.AsInteger := ADOQ_Aux.FieldByName('codigo').AsInteger;
        L_Aluno.Caption := '';
        E_CodLIvro.SetFocus;
      end;
    finally
      ADOQ_Aux.Close;
    end;
  end;
end;

procedure TF_Emprestimo.ADODS_MovimentacaoalunoChange(Sender: TField);
begin
  L_Aluno.Caption := '';
end;

procedure TF_Emprestimo.FormCreate(Sender: TObject);
begin
  L_Aluno.Caption       := '';
  L_TituloLivro.Caption := '';
end;

end.
