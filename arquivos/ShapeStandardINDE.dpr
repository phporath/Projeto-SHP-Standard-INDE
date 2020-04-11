program ShapeStandardINDE;

uses
  Forms,
  uMenuPrincipal in 'uMenuPrincipal.pas' {fMenuPrincipal},
  udmINDE in 'udmINDE.pas' {dmINDE: TDataModule},
  uPadraoINDE in 'uPadraoINDE.pas' {fPadraoINDE},
  uCamada in 'uCamada.pas' {fCamada},
  uCriacaoCamada in 'uCriacaoCamada.pas' {fCriacaoCamada},
  uJuncaoCampo in 'uJuncaoCampo.pas' {fJuncaoCamada},
  uSobre in 'uSobre.pas' {fSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMenuPrincipal, fMenuPrincipal);
  Application.CreateForm(TdmINDE, dmINDE);
  Application.CreateForm(TfPadraoINDE, fPadraoINDE);
  Application.CreateForm(TfCamada, fCamada);
  Application.CreateForm(TfCriacaoCamada, fCriacaoCamada);
  Application.CreateForm(TfJuncaoCamada, fJuncaoCamada);
  Application.CreateForm(TfSobre, fSobre);
  Application.Run;
end.
