unit frInfantis;

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
  TframeInfantis = class(TUniFrame)
    FDQueryInfantis: TFDQuery;
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
    dsInfantis: TDataSource;
    procedure UniFrameReady(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure smLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure TframeInfantis.EdPesquisarChange(Sender: TObject);
begin
         // pesquisa dinamica na tabela Usuario
  FDQueryInfantis.SQL.Clear;
  FDQueryInfantis.SQL.Add('select * from CAD_MEMBROS where CLASSIFICACAO=''INFANTIL''');
  FDQueryInfantis.SQL.Add('and (NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  FDQueryInfantis.SQL.Add(')order by NOME');
  FDQueryInfantis.Open;
end;

procedure TframeInfantis.smLimparClick(Sender: TObject);
begin
  EdPesquisar.Clear;
  EdPesquisarChange(Sender);
end;

procedure TframeInfantis.UniFrameReady(Sender: TObject);
begin
  FDQueryInfantis.Open();
end;

end.
