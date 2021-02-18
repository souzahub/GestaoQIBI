
unit Dashboard.Infobox;

interface

uses
 System.SysUtils, System.Classes;

type
  IInfobox = interface
    ['{4EA7B8B0-476B-41D6-A748-60FDB3990B57}']
    function TotalReceber(Value:string) : IInfobox;
    function OsPagas(Value:string) : IInfobox;
    function OsAberta(Value:string) : IInfobox;
    function TotalOs(Value:string) : IInfobox;
    function HTMLView : string;
  end;

  TInfobox = class(TInterfacedObject, IInfobox)
  private
    SL : TStringList;
    FStrNoCache,
    FHTML,
    FTotalReceber,
    FOsPagas,
    FOsAberta,
    FTotalOs : string;
    const
      cHTMLFile     =  '.\files\dashboard\html\infobox.html';
      cCSSImport    =  '/files/dashboard/css/infobox.css';
      cJavaScript   =  '/files/dashboard/js/infobox.js';
    function TotalReceber(Value:string) : IInfobox;
    function OsPagas(Value:string) : IInfobox;
    function OsAberta(Value:string) : IInfobox;
    function TotalOs(Value:string) : IInfobox;
    function HTMLView : String;
    function HTMLFile : string;
    function JavaScript : string;
    function CSSImport : string;
    function Bind(aKey,aValue: string) : TInfobox;
  public
    class function Init: IInfobox;
    constructor Create;
    destructor Destroy;override;
  end;

implementation

{ TInfobox }

constructor TInfobox.Create;
begin
  FHTML       := HTMLFile;

  //Para controlar/evitar Cache do CSS e JS:
  FStrNoCache := FormatDateTime('yhns',Now); // Em tempo de Desenvolvimento
//  FStrNoCache := FormatDateTime('ymd',Now);  // Em tempo de Produção
end;

destructor TInfobox.Destroy;
begin
  FreeAndNil(SL);
  inherited;
end;

function TInfobox.CSSImport: string;
begin
  Result := cCSSImport + '?' + FStrNoCache;
end;

function TInfobox.JavaScript: string;
begin
  Result := cJavaScript + '?' + FStrNoCache;
end;

class function TInfobox.Init: IInfobox;
begin
  Result := Self.Create;
end;

function TInfobox.TotalReceber(Value: string): IInfobox;
begin
  Result          := Self;
  FTotalReceber  := Value;
end;

function TInfobox.OsPagas(Value: string): IInfobox;
begin
  Result := Self;
  FOsPagas := Value;
end;

function TInfobox.OsAberta(Value: string): IInfobox;
begin
  Result    := Self;
  FOsAberta := Value;
end;

function TInfobox.TotalOs(Value: string): IInfobox;
begin
  Result        := Self;
  FTotalOs := Value;
end;

function TInfobox.HTMLFile: string;
begin
  SL          := TStringList.Create;

  if FileExists(cHTMLFile) then
  begin
    SL.LoadFromFile(cHTMLFile,TEncoding.UTF8);
    Result := SL.Text;
  end else
  raise Exception.Create(
    'O arquivo "'+cHTMLFile+'" não foi encontrado'
  );
end;

function TInfobox.HTMLView: String;  // busca as variaveis do Html
begin
  Bind('CSSImport',CSSImport).
  Bind('JavaScript',JavaScript).
  Bind('TotalReceber',FTotalReceber).
  Bind('OsPagas',FOsPagas).
  Bind('OsAberta',FOsAberta).
  Bind('TotalOs',FTotalOs);

  Result := FHTML;
end;

function TInfobox.Bind(aKey,aValue:string) : TInfobox;
begin
  Result  := Self;
  FHTML   := StringReplace(FHTML,'{{'+aKey+'}}',aValue,
                            [rfReplaceAll,rfIgnoreCase]);
end;

end.
