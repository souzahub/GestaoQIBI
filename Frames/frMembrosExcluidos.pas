unit frMembrosExcluidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uDados, uniSweetAlert, uniScreenMask,
  uniGUIBaseClasses, uniImageList, uniButton, uniBitBtn, UniFSButton,
  uniDateTimePicker, uniLabel, uniEdit, uniBasicGrid, uniDBGrid, uniPageControl,
  uniPanel, Data.DB;

type
  TframeMembrosExcluidos = class(TUniFrame)
    DataSourceMembros: TDataSource;
    PnUsuario: TUniPanel;
    PageCadastro: TUniPageControl;
    Tab1: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    Tab2: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniPanel1: TUniPanel;
    edNome: TUniEdit;
    edEndereco: TUniEdit;
    lbBaiiro: TUniLabel;
    edBairro: TUniEdit;
    UniLabel4: TUniLabel;
    edEmail: TUniEdit;
    UniLabel7: TUniLabel;
    lbNumero: TUniLabel;
    edCidade: TUniEdit;
    dtBatismo: TUniDateTimePicker;
    dtNascimento: TUniDateTimePicker;
    lbDataNascimento: TUniLabel;
    UniLabel8: TUniLabel;
    lbCidade: TUniLabel;
    lbEndereco: TUniLabel;
    lbNome: TUniLabel;
    edUf: TUniEdit;
    edNumero: TUniEdit;
    PnlCrud: TUniPanel;
    UniLabel1: TUniLabel;
    EdPesquisar: TUniEdit;
    UniNativeImageList1: TUniNativeImageList;
    UniScreenMask1: TUniScreenMask;
    UniSweetAlert1: TUniSweetAlert;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure TframeMembrosExcluidos.UniFrameCreate(Sender: TObject);
begin
  dmDados.FDMembrosExcluido.Open();
end;

end.
