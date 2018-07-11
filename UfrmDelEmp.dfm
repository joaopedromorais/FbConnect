object frmDelEmp: TfrmDelEmp
  Left = 0
  Top = 0
  Caption = 'Dele'#231#227'o de Empresa'
  ClientHeight = 143
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 10
    Top = 4
    Caption = ' &C'#243'digo da Empresa'
    TabOrder = 0
    Height = 44
    Width = 115
    object cedCodEmp: TcxCurrencyEdit
      Left = 10
      Top = 16
      Properties.DisplayFormat = '#'
      TabOrder = 0
      OnKeyPress = cedCodEmpKeyPress
      Width = 95
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 131
    Top = 4
    Caption = ' &Nome da Empresa'
    TabOrder = 1
    Height = 44
    Width = 279
    object edNomEmp: TEdit
      Left = 10
      Top = 16
      Width = 259
      Height = 21
      TabOrder = 0
    end
  end
  object bteBuscar: TButton
    Left = 8
    Top = 96
    Width = 117
    Height = 33
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = bteBuscarClick
  end
  object bteDelEmp: TButton
    Left = 283
    Top = 96
    Width = 117
    Height = 33
    Caption = 'Deletar'
    TabOrder = 3
    OnClick = bteDelEmpClick
  end
  object FdProcedure: TFDStoredProc
    Connection = frmPrincipal.fdConexao
    Left = 223
    Top = 72
  end
end
