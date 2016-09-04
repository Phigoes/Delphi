unit U_QR_RelObra;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBClient, QRPrntr,
  ADODB, qrpctrls, grimgctrl;

type
  TF_QR_RelObra = class(TQuickRep)
    ADODataSet1: TADODataSet;
    QRBand4: TQRBand;
    QRHRule3: TQRHRule;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRHRule1: TQRHRule;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRPDBText1: TQRPDBText;
    QRLabel2: TQRLabel;
    QRPDBText2: TQRPDBText;
    QRHRule2: TQRHRule;
    QRSysData1: TQRSysData;
    QRL_TituloCabecario: TQRLabel;
    QRL_Titulo: TQRLabel;
    QRPDBText9: TQRPDBText;
    QRLabel9: TQRLabel;
    QRPDBText10: TQRPDBText;
    QRLabel10: TQRLabel;
    ADODataSet1codigo: TAutoIncField;
    ADODataSet1titulo: TWideStringField;
    ADODataSet1area: TWideStringField;
    ADODataSet1assunto: TWideStringField;
    ADODataSet1autor: TWideStringField;
    ADODataSet1editora: TWideStringField;
    QRPDBText3: TQRPDBText;
    QRLabel3: TQRLabel;
    QRPDBText4: TQRPDBText;
    QRLabel4: TQRLabel;
    procedure QuickRepPreview(Sender: TObject);
  private

  public

  end;

var
  F_QR_RelObra: TF_QR_RelObra;

implementation

uses U_Main, ufrmPreview;

{$R *.DFM}

procedure TF_QR_RelObra.QuickRepPreview(Sender: TObject);
begin
  //Carrega o relatório no dentro do frmPreview
	frmPreview := TfrmPreview.Create(Application);

  with frmPreview do
  begin
		qrprvwPadrao.QRPrinter := TQRPrinter(Sender);
    vTitulo := 'Relatório de Alunos';
  	ShowModal;
  end;
end;

end.
