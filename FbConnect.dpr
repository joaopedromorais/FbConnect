program FbConnect;

uses
  Vcl.Forms,
  UStringFunctions in '..\Escrita_Fiscal_2009\Projeto\Library_Tron\UStringFunctions.pas',
  UDateTimeFunctions in 'UDateTimeFunctions.pas',
  UAppConfig in '..\Library_Tron\Comuns\UAppConfig.pas',
  UfrmBacRes in 'UfrmBacRes.pas' {frmBacRes},
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UfrmDelEmp in 'UfrmDelEmp.pas' {frmDelEmp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBacRes, frmBacRes);
  Application.CreateForm(TfrmDelEmp, frmDelEmp);
  Application.Run;
end.
