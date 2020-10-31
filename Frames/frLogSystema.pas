unit frLogSystema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uDados, uniBasicGrid, uniDBGrid, uniScrollBox,
  uniEdit, uniLabel, uniGUIBaseClasses, uniPanel, Data.DB;

type
  TframeLogSys = class(TUniFrame)
    dsConulta: TDataSource;
    PnlCrud: TUniPanel;
    UniLabel1: TUniLabel;
    EdPesquisar: TUniEdit;
    UniScrollBox1: TUniScrollBox;
    UniDBGrid1: TUniDBGrid;
    procedure EdPesquisarChange(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure TframeLogSys.EdPesquisarChange(Sender: TObject);
begin
    // pesquisa dinamica na tabela LOG
  dmDados.FDQueryLogSys.SQL.Clear;
  dmDados.FDQueryLogSys.SQL.Add('select * from LOGSYS where');
  dmDados.FDQueryLogSys.SQL.Add('(LOGIN LIKE  ' +QuotedStr('%' + EdPesquisar.Text + '%'));
  dmDados.FDQueryLogSys.SQL.Add('or OPERACAO LIKE  ' +QuotedStr('%' + EdPesquisar.Text + '%'));
  dmDados.FDQueryLogSys.SQL.Add('or DIA LIKE  ' +QuotedStr('%' + EdPesquisar.Text + '%'));
  dmDados.FDQueryLogSys.SQL.Add(')order by ID desc');
  dmDados.FDQueryLogSys.Open;

end;

procedure TframeLogSys.UniFrameCreate(Sender: TObject);
begin
  EdPesquisarChange(Sender);
end;

end.
