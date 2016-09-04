unit U_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, Buttons, ExtCtrls, ComCtrls, ToolWin, Menus, StdCtrls,
  CPortCtl, DB, ADODB, XPMan;

const Pwd               = '';  //Defina a senha de conexão com o banco, deixar em branco se o banco não possui senha
      MaxLivroPermitido = 2;   //Defina o número máximo de livro por empréstimo
      DisplayNome       = 'Sistema para Biblioteca RFID'; //Nome que sai no cabeçário dos relatórios
type
  TF_Principal = class(TForm)
    ComPort1: TComPort;
    Panel1: TPanel;
    Btn_Alunos: TSpeedButton;
    EmprestimoBtn: TSpeedButton;
    DevolucaoBtn: TSpeedButton;
    RelatoriosBtn: TSpeedButton;
    HistoricoBtn: TSpeedButton;
    MainMenu1: TMainMenu;
    Configura1: TMenuItem;
    PortaSerial1: TMenuItem;
    Ajuda1: TMenuItem;
    T_Porta: TTimer;
    Testar1: TMenuItem;
    Sair1: TMenuItem;
    Panel3: TPanel;
    ADOC_Conexao: TADOConnection;
    ObrasBtn: TSpeedButton;
    Panel4: TPanel;
    ComLed1: TComLed;
    P_Data: TPanel;
    P_Hora: TPanel;
    T_Hora: TTimer;
    P_Geral: TPanel;
    SB_Renovacao: TSpeedButton;
    PM_Relatorios: TPopupMenu;
    Aluno1: TMenuItem;
    Livro1: TMenuItem;
    Emprestimo1: TMenuItem;
    L_Logo: TImage;
    T_Catraca: TTimer;
    ADOQ_Aux: TADOQuery;
    AbrirPorta1: TMenuItem;
    FecharPorta1: TMenuItem;
    procedure PortaSerial1Click(Sender: TObject);
    procedure T_PortaTimer(Sender: TObject);
    procedure Btn_AlunosClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Testar1Click(Sender: TObject);
    procedure AbrirPorta;
    procedure FecharPorta;
    procedure EmprestimoBtnClick(Sender: TObject);
    procedure DevolucaoBtnClick(Sender: TObject);
    procedure ObrasBtnClick(Sender: TObject);
    procedure HistoricoBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure T_HoraTimer(Sender: TObject);
    procedure TabEnter(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_RenovacaoClick(Sender: TObject);
    procedure RelatoriosBtnClick(Sender: TObject);
    procedure Aluno1Click(Sender: TObject);
    procedure Emprestimo1Click(Sender: TObject);
    procedure Livro1Click(Sender: TObject);
    procedure T_CatracaTimer(Sender: TObject);
    procedure FecharPorta1Click(Sender: TObject);
    procedure AbrirPorta1Click(Sender: TObject);
  private
    { Private declarations }
    procedure InsereLogEntrada(pCodAluno: Integer);
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_CadObra, U_CadAluno, U_Teste, U_Emprestimo, U_Renovacao, U_Devolucao,
  U_RelAluno, U_RelEmprestimo, U_RelObra, U_Splash, U_RelHistorico;

{$R *.dfm}

procedure TF_Principal.InsereLogEntrada(pCodAluno: Integer);
begin
  //Procedimento realiza a inserção de log de entrada no banco de dados, parametro Codigo do Aluno
  ADOQ_Aux.Close;
  ADOQ_Aux.SQL.Clear;
  ADOQ_Aux.SQL.Add('insert into logacesso');
  ADOQ_Aux.SQL.Add(' (dataentrada, aluno)');
  ADOQ_Aux.SQL.Add(' values (' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now)) + ', ' + IntToStr(pCodAluno) + ')');
  ADOQ_Aux.ExecSQL;
end;

procedure TF_Principal.PortaSerial1Click(Sender: TObject);
begin
  //Abra a tela de configuração da porta
  ComPort1.ShowSetupDialog;
end;

procedure TF_Principal.T_PortaTimer(Sender: TObject);
begin
  //Timer verifica se a porta esta conectada e desabilita menus conforme status da porta
  if ComPort1.Connected then
  begin
    PortaSerial1.Enabled := False;
    Testar1.Enabled      := True;
  end
  else
  begin
    PortaSerial1.Enabled := True;
    Testar1.Enabled      := False;
  end;
end;

procedure TF_Principal.Btn_AlunosClick(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_CadAluno' then
    begin
      Achou := True;
      F_CadAluno.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_CadAluno := TF_CadAluno.Create(Self);
    F_CadAluno.ADODataSet1.Active := True;
    F_CadAluno.Top    := 0;
    F_CadAluno.Left   := 0;
    F_CadAluno.Height := 272;
    F_CadAluno.Width  := 590;
    F_CadAluno.T_Aluno.Enabled := True;
  end;
  T_Catraca.Enabled := False; //Desabilita a catraca
end;

procedure TF_Principal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TF_Principal.Testar1Click(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_Teste' then
    begin
      Achou := True;
      F_CadAluno.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_Teste := TF_Teste.Create(Self);
    F_Teste.Top    := 0;
    F_Teste.Left   := 0;
    F_Teste.Height := 199;
    F_Teste.Width  := 469;
  end;
  T_Catraca.Enabled := False; //Desabilita a catraca
end;

procedure TF_Principal.AbrirPorta;
begin
  //Abre a porta
  ComPort1.Open;
  AbrirPorta1.Enabled  := False;
  FecharPorta1.Enabled := True;
  PortaSerial1.Enabled := False;
  T_Porta.Enabled      := True;
end;

procedure TF_Principal.FecharPorta;
begin
  //Fecha a porta
  ComPort1.Close;
  AbrirPorta1.Enabled  := True;
  FecharPorta1.Enabled := False;
  PortaSerial1.Enabled := True;
  T_Porta.Enabled      := False;
end;

procedure TF_Principal.EmprestimoBtnClick(Sender: TObject);
var
  i     : Integer;
  Achou : Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_Emprestimo' then
    begin
      Achou := True;
      F_Emprestimo.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_Emprestimo := TF_Emprestimo.Create(Self);
    F_Emprestimo.Top    := 0;
    F_Emprestimo.Left   := 0;
    F_Emprestimo.Height := 494;
    F_Emprestimo.Width  := 648;
    F_Emprestimo.ADODS_Aluno.Active := True;
    F_Emprestimo.ADODS_Livro.Active := True;
    F_Emprestimo.ADODS_Movimentacao.Active := True;
    F_Emprestimo.ADODS_MovItem.Active      := True;
    F_Emprestimo.T_Aluno.Enabled           := True;
    F_Emprestimo.DBLookupComboBox1.SetFocus;
  end;
  T_Catraca.Enabled := False; //Desabilita a catraca
end;

procedure TF_Principal.DevolucaoBtnClick(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_Devolucao' then
    begin
      Achou := True;
      MDIChildren[i].Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_Devolucao := TF_Devolucao.Create(Self);
    F_Devolucao.Top     := 0;
    F_Devolucao.Left    := 0;
    F_Devolucao.Height  := 422;
    F_Devolucao.Width   := 482;
  end;
end;

procedure TF_Principal.ObrasBtnClick(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_CadObra' then
    begin
      Achou := True;
      F_CadObra.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_CadObra := TF_CadObra.Create(Self);
    F_CadObra.Top    := 0;
    F_CadObra.Left   := 0;
    F_CadObra.Height := 285;
    F_CadObra.Width  := 590;
    F_CadObra.ADODataSet1.Active := True;
  end;
end;

procedure TF_Principal.HistoricoBtnClick(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_RelHistorico' then
    begin
      Achou := True;
      F_RelAluno.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_RelHistorico := TF_RelHistorico.Create(Self);
    F_RelHistorico.Top    := 0;
    F_RelHistorico.Left   := 0;
    F_RelHistorico.Height := 297;
    F_RelHistorico.Width  := 544;
  end;
end;

procedure TF_Principal.FormCreate(Sender: TObject);
var
  Config: TStringList;
begin
  //Verifica se existe o banco de dados na mesma pasta que o executável, caso não, fecha a aplicação
  if not (FileExists(ExtractFilePath(Application.ExeName) + 'Biblioteca.mdb')) then
    Halt;
  //Se estiver conectado, desconecte, seta a String de Conexão
  if ADOC_Conexao.Connected then
    ADOC_Conexao.Connected := False;
  ADOC_Conexao.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=True;Data Source=' + ExtractFilePath(Application.ExeName)  +
                                     'Biblioteca.mdb;Jet OLEDB:Database Password=' + Pwd + ';';
  //Tenta conectar, se der erro, gera um arquivo de log, contendo o erro gerado ao tentar abrir a conexão com o banco
  try
    ADOC_Conexao.Connected := True;
  except
    on E: Exception do
    begin
      Config := TStringList.Create;
      if FileExists('erros.log') then
        Config.LoadFromFile('erros.log');
      Config.Add(FormatDateTime('dd/mm/yyyy - hh:nn:ss',Now) + ' - CONEXÃO');
      Config.Add('ERRO AO CONECTAR-SE COM A BASE');
      Config.Add(Trim(E.Message));
      Config.Add('');
      Config.SaveToFile('erros.log');
      Config.Free;
      MessageDlg('IMPOSSÍVEL CONECTAR COM O SERVIDOR.' + #13 +
                 'FAVOR CONTATAR O SUPORTE TÉCNICO.',mtWarning,[mbOk],0);
      Halt;
    end;
  end;
  //Abre a janela de Splash
  F_Splash := TF_Splash.Create(Application);
  if F_Splash.Resposta = mrCancel then
    Halt;
  if F_Splash.Resposta = mrOK then
  begin
    F_Splash.Close;
  end;
  T_Hora.Enabled := True;
  P_Data.Caption := FormatDateTime('dddd d mmmm yyyy', Date);
  F_Principal.WindowState := wsMaximized;
  //Verifica se existe a imagem de logo junto ao executavel, se houver, carrega a imagem
  if FileExists(ExtractFilePath(Application.ExeName) + 'Logo.jpg') then
    L_Logo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Logo.jpg');
  AbrirPorta;
  T_Catraca.Enabled := True;  //Habilita a catraca
end;

procedure TF_Principal.T_HoraTimer(Sender: TObject);
begin
  //Atualiza a hora do sistema 
  P_Hora.Caption := FormatDateTime('hh:mm:ss', Now);
end;

procedure TF_Principal.TabEnter(Sender: TObject; var Key: Char);
begin
  //Troca o Enter(#13) por Tab, quando a tecla for enter, seta o focu no proximo componente 
  if Key = #13 then
  begin
    Screen.ActiveForm.Perform(WM_NextDlgCtl,0,0);
    Key := #0;
  end;
end;

procedure TF_Principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ComPort1.Close;
  T_Porta.Enabled := False;
end;

procedure TF_Principal.SB_RenovacaoClick(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_Renovacao' then
    begin
      Achou := True;
      MDIChildren[i].Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_Renovacao := TF_Renovacao.Create(Self);
    F_Renovacao.Top     := 0;
    F_Renovacao.Left    := 0;
    F_Renovacao.Height  := 422;
    F_Renovacao.Width   := 482;
  end;
end;

procedure TF_Principal.RelatoriosBtnClick(Sender: TObject);
var
  Ponto: TPoint;
begin
  //Pega o ponto X e Y do botão, para posicionar onde o popmenu irá abrir
  Ponto.X := (Sender as TSpeedButton).BoundsRect.Right;
  Ponto.Y := (Sender as TSpeedButton).BoundsRect.Bottom;
  PM_Relatorios.Popup(Ponto.X,Ponto.Y);
end;

procedure TF_Principal.Aluno1Click(Sender: TObject);
var
  i     : Integer;
  Achou : Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_RelAluno' then
    begin
      Achou := True;
      F_RelAluno.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_RelAluno := TF_RelAluno.Create(Self);
    F_RelAluno.Top    := 0;
    F_RelAluno.Left   := 0;
    F_RelAluno.Height := 213;
    F_RelAluno.Width  := 536;
  end;
end;

procedure TF_Principal.Emprestimo1Click(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_RelEmprestimo' then
    begin
      Achou := True;
      F_RelEmprestimo.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_RelEmprestimo := TF_RelEmprestimo.Create(Self);
    F_RelEmprestimo.Top    := 0;
    F_RelEmprestimo.Left   := 0;
    F_RelEmprestimo.Height := 213;
    F_RelEmprestimo.Width  := 536;
  end;
end;

procedure TF_Principal.Livro1Click(Sender: TObject);
var
  i    : Integer;
  Achou: Boolean;
begin
  //Verifica se a janela já esta aberta, se sim(exibe a janela), se não(cria a janela)
  Achou := False;
  for i := 0 to F_Principal.MDIChildCount - 1 do
    if MDIChildren[i].Name = 'F_RelObra' then
    begin
      Achou := True;
      F_RelObra.Show;
      Exit;
    end;

  if not(Achou) then
  begin
    F_RelObra := TF_RelObra.Create(Self);
    F_RelObra.Top    := 0;
    F_RelObra.Left   := 0;
    F_RelObra.Height := 213;
    F_RelObra.Width  := 536;
  end;
end;

procedure TF_Principal.T_CatracaTimer(Sender: TObject);
var
  vNumCartao: String;
begin
  //Verifica se foi passao o cartão na catraca
  vNumCartao := '';
  if F_Principal.ComPort1.Connected then
    F_Principal.ComPort1.ReadStr(vNumCartao,100);
  if vNumCartao <> '' then
  begin
    //Retira os caracteres especiais que vem junto com o numero do RFID
    vNumCartao := StringReplace(vNumCartao,''#2'', '', [rfReplaceAll]);
    vNumCartao := StringReplace(vNumCartao,''#3'', '', [rfReplaceAll]);
    try
      //Pesquisa se existe aluno cadatrado com o RFID passado.
      ADOQ_Aux.Close;
      ADOQ_Aux.SQL.Clear;
      ADOQ_Aux.SQL.Add('select codigo');
      ADOQ_Aux.SQL.Add('  from aluno');
      ADOQ_Aux.SQL.Add(' where rfid=' + QuotedStr(vNumCartao));
      ADOQ_Aux.Open;
      //Se houver registro, insere log de entrada e envia o caracter 1 para a porta COM
      if not (ADOQ_Aux.IsEmpty) then
      begin
        InsereLogEntrada(ADOQ_Aux.FieldByName('codigo').AsInteger);
        F_Principal.ComPort1.WriteStr(Chr(1));
      end;
    finally
      ADOQ_Aux.Close;
    end;
  end;
end;

procedure TF_Principal.FecharPorta1Click(Sender: TObject);
begin
  FecharPorta;
end;

procedure TF_Principal.AbrirPorta1Click(Sender: TObject);
begin
  AbrirPorta;
end;

end.
