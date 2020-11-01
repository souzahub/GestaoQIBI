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

initialization
  RegisterModuleClass(TdmDados);

end.
