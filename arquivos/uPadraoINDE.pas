unit uPadraoINDE;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, DB,
  ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractTable, ExtCtrls;

type
  TfPadraoINDE = class(TForm)
    btNovo: TBitBtn;
    btExcluir: TBitBtn;
    btSalvar: TBitBtn;
    btVoltar: TBitBtn;
    qyCampo: TZQuery;
    dsCampo: TDataSource;
    dbINDE: TDBGrid;
    edNomeCampo: TDBEdit;
    edCaractere: TDBEdit;
    cbTipoCampo: TDBComboBox;
    cbRequisito: TDBComboBox;
    cbCamada: TDBLookupComboBox;
    dsCamada: TDataSource;
    qyCamada: TZQuery;
    btNova: TBitBtn;
    cbSecao: TDBLookupComboBox;
    dsSecao: TDataSource;
    qySecao: TZQuery;
    painelCampo: TPanel;
    lbTipo: TLabel;
    lbNome: TLabel;
    lbCaractere: TLabel;
    lbRequisito: TLabel;
    painelCamada: TPanel;
    lbSecao: TLabel;
    lbNomeCamada: TLabel;
    procedure btNovaClick(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbCamadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPadraoINDE: TfPadraoINDE;

implementation

uses udmINDE, uCriacaoCamada;

{$R *.dfm}

procedure TfPadraoINDE.FormShow(Sender: TObject);
begin
  qySecao.Active := true;
  qyCamada.Active := true;
  {qyCampo.Active := true;
  qyCampo.Refresh;
  qyCampo.Append;}
end;

procedure TfPadraoINDE.cbCamadaClick(Sender: TObject);
begin
  qyCampo.Active := true;
  qyCampo.Refresh;
  qyCampo.Append;
end;

procedure TfPadraoINDE.btNovaClick(Sender: TObject);
begin
with TfCriacaoCamada.Create(Self) do
  begin
  ShowModal;
  end;
end;

procedure TfPadraoINDE.btVoltarClick(Sender: TObject);
begin
  close;
end;

procedure TfPadraoINDE.btSalvarClick(Sender: TObject);
  begin
    if qyCampo.state in [dsEdit, dsInsert] then
    qyCampo.FieldByName('cdCamada').AsInteger := qyCamada.FieldByName('cdCamada').AsInteger;
    qyCampo.Post;
    qyCampo.Refresh;
    qyCampo.Append;
  end;

end.
