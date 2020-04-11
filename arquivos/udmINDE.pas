unit udmINDE;

interface

uses
  SysUtils, Classes, ZConnection;

type
  TdmINDE = class(TDataModule)
    zConexao: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmINDE: TdmINDE;

implementation

{$R *.dfm}


end.
