unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniTreeView, uniTreeMenu,
  uniSweetAlert, uniStatusBar, uniScreenMask, uniGUIBaseClasses,
  uniImageList, Vcl.Menus, uniMainMenu, uniPanel, uniLabel,
  Vcl.Imaging.pngimage, uniImage, uniScrollBox, uniPageControl, frxClass,
  frxExportBaseDialog, frxExportPDF, frxGradient, frxDBSet, uniGUIFrame,
  uniButton, uniBitBtn, uniMenuButton, UniFSMenuButton, DB, frCadUsuario,
  UniFSToast, frCadMembros, frLogSystema, formAniversarioDoMes, UniFSButton,
  frMembrosAtivo, frMembrosAusentes, frMembrosExcluidos, frMembrosObitos,
  uniEdit;

type
  TMainForm = class(TUniForm)
    frxGradientObject1: TfrxGradientObject;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    UniMenuItems1: TUniMenuItems;
    DashBoard: TUniMenuItem;
    UniNativeImageList1: TUniNativeImageList;
    UniStatusBar1: TUniStatusBar;
    UniSweetAlert1: TUniSweetAlert;
    frxDBDataset1: TfrxDBDataset;
    Popup1: TUniPopupMenu;
    Usuarios1: TUniMenuItem;
    Log2: TUniMenuItem;
    Sair1: TUniMenuItem;
    paLayoutMenuLateral: TUniContainerPanel;
    imgUser: TUniImage;
    UniTreeMenu1: TUniTreeMenu;
    lbOla: TUniLabel;
    paBackGround: TUniContainerPanel;
    PagePrincipal: TUniPageControl;
    TabHome: TUniTabSheet;
    paGeral: TUniContainerPanel;
    UniPanel1: TUniPanel;
    UniContainerPanel2: TUniContainerPanel;
    paDash1x1_Blue: TUniContainerPanel;
    paDashBlueImg: TUniContainerPanel;
    imgDashBlue: TUniImage;
    lbAdulto: TUniLabel;
    paDash1x1_Red: TUniContainerPanel;
    paDashRedImg: TUniContainerPanel;
    imgDashRed: TUniImage;
    labDashRed: TUniLabel;
    lbTotalMembro: TUniLabel;
    paDash1x1_Purple: TUniContainerPanel;
    paDashOrangeImg: TUniContainerPanel;
    imgDashOrange: TUniImage;
    lbJovens: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    PanelTop: TUniPanel;
    UniFSMenuButton1: TUniFSMenuButton;
    imgIcone: TUniImage;
    UniLabel1: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel9: TUniLabel;
    labSistema: TUniLabel;
    Toast: TUniFSToast;
    BtCan: TUniFSButton;
    Gerenciamento1: TUniMenuItem;
    Ativos1: TUniMenuItem;
    Membros1: TUniMenuItem;
    GerenciarMembros1: TUniMenuItem;
    Ativo1: TUniMenuItem;
    Auxentes1: TUniMenuItem;
    Excluidos2: TUniMenuItem;
    bitos1: TUniMenuItem;
    rocarSenha1: TUniMenuItem;
    pnAlteraSenha: TUniPanel;
    edAlteraUsuario: TUniEdit;
    edAlteraSenha: TUniEdit;
    UniLabel12: TUniLabel;
    sbConectar: TUniFSButton;
    UniFSButton1: TUniFSButton;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniImage2: TUniImage;
    lbAdolecente: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniImage1: TUniImage;
    lbInfantil: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    Adultos1: TUniMenuItem;
    Jovens1: TUniMenuItem;
    Adolescentes1: TUniMenuItem;
    Intantis1: TUniMenuItem;
    procedure mnuUsuarioClick(Sender: TObject);
    procedure UniFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    procedure Sair1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure RegistraLog(Tipo: String; Historico: String);
    procedure Log2Click(Sender: TObject);
    procedure DashBoardClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure Ativos1Click(Sender: TObject);
    procedure Membros1Click(Sender: TObject);
    procedure Ativo1Click(Sender: TObject);
    procedure Auxentes1Click(Sender: TObject);
    procedure Excluidos2Click(Sender: TObject);
    procedure bitos1Click(Sender: TObject);
    procedure rocarSenha1Click(Sender: TObject);
    procedure sbConectarClick(Sender: TObject);
    procedure UniSweetAlert1Confirm(Sender: TObject);
    procedure UniFSButton1Click(Sender: TObject);
    procedure UniSweetAlert1Dismiss(Sender: TObject;
      const Reason: TDismissType);
    procedure GerenciarMembros1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure Adultos1Click(Sender: TObject);
    procedure Jovens1Click(Sender: TObject);
    procedure Adolescentes1Click(Sender: TObject);
    procedure Intantis1Click(Sender: TObject);// procedure gravar log
  private
    procedure NovaAba(nomeFormFrame: TFrame; descFormFrame: string; Fechar: Boolean);   // frame lateral
  public
    { Public declarations }
    xIncluindo : Boolean;
    procedure TotalMembros; //função de atualizar Total de MEMBROS
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uDados,
  uFormLogin, formAlteraDados, frAdultos, frAdolescentes, frInfantis, frJovens;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.RegistraLog(Tipo: String; Historico: String);  // procedure gravar log
var
  xERRO: String;
begin
  exit;
  // registra o log ( função Log ) para todos
  dmDados.FDQueryAuxiliar.Close;
  dmDados.FDQueryAuxiliar.SQL.Clear;
  dmDados.FDQueryAuxiliar.SQL.Add('INSERT into LOGSYS values (NULL, :vDIA, :vLOGIN, :vOPERACAO, :vOCORRENCIA )');
  // DIA
  dmDados.FDQueryAuxiliar.Params[0].DataType := ftDateTime;
  dmDados.FDQueryAuxiliar.Params[0].Value := DateTimeToStr(now);
  // pega a Data do computador
  // Login
  dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[1].Value := MainModule.UniMainModule.xUsuario;
  // pega o usuario na entrada do sistema ( usuario global )
  // operação
  dmDados.FDQueryAuxiliar.Params[2].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[2].Value := Tipo; // pega esse valor para a função
  // Ocorrencia
  dmDados.FDQueryAuxiliar.Params[3].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[3].Value := Historico;
  // pega esse valor para a função

  dmDados.FDQueryAuxiliar.ExecSQL(xERRO);

  dmDados.FDQueryLogSys.Close;
  dmDados.FDQueryLogSys.Open;
end;

procedure TMainForm.TotalMembros; // função de atualizar Total de MEMBROS
var vTOTAL, vQuantidadeMembro : Integer;
begin
  // conta total de de membros
  dmDados.FDQueryAuxiliar.SQL.Clear;
  dmDados.FDQueryAuxiliar.SQL.Add('select COUNT( ID ) as TOTAL from CAD_MEMBROS Where STATUS=:vSTATUS or STATUS=:vSTATUS1 ');
  dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[0].Value :='ativo'; // membros ativos
  dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[1].Value :='ausente'; // membros ausentes
  dmDados.FDQueryAuxiliar.Open;
  lbTotalMembro.Caption := FormatFloat('#0', dmDados.FDQueryAuxiliar.FieldByName('TOTAL').AsCurrency );
  dmDados.FDQueryAuxiliar.Close;

// conta total de de membros adultos
  dmDados.FDQueryAuxiliar.SQL.Clear;
  dmDados.FDQueryAuxiliar.SQL.Add('select COUNT( ID ) as TOTAL from CAD_MEMBROS Where STATUS=:vSTATUS and CLASSIFICACAO=:vCLASSIFICACAO');
  dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[0].Value :='ativo'; // membros ativos
  dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[1].Value :='ADULTOS'; // classificação Adultos
  dmDados.FDQueryAuxiliar.Open;
  lbAdulto.Caption := FormatFloat('#0', dmDados.FDQueryAuxiliar.FieldByName('TOTAL').AsCurrency );
  dmDados.FDQueryAuxiliar.Close;

  // conta total de de membros jovens
  dmDados.FDQueryAuxiliar.SQL.Clear;
  dmDados.FDQueryAuxiliar.SQL.Add('select COUNT( ID ) as TOTAL from CAD_MEMBROS Where STATUS=:vSTATUS and CLASSIFICACAO=:vCLASSIFICACAO');
  dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[0].Value :='ativo'; // membros ativos
  dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[1].Value :='JOVENS'; // classificação jovens
  dmDados.FDQueryAuxiliar.Open;
  lbJovens.Caption := FormatFloat('#0', dmDados.FDQueryAuxiliar.FieldByName('TOTAL').AsCurrency );
  dmDados.FDQueryAuxiliar.Close;

  // conta total de de membros adolescentes
  dmDados.FDQueryAuxiliar.SQL.Clear;
  dmDados.FDQueryAuxiliar.SQL.Add('select COUNT( ID ) as TOTAL from CAD_MEMBROS Where STATUS=:vSTATUS and CLASSIFICACAO=:vCLASSIFICACAO');
  dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[0].Value :='ativo'; // membros ativos
  dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[1].Value :='ADOLESCENTE'; // classificação adolescentes
  dmDados.FDQueryAuxiliar.Open;
  lbAdolecente.Caption := FormatFloat('#0', dmDados.FDQueryAuxiliar.FieldByName('TOTAL').AsCurrency );
  dmDados.FDQueryAuxiliar.Close;

  // conta total de de membros infantis
  dmDados.FDQueryAuxiliar.SQL.Clear;
  dmDados.FDQueryAuxiliar.SQL.Add('select COUNT( ID ) as TOTAL from CAD_MEMBROS Where STATUS=:vSTATUS and CLASSIFICACAO=:vCLASSIFICACAO');
  dmDados.FDQueryAuxiliar.Params[0].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[0].Value :='ativo'; // membros ativos
  dmDados.FDQueryAuxiliar.Params[1].DataType := ftString;
  dmDados.FDQueryAuxiliar.Params[1].Value :='INFANTIL'; // classificação infantis
  dmDados.FDQueryAuxiliar.Open;
  lbInfantil.Caption := FormatFloat('#0', dmDados.FDQueryAuxiliar.FieldByName('TOTAL').AsCurrency );
  dmDados.FDQueryAuxiliar.Close;

end;


procedure TMainForm.rocarSenha1Click(Sender: TObject);
begin
//  uformAlteraDados.Show();
  PagePrincipal.ActivePage := TabHome; // ativa pagina Principal
  pnAlteraSenha.Visible := True;
//  dmDados.FDUsuario.Edit;
  edAlteraUsuario.Text := (dmDados.FDUsuarioLOGIN.Value);
  edAlteraSenha.Text := (dmDados.FDUsuarioSENHA.Value);
end;

// frame lateral
procedure TMainForm.Adolescentes1Click(Sender: TObject);
begin
  NovaAba(TFrame(TframeAdolescentes),'Adolescentes',True);
end;

procedure TMainForm.Adultos1Click(Sender: TObject);
begin
   NovaAba(TFrame(TframeAdulto),'Adultos',True);
end;

procedure TMainForm.Ativo1Click(Sender: TObject);
begin
   if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
  NovaAba(TFrame(TframeMembrosAtivos),'Membros Ativos',True);
end;

procedure TMainForm.Ativos1Click(Sender: TObject);
begin
    NovaAba(TFrame(TframeMembrosAtivos),'Membros Ativos',True);
end;

procedure TMainForm.Auxentes1Click(Sender: TObject);
begin
   if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
    NovaAba(TFrame(TframeMembrosAusentes),'Membros Ausentes',True);
end;

procedure TMainForm.bitos1Click(Sender: TObject);
begin
   if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
  NovaAba(TFrame(TframeMembrosObitos),'Membros Óbitos',True);
end;

procedure TMainForm.BtCanClick(Sender: TObject);
begin
   forAnivMEs.ShowModal();
end;

procedure TMainForm.DashBoardClick(Sender: TObject);
begin
  PagePrincipal.ActivePage := TabHome; // ativa pagina Principal
end;

procedure TMainForm.Excluidos2Click(Sender: TObject);
begin
   if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
   NovaAba(TFrame(TframeMembrosExcluidos),'Membros Excluidos',True);
end;

procedure TMainForm.GerenciarMembros1Click(Sender: TObject);
begin
 if (not MainModule.UniMainModule.vADMIN) then exit;
end;

procedure TMainForm.Intantis1Click(Sender: TObject);
begin
  NovaAba(TFrame(TframeInfantis),'Infantis',True);
end;

procedure TMainForm.Jovens1Click(Sender: TObject);
begin
  NovaAba(TFrame(TframeJovens),'JOVENS',True);
end;

procedure TMainForm.Log2Click(Sender: TObject);
begin
exit;
  if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
  NovaAba(TFrame(TframeLogSys), 'log Sys', True);
end;

procedure TMainForm.Membros1Click(Sender: TObject);
begin
 if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
    NovaAba(TFrame(TframeCadMembros),'Membros',True);
end;

procedure TMainForm.mnuUsuarioClick(Sender: TObject);
begin
   NovaAba(TFrame(TframeCadUsuario),'Usuário',True);
end;

procedure TMainForm.NovaAba(nomeFormFrame: TFrame; descFormFrame: string; Fechar: Boolean);
var TabSheet      :TUniTabSheet;
    FCurrentFrame :TUniFrame;
    I             :Integer;
begin

      pagePrincipal.Visible := True;

      {Verificando se a tela já está aberto e redireciona a ela}
      for I := 0 to pagePrincipal.PageCount - 1 do
        with pagePrincipal do
          if Pages[I].Caption = descFormFrame  then
            begin
              pagePrincipal.ActivePageIndex := I;
              Exit;
            end;

      TabSheet              := TUniTabSheet.Create(Self);
      TabSheet.PageControl  := pagePrincipal;
      TabSheet.Caption      := descFormFrame;
      TabSheet.Closable     := Fechar;

      FCurrentFrame:= TUniFrameClass(nomeFormFrame).Create(Self);

      with FCurrentFrame do
        begin
          Align               := alClient;
          Parent              := TabSheet;
        end;

      Refresh;

      pagePrincipal.ActivePage := TabSheet;
end;
procedure TMainForm.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.sbConectarClick(Sender: TObject);
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

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  TotalMembros;
end;

procedure TMainForm.UniFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
begin
    // resposividade na tela
  Self.Left := Round((AWidth / 2)  - (Self.Width / 2));
  Self.Top  := Round((AHeight / 2) - (Self.Height / 2));
end;

procedure TMainForm.UniFSButton1Click(Sender: TObject);
begin

  edAlteraSenha.Text := '';
  pnAlteraSenha.Visible := False;
  PagePrincipal.Pages[0].TabVisible := True ;

end;

procedure TMainForm.UniSweetAlert1Confirm(Sender: TObject);
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
    dmDados.FDUsuario.Close();
    dmDados.FDUsuario.Open();
    xIncluindo := False;
    Close;

    // MainForm.RegistraLog('INCLUSÃO', 'INCLUSÃO DO USUÁRIO: '+UniNome.Text);    log

  end;

//   dmDados.FDUsuario.Open;
//   dmDados.FDUsuario.Edit;
//   dmDados.FDUsuarioLOGIN.Value := edAlteraUsuario.Text;
//   dmDados.FDUsuarioSENHA.Value := edAlteraSenha.Text;
//   dmDados.FDUsuario.Post;
//   dmDados.FDUsuario.Close;
//   dmDados.FDUsuario.Open;
//   Close;

end;

procedure TMainForm.UniSweetAlert1Dismiss(Sender: TObject;
  const Reason: TDismissType);
begin
  edAlteraSenha.Text := '';
  pnAlteraSenha.Visible := False;
end;

procedure TMainForm.Usuarios1Click(Sender: TObject);
begin
  if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
  NovaAba(TFrame(TframeCadUsuario),'Usuário',True);
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
