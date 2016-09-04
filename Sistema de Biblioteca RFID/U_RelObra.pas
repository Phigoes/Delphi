unit U_RelObra;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit,
  JvExControls, JvXPCore, JvXPButtons, DB, ADODB, Menus;

type
  TF_RelObra = class(TForm)
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
    procedure CarregaObras;
    procedure RG_OpcoesClick(Sender: TObject);
    procedure SB_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelObra: TF_RelObra;

implementation

uses U_Main, U_QR_RelObra;

{$R *.dfm}

procedure TF_RelObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Desaloca Formulario da memória
  Action := caFree;
  F_RelObra := nil;
end;

procedure TF_RelObra.SB_VisualizarClick(Sender: TObject);
var vSubtitulo, vEstoque, vProduto, vInstrucao: String;
begin
  if RG_Opcoes.ItemIndex = 1 then
  begin
    //Faz consistencia dos campos que devem ser preenchidos
    if Trim(CB_Escolha.Text) = '' then
    begin
      MessageDlg('O livro não pode ser em branco.',MTWarning,[mbok],0);
      CB_Escolha.SetFocus;
      Abort;
    end;
    //Monta a instrução do select e o subtitulo
    vInstrucao := 'select * from livro where codigo = ' + CB_Codigo.Items[CB_Escolha.ItemIndex];
    vSubtitulo := vSubtitulo + 'Livro: ' + CB_Codigo.Items[CB_Escolha.ItemIndex] + ' - ' + CB_Escolha.Text;
  end
  else
  begin
    //Monta a instrução do select e o subtitulo
    vInstrucao := 'select * from livro';
    vSubtitulo := 'Todos os livros';
  end;
  F_QR_RelObra := TF_QR_RelObra.Create(Application);
  F_QR_RelObra.ADODataSet1.CommandText := vInstrucao; //Carrega o SQL de instrução
  F_QR_RelObra.ADODataSet1.Open;
  F_QR_RelObra.QRL_TituloCabecario.Caption := DisplayNome; //Atribui o nome do cabeçários
  F_QR_RelObra.QRL_Titulo.Caption          := vSubtitulo; //Atribui o subtitulo
  F_QR_RelObra.PreviewModal;
	F_QR_RelObra.Free;
  F_QR_RelObra := Nil;
end;

procedure TF_RelObra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  F_Principal.tabEnter(sender, Key);
end;

procedure TF_RelObra.SB_LimparClick(Sender: TObject);
begin
  RG_Opcoes.ItemIndex := 0;
end;

procedure TF_RelObra.CarregaObras;
begin
  //Traz todos os livros no combobox ordenado por titulo
  CB_Codigo.Items.Clear;
  CB_Escolha.Items.Clear;
  Qry.SQL.Clear;
  Qry.SQL.Add('select codigo, titulo from livro order by titulo');
  Qry.Open;
  Qry.First;
  while not(Qry.Eof) do
  begin
    CB_Codigo.Items.Add(Qry.FieldByName('codigo').AsString);
    CB_Escolha.Items.Add(Qry.FieldByName('titulo').AsString);
    Qry.Next;
  end;
  Qry.Close;
end;

procedure TF_RelObra.RG_OpcoesClick(Sender: TObject);
begin
  //Dependendo da opção escolhida habilitaos controles de livro, do contrário, desabilita os mesmos
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
    CarregaObras;
  end;
end;

procedure TF_RelObra.SB_SairClick(Sender: TObject);
begin
  Close;
end;

end.
