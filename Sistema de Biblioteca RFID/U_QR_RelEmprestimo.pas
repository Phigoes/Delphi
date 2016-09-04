unit U_QR_RelEmprestimo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBClient, QRPrntr,
  ADODB, qrpctrls, grimgctrl;

type
  TF_QR_RelEmprestimo = class(TQuickRep)
    ADODataSet1: TADODataSet;
    QRB_PageHeader: TQRBand;
    QRB_PageFooter: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRL_TituloCabecario: TQRLabel;
    QRL_Titulo: TQRLabel;
    ADODataSet1nome: TWideStringField;
    ADODataSet1matricula: TWideStringField;
    ADODataSet1titulo: TWideStringField;
    ADODataSet1data_emprestimo: TDateTimeField;
    ADODataSet1data_devolvido: TDateTimeField;
    QRB_Detalhe: TQRBand;
    QRPDBText1: TQRPDBText;
    QRPDBText2: TQRPDBText;
    QRPDBText3: TQRPDBText;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRPDBText4: TQRPDBText;
    QRHRule3: TQRHRule;
    procedure QuickRepPreview(Sender: TObject);
    procedure WinControlFormClose(Sender: TObject;
      var Action: TCloseAction);
  private

  public

  end;

var
  F_QR_RelEmprestimo: TF_QR_RelEmprestimo;

implementation

uses U_Main, ufrmPreview;

{$R *.DFM}

procedure TF_QR_RelEmprestimo.QuickRepPreview(Sender: TObject);
begin
  //Carrega o relatório no dentro do frmPreview
	frmPreview := TfrmPreview.Create(Application);

  with frmPreview do
  begin
		qrprvwPadrao.QRPrinter := TQRPrinter(Sender);
    vTitulo := 'Relatório de Empréstimo';
  	ShowModal;
  end;
end;

procedure TF_QR_RelEmprestimo.WinControlFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
