unit UfrmBacRes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UfrmPrincipal,
  FireDAC.Stan.Def, FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.IBBase;

type
  TfrmBacRes = class(TForm)
    mmBR: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBacRes: TfrmBacRes;

implementation


{$R *.dfm}

end.
