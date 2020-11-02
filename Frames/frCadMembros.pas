unit frCadMembros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDateTimePicker, uniPanel, uniSweetAlert,
  uniScreenMask, uniGUIBaseClasses, uniImageList, uniEdit, uniButton, uniBitBtn,
  UniFSButton, uniLabel, uniBasicGrid, uniDBGrid, uniPageControl, Data.DB,
  uDados, UniFSToast, MainModule, formAniversarioDoMes;

type
  TframeCadMembros = class(TUniFrame)
    DataSourceMembros: TDataSource;
    PnUsuario: TUniPanel;
    PageCadastro: TUniPageControl;
    Tab1: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    Tab2: TUniTabSheet;
    UniPanel2: TUniPanel;
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
    UniSweetAlertUpdate: TUniSweetAlert;
    procedure UniFrameCreate(Sender: TObject);
    procedure BtIncClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGrvClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure BtAltClick(Sender: TObject);
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
    procedure EdPesquisarChange(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniSweetAlertUpdateConfirm(Sender: TObject);
    procedure UniSweetAlertUpdateDismiss(Sender: TObject;
      const Reason: TDismissType);
  private
     xIncluindo, xDeletando, xEditando, xSoAlerta : Boolean;
     xAtivo, xAusente, xExcluido, xObito : Boolean;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure TframeCadMembros.BtAltClick(Sender: TObject);
begin
  EdPesquisar.Visible := False;
  xSoAlerta := False;
  xIncluindo := False;
  xEditando := True;
  xDeletando := False;

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

  dtNascimento.Text := (dmDados.FDCadMembrosDT_NASCIMENTO.AsString);
  dtBatismo.Text := (dmDados.FDCadMembrosDT_BATISMO.AsString);
  edNome.Text := dmDados.FDCadMembrosNOME.Value;
  edEndereco.Text := dmDados.FDCadMembrosENDERECO.Value;
  edBairro.Text := dmDados.FDCadMembrosBAIRRO.Value;
  edNumero.Text := dmDados.FDCadMembrosNUMERO.Value;
  edEmail.Text := dmDados.FDCadMembrosEMAIL.Value;
  edCidade.Text := dmDados.FDCadMembrosCIDADE.Value;
  edUf.Text := dmDados.FDCadMembrosUF.Value;
end;

procedure TframeCadMembros.BtCanClick(Sender: TObject);
begin

  EdPesquisar.Visible := True;
  dmDados.FDCadMembros.Cancel;
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
  dmDados.FDCadMembros.Close();
  dmDados.FDCadMembros.Open();
  BtAlt.Enabled := dmDados.FDCadMembros.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado
  BtExc.Enabled := dmDados.FDCadMembros.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado
end;

procedure TframeCadMembros.BtExcClick(Sender: TObject);
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
  UniSweetAlert1.CancelButtonText := 'N�o';
  UniSweetAlert1.Show(dmDados.FDCadMembrosNOME.Value);

end;

procedure TframeCadMembros.BtGrvClick(Sender: TObject);
begin
   EdPesquisar.Visible := False;
    //  usando  SweetAlert1
  if edNome.Text = '' then
  begin
    xSoAlerta := True; // Bloqueia o alerta
    UniSweetAlert1.Title := ('Nome Obrigat�rio');
    UniSweetAlert1.AlertType := atWarning;
    UniSweetAlert1.ShowConfirmButton := False;
    UniSweetAlert1.ShowCancelButton := True ;
    UniSweetAlert1.CancelButtonText := 'Ok';
    UniSweetAlert1.Show('Digite seu Nome');
    exit;
  end;

  //  Salvando com SweetAlert1
  xSoAlerta := False;
  UniSweetAlert1.Title := 'Deseja salvar esse Membro ?';
  UniSweetAlert1.AlertType := atInfo;
  UniSweetAlert1.ShowConfirmButton := True;
  UniSweetAlert1.ConfirmButtonText := 'Sim';
  UniSweetAlert1.ShowCancelButton := True;
  UniSweetAlert1.CancelButtonText := 'N�o';
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

procedure TframeCadMembros.BtIncClick(Sender: TObject);
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
  EdPesquisar.Clear;
  dtNascimento.Text := DateToStr(Date); // entra com a data do dia
  dtBatismo.Text := DateToStr(Date); // entra com a data do dia
  edNome.Clear;
  edEndereco.Text := '';
  edBairro.Text := '';
  edNumero.Text := '';
  edEmail.Text := '';
  edCidade.Text := '';
  edUf.Text := '';

end;

procedure TframeCadMembros.EdPesquisarChange(Sender: TObject);
begin
    // pesquisa dinamica na tabela Usuario
  dmDados.FDCadMembros.SQL.Clear;
  dmDados.FDCadMembros.SQL.Add('select * from CAD_MEMBROS where');
  dmDados.FDCadMembros.SQL.Add('(NOME LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.FDCadMembros.SQL.Add('or CIDADE LIKE  '+QuotedStr('%'+EdPesquisar.Text+'%') );
  dmDados.FDCadMembros.SQL.Add(')order by NOME');
  dmDados.FDCadMembros.Open;
end;

procedure TframeCadMembros.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
   if Column.Field = dmDados.FDCadMembrosATIVO then
   begin

    xSoAlerta := False;
    xAtivo := True;
    xAusente := False;
    xExcluido := False;
    xObito := False;

    UniSweetAlertUpdate.Title := 'Deseja Ativar o Membro?';
    UniSweetAlertUpdate.AlertType := atInfo;
    UniSweetAlertUpdate.ShowConfirmButton := True;
    UniSweetAlertUpdate.ConfirmButtonText := 'Sim';
    UniSweetAlertUpdate.ShowCancelButton := True;
    UniSweetAlertUpdate.CancelButtonText := 'N�o';
    UniSweetAlertUpdate.Show(dmDados.FDCadMembrosNOME.Value);

    end;

     if Column.Field = dmDados.FDCadMembrosAUSENTE then
   begin

    xSoAlerta := False;
    xAtivo := False;
    xAusente := True;
    xExcluido := False;
    xObito := False;

    UniSweetAlertUpdate.Title := 'Deseja Ausentar o Membro?';
    UniSweetAlertUpdate.AlertType := atInfo;
    UniSweetAlertUpdate.ShowConfirmButton := True;
    UniSweetAlertUpdate.ConfirmButtonText := 'Sim';
    UniSweetAlertUpdate.ShowCancelButton := True;
    UniSweetAlertUpdate.CancelButtonText := 'N�o';
    UniSweetAlertUpdate.Show(dmDados.FDCadMembrosNOME.Value);

   end;

     if Column.Field = dmDados.FDCadMembrosEXCLUIDO then
   begin

    xSoAlerta := False;
    xAtivo := False;
    xAusente := False;
    xExcluido := True;
    xObito := False;

    UniSweetAlertUpdate.Title := 'Deseja Excluir o Membro?';
    UniSweetAlertUpdate.AlertType := atInfo;
    UniSweetAlertUpdate.ShowConfirmButton := True;
    UniSweetAlertUpdate.ConfirmButtonText := 'Sim';
    UniSweetAlertUpdate.ShowCancelButton := True;
    UniSweetAlertUpdate.CancelButtonText := 'N�o';
    UniSweetAlertUpdate.Show(dmDados.FDCadMembrosNOME.Value);

   end;

     if Column.Field = dmDados.FDCadMembrosOBITO then
   begin

    xSoAlerta := False;
    xAtivo := False;
    xAusente := False;
    xExcluido := False;
    xObito := True;

    UniSweetAlertUpdate.Title := 'Deseja Desligar o Membro?';
    UniSweetAlertUpdate.AlertType := atInfo;
    UniSweetAlertUpdate.ShowConfirmButton := True;
    UniSweetAlertUpdate.ConfirmButtonText := 'Sim';
    UniSweetAlertUpdate.ShowCancelButton := True;
    UniSweetAlertUpdate.CancelButtonText := 'N�o';
    UniSweetAlertUpdate.Show(dmDados.FDCadMembrosNOME.Value);

   end;
end;

procedure TframeCadMembros.UniFrameCreate(Sender: TObject);
begin

  dmDados.FDCadMembros.Open;
  BtAlt.Enabled := dmDados.FDCadMembros.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado
  BtExc.Enabled := dmDados.FDCadMembros.RecordCount > 0;
  // ferifica se tem registro/ se nao => ele deixa ele desabilitado

  PageCadastro.Pages[0].TabVisible := True;
  PageCadastro.Pages[1].TabVisible := False;
  BtInc.Enabled := True;
  BtGrv.Enabled := False;
  BtCan.Enabled := False;
  PageCadastro.ActivePage := Tab1; // Volta para a Tela de Consulta
end;

procedure TframeCadMembros.UniSweetAlert1Confirm(Sender: TObject);
var
  xErro: String;
begin
  if xSoAlerta = True then exit;

  if xIncluindo then
  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('INSERT into CAD_MEMBROS values (NULL, :vDT_NASCIMENTO, :vDT_BATISMO, :vNOME, :vENDERECO, :vNUMERO, :vBAIRRO, :vCIDADE, :vEMAIL, :vUF, :vDATA_CADASTRO, :vSTATUS, :vDATASTATUS_ATIVO )');
    dmDados.FDQueryAuxiliar.Params[0].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[0].Value := dtNascimento.Text;
    dmDados.FDQueryAuxiliar.Params[1].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[1].Value := dtBatismo.Text;
    dmDados.FDQueryAuxiliar.Params[2].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[2].Value := edNome.Text;
    dmDados.FDQueryAuxiliar.Params[3].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[3].Value := edEndereco.Text;
    dmDados.FDQueryAuxiliar.Params[4].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[4].Value := edNumero.Text;
    dmDados.FDQueryAuxiliar.Params[5].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[5].Value := edBairro.Text;
    dmDados.FDQueryAuxiliar.Params[6].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[6].Value := edCidade.Text;
    dmDados.FDQueryAuxiliar.Params[7].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[7].Value := edEmail.Text;
    dmDados.FDQueryAuxiliar.Params[8].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[8].Value := edUf.Text;
    dmDados.FDQueryAuxiliar.Params[9].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[9].Value := Now;
    dmDados.FDQueryAuxiliar.Params[10].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[10].Value := 'ativo';
    dmDados.FDQueryAuxiliar.Params[11].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[11].Value := Now;
    // null


    dmDados.FDQueryAuxiliar.ExecSQL(xErro);

    dmDados.FDCadMembros.Close;
    dmDados.FDCadMembros.Open;

    dmDados.FDMembrosAtivos.Close;
    dmDados.FDMembrosAtivos.Open;

    dmDados.FDMembrosAusente.Close;
    dmDados.FDMembrosAusente.Open;

    dmDados.FDMembrosExcluido.Close;
    dmDados.FDMembrosExcluido.Open;

    dmDados.FDMembrosObito.Close;
    dmDados.FDMembrosObito.Open;

    xIncluindo := False;
//    Toast.Success('Sucesso', 'Membro Cadastrado ', topCenter);
    // MainForm.RegistraLog('INCLUS�O', 'INCLUS�O DO USU�RIO: '+UniNome.Text);    log

  end;

  if xEditando then

  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('update CAD_MEMBROS set DT_NASCIMENTO=:vDT_NASCIMENTO, DT_BATISMO=:vDT_BATISMO, NOME=:vNOME, ENDERECO=:vENDERECO, NUMERO=:vNUMERO, BAIRRO=:vBAIRRO,');
    dmDados.FDQueryAuxiliar.SQL.Add('CIDADE=:vCIDADE, EMAIL=:vEMAIL, UF=:vUF, DATA_CADASTRO=:vDATA_CADASTRO, STATUS=:vSTATUS, DATASTATUS_ATIVO=:vDATASTATUS_ATIVO where ID=:vID');
    dmDados.FDQueryAuxiliar.Params[0].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[0].Value := dtNascimento.Text;
    dmDados.FDQueryAuxiliar.Params[1].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[1].Value := dtBatismo.Text;
    dmDados.FDQueryAuxiliar.Params[2].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[2].Value := edNome.Text;
    dmDados.FDQueryAuxiliar.Params[3].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[3].Value := edEndereco.Text;
    dmDados.FDQueryAuxiliar.Params[4].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[4].Value := edNumero.Text;
    dmDados.FDQueryAuxiliar.Params[5].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[5].Value := edBairro.Text;
    dmDados.FDQueryAuxiliar.Params[6].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[6].Value := edCidade.Text;
    dmDados.FDQueryAuxiliar.Params[7].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[7].Value := edEmail.Text;
    dmDados.FDQueryAuxiliar.Params[8].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[8].Value := edUf.Text;
    dmDados.FDQueryAuxiliar.Params[9].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[9].Value := Now;
    dmDados.FDQueryAuxiliar.Params[10].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[10].Value := 'ativo';
    dmDados.FDQueryAuxiliar.Params[11].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[11].Value := Now;
    // null  data Saida
    dmDados.FDQueryAuxiliar.Params[12].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[12].Value := dmDados.FDCadMembrosID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDCadMembros.Close;
    dmDados.FDCadMembros.Open;

    dmDados.FDMembrosAtivos.Close;
    dmDados.FDMembrosAtivos.Open;

    dmDados.FDMembrosAusente.Close;
    dmDados.FDMembrosAusente.Open;

    dmDados.FDMembrosExcluido.Close;
    dmDados.FDMembrosExcluido.Open;

    dmDados.FDMembrosObito.Close;
    dmDados.FDMembrosObito.Open;

//    Toast.Success('Sucesso', 'Membro Alterado ', topCenter);
    xEditando := False;
  end;

  if xDeletando then
  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('delete from CAD_MEMBROS where ID=:vID');
    dmDados.FDQueryAuxiliar.Params[0].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[0].Value := dmDados.FDCadMembrosID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);

    dmDados.FDCadMembros.Close;
    dmDados.FDCadMembros.Open;

    dmDados.FDMembrosAtivos.Close;
    dmDados.FDMembrosAtivos.Open;

    dmDados.FDMembrosAusente.Close;
    dmDados.FDMembrosAusente.Open;

    dmDados.FDMembrosExcluido.Close;
    dmDados.FDMembrosExcluido.Open;

    dmDados.FDMembrosObito.Close;
    dmDados.FDMembrosObito.Open;
//    Toast.Error('Sucesso', 'Membro Excluido com sucesso ', topCenter);
    xDeletando := False;

    // MainForm.RegistraLog('EXCLUS�O', 'EXCLU�DO DO USU�RIO: '+vexUsuario);   log
  end;

end;

procedure TframeCadMembros.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin

  xSoAlerta := False;
  xIncluindo := False;
  xEditando := False;
  xDeletando := False;

end;

procedure TframeCadMembros.UniSweetAlertUpdateConfirm(Sender: TObject);
var
  xErro: String;
begin
  if xAtivo then

  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('update CAD_MEMBROS set STATUS=:vSTATUS, DATASTATUS_ATIVO=:vDATASTATUS_ATIVO where ID=:vID');

    dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[0].Value := 'ativo';

    dmDados.FDQueryAuxiliar.Params[1].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[1].Value := Now;
    // null
    dmDados.FDQueryAuxiliar.Params[2].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[2].Value := dmDados.FDCadMembrosID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDCadMembros.Close;
    dmDados.FDCadMembros.Open;

    dmDados.FDMembrosAtivos.Close;
    dmDados.FDMembrosAtivos.Open;

    dmDados.FDMembrosAusente.Close;
    dmDados.FDMembrosAusente.Open;

    dmDados.FDMembrosExcluido.Close;
    dmDados.FDMembrosExcluido.Open;

    dmDados.FDMembrosObito.Close;
    dmDados.FDMembrosObito.Open;

//    Toast.Success('Sucesso', 'Membro Alterado ', topCenter);
    xAtivo := False;

  end;

    if xAusente then
  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('update CAD_MEMBROS set STATUS=:vSTATUS, DATASTATUS_ATIVO=:vDATASTATUS_ATIVO where ID=:vID');

    dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[0].Value := 'ausente';

    dmDados.FDQueryAuxiliar.Params[1].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[1].Value := Now;

    dmDados.FDQueryAuxiliar.Params[2].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[2].Value := dmDados.FDCadMembrosID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDCadMembros.Close;
    dmDados.FDCadMembros.Open;

    dmDados.FDMembrosAtivos.Close;
    dmDados.FDMembrosAtivos.Open;

    dmDados.FDMembrosAusente.Close;
    dmDados.FDMembrosAusente.Open;

    dmDados.FDMembrosExcluido.Close;
    dmDados.FDMembrosExcluido.Open;

    dmDados.FDMembrosObito.Close;
    dmDados.FDMembrosObito.Open;

//    Toast.Success('Sucesso', 'Membro Alterado ', topCenter);
    xAusente := False;
  end;

  if xExcluido then

  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('update CAD_MEMBROS set STATUS=:vSTATUS, DATASTATUS_ATIVO=:vDATASTATUS_ATIVO where ID=:vID');

    dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[0].Value := 'excluido';

    dmDados.FDQueryAuxiliar.Params[1].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[1].Value := Now;

    dmDados.FDQueryAuxiliar.Params[2].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[2].Value := dmDados.FDCadMembrosID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDCadMembros.Close;
    dmDados.FDCadMembros.Open;

    dmDados.FDMembrosAtivos.Close;
    dmDados.FDMembrosAtivos.Open;

    dmDados.FDMembrosAusente.Close;
    dmDados.FDMembrosAusente.Open;

    dmDados.FDMembrosExcluido.Close;
    dmDados.FDMembrosExcluido.Open;

    dmDados.FDMembrosObito.Close;
    dmDados.FDMembrosObito.Open;

//    Toast.Success('Sucesso', 'Membro Alterado ', topCenter);
    xExcluido := False;

  end;

    if xObito then

  begin

    dmDados.FDQueryAuxiliar.Close;
    dmDados.FDQueryAuxiliar.SQL.Clear;
    dmDados.FDQueryAuxiliar.SQL.Add('update CAD_MEMBROS set STATUS=:vSTATUS, DATASTATUS_ATIVO=:vDATASTATUS_ATIVO where ID=:vID');

    dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
    dmDados.FDQueryAuxiliar.Params[0].Value := 'obito';

    dmDados.FDQueryAuxiliar.Params[1].DataType := ftDate;
    dmDados.FDQueryAuxiliar.Params[1].Value := Now;

    dmDados.FDQueryAuxiliar.Params[2].DataType := ftInteger;
    dmDados.FDQueryAuxiliar.Params[2].Value := dmDados.FDCadMembrosID.Value;

    dmDados.FDQueryAuxiliar.ExecSQL(xErro);
    dmDados.FDCadMembros.Close;
    dmDados.FDCadMembros.Open;

    dmDados.FDMembrosAtivos.Close;
    dmDados.FDMembrosAtivos.Open;

    dmDados.FDMembrosAusente.Close;
    dmDados.FDMembrosAusente.Open;

    dmDados.FDMembrosExcluido.Close;
    dmDados.FDMembrosExcluido.Open;

    dmDados.FDMembrosObito.Close;
    dmDados.FDMembrosObito.Open;

//    Toast.Success('Sucesso', 'Membro Alterado ', topCenter);
    xObito := False;

  end;

end;

procedure TframeCadMembros.UniSweetAlertUpdateDismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  xAtivo := False;
  xAusente := False;
  xExcluido := False;
  xObito := False;
end;

end.
