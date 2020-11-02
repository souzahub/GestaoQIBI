program GestaoQIBI;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  uDados in 'uDados.pas' {dmDados: TDataModule},
  uFormLogin in 'uFormLogin.pas' {formLogin: TUniLoginForm},
  frCadUsuario in 'Frames\frCadUsuario.pas' {frameCadUsuario: TUniFrame},
  frLogSystema in 'Frames\frLogSystema.pas' {frameLogSys: TUniFrame},
  frCadMembros in 'Frames\frCadMembros.pas' {frameCadMembros: TUniFrame},
  formAniversarioDoMes in 'Forms\formAniversarioDoMes.pas' {forAnivMEs: TUniForm},
  frMembrosAtivo in 'Frames\frMembrosAtivo.pas' {frameMembrosAtivos: TUniFrame},
  frMembrosObitos in 'Frames\frMembrosObitos.pas' {frameMembrosObitos: TUniFrame},
  frMembrosExcluidos in 'Frames\frMembrosExcluidos.pas' {frameMembrosExcluidos: TUniFrame},
  frMembrosAusentes in 'Frames\frMembrosAusentes.pas' {frameMembrosAusentes: TUniFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
