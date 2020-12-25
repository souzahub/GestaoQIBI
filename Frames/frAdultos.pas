unit frAdultos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniSweetAlert, uniScreenMask,
  uniGUIBaseClasses, uniImageList, uniButton, uniBitBtn, UniFSButton, uniEdit,
  uniPanel, uniLabel, uniBasicGrid, uniDBGrid, uniPageControl;

type
  TframeAdulto = class(TUniFrame)
    dsAdultos: TDataSource;
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
    FDQueryAdulto: TFDQuery;
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



procedure TframeAdulto.EdPesquisarChange(Sender: TObject);
begin
    // pesquisa dinamica
  FDQueryAdulto.SQL.Clear;
  FDQueryAdulto.SQL.Add('select * from CAD_MEMBROS where CLASSIFICACAO=''ADULTOS''');
  FDQueryAdulto.SQL.Add('and (NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  FDQueryAdulto.SQL.Add(')order by NOME');
  FDQueryAdulto.Open;
end;

procedure TframeAdulto.smLimparClick(Sender: TObject);
begin
  EdPesquisar.Clear;
  EdPesquisarChange(Sender);
end;

procedure TframeAdulto.UniFrameReady(Sender: TObject);
begin
   FDQueryAdulto.Open();
end;

end.
