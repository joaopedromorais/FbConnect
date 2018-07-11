object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FbConnect'
  ClientHeight = 308
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = bteConectarKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object gpbCaminhoTronConfig: TcxGroupBox
    Left = 22
    Top = 9
    Caption = ' &Caminho do Tron Config  '
    TabOrder = 0
    Height = 50
    Width = 450
    object bteCaminhoTronConfig: TcxButtonEdit
      Left = 17
      Top = 17
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = bteCaminhoBancoPropertiesButtonClick
      TabOrder = 0
      Width = 420
    end
  end
  object bteConectar: TcxButton
    Left = 22
    Top = 261
    Width = 85
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = bteConectarClick
    OnKeyPress = bteConectarKeyPress
  end
  object mmBuscaDados: TMemo
    Left = 22
    Top = 232
    Width = 62
    Height = 11
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 22
    Top = 146
    Width = 450
    Height = 109
    Caption = ' &Informa'#231#245'es do Banco '
    TabOrder = 3
    object cxDBVerticalGrid1: TcxDBVerticalGrid
      Left = 17
      Top = 18
      Width = 420
      Height = 75
      OptionsView.PaintStyle = psDelphi
      OptionsView.GridLineColor = clAppWorkSpace
      OptionsView.RowHeaderWidth = 108
      Navigator.Buttons.CustomButtons = <>
      TabOrder = 0
      DataController.DataSource = DataSource1
      DataController.GridMode = True
      Version = 1
      object cxDBVersãoBD: TcxDBEditorRow
        Properties.Caption = 'Vers'#227'o Firebird    '
        Properties.HeaderAlignmentHorz = taCenter
        Properties.Hint = 'Vers'#227'o do Firebird'
        Properties.DataBinding.FieldName = 'VersaoFB'
        ID = 0
        ParentID = -1
        Index = 0
        Version = 1
      end
      object cxDBServidor: TcxDBEditorRow
        Properties.Caption = 'Servidor     '
        Properties.HeaderAlignmentHorz = taCenter
        Properties.DataBinding.FieldName = 'Servidor'
        Properties.Options.ShowEditButtons = eisbNever
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object cxDBPort: TcxDBEditorRow
        Properties.Caption = 'Porta     '
        Properties.HeaderAlignmentHorz = taCenter
        Properties.DataBinding.FieldName = 'Porta'
        Properties.Options.ShowEditButtons = eisbNever
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object cxDBVersaoSys: TcxDBEditorRow
        Properties.Caption = 'Vers'#227'o do Banco   '
        Properties.HeaderAlignmentHorz = taCenter
        Properties.DataBinding.FieldName = 'Versao'
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
    end
  end
  object bteDesconectar: TcxButton
    Left = 387
    Top = 261
    Width = 85
    Height = 25
    Caption = 'Desconectar'
    Enabled = False
    TabOrder = 4
    OnClick = bteDesconectarClick
  end
  object bteBackupFB: TcxButton
    Left = 112
    Top = 261
    Width = 85
    Height = 25
    Caption = 'Backup'
    Enabled = False
    TabOrder = 5
    OnClick = bteBackupFBClick
  end
  object bteRestore: TcxButton
    Left = 204
    Top = 261
    Width = 85
    Height = 25
    Caption = 'Restore'
    Enabled = False
    TabOrder = 6
    OnClick = bteRestoreClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 22
    Top = 79
    Caption = ' &Caminho do Banco de Vers'#227'o  '
    TabOrder = 7
    Height = 50
    Width = 450
    object bteCaminhoComparer: TcxButtonEdit
      Left = 18
      Top = 17
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = bteCaminhoBancoPropertiesButtonClick
      TabOrder = 0
      Width = 420
    end
  end
  object bteDbComparer: TcxButton
    Left = 296
    Top = 261
    Width = 85
    Height = 25
    Caption = 'DbComparer'
    Enabled = False
    TabOrder = 8
    OnClick = bteDbComparerClick
  end
  object opnBuscarBanco: TOpenDialog
    InitialDir = 'C:\Program Files (x86)\Tron'
    Left = 328
    Top = 50
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 382
    Top = 125
  end
  object DataSource1: TDataSource
    Left = 271
    Top = 50
  end
  object FDQuery1: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT '#39#39'||rdb$get_context('#39'SYSTEM'#39', '#39'ENGINE_VERSION'#39') '
      'as Versao from rdb$database;')
    Left = 328
    Top = 125
    object FDQuery1VERSAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 197
    Top = 53
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 391
    Top = 49
  end
  object FdBackup: TFDIBBackup
    DriverLink = FDPhysFBDriver
    UserName = 'SYSDBA'
    Password = 'masterkey'
    OnProgress = FdBackupProgress
    Verbose = True
    Left = 204
    Top = 123
  end
  object FDPhysFBDriver: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'fbclient'
    Left = 452
    Top = 47
  end
  object FdRestore: TFDIBRestore
    DriverLink = FDPhysFBDriver
    UserName = 'sysdba'
    Password = 'masterkey'
    OnProgress = FdRestoreProgress
    Verbose = True
    Options = [roReplace]
    Left = 426
    Top = 125
  end
  object MainMenu1: TMainMenu
    Left = 19
    Top = 103
    object Gfix1: TMenuItem
      Caption = 'Fun'#231#245'es'
      object Optimizador1: TMenuItem
        Caption = 'Optimizador'
        OnClick = Optimizador1Click
      end
      object DeleodeEmpresa1: TMenuItem
        Caption = 'Dele'#231#227'o de Empresa'
        OnClick = DeleodeEmpresa1Click
      end
    end
    object Sobre1: TMenuItem
      Caption = 'Sobre'
    end
  end
  object fdValidacao: TFDIBValidate
    OnError = fdValidacaoError
    DriverLink = FDPhysFBDriver
    Protocol = ipTCPIP
    UserName = 'sysdba'
    Password = 'masterkey'
    OnProgress = fdValidacaoProgress
    Options = [roValidateFull, roValidatePages, roMendRecords]
    Left = 267
    Top = 123
  end
end
