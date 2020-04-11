unit uCriacaoCamada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfCriacaoCamada = class(TForm)
    edCamada: TDBEdit;
    qyCamada: TZQuery;
    dsCamada: TDataSource;
    btAdicionar: TBitBtn;
    btExcluir: TBitBtn;
    btSalvar: TBitBtn;
    btVoltar: TBitBtn;
    dbCamada: TDBGrid;
    edCodINDE: TDBEdit;
    lcSecao: TDBLookupComboBox;
    dsSecao: TDataSource;
    qySecao: TZQuery;
    painelCamada: TPanel;
    lbCodINDE: TLabel;
    lbCamada: TLabel;
    painelCampo2: TPanel;
    painelBotoes: TPanel;
    dsCamadaGrid: TDataSource;
    qyCamadaGrid: TZQuery;
    Panel1: TPanel;
    lbSecao: TLabel;
    procedure btVoltarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCriacaoCamada: TfCriacaoCamada;

implementation

uses udmINDE;

{$R *.dfm}

procedure TfCriacaoCamada.FormShow(Sender: TObject);
begin
  qyCamada.ShowRecordTypes;
  qySecao.Active := true;
end;

procedure TfCriacaoCamada.btVoltarClick(Sender: TObject);
begin
  close;
end;

procedure TfCriacaoCamada.btSalvarClick(Sender: TObject);
begin
  if qyCamada.state in [dsEdit, dsInsert] then
      qyCamada.FieldByName('cdSecao').AsInteger := qySecao.FieldByName('cdSecao').AsInteger;
      qyCamada.Post;
      qyCamada.Refresh;
      qyCamada.Append;
end;

procedure TfCriacaoCamada.btExcluirClick(Sender: TObject);
begin
  qyCamada.Delete;
end;


procedure TfCriacaoCamada.btAdicionarClick(Sender: TObject);
begin
  //qySecao.Active := true;
  qyCamada.Active := true;
  qyCamada.Append;
  lcSecao.Enabled := true;
  edCamada.Enabled := true;
  edCodINDE.Enabled := true;
end;










end.
