unit uFormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, Vcl.Imaging.pngimage,
  uniImage, uniLabel, uniEdit, uniSpeedButton, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel, uniSweetAlert, uniImageList, UniFSiGrowl,
  UniFSToast, UniFSButton;

type
  TformLogin = class(TUniLoginForm)
    Toast: TUniFSToast;
    FSiGrowl: TUniFSiGrowl;
    imgl20: TUniNativeImageList;
    UniSweetAlert1: TUniSweetAlert;
    UniNativeImageList1: TUniNativeImageList;
    UniImage2: TUniImage;
    UniLabel3: TUniLabel;
    lbA: TUniLabel;
    lbF: TUniLabel;
    edUsuario: TUniEdit;
    edSenhaLogin: TUniEdit;
    PnlBottom: TUniPanel;
    sbConectar: TUniFSButton;
    procedure lbAClick(Sender: TObject);
    procedure lbFClick(Sender: TObject);
    procedure UniLoginFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    procedure edSenhaLoginKeyPress(Sender: TObject; var Key: Char);
    procedure UniLoginFormCreate(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function formLogin: TformLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uDados, Main;

function formLogin: TformLogin;
begin
  Result := TformLogin(UniMainModule.GetFormInstance(TformLogin));
end;

procedure TformLogin.edSenhaLoginKeyPress(Sender: TObject; var Key: Char);
begin
  sbConectar.SetFocus;
end;

procedure TformLogin.lbAClick(Sender: TObject);
begin
  lbF.Visible := True ;
  lbA.Visible := False ;
  edSenhaLogin.PasswordChar := #0;
end;

procedure TformLogin.lbFClick(Sender: TObject);
begin
  lbF.Visible := False ;
  lbA.Visible := True;
  edSenhaLogin.PasswordChar :=  '*' ;
end;

procedure TformLogin.UniFSButton1Click(Sender: TObject);
begin
   dmDados.FDUsuario.Open;

  if dmDados.FDUsuario.Locate('LOGIN', edUsuario.Text, []) then
  begin
    if dmDados.FDUsuarioSENHA.Value <> edSenhaLogin.Text then
    begin
      // ShowMessage('ATENÇÃO: USUARIO ou SENHA INVÁLIDA.');
      UniSweetAlert1.InputType := ItNone;
      UniSweetAlert1.AlertType := atWarning;
      UniSweetAlert1.ShowCancelButton := False;
      UniSweetAlert1.ShowConfirmButton := True;
      UniSweetAlert1.Width := 300;
      UniSweetAlert1.Title := 'ATENÇÃO';
      UniSweetAlert1.Show('Usuario / Senha Incorreta');
      edUsuario.SetFocus;
      exit;
    end;
  end
  else
  begin
    // ShowMessage('ATENÇÃO: USUARIO ou SENHA INVÁLIDA.');
    UniSweetAlert1.InputType := ItNone;
    UniSweetAlert1.AlertType := atWarning;
    UniSweetAlert1.ShowCancelButton := False;
    UniSweetAlert1.ShowConfirmButton := True;
    UniSweetAlert1.Width := 300;
    UniSweetAlert1.Title := 'ATENÇÃO';
    UniSweetAlert1.Show('Usuario / Senha Incorreta');
    edUsuario.SetFocus;
    exit;
  end;
  ModalResult := mrOk;
 MainModule.UniMainModule.xUsuario:= edUsuario.Text; // o edit usuario sempre sera o usuario global
 MainModule.UniMainModule.xResponsavel := dmDados.FDUsuarioNOME.Value;

  // o edit usuario sempre sera o usuario global ( chama o nome do tecnico/ responsavel)
  MainForm.lbOla.Caption := 'Olá, ' + dmDados.FDUsuarioNOME.Value;

  // registra o log de entrada
  MainForm.RegistraLog('LOGIN', 'LOGOU NO SISTEMA');

  MainModule.UniMainModule.vADMIN := False;
  if dmDados.FDUsuarioPERFIL.Value = 'ADMINISTRADOR' then
    MainModule.UniMainModule.vADMIN := True;

    Toast.Success('Sucesso', 'Usuário autorizado ', topCenter);
end;

procedure TformLogin.UniLoginFormCreate(Sender: TObject);
begin
  edUsuario.SetFocus;
end;

procedure TformLogin.UniLoginFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
begin
    // resposividade na tela
  Self.Left := Round((AWidth / 2)  - (Self.Width / 2));
  Self.Top  := Round((AHeight / 2) - (Self.Height / 2));

end;

initialization
  RegisterAppFormClass(TformLogin);

end.
