unit frCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uDados, uniSweetAlert, uniScreenMask,
  uniGUIBaseClasses, uniImageList, uniButton, uniBitBtn, UniFSButton,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniScrollBox, uniBasicGrid,
  uniDBGrid, uniPageControl, uniPanel, Data.DB;

type
  TframeCadUsuario = class(TUniFrame)
    DataSourceUsuario: TDataSource;
    PnUsuario: TUniPanel;
    PageCadastro: TUniPageControl;
    Tab1: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    Tab2: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniScrollBox2: TUniScrollBox;
    UniPanel3: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel3: TUniLabel;
    edNome: TUniEdit;
    edLogin: TUniEdit;
    edSenha: TUniEdit;
    cbPerfil: TUniComboBox;
    PnlCrud: TUniPanel;
    UniLabel1: TUniLabel;
    BtCan: TUniFSButton;
    BtGrv: TUniFSButton;
    BtExc: TUniFSButton;
    BtInc: TUniFSButton;
    BtAlt: TUniFSButton;
    EdPesquisar: TUniEdit;
    UniNativeImageList1: TUniNativeImageList;
    UniScreenMask1: TUniScreenMask;
    UniSweetAlert1: TUniSweetAlert;
    procedure UniFrameCreate(Sender: TObject);
    procedure BtIncClick(Sender: TObject);
    procedure BtAltClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGrvClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
  private
    xIncluindo, xDeletando, xEditando, xSoAlerta : Boolean;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure TframeCadUsuario.BtAltClick(Sender: TObject);
begin
  EdPesquisar.Visible := False;
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := True;
  xDeletando := False;

  cbPerfil.SetFocus;

  // Visualizando a Tab2
  PageCadastro.ActivePage := Tab1; // Volta para a Tela de Consulta
  PageCadastro.Pages[0].TabVisible := False;
  PageCadastro.Pages[1].TabVisible := True;

  // Visualizando Botao do Crud
  BtInc.Enabled := False;
  BtAlt.Enabled := False;
  BtExc.Enabled := False;
  BtGrv.Enabled := True;
  BtCan.Enabled := True;

  edNome.Text := dmDados.FDUsuarioNOME.Value;
  edLogin.Text := dmDados.FDUsuarioLOGIN.Value;
  edSenha.Text := dmDados.FDUsuarioSENHA.Value;
  cbPerfil.Text := dmDados.FDUsuarioPERFIL.Value;
end;

procedure TframeCadUsuario.BtCanClick(Sender: TObject);
begin
  EdPesquisar.Visible := True;
  dmDados.FDUsuario.Cancel;
  PageCadastro.ActivePage := Tab1; // Volta para a Tela de Consulta
  PageCadastro.Pages[0].TabVisible := True;
  PageCadastro.Pages[1].TabVisible := False;

  // Visualizando Botao do Crud
  BtInc.Enabled := True;
  BtAlt.Enabled := True;
  BtExc.Enabled := True;
  BtGrv.Enabled := False;
  BtCan.Enabled := False;
  EdPesquisar.Clear;
  dmDados.FDUsuario.Close();
  dmDados.FDUsuario.Open();
  BtAlt.Enabled := dmDados.FDUsuario.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado
  BtExc.Enabled := dmDados.FDUsuario.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado
end;

procedure TframeCadUsuario.BtExcClick(Sender: TObject);
begin
   // Confirmacao da exclusao com SweetAlert1
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := True;

  UniSweetAlert1.Title := 'Deseja excluir esse Usuario';
  UniSweetAlert1.AlertType := atError;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'Não';
  UniSweetAlert1.Show(dmDados.FDUsuarioNOME.Value);

end;

procedure TframeCadUsuario.BtGrvClick(Sender: TObject);
begin
  EdPesquisar.Visible := False;
  //  usando  SweetAlert1
  if cbPerfil.Text = '' then
  begin
    xSoAlerta := True;   // bloqueia alerta
    UniSweetAlert1.Title := ('Perfil Obrigatório');
    UniSweetAlert1.AlertType := atInfo;
    UniSweetAlert1.ShowConfirmButton := False;
    UniSweetAlert1.ShowCancelButton := True;
    UniSweetAlert1.CancelButtonText := 'Ok';
    UniSweetAlert1.Show('selecione o Perfil');
    exit;
  end;

    //  usando  SweetAlert1
  if edNome.Text = '' then
  begin
    xSoAlerta := True; // Bloqueia o alerta
    UniSweetAlert1.Title := ('Nome Obrigatório');
    UniSweetAlert1.AlertType := atInfo;
    UniSweetAlert1.ShowConfirmButton := False;
    UniSweetAlert1.ShowCancelButton := True ;
    UniSweetAlert1.CancelButtonText := 'Ok';
    UniSweetAlert1.Show('Digite seu Nome');
    exit;
  end;

  //  Salvando com SweetAlert1
  xSoAlerta := False;
  UniSweetAlert1.Title := 'Deseja salvar esse Usuario ?';
  UniSweetAlert1.AlertType := atQuestion;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'Não';
  UniSweetAlert1.Show( edNome.Text );

  BtInc.Enabled := True;
  BtAlt.Enabled := True;
  BtExc.Enabled := True;
  BtGrv.Enabled := False;
  BtCan.Enabled := False;
  PageCadastro.ActivePage := Tab1 ; // Volta para a Tela de Consulta
  PageCadastro.Pages[0].TabVisible := True ;
  PageCadastro.Pages[1].TabVisible := False ;
end;

procedure TframeCadUsuario.BtIncClick(Sender: TObject);
begin

  EdPesquisar.Visible := False;
  xSoAlerta := False;
  xIncluindo := True;
  xEditando := False;
  xDeletando := False;
  //UniDBComboBox1v:= 0;
  PageCadastro.ActivePage := Tab2 ;
  // Visualizando a Tab2
  PageCadastro.Pages[0].TabVisible := False ;
  PageCadastro.Pages[1].TabVisible := Visible ;
  // Visualizando Botao do Crud
  BtInc.Enabled := False;
  BtAlt.Enabled := False;
  BtExc.Enabled := False;
  BtGrv.Enabled := True;
  BtCan.Enabled := True;
  cbPerfil.SetFocus;

  cbPerfil.ItemIndex := 0;
  EdPesquisar.Clear;
  edNome.Clear;
  edLogin.Clear;
  edSenha.Clear;

end;

procedure TframeCadUsuario.EdPesquisarChange(Sender: TObject);
begin
  // pesquisa dinamica na tabela Usuario
  dmDados.FDUsuario.SQL.Clear;
  dmDados.FDUsuario.SQL.Add('select * from USUARIO where');
  dmDados.FDUsuario.SQL.Add('(NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.FDUsuario.SQL.Add('or LOGIN LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.FDUsuario.SQL.Add(')order by NOME');
  dmDados.FDUsuario.Open;

end;

procedure TframeCadUsuario.UniFrameCreate(Sender: TObject);
begin
  EdPesquisarChange(Sender);
  BtAlt.Enabled := dmDados.FDUsuario.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado
  BtExc.Enabled := dmDados.FDUsuario.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado

  PageCadastro.Pages[0].TabVisible := True;
  PageCadastro.Pages[1].TabVisible := False;
  BtInc.Enabled := True;
  BtGrv.Enabled := False;
  BtCan.Enabled := False;
  PageCadastro.ActivePage := Tab1; // Volta para a Tela de Consulta
end;

procedure TframeCadUsuario.UniSweetAlert1Confirm(Sender: TObject);
var
  xErro: String;
begin
  if xSoAlerta = True then exit;

  if xIncluindo then
  begin
    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('insert into USUARIO values (NULL, :vPERFIL, :vNOME, :vLOGIN, :vSENHA )');
    dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[0].Value := cbPerfil.Text;
    dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[1].Value := edNome.Text;
    dmDados.FDQueryAuxiliar.Params[2].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[2].Value := edLogin.Text;
    dmDados.FDQueryAuxiliar.Params[3].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[3].Value := edSenha.Text;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDUsuario.Close();
    dmDados.FDUsuario.Open();
    xIncluindo := False;

    // MainForm.RegistraLog('INCLUSÃO', 'INCLUSÃO DO USUÁRIO: '+UniNome.Text);    log

  end;
  if xEditando then
  begin
    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('update USUARIO set PERFIL=:vPERFIL, NOME=:vNOME, LOGIN=:vLOGIN, SENHA=:vSENHA where ID=:vID');
    dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[0].Value := cbPerfil.Text;
    dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[1].Value := edNome.Text;
    dmDados.FDQueryAuxiliar.Params[2].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[2].Value := edLogin.Text;
    dmDados.FDQueryAuxiliar.Params[3].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[3].Value := edSenha.Text;
    dmDados.FDQueryAuxiliar.Params[4].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[4].Value := dmDados.FDUsuarioID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDUsuario.Close();
    dmDados.FDUsuario.Open();
    xEditando := False;
  end;
  if xDeletando then

  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('delete from USUARIO where ID=:vID');
    dmDados.FDQueryAuxiliar.Params[0].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[0].Value := dmDados.FDUsuarioID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);

    dmDados.FDUsuario.Close();
    dmDados.FDUsuario.Open();
    xDeletando := False;

    // MainForm.RegistraLog('EXCLUSÃO', 'EXCLUÍDO DO USUÁRIO: '+vexUsuario);   log
  end;

end;

procedure TframeCadUsuario.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin

  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := False;

end;

end.
