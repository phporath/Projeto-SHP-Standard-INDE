unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfSobre = class(TForm)
    memoSobre: TMemo;
    btVoltar: TBitBtn;
    procedure btVoltarClick(Sender: TObject);
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSobre: TfSobre;

implementation

{$R *.dfm}


procedure TfSobre.btVoltarClick(Sender: TObject);
begin
  close;
end;

end.
