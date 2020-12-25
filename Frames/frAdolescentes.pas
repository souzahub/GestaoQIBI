unit frAdolescentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  uniGUIBaseClasses, uniImageList, uniButton, uniBitBtn, UniFSButton, uniEdit,
  uniPanel, uniLabel, uniBasicGrid, uniDBGrid, uniPageControl,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TframeAdolescentes = class(TUniFrame)
    FDQueryAdolescentes: TFDQuery;
    PnUsuario: TUniPanel;
    PageCadastro: TUniPageControl;
    Tab1: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    PnlCrud: TUniPanel;
    UniLabel1: TUniLabel;
    cPanel1: TUniContainerPanel;
    EdPesquisar: TUniEdit;
    smLimpar: TUniFSButton;
    UniLabel2: TUniLabel;
    UniNativeImageList1: TUniNativeImageList;
    dsAdolescentes: TDataSource;
    procedure EdPesquisarChange(Sender: TObject);
    procedure smLimparClick(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure TframeAdolescentes.EdPesquisarChange(Sender: TObject);
begin
       // pesquisa dinamica na tabela Usuario
  FDQueryAdolescentes.SQL.Clear;
  FDQueryAdolescentes.SQL.Add('select * from CAD_MEMBROS where CLASSIFICACAO=''ADOLESCENTE''');
  FDQueryAdolescentes.SQL.Add('and (NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  FDQueryAdolescentes.SQL.Add(')order by NOME');
  FDQueryAdolescentes.Open;
end;

procedure TframeAdolescentes.smLimparClick(Sender: TObject);
begin
  EdPesquisar.Clear;
  EdPesquisarChange(Sender);
end;

procedure TframeAdolescentes.UniFrameReady(Sender: TObject);
begin
  FDQueryAdolescentes.Open();
end;

end.
