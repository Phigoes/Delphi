unit ufrmPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRPrntr, ExtCtrls, Buttons, StdCtrls, QRExport, QRWebFilt,
  QRPDFFilt, Printers;

type
  TfrmPreview = class(TForm)
    pnlTop: TPanel;
    pnlControles: TPanel;
    qrprvwPadrao: TQRPreview;
    pnlBottom: TPanel;
    btnImprimir: TSpeedButton;
    btnZoomMinus: TSpeedButton;
    btnPrimeira: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProxima: TSpeedButton;
    btnUltima: TSpeedButton;
    btnExportar: TSpeedButton;
    btnZoomPlus: TSpeedButton;
    txtPagina: TStaticText;
    lblTitulo: TLabel;
    txtZoom: TStaticText;
    btnZoomPage: TSpeedButton;
    btnZoomFit: TSpeedButton;
    bvlLinha01: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnSair: TSpeedButton;
    dlgSaveDialog: TSaveDialog;
    lblSubTitulo: TLabel;
    imgPadrao: TImage;
    btnSetup: TSpeedButton;
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximaClick(Sender: TObject);
    procedure btnUltimaClick(Sender: TObject);
    procedure btnPrimeiraClick(Sender: TObject);
    procedure btnZoomPlusClick(Sender: TObject);
    procedure btnZoomMinusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnZoomPageClick(Sender: TObject);
    procedure btnZoomFitClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSetupClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure AcertaPaginas;
  private
    { Private declarations }
    function getPage(Report: TQRPreview): string;
  public
    { Public declarations }
    vTitulo: String;
  end;

var
  frmPreview: TfrmPreview;

implementation

{$R *.dfm}

procedure TfrmPreview.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
	btnZoomMinus.Click;
end;

procedure TfrmPreview.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  btnZoomPlus.Click;
end;

procedure TfrmPreview.btnAnteriorClick(Sender: TObject);
begin
	qrprvwPadrao.PageNumber := qrprvwPadrao.PageNumber - 1;
  AcertaPaginas;
end;

procedure TfrmPreview.btnProximaClick(Sender: TObject);
begin
	qrprvwPadrao.PageNumber := qrprvwPadrao.PageNumber + 1;
  AcertaPaginas;
end;

procedure TfrmPreview.btnUltimaClick(Sender: TObject);
begin
	qrprvwPadrao.PageNumber := qrprvwPadrao.PageNumber;
end;

procedure TfrmPreview.btnPrimeiraClick(Sender: TObject);
begin
	qrprvwPadrao.PageNumber := 1;
end;

procedure TfrmPreview.btnZoomPlusClick(Sender: TObject);
begin
	if qrprvwPadrao.Zoom <= 200 then
    qrprvwPadrao.Zoom := qrprvwPadrao.Zoom + 10;
  txtZoom.Caption := IntToStr(qrprvwPadrao.Zoom) + '%';
end;

procedure TfrmPreview.btnZoomMinusClick(Sender: TObject);
begin
	if qrprvwPadrao.Zoom >= 20 then
    qrprvwPadrao.Zoom := qrprvwPadrao.Zoom - 10;
  txtZoom.Caption := IntToStr(qrprvwPadrao.Zoom) + '%';
end;

procedure TfrmPreview.FormShow(Sender: TObject);
begin
	frmPreview.Caption := qrprvwPadrao.QRPrinter.Title;
//	lblTitulo.Caption := qrprvwPadrao.QRPrinter.Title;
  txtZoom.Caption := IntToStr(qrprvwPadrao.Zoom) + '%';
  lblSubTitulo.Caption := vTitulo;
  AcertaPaginas;
end;

function TfrmPreview.getPage(Report: TQRPreview): string;
begin
	Result := 'Página: ' + IntToStr(Report.PageNumber) + ' / ' + IntToStr(Report.QRPrinter.PageCount);
end;

procedure TfrmPreview.btnZoomPageClick(Sender: TObject);
begin
  qrprvwPadrao.ZoomToFit;
  txtZoom.Caption := IntToStr(qrprvwPadrao.Zoom) + '%';
end;

procedure TfrmPreview.btnZoomFitClick(Sender: TObject);
begin
  qrprvwPadrao.ZoomToWidth;
  txtZoom.Caption := IntToStr(qrprvwPadrao.Zoom) + '%';
end;

procedure TfrmPreview.btnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
  frmPreview := Nil;
end;

procedure TfrmPreview.btnImprimirClick(Sender: TObject);
begin
  qrprvwPadrao.QRPrinter.PrintSetup;
  qrprvwPadrao.QRPrinter.PrinterIndex := Printer.PrinterIndex;
  if qrprvwPadrao.QRPrinter.Master.Tag = 0 then
  	qrprvwPadrao.QRPrinter.Print;
end;

procedure TfrmPreview.btnSetupClick(Sender: TObject);
begin
	qrprvwPadrao.QRPrinter.PrintSetup;
end;

procedure TfrmPreview.btnExportarClick(Sender: TObject);
  var fileName: string; Cur: TCursor; Filtro: TQRCSVFilter;
begin
	dlgSaveDialog.FileName := qrprvwPadrao.QRPrinter.Title;
	if dlgSaveDialog.Execute then
  begin
    Filtro := TQRCSVFilter.Create(Self);
    Filtro.Separator := ';';

    Cur := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    fileName := ChangeFileExt(dlgSaveDialog.FileName, '');
    Case dlgSaveDialog.FilterIndex of
      1: qrprvwPadrao.QRPrinter.ExportToFilter(TQRXLSFilter.Create(fileName + '.xls'));
      2: qrprvwPadrao.QRPrinter.ExportToFilter(TQRRTFExportFilter.Create(fileName + '.rtf'));
      3: qrprvwPadrao.QRPrinter.ExportToFilter(TQRPDFDocumentFilter.Create(fileName + '.pdf'));
      4: qrprvwPadrao.QRPrinter.ExportToFilter(TQRAsciiExportFilter.Create(fileName + '.txt'));
      5: qrprvwPadrao.QRPrinter.ExportToFilter(TQRGHTMLDocumentFilter.Create(fileName + '.html'));
      6: qrprvwPadrao.QRPrinter.ExportToFilter(TQRWMFExportFilter.Create(fileName + '.wmf'));
      7: qrprvwPadrao.QRPrinter.ExportToFilter(TQRCommaSeparatedFilter.Create(fileName + '.csv'));
    End;
    Screen.Cursor := Cur;
    Filtro.Free;
	end;
end;

procedure TfrmPreview.AcertaPaginas;
begin
	pnlBottom.Caption := 'Página: ' + IntToStr(qrprvwPadrao.PageNumber) + ' / ' + IntToStr(qrprvwPadrao.QRPrinter.PageCount);
	txtPagina.Caption := IntToStr(qrprvwPadrao.PageNumber) + ' / ' + IntToStr(qrprvwPadrao.QRPrinter.PageCount);
end;

end.
