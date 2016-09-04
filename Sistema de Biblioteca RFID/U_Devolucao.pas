unit U_Devolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, Grids, DBGrids, ADODB,
  ExtCtrls;

type
  TF_Devolucao = class(TForm)
    P_Topo: TPanel;
    ADOQ_Emprestimo: TADOQuery;
    P_Edicao: TPanel;
    L_Matricula: TLabel;
    L_Matricula_: TLabel;
    L_Livro: TLabel;
    L_Livro_: TLabel;
    L_DataEmprestimo_: TLabel;
    L_DataEmprestimo: TLabel;
    L_DataDevolucao_: TLabel;
    L_DataDevolucao: TLabel;
    L_Aluno_: TLabel;
    L_Aluno: TLabel;
    L_Encontrado: TLabel;
    L_Multa_: TLabel;
    L_DiasAtraso_: TLabel;
    L_DiasAtraso: TLabel;
    L_Multa: TLabel;
    E_CodLivro: TEdit;
    Label3: TLabel;
    Btn_FinalizaDevolucao: TBitBtn;
    ADOQ_Aux: TADOQuery;
    Btn_Pesquisar: TBitBtn;
    L_Codigo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MostraCampos;
    procedure EscondeCampos;
    procedure VerificaDevolucao;
    procedure SomenteNumeros(Sender: TObject; var Key: Char);
    function ConsultaCampo(pCampo: String; pTabela: String; pCondicao: String): String;
    procedure E_CodLivroExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_PesquisarClick(Sender: TObject);
    procedure Btn_FinalizaDevolucaoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Devolucao: TF_Devolucao;

implementation

uses U_Main, U_Pesquisa;

{$R *.dfm}

procedure TF_Devolucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Desalocando formulário da memória
  Action := caFree;
  F_Devolucao := nil;
end;

procedure TF_Devolucao.MostraCampos;
begin
  L_Aluno_.Visible := True;
  L_Aluno.Visible  := True;
  L_Matricula_.Visible := True;
  L_Matricula.Visible  := True;
  L_Livro_.Visible := True;
  L_Livro.Visible  := True;
  L_DataEmprestimo_.Visible := True;
  L_DataEmprestimo.Visible  := True;
  L_DataDevolucao_.Visible := True;
  L_DataDevolucao.Visible  := True;
  L_DiasAtraso_.Visible := True;
  L_DiasAtraso.Visible  := True;
  L_Multa_.Visible := True;
  L_Multa.Visible  := True;
  Btn_FinalizaDevolucao.Visible := True
end;

procedure TF_Devolucao.VerificaDevolucao;
var
  DiasAtraso : Double;
begin
  try
    ADOQ_Emprestimo.Close;
    ADOQ_Emprestimo.SQL.Clear;
    ADOQ_Emprestimo.SQL.Add('select m.codigo,');
    ADOQ_Emprestimo.SQL.Add('       m.aluno,');
    ADOQ_Emprestimo.SQL.Add('       i.livro,');
    ADOQ_Emprestimo.SQL.Add('       i.data_devolucao,');
    ADOQ_Emprestimo.SQL.Add('       i.data_emprestimo');
    ADOQ_Emprestimo.SQL.Add('  from movimentacao m,');
    ADOQ_Emprestimo.SQL.Add('       movitem i');
    ADOQ_Emprestimo.SQL.Add(' where i.livro=' + E_CodLivro.Text);
    ADOQ_Emprestimo.SQL.Add('   and i.data_devolvido is null');
    ADOQ_Emprestimo.SQL.Add('   and m.codigo=i.codigo');
    ADOQ_Emprestimo.Open;
    if ADOQ_Emprestimo.IsEmpty then
    begin
      L_Encontrado.Caption := 'Livro ' + E_CodLivro.Text + ', não se encontra emprestado';
      EscondeCampos;
    end
    else
    begin
      L_Codigo.Tag             := ADOQ_Emprestimo.FieldByName('codigo').AsInteger;
      DiasAtraso               := Date - ADOQ_Emprestimo.FieldByName('data_devolucao').AsDateTime;
      L_Aluno.Caption          := ConsultaCampo('nome','aluno','codigo=' + ADOQ_Emprestimo.FieldByName('aluno').AsString);
      L_Matricula.Caption      := ConsultaCampo('matricula','aluno','codigo=' + ADOQ_Emprestimo.FieldByName('aluno').AsString);
      L_Livro.Caption          := ConsultaCampo('titulo','livro','codigo=' + ADOQ_Emprestimo.FieldByName('livro').AsString);
      L_DataEmprestimo.Caption := FormatDateTime('dd/mm/yyyy', ADOQ_Emprestimo.FieldByName('data_emprestimo').AsDateTime);
      L_DataDevolucao.Caption  := FormatDateTime('dd/mm/yyyy', ADOQ_Emprestimo.FieldByName('data_devolucao').AsDateTime);
      L_DiasAtraso.Caption     := FloatToStr(DiasAtraso);
      L_Multa.Caption          := FormatFloat('R$ ###,###,##0.00', DiasAtraso);
      if DiasAtraso > 0 then
      begin
        L_DiasAtraso.Font.Color := clRed;
        L_Multa.Font.Color := clRed;
      end
      else
      begin
        L_DiasAtraso.Font.Color := clNavy;
        L_Multa.Font.Color   := clNavy;
        L_DiasAtraso.Caption := '0';
        L_Multa.Caption      := 'R$ 0.00';
      end;
      MostraCampos;
    end;
  finally
    ADOQ_Emprestimo.Close;
  end;
end;

function TF_Devolucao.ConsultaCampo(pCampo: String; pTabela: String; pCondicao: String): String;
begin
  try
    ADOQ_Aux.Close;
    ADOQ_Aux.SQL.Clear;
    ADOQ_Aux.SQL.Add('select ' + pCampo);
    ADOQ_Aux.SQL.Add('  from ' + pTabela);
    ADOQ_Aux.SQL.Add(' where ' + pCondicao);
    ADOQ_Aux.Open;
    Result := ADOQ_Aux.FieldByName(pCampo).AsString;
  finally
    ADOQ_Aux.Close;
  end;
end;

procedure TF_Devolucao.EscondeCampos;
begin
  L_Aluno_.Visible          := False;
  L_Aluno.Visible           := False;
  L_Matricula_.Visible      := False;
  L_Matricula.Visible       := False;
  L_Livro_.Visible          := False;
  L_Livro.Visible           := False;
  L_DataEmprestimo_.Visible := False;
  L_DataEmprestimo.Visible  := False;
  L_DataDevolucao_.Visible  := False;
  L_DataDevolucao.Visible   := False;
  L_DiasAtraso_.Visible     := False;
  L_DiasAtraso.Visible      := False;
  L_Multa_.Visible          := False;
  L_Multa.Visible           := False;
  L_Encontrado.Visible      := True;
  Btn_FinalizaDevolucao.Visible := False;
  E_CodLivro.Clear;
end;

procedure TF_Devolucao.SomenteNumeros(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;
end;

procedure TF_Devolucao.E_CodLivroExit(Sender: TObject);
begin
  if not(E_CodLivro.Text = '') then
    VerificaDevolucao;
end;

procedure TF_Devolucao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  F_Principal.TabEnter(Sender, Key);
end;

procedure TF_Devolucao.Btn_PesquisarClick(Sender: TObject);
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
    if ShowModal = MrCancel then
    begin
      ADODS_Pesquisa.Close;
      SysUtils.Abort;
    end;
    L_Encontrado.Visible := False;
    E_CodLivro.Text := IntToStr(ADODS_Pesquisa.FieldByName('Codigo').AsInteger);
    ADODS_Pesquisa.Close;
    VerificaDevolucao;
  end;
end;

procedure TF_Devolucao.Btn_FinalizaDevolucaoClick(Sender: TObject);
begin
  try
    ADOQ_Aux.Close;
    ADOQ_Aux.SQL.Clear;
    ADOQ_Aux.SQL.Add('update movitem');
    ADOQ_Aux.SQL.Add('   set data_devolvido=#' + FormatDateTime('mm/dd/yyyy', Date) + '#');
    ADOQ_Aux.SQL.Add(' where codigo=' + IntToStr(L_Codigo.Tag));
    ADOQ_Aux.SQL.Add('   and livro='  + E_CodLivro.Text);
    ADOQ_Aux.SQL.Add('   and data_devolvido is null');
    ADOQ_Aux.ExecSQL;
    MessageDlg('Devolução realizada com sucesso.', mtInformation, [mbOK], 0);
  finally
    EscondeCampos;
    L_Encontrado.Visible := False;
  end;
end;

end.
