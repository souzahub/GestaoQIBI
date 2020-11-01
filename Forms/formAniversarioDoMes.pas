unit formAniversarioDoMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, Data.DB, uniImageList, uniButton, uniBitBtn, UniFSButton,
  uniMultiItem, uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client ;

type
  TforAnivMEs = class(TUniForm)
    pnPrincipal: TUniPanel;
    UniPanel1: TUniPanel;
    pnlMes: TUniPanel;
    dsAniversarioMes: TDataSource;
    UniFSButton1: TUniFSButton;
    UniNativeImageList1: TUniNativeImageList;
    UniContainerPanel1: TUniContainerPanel;
    UniDBGrid2: TUniDBGrid;
    FDQueryAniver: TFDQuery;
    UniPanel2: TUniPanel;
    ComboBox1: TUniComboBox;
    procedure UniFormCreate(Sender: TObject);
    procedure FDQueryAniverFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function forAnivMEs: TforAnivMEs;

var
  MesFiltrado : string; // var procedure para data

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function forAnivMEs: TforAnivMEs;
begin
  Result := TforAnivMEs(UniMainModule.GetFormInstance(TforAnivMEs));
end;

procedure TforAnivMEs.ComboBox1CloseUp(Sender: TObject);
begin
     pnlMes.Caption := ComboBox1.Text;

  case ComboBox1.ItemIndex of

     0: MesFiltrado :='01';
     1: MesFiltrado :='02';
     2: MesFiltrado :='03';
     3: MesFiltrado :='04';
     4: MesFiltrado :='05';
     5: MesFiltrado :='06';
     6: MesFiltrado :='07';
     7: MesFiltrado :='08';
     8: MesFiltrado :='09';
     9: MesFiltrado :='10';
     10:MesFiltrado :='11';
     11:MesFiltrado :='12';

  end;

  FDQueryAniver.Close;
  FDQueryAniver.Filtered := False;
  FDQueryAniver.Open;
  FDQueryAniver.Filtered := True;
end;

procedure TforAnivMEs.FDQueryAniverFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
  var
  dia, mes, ano : Word;
begin

  if FDQueryAniver.RecordCount < 0 then
   Abort else
  Accept :=  False;
  DecodeDate(FDQueryAniver.FieldByName('DT_NASCIMENTO').AsDateTime, dia, mes, ano);

  if mes = StrToInt (MesFiltrado) then
  Accept := True

end;


procedure TforAnivMEs.UniFormCreate(Sender: TObject);
begin
//  FDAniversarioDoMEs.Open();
  ComboBox1.Text := '';
end;

procedure TforAnivMEs.UniFSButton1Click(Sender: TObject);
begin
  Close;
end;

end.
