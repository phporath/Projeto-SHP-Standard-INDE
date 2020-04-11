unit uJuncaoCampo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, ExtCtrls, Mask, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBTables, ADODB;

type
  TfJuncaoCamada = class(TForm)
    rgSecao: TDBRadioGroup;
    dbCamada: TDBGrid;
    btSalvar: TBitBtn;
    dsSecao: TDataSource;
    qySecao: TZQuery;
    dsCamada: TDataSource;
    qyCamada: TZQuery;
    tbDBF: TTable;
    dsDBF: TDataSource;
    btCarregar: TBitBtn;
    edCamDBF: TEdit;
    edNomDBF: TEdit;
    dsCampo: TDataSource;
    qyCampo: TZQuery;
    DBGrid2: TDBGrid;
    OpenDialog: TOpenDialog;
    CampoTeste: TDBGrid;
    tbDBFOrig: TTable;
    painelArquivo: TPanel;
    lbCamArq: TLabel;
    lbNomArq: TLabel;
    painelSecao: TPanel;
    procedure FormShow(Sender: TObject);
    procedure qyCamadaBeforeOpen(DataSet: TDataSet);
    procedure rgSecaoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCarregarClick(Sender: TObject);

  private
    procedure CopiaValores (tbOrig, tbDest: TTable);
  public
    { Public declarations }
    procedure prenchacomponente;
  end;

var
  fJuncaoCamada: TfJuncaoCamada;

implementation

uses udmINDE;

{$R *.dfm}

{ TfJuncaoCamada }

procedure TfJuncaoCamada.prenchacomponente;
begin
  qySecao.Open;
  qySecao.First;
  rgSecao.Items.Clear;
  rgSecao.Values.Clear;
  While not qySecao.Eof do
  begin
    rgSecao.Items.add(qySecao.fieldbyname('nmSecao').AsString);
    rgSecao.Values.add (qySecao.fieldbyname('cdSecao').AsString);
    qySecao.Next;
  end;
  qyCamada.Active := True;
end;

procedure TfJuncaoCamada.FormShow(Sender: TObject);
begin
  prenchacomponente;
end;

procedure TfJuncaoCamada.qyCamadaBeforeOpen(DataSet: TDataSet);
begin
  if rgSecao.ItemIndex > -1 then
    qyCamada.ParamByName('cdSecao').Value :=
      rgSecao.Values[rgSecao.ItemIndex];
end;

procedure TfJuncaoCamada.rgSecaoClick(Sender: TObject);
begin
  if (qySecao.Active) and (qyCamada.Active) then
  begin
    qyCamada.close;
    qyCamada.Open;
  end;

end;



procedure TfJuncaoCamada.btSalvarClick(Sender: TObject);
var
  i, Count: integer;
  nomeCampo: string;
  tipoCampo: string;
  tamanhoCampo: integer;
begin
    tbDBF.Active := False;
    tbDBF.DatabaseName:= edCamDBF.Text; //'C:\Users\Pedro\Desktop\Artigo';
    tbDBFOrig.DatabaseName:= edCamDBF.Text;

    tbDBF.TableName:= copy(edNomDBF.Text, 1, Length(edNomDBF.Text) - 4) + '_TMP.dbf'; //'Praca_Sul.dbf';
    tbDBFOrig.TableName:= edNomDBF.Text;

    tbDBF.TableType := ttDBase;
    tbDBFOrig.Active := True;

    tbDBF.CreateTable;

    tbDBF.FieldDefs.Update;

    qyCampo.first;
    while not qyCampo.Eof do
    begin

      if qyCampo.FieldByName('nmTipo').AsString = 'VARCHAR' then
        tbDBF.FieldDefs.Add (qyCampo.FieldValues ['nmCampo'] ,ftstring,qyCampo.FieldValues ['nuCaractere'],qyCampo.FieldValues ['requisito'])
      else if qyCampo.FieldByName('nmTipo').AsString = 'INTEGER' then
        tbDBF.FieldDefs.Add (qyCampo.FieldValues ['nmCampo'] ,ftInteger,0,qyCampo.FieldValues ['requisito'])
      else
        tbDBF.FieldDefs.Add (qyCampo.FieldValues ['nmCampo'] ,ftFloat,0,qyCampo.FieldValues ['requisito']);
      qyCampo.Next;
    end;



    tbDBF.CreateTable;
    CopiaValores(tbDBFOrig, tbDBF);
    Showmessage ('Dados gravados com sucesso!')
end;


procedure TfJuncaoCamada.btCarregarClick(Sender: TObject);
var
  mnome : string;
begin
  if OpenDialog.Execute then
  begin
    mnome := ExtractFilePath( OpenDialog.FileName);
    edCamDBF.Text := mnome;
    tbDBF.DatabaseName := mnome;
    edNomDBF.Text := ExtractFileName(OpenDialog.FileName);
    tbDBF.TableName := edNomDBF.Text;
    tbDBF.Open;
    qyCampo.Open;
  end;

end;



procedure TfJuncaoCamada.CopiaValores(tbOrig, tbDest: TTable);
var
  Cont : Integer;
begin
  if not tbDest.Active then
    tbDest.Active := True;
  tbOrig.First;
  while not tbOrig.EOF do
  begin
    tbDest.Append;
    for Cont := 0 to tbOrig.FieldDefs.Count - 1 do
      tbDest.FieldByName(tbOrig.Fields[cont].FieldName).Value := tbOrig.Fields[cont].Value;
    tbDest.Post;
    tbOrig.Next;
  end;
  tbOrig.Close;
  tbDest.Close;

  if RenameFile(tbOrig.TableName, tbOrig.TableName + '.OLD' ) then
  //showMessage('OK');
  RenameFile(tbDest.TableName, tbOrig.TableName  ); //then showMessage('OK');

end;



end.
