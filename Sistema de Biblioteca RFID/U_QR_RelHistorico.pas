unit U_QR_RelHistorico;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBClient, QRPrntr,
  ADODB, qrpctrls, grimgctrl;

type
  TF_QR_RelHistorico = class(TQuickRep)
    ADODataSet1: TADODataSet;
    QRB_PageHeader: TQRBand;
    QRB_PageFooter: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRL_TituloCabecario: TQRLabel;
    QRL_Titulo: TQRLabel;
    QRB_Detalhe: TQRBand;
    QRPDBText2: TQRPDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRPDBText4: TQRPDBText;
    QRHRule3: TQRHRule;
    ADODataSet1nome: TWideStringField;
    ADODataSet1matricula: TWideStringField;
    ADODataSet1rfid: TWideStringField;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRPDBText1: TQRPDBText;
    QRPDBText3: TQRPDBText;
    ADODataSet1dataentrada: TDateTimeField;
    procedure QuickRepPreview(Sender: TObject);
    procedure WinControlFormClose(Sender: TObject;
      var Action: TCloseAction);
  private

  public

  end;

var
  F_QR_RelHistorico: TF_QR_RelHistorico;

implementation

uses U_Main, ufrmPreview;

{$R *.DFM}

procedure TF_QR_RelHistorico.QuickRepPreview(Sender: TObject);
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

procedure TF_QR_RelHistorico.WinControlFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
