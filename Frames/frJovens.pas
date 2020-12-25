unit frJovens;

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
  TframeJovens = class(TUniFrame)
    FDQueryJovens: TFDQuery;
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
    dsJovens: TDataSource;
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



procedure TframeJovens.EdPesquisarChange(Sender: TObject);
begin
      // pesquisa dinamica
  FDQueryJovens.SQL.Clear;
  FDQueryJovens.SQL.Add('select * from CAD_MEMBROS where CLASSIFICACAO=''JOVENS''');
  FDQueryJovens.SQL.Add('and (NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  FDQueryJovens.SQL.Add(')order by NOME');
  FDQueryJovens.Open;
end;

procedure TframeJovens.smLimparClick(Sender: TObject);
begin
  EdPesquisar.Clear;
  EdPesquisarChange(Sender);
end;

procedure TframeJovens.UniFrameReady(Sender: TObject);
begin
   FDQueryJovens.Open();
end;

end.
