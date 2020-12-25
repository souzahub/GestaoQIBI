unit formAlteraDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniSweetAlert, uniButton,
  uniBitBtn, UniFSButton, uniLabel, uniEdit, uniPanel, DB;

type
  TuformAlteraDados = class(TUniForm)
    pnAlteraSenha: TUniPanel;
    edAlteraUsuario: TUniEdit;
    edAlteraSenha: TUniEdit;
    UniLabel12: TUniLabel;
    sbConectar: TUniFSButton;
    UniFSButton1: TUniFSButton;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniSweetAlert1: TUniSweetAlert;
    procedure sbConectarClick(Sender: TObject);
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
  private
    { Private declarations }
  public
    xIncluindo :Boolean;
  end;

function uformAlteraDados: TuformAlteraDados;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uDados, Main;

function uformAlteraDados: TuformAlteraDados;
begin
  Result := TuformAlteraDados(UniMainModule.GetFormInstance(TuformAlteraDados));
end;

procedure TuformAlteraDados.sbConectarClick(Sender: TObject);
begin
  xIncluindo := True;
  UniSweetAlert1.Title := 'Deseja Alterar ';
  UniSweetAlert1.AlertType := atQuestion;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'Não';
  UniSweetAlert1.Show( 'Os Dados ?');
end;

procedure TuformAlteraDados.UniFormShow(Sender: TObject);
begin
   edAlteraUsuario.Text := (dmDados.FDUsuarioLOGIN.Value);
   edAlteraSenha.Text := (dmDados.FDUsuarioSENHA.Value);
end;

procedure TuformAlteraDados.UniFSButton1Click(Sender: TObject);
begin
  close;
end;

procedure TuformAlteraDados.UniSweetAlert1Confirm(Sender: TObject);
var
  xErro: String;
begin
   if xIncluindo then
  begin
    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('update USUARIO set LOGIN=:vLOGIN, SENHA=:vSENHA where ID=:vID');

    dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[0].Value := edAlteraUsuario.Text;
    dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[1].Value := edAlteraSenha.Text;
    dmDados.FDQueryAuxiliar.Params[2].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[2].Value := dmDados.FDUsuarioID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDUsuario.Close;
    dmDados.FDUsuario.Open();
    xIncluindo := False;

    UniSession.Terminate();
    UniSession.UniApplication.Terminate( );

    // MainForm.RegistraLog('INCLUSÃO', 'INCLUSÃO DO USUÁRIO: '+UniNome.Text);    log

  end;

end;


procedure TuformAlteraDados.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  xIncluindo := False;
  close;
end;

end.
