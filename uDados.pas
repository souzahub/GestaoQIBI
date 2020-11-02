unit uDados;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, formAniversarioDoMes ;

type
  TdmDados = class(TDataModule)
    FDUsuario: TFDQuery;
    FDQueryAuxiliar: TFDQuery;
    FDQueryLogSys: TFDQuery;
    FDCadMembros: TFDQuery;
    FDQueryLogSysID: TIntegerField;
    FDQueryLogSysDIA: TSQLTimeStampField;
    FDQueryLogSysLOGIN: TStringField;
    FDQueryLogSysOPERACAO: TStringField;
    FDQueryLogSysOCORRENCIA: TStringField;
    FDUsuarioID: TIntegerField;
    FDUsuarioPERFIL: TStringField;
    FDUsuarioNOME: TStringField;
    FDUsuarioLOGIN: TStringField;
    FDUsuarioSENHA: TStringField;
    FDCadMembrosID: TIntegerField;
    FDCadMembrosDT_NASCIMENTO: TDateField;
    FDCadMembrosDT_BATISMO: TDateField;
    FDCadMembrosNOME: TStringField;
    FDCadMembrosENDERECO: TStringField;
    FDCadMembrosNUMERO: TStringField;
    FDCadMembrosBAIRRO: TStringField;
    FDCadMembrosCIDADE: TStringField;
    FDCadMembrosEMAIL: TStringField;
    FDCadMembrosUF: TStringField;
    FDTransaction1: TFDTransaction;
    FDCadMembrosSTATUS: TStringField;
    FDCadMembrosDATA_CADASTRO: TDateField;
    FDMembrosAtivos: TFDQuery;
    FDMembrosObito: TFDQuery;
    FDMembrosAusente: TFDQuery;
    FDMembrosExcluido: TFDQuery;
    FDMembrosObitoDT_BATISMO: TDateField;
    FDMembrosObitoNOME: TStringField;
    FDMembrosObitoDATA_CADASTRO: TDateField;
    FDMembrosObitoSTATUS: TStringField;
    FDMembrosAusenteDT_BATISMO: TDateField;
    FDMembrosAusenteNOME: TStringField;
    FDMembrosAusenteSTATUS: TStringField;
    FDMembrosExcluidoDT_BATISMO: TDateField;
    FDMembrosExcluidoNOME: TStringField;
    FDCadMembrosATIVO: TIntegerField;
    FDCadMembrosAUSENTE: TIntegerField;
    FDCadMembrosEXCLUIDO: TIntegerField;
    FDCadMembrosOBITO: TIntegerField;
    FDMembrosAtivosDT_BATISMO: TDateField;
    FDMembrosAtivosNOME: TStringField;
    FDMembrosAtivosDATA_CADASTRO: TDateField;
    FDMembrosAtivosSTATUS: TStringField;
    FDMembrosAusenteDATA_CADASTRO: TDateField;
    FDMembrosExcluidoDATA_CADASTRO: TDateField;
    FDMembrosExcluidoSTATUS: TStringField;
    FDMembrosAtivosDATASTATUS_ATIVO: TDateField;
    FDMembrosObitoDATASTATUS_ATIVO: TDateField;
    FDMembrosAusenteDATASTATUS_ATIVO: TDateField;
    FDMembrosExcluidoDATASTATUS_ATIVO: TDateField;
    FDCadMembrosDATASTATUS_ATIVO: TDateField;
    procedure FDMembrosAtivosSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDMembrosObitoSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDMembrosAusenteSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDMembrosExcluidoSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDCadMembrosAUSENTEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDCadMembrosATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDCadMembrosEXCLUIDOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDCadMembrosOBITOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDCadMembrosSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


function dmDados: TdmDados;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function dmDados: TdmDados;
begin
  Result := TdmDados(UniMainModule.GetModuleInstance(TdmDados));
end;

procedure TdmDados.FDCadMembrosATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text :='<i title="Ativar Membro" class="x-fa4 fa-lg far fa-check-circle"; style="color: #28b538;cursor:pointer;font-style: normal;"></i>';  //  direciona para o bitao no grid
end;

procedure TdmDados.FDCadMembrosAUSENTEGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    Text :='<i title="Ausentar Membro" class="x-fa4 fa-lg far fa-check-circle"; style="color: #28b538;cursor:pointer;font-style: normal;"></i>';  //  direciona para o bitao no grid
end;

procedure TdmDados.FDCadMembrosEXCLUIDOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text :='<i title="Excluir Membro" class="x-fa4 fa-lg far fa-check-circle"; style="color: #28b538;cursor:pointer;font-style: normal;"></i>';  //  direciona para o bitao no grid
end;

procedure TdmDados.FDCadMembrosOBITOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    Text :='<i title="”bito de Membro" class="x-fa4 fa-lg far fa-check-circle"; style="color: #28b538;cursor:pointer;font-style: normal;"></i>';  //  direciona para o bitao no grid
end;

procedure TdmDados.FDCadMembrosSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if FDCadMembrosSTATUS.Value = 'ativo' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-success btn-sm">&nbsp&nbsp&nbspATIVO&nbsp&nbsp&nbsp</button> </span>';

    if FDCadMembrosSTATUS.Value = 'ausente' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-warning btn-sm"> AUSENTE </button> </span>';

    if FDCadMembrosSTATUS.Value = 'excluido' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-danger btn-sm">EXCLUIDO</button> </span>';

    if FDCadMembrosSTATUS.Value = 'obito' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-danger btn-sm">&nbsp&nbsp&nbsp”BITO&nbsp&nbsp&nbsp</button> </span>';
end;

procedure TdmDados.FDMembrosAtivosSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if FDMembrosAtivosSTATUS.Value = 'ativo' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-success btn-sm">&nbsp&nbsp&nbspATIVO&nbsp&nbsp&nbsp</button> </span>';
end;

procedure TdmDados.FDMembrosAusenteSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if FDMembrosAusenteSTATUS.Value = 'ausente' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-warning btn-sm"> AUSENTE </button> </span>';
end;

procedure TdmDados.FDMembrosExcluidoSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if FDMembrosExcluidoSTATUS.Value = 'excluido' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-danger btn-sm">EXCLUIDO </button> </span>';
end;

procedure TdmDados.FDMembrosObitoSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if FDMembrosObitoSTATUS.Value = 'obito' then
    Text :='<span style="cursor:pointer">  <button type="button" class="btn btn-danger btn-sm">&nbsp&nbsp&nbsp”BITO&nbsp&nbsp&nbsp</button> </span>';
end;

initialization
  RegisterModuleClass(TdmDados);

end.
