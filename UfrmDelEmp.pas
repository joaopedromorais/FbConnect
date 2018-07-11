unit UfrmDelEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.StdCtrls,
  cxGroupBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxTextEdit, cxCurrencyEdit, Vcl.Buttons;

type
  TfrmDelEmp = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    edNomEmp: TEdit;
    bteBuscar: TButton;
    FdProcedure: TFDStoredProc;
    cedCodEmp: TcxCurrencyEdit;
    bteDelEmp: TButton;
    procedure bteBuscarClick(Sender: TObject);
    procedure bteDelEmpClick(Sender: TObject);
    procedure cedCodEmpKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
    { Public declarations }
  end;

var
  frmDelEmp: TfrmDelEmp;

implementation

uses
    UfrmPrincipal;

{$R *.dfm}

procedure TfrmDelEmp.bteBuscarClick(Sender: TObject);
  var
    qry:    TFDQuery;
    NomEmp: String;
    Count:  Integer;
begin
  qry := TFDQuery.Create(Self);
  try
   if cedCodEmp.Text = '' then
  begin
    ShowMessage('Informe o Código da Empresa!');
    abort
  end;
   qry.Connection := frmPrincipal.fdConexao;

   qry.Sql.Clear;
   qry.Sql.Add('SELECT COUNT(CODEMP) AS CONTADOR FROM TBLEMP WHERE CODEMP = :iCodEmpg');
   qry.Open;
   Count := qry.FieldByName('CONTADOR').AsInteger;
   if Count = 0 then
   begin
    ShowMessage('Código de Empresa inexistente!');
   end;
   qry.Sql.Clear;
   qry.Sql.Add('SELECT RAZSOCEMP FROM TBLEMP WHERE CODEMP = :iCodEmpg');
   qry.Params.ParamByName('iCodEmpg').AsInteger := StrToInt(cedCodEmp.Text);
   qry.Open;
   NomEmp := qry.FieldByName('RAZSOCEMP').AsString;
   edNomEmp.Text := NomEmp;
  finally
   qry.Free;
  end;
end;

procedure TfrmDelEmp.bteDelEmpClick(Sender: TObject);
begin
  FdProcedure.StoredProcName     :=  'PRC_DELEMP';
  FdProcedure.Prepare;
  FdProcedure.Params[ 0 ].VALUE  := cedCodEmp.Value;
  FdProcedure.ExecProc;
end;

procedure TfrmDelEmp.cedCodEmpKeyPress(Sender: TObject; var Key: Char);
begin
  if(key = #8)then
  begin
   edNomEmp.Clear;
  end;
end;

procedure TfrmDelEmp.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if(Key = #13)then
  begin
   bteBuscarClick(Self);
  end;
end;

end.
