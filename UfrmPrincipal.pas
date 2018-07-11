unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxGroupBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Vcl.Menus, cxButtons, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBWrapper, FireDAC.Phys.IBBase, RegularExpressions, cxLabel,
  Vcl.Grids, cxStyles, cxInplaceContainer, cxVGrid, cxDBVGrid,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, UAppConfig, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  Datasnap.DBClient, Datasnap.Provider, dbcClasses, dbcDBComparer,
  dbcDBEngine, dbcPGDatabaseExtract, Vcl.Buttons, FireDAC.Phys.ASAWrapper,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.ASA;

type
  TfrmPrincipal = class(TForm)
    opnBuscarBanco: TOpenDialog;
    gpbCaminhoTronConfig: TcxGroupBox;
    bteCaminhoTronConfig: TcxButtonEdit;
    fdConexao: TFDConnection;
    bteConectar: TcxButton;
    mmBuscaDados: TMemo;
    GroupBox1: TGroupBox;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    cxDBVerticalGrid1: TcxDBVerticalGrid;
    cxDBVersãoBD: TcxDBEditorRow;
    cxDBServidor: TcxDBEditorRow;
    cxDBPort: TcxDBEditorRow;
    cxDBVersaoSys: TcxDBEditorRow;
    FDQuery1VERSAO: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DataSetProvider1: TDataSetProvider;
    bteDesconectar: TcxButton;
    FdBackup: TFDIBBackup;
    bteBackupFB: TcxButton;
    FDPhysFBDriver: TFDPhysFBDriverLink;
    FdRestore: TFDIBRestore;
    bteRestore: TcxButton;
    cxGroupBox1: TcxGroupBox;
    bteCaminhoComparer: TcxButtonEdit;
    bteDbComparer: TcxButton;
    MainMenu1: TMainMenu;
    Gfix1: TMenuItem;
    Sobre1: TMenuItem;
    Optimizador1: TMenuItem;
    DeleodeEmpresa1: TMenuItem;
    fdValidacao: TFDIBValidate;
    procedure bteCaminhoBancoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bteConectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bteDesconectarClick(Sender: TObject);
    procedure bteBackupFBClick(Sender: TObject);
    procedure bteRestoreClick(Sender: TObject);
    procedure FdBackupProgress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure FdRestoreProgress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure bteDbComparerClick(Sender: TObject);
    procedure Optimizador1Click(Sender: TObject);
    procedure fdValidacaoProgress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure fdValidacaoError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure DeleodeEmpresa1Click(Sender: TObject);
    procedure bteConectarKeyPress(Sender: TObject; var Key: Char);
//    procedure FdBackupProgress(ASender: TFDPhysDriverService;
//      const AMessage: string);
  private
    ConfiguracaoBanco: IXMLTRONType;
    FCaminhoArquivo: String;
    FIpServer: String;
    FPort: String;
    FsVerCtrVer: String;
    FiVersao: Integer;
    function ConsultaDados(Servidor,Porta: String): TClientDataSet;
    { Private declarations }
    property CaminhoArquivo: String read FCaminhoArquivo write FCaminhoArquivo;
    property IpServer: String read FIpServer write FIpServer;
    property Port: String read FPort write FPort;
    property sVerCtrVer: String read FsVerCtrVer write FsVerCtrVer;
    property iVersao: Integer read FiVersao write FiVersao;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;


implementation

uses
 UStringFunctions, UCdsFunctions, UfrmBacRes, UfrmDelEmp;

{$R *.dfm}



procedure TfrmPrincipal.bteBackupFBClick(Sender: TObject);
var
  tHoraBackup, tHoraRestore : TTime;
  lblHora: String;
begin
  tHoraBackup := Time;

  try
   FdBackup.Verbose := Application.MessageBox('Deseja ver o log do backup?','Confirme',MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_YES;

   if FdBackup.Verbose then
    begin
     frmBacRes.Show;
     frmBacRes.Caption := 'Fb Connect - Backup';
    end;

   fdConexao.Connected := False;

   FdBackup.DriverLink := FDPhysFBDriver;
   FdBackup.Database   := Self.CaminhoArquivo;
   FdBackup.Host       := Format('%s/%s', [Self.IpServer, Self.Port]);
   FdBackup.BackupFiles.Clear;
   FdBackup.BackupFiles.Add (Format ('%s',[ExtractFilePath(Self.CaminhoArquivo)])+'\TRONCG.backup');
   FdBackup.Backup;

   if Application.MessageBox('Backup Realizado Com Sucesso. Deseja iniciar processo de restauração?'+#13#13+'(OBS: Todos os Usuários devem estar fora do sistema)','Confirme',MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON2) = ID_YES then
    begin
     tHoraRestore := Time;

     try
      if FdBackup.Verbose then
       begin
        frmBacRes.mmBR.Clear;
        frmBacRes.Show;
        frmBacRes.Caption := 'Fb Connect - Restore';
       end;

      FDPhysFBDriver.DriverID  := 'FB';
      FDPhysFBDriver.VendorLib := 'fbclient';

      FdRestore.DriverLink := FDPhysFBDriver;
      FdRestore.UserName   := 'SYSDBA';
      FdRestore.Password   := 'masterkey';
      FdRestore.Host       := Format('%s/%s', [Self.IpServer, Self.Port]);
      FdRestore.Database   := Format ('%s',[ExtractFilePath(Self.CaminhoArquivo)])+'\TRONCG_Restaurado.idb';

      FdRestore.BackupFiles.Add (Format ('%s',[ExtractFilePath(Self.CaminhoArquivo)])+'\TRONCG.backup');
      FdRestore.Restore;
     finally
      tHoraRestore := Time - tHoraRestore;
      lblHora := Format('%s', [FormatDateTime('hh:nn:ss', tHoraRestore)]);

      ShowMessage('Backup Restaurado com sucesso! Tempo Gasto: ' +lblHora);

      if FdBackup.Verbose then
       frmBacRes.Close();

      if not bteRestore.Enabled then
       bteRestore.Enabled := False;
     end;
    end
   else if FdBackup.Verbose then frmBacRes.Close();
  finally
   tHoraBackup   := Time - tHoraBackup;
   lblHora := Format('%s', [FormatDateTime('hh:nn:ss', tHoraBackup)]);

   ShowMessage('Backup realizado com sucesso! Tempo Gasto: ' + lblHora);

   if not bteRestore.Enabled then
    bteRestore.Enabled := True;
  end;
end;

procedure TfrmPrincipal.bteCaminhoBancoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if opnBuscarBanco.Execute then
   begin
    bteCaminhoTronConfig.Text := opnBuscarBanco.FileName;
    ConfiguracaoBanco := LoadTRON(opnBuscarBanco.FileName);
   end;
end;

procedure TfrmPrincipal.bteConectarClick(Sender: TObject);
  var Host: TStringList;
begin
  if not FileExists(bteCaminhoTronConfig.Text) then
   begin
    ShowMessage('Informe o arquivo Tron.config!');
    abort;
   end
  else
   begin
    if ConfiguracaoBanco.IsConfigured then
     begin
       Self.CaminhoArquivo := ConfiguracaoBanco.ARQUIVO;
       Host     := TStringFunctions.Aparse(ConfiguracaoBanco.SERVIDOR, '/');
       try
        IpServer := Host[0];
        Port     := Host[1];
       finally
        Host.Free;
       end;
     end;
    fdConexao.Connected := False;
    fdConexao.Params.Clear;
    fdConexao.Params.Add('DriverID=FB');
    fdConexao.Params.Add('Server='+Self.IpServer);
    fdConexao.Params.Add('Port='+Self.Port);
    fdConexao.Params.Add('Database='+Self.CaminhoArquivo);
    fdConexao.Params.Add('CharacterSet=WIN1252');
    fdConexao.Params.Add('User_Name=SYSDBA');
    fdConexao.Params.Add('Password=masterkey');
    fdConexao.Connected := True;
   end;
  if fdConexao.Connected = True then
   begin
    ShowMessage('Banco Conectado com Sucesso!');
    Self.ConsultaDados(Self.IpServer,Self.Port);

    bteDbComparer.Enabled                := True;
    bteBackupFB.Enabled                  := True;
    bteConectar.Enabled                  := False;
    bteDesconectar.Enabled               := True;
    bteCaminhoComparer.Enabled           := True;
   end;
end;

procedure TfrmPrincipal.bteConectarKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
    bteConectarClick(Sender);
   end;
end;

procedure TfrmPrincipal.bteDbComparerClick(Sender: TObject);
begin
  if bteCaminhoComparer.Text = '' then
  begin
    ShowMessage('Informe o Caminho do Banco da Versão '+Format('%s-%d.', [sVerCtrVer,iVersao]));
  end;
end;

procedure TfrmPrincipal.bteDesconectarClick(Sender: TObject);
begin
 if fdConexao.Connected = True then
  begin
    fdConexao.Connected := False;
  end;
 if fdConexao.Connected = False then
  ShowMessage('Banco Desconectado com Sucesso');
  bteBackupFB.Enabled             := False;
  bteRestore.Enabled              := False;
  bteDesconectar.Enabled          := False;
  bteConectar.Enabled             := True;
  bteCaminhoComparer.Enabled      := False;
end;

procedure TfrmPrincipal.bteRestoreClick(Sender: TObject);
  var sPort: Integer;
      tHora: TTime;
      lblHora: String;
begin
  try
    frmBacRes.Show;
    frmBacRes.Caption := ('Fb Connect - Restore');
    tHora := Time;

    sPort := StrToInt(Self.Port);
    FdRestore.Host := Format('%s/%d', [Self.IpServer, sPort]);
    FdRestore.Database := (Format ('%s',[ExtractFilePath(Self.CaminhoArquivo)])+'\TRONCG_Restaurado.idb');
    FdRestore.BackupFiles.add (Format ('%s',[ExtractFilePath(Self.CaminhoArquivo)])+'\TRONCG.backup');
    FdRestore.Restore;
  finally
    tHora := Time - tHora;
    lblHora := Format('%s', [FormatDateTime('hh:nn:ss', tHora)]);
    ShowMessage('Restore realizado com sucesso! Tempo Gasto: ' +lblHora);
    frmBacRes.Close();
    bteRestore.Enabled := False;
  end;
end;

procedure TfrmPrincipal.FdBackupProgress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  frmBacRes.mmBR.Lines.Add(AMessage);
end;

procedure TfrmPrincipal.FdRestoreProgress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  frmBacRes.mmBR.Lines.Add(AMessage);
end;

procedure TfrmPrincipal.fdValidacaoError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  frmBacRes.mmBR.Lines.Add(AException.Message);
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.fdValidacaoProgress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  frmBacRes.mmBR.Lines.Add(AMessage);
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ConfiguracaoBanco := NewTRON;
end;

procedure TfrmPrincipal.Optimizador1Click(Sender: TObject);
  var
     sPort: Integer;
begin
  fdConexao.Connected := False;
  sPort := StrToInt(Self.Port);
  frmBacRes.mmBR.Clear();
  frmBacRes.Show;
  frmBacRes.Caption := 'Validação';

  fdValidacao.Host       := Format('%s/%d', [Self.IpServer, sPort]);
  fdValidacao.Database   := Self.CaminhoArquivo;

  frmBacRes.mmBR.Lines.Add('Iniciando primeira validação no banco de dados. Aguarde...');
  fdValidacao.CheckOnly;
  frmBacRes.mmBR.Lines.Add('Primeira validação realizada com sucesso!');
  frmBacRes.mmBR.Lines.Add('');

  frmBacRes.mmBR.Lines.Add('Iniciando segunda validação no banco de dados. Aguarde...');
  fdValidacao.Repair;
  frmBacRes.mmBR.Lines.Add('Segunda validação realizada com sucesso!');
  frmBacRes.mmBR.Lines.Add('');
  frmBacRes.mmBR.Lines.Add('Validação Concluída!');
end;

function TfrmPrincipal.ConsultaDados(Servidor,Porta: String): TClientDataSet;
var
  qry: TFDQuery;
  dataSetProvider: TDataSetProvider;
  cdsConsultaDados: TClientDataSet;
  sVersaoFB: String;
begin
  qry := TFDQuery.Create(Self);
  dataSetProvider := TDataSetProvider.Create(Self);
  Result := TClientDataSet.Create(Self);

  try
   qry.Connection := fdConexao;

   qry.Sql.Clear;
   qry.Sql.Add('SELECT ''''||rdb$get_context(''SYSTEM'', ''ENGINE_VERSION'') as VersaoFB from rdb$database;');
   qry.Open;
   sVersaoFB := qry.FieldByName('VersaoFB').AsString;

   qry.Sql.Clear;
   qry.Sql.Add('SELECT FIRST 1 (VERCTRVER),COUNT(VERCTRVER) AS VERSAO FROM TBLCTRVER GROUP BY VERCTRVER ORDER BY VERCTRVER DESC');
   qry.Open;
   sVerCtrVer := qry.FieldByName('VERCTRVER').AsString;
   iVersao    := qry.FieldByName('VERSAO').AsInteger;

   if iVersao > 1 then
    iVersao := (iVersao - 1);


   cdsConsultaDados := TClientDataSet.Create(Self);

   TCdsFunctions.AddFields(cdsConsultaDados, 'VersaoFB', TStringField, fkData, 200);
   TCdsFunctions.AddFields(cdsConsultaDados, 'Servidor', TStringField, fkData, 200);
   TCdsFunctions.AddFields(cdsConsultaDados, 'Porta', TStringField, fkData, 100);
   TCdsFunctions.AddFields(cdsConsultaDados, 'Versao', TStringField, fkData, 100);

   cdsConsultaDados.CreateDataSet;

   CdsConsultaDados.Append;

   cdsConsultaDados.FieldByName('VersaoFB').AsString   := sVersaoFB;
   cdsConsultaDados.FieldByName('Servidor').AsString   := Servidor;
   cdsConsultaDados.FieldByName('Porta').AsString      := Porta;
   cdsConsultaDados.FieldByName('Versao').AsString     := Format('%s-%d', [sVerCtrVer, iVersao]);

   cdsConsultaDados.Post;
   DataSource1.DataSet := cdsConsultaDados;

//   dataSetProvider.DataSet := qry;
//   Result.ProviderName := dataSetProvider.Name;
//   Result.Open;
  finally
   Result.ProviderName := '';
   dataSetProvider.Free;
   qry.Free;
  end;
end;

procedure TfrmPrincipal.DeleodeEmpresa1Click(Sender: TObject);
begin
  frmDelEmp.Show;
end;

end.
