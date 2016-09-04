unit U_CadAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, Buttons, ExtCtrls, DBCtrls, Mask, Grids,
  DBGrids, ADODB;

type
  TF_CadAluno = class(TForm)
    DataSource1: TDataSource;
    T_Aluno: TTimer;
    ADODataSet1: TADODataSet;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    ADODataSet1codigo: TAutoIncField;
    ADODataSet1rfid: TWideStringField;
    ADODataSet1nome: TWideStringField;
    ADODataSet1matricula: TWideStringField;
    P_Botoes: TPanel;
    Btn_Incluir: TSpeedButton;
    Btn_Excluir: TSpeedButton;
    Btn_Salvar: TSpeedButton;
    Btn_Cancelar: TSpeedButton;
    Btn_Pesquisar: TSpeedButton;
    Btn_Sair: TSpeedButton;
    Qry: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairBitClick(Sender: TObject);
    procedure T_AlunoTimer(Sender: TObject);
    procedure Btn_PesquisarClick(Sender: TObject);
    procedure Btn_IncluirClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_SalvarClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure ADODataSet1AfterInsert(DataSet: TDataSet);
    procedure DataSource1StateChange(Sender: TObject);
    procedure ADODataSet1BeforeDelete(DataSet: TDataSet);
    procedure ADODataSet1BeforePost(DataSet: TDataSet);
    procedure Btn_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadAluno: TF_CadAluno;

implementation

uses U_Main, U_Pesquisa;

{$R *.dfm}

procedure TF_CadAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Fecha as tabelas abertas, desabilita o timer e desaloca formulario da memória
  T_Aluno.Enabled := False;
  ADODataSet1.Close;
  F_Principal.T_Catraca.Enabled := True;  
  Action     := caFree;
  F_CadAluno := nil;
end;

procedure TF_CadAluno.SairBitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_CadAluno.T_AlunoTimer(Sender: TObject);
  //Função retona true se encontrar aluno cadastrado com o RFID passado como paramêtro, do contrário, devolve false
  function AlunoCadastrado(pRFID :  String): Boolean;
  begin
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('select codigo,');
      Qry.SQL.Add('       nome'   );
      Qry.SQL.Add('  from aluno'  );
      Qry.SQL.Add(' where rfid=' + QuotedStr(pRFID));
      Qry.Open;
      if Qry.IsEmpty then
        Result := False
      else
        Result := True;
    finally
      Qry.Close;
    end;
  end;

var
  vNumCartao: String;
begin
  //Verifica se já existe RFID cadastrado e exibe mensagem e não permite o cadastro, do contrário ele permite o cadastro
  vNumCartao := '';
  if F_Principal.ComPort1.Connected then
    F_Principal.ComPort1.ReadStr(vNumCartao,100);
  if vNumCartao <> '' then
  begin
    vNumCartao := StringReplace(vNumCartao,''#2'', '', [rfReplaceAll]);
    vNumCartao := StringReplace(vNumCartao,''#3'', '', [rfReplaceAll]);
    if AlunoCadastrado(vNumCartao) then
    begin
      MessageDlg('RFID já cadastrado.',MTWarning,[mbok],0);
      DBEdit4.SetFocus;
      Abort;
    end
    else
    begin
      if not (DataSource1.State in [dsInsert, dsEdit]) then
        ADODataSet1.Edit;
      ADODataSet1rfid.AsString := vNumCartao;
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TF_CadAluno.Btn_PesquisarClick(Sender: TObject);
begin
  //Formulario da pesquisa é criado e parametrizado conforme a pesquisa
  F_Pesquisa := TF_Pesquisa.Create(Self);
  with F_Pesquisa do
  begin
    P_Painel.Tag := 2;
    CB_Por.Items.Add('Código');
    Campos.Add('codigo');
    Tipos.Add('I');
    CB_Por.Items.Add('RFID');
    Campos.Add('rfid');
    Tipos.Add('I');
    CB_Por.Items.Add('Nome');
    Campos.Add('nome');
    Tipos.Add('S');
    CB_Por.Items.Add('Matrícula');
    Campos.Add('matricula');
    Tipos.Add('S');
    CB_Por.ItemIndex := 0;
    Comandos := 'SELECT codigo, rfid, nome, matricula FROM aluno order by ';
    ADODS_Pesquisa.CommandText := 'SELECT codigo, rfid, nome, matricula FROM aluno order by codigo';
    ADODS_Pesquisa.Open;
    FieldsAluno;
    if ShowModal = MrCancel then begin
      ADODS_Pesquisa.Close;
      SysUtils.Abort;
    end;
    ADODataSet1.Locate('Codigo', IntToStr(ADODS_Pesquisa.FieldByName('Codigo').AsInteger), []);
    ADODS_Pesquisa.Close;
  end;
end;

procedure TF_CadAluno.Btn_IncluirClick(Sender: TObject);
begin
  ADODataSet1.Insert;
end;

procedure TF_CadAluno.Btn_ExcluirClick(Sender: TObject);
begin
  ADODataSet1.Delete;
end;

procedure TF_CadAluno.Btn_SalvarClick(Sender: TObject);
begin
  ADODataSet1.Post;
end;

procedure TF_CadAluno.Btn_CancelarClick(Sender: TObject);
begin
  ADODataSet1.Cancel;
end;

procedure TF_CadAluno.ADODataSet1AfterInsert(DataSet: TDataSet);
begin
  DBEdit4.SetFocus;
end;

procedure TF_CadAluno.DataSource1StateChange(Sender: TObject);
begin
  //dependendo do estado em que se encontra o componente de acesso a banco, os botões da barra são habilitados e desabilitados.
  case DataSource1.State of
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

procedure TF_CadAluno.ADODataSet1BeforeDelete(DataSet: TDataSet);
begin
  //Mensagem de confirmação de exclusão, para não ocorrer exclusão ao clicar sem querer
  if MessageDLG('Confirma a exclusão do Aluno?',MTConfirmation,[MBYes,MBNo],0) = MRNo then
    SysUtils.Abort;
end;

procedure TF_CadAluno.ADODataSet1BeforePost(DataSet: TDataSet);
begin
  //Verificação de campos que são obrigatórios o preenchimento
  if Trim (ADODataSet1Nome.AsString) = '' then
  begin
    MessageDlg('O nome não pode ser em branco.',MTWarning,[mbok],0);
    DBEdit2.SetFocus;
    SysUtils.Abort;
  end;
  if Trim (ADODataSet1Matricula.AsString) = '' then
  begin
    MessageDlg('A matrícula não pode ser em branco.',MTWarning,[mbok],0);
    DBEdit3.SetFocus;
    SysUtils.Abort;
  end;
end;

procedure TF_CadAluno.Btn_SairClick(Sender: TObject);
begin
  Close;
end;

end.
