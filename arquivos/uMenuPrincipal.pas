unit uMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfMenuPrincipal = class(TForm)
    btPadronizar: TButton;
    btSair: TButton;
    btCamada: TButton;
    btSobre: TBitBtn;
    lbNome: TLabel;
    lnEmail: TLabel;
    procedure btCampoClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btPadronizarClick(Sender: TObject);
    procedure btSobreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuPrincipal: TfMenuPrincipal;

implementation

uses uCamada, udmINDE, uPadraoINDE, uJuncaoCampo, uSobre;

{$R *.dfm}

procedure TfMenuPrincipal.btCampoClick(Sender: TObject);
begin
  with TfPadraoINDE.Create (Self) do
    ShowModal;
end;

procedure TfMenuPrincipal.btSairClick(Sender: TObject);
begin
  Halt;
end;

procedure TfMenuPrincipal.btPadronizarClick(Sender: TObject);
begin
  with TfJuncaoCamada.Create(Self) do
    ShowModal;
end;

procedure TfMenuPrincipal.btSobreClick(Sender: TObject);
begin
  with TfSobre.Create(Self) do
    ShowModal
end;



end.
