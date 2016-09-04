unit U_CadObra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, Buttons, ExtCtrls, DBCtrls, Mask, Grids,
  DBGrids, ADODB;

type
  TF_CadObra = class(TForm)
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    ADODataSet1codigo: TAutoIncField;
    ADODataSet1titulo: TWideStringField;
    ADODataSet1area: TWideStringField;
    ADODataSet1assunto: TWideStringField;
    ADODataSet1autor: TWideStringField;
    ADODataSet1editora: TWideStringField;
    P_Botoes: TPanel;
    Btn_Incluir: TSpeedButton;
    Btn_Excluir: TSpeedButton;
    Btn_Salvar: TSpeedButton;
    Btn_Cancelar: TSpeedButton;
    Btn_Pesquisar: TSpeedButton;
    Btn_Sair: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_PesquisarClick(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure Btn_IncluirClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_SalvarClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure ADODataSet1AfterInsert(DataSet: TDataSet);
    procedure ADODataSet1BeforeDelete(DataSet: TDataSet);
    procedure ADODataSet1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadObra: TF_CadObra;

implementation

uses U_Main, U_Pesquisa;

{$R *.dfm}

procedure TF_CadObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Fecha as tabelas abertas e desaloca formulario da memória
  ADODataSet1.Close;
  Action    := caFree;
  F_CadObra := nil;
end;

procedure TF_CadObra.DataSource1StateChange(Sender: TObject);
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

procedure TF_CadObra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  F_Principal.TabEnter(Sender, Key);
end;

procedure TF_CadObra.Btn_PesquisarClick(Sender: TObject);
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
    ADODataSet1.Locate('Codigo', IntToStr(ADODS_Pesquisa.FieldByName('Codigo').AsInteger), []);
    ADODS_Pesquisa.Close;
  end;
end;

procedure TF_CadObra.Btn_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TF_CadObra.Btn_IncluirClick(Sender: TObject);
begin
  ADODataSet1.Insert;
end;

procedure TF_CadObra.Btn_ExcluirClick(Sender: TObject);
begin
  ADODataSet1.Delete;
end;

procedure TF_CadObra.Btn_SalvarClick(Sender: TObject);
begin
  ADODataSet1.Post;
end;

procedure TF_CadObra.Btn_CancelarClick(Sender: TObject);
begin
  ADODataSet1.Cancel;
end;

procedure TF_CadObra.ADODataSet1AfterInsert(DataSet: TDataSet);
begin
  DBEdit5.SetFocus;
end;

procedure TF_CadObra.ADODataSet1BeforeDelete(DataSet: TDataSet);
begin
  //Mensagem de confirmação de exclusão, para não ocorrer exclusão ao clicar sem querer
  if MessageDLG('Confirma a exclusão da Obra?',MTConfirmation,[MBYes,MBNo],0) = MRNo then
    SysUtils.Abort;
end;

procedure TF_CadObra.ADODataSet1BeforePost(DataSet: TDataSet);
begin
  //Verificação de campos que são obrigatórios o preenchimento
  if Trim (ADODataSet1Titulo.AsString) = '' then
  begin
    MessageDlg('O título não pode ser em branco.',MTWarning,[mbok],0);
    DBEdit5.SetFocus;
    Abort;
  end;
  if Trim (ADODataSet1Area.AsString) = '' then
  begin
    MessageDlg('A área não pode ser em branco.',MTWarning,[mbok],0);
    DBEdit6.SetFocus;
    Abort;
  end;
end;

end.
