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
  UniFSToast, frCadMembros, frLogSystema, formAniversarioDoMes, UniFSButton;

type
  TMainForm = class(TUniForm)
    frxGradientObject1: TfrxGradientObject;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    UniMenuItems1: TUniMenuItems;
    DashBoard: TUniMenuItem;
    Cadastros1: TUniMenuItem;
    ContasPadro1: TUniMenuItem;
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
    UniLabel4: TUniLabel;
    paDash1x1_Red: TUniContainerPanel;
    paDashRedImg: TUniContainerPanel;
    imgDashRed: TUniImage;
    labDashRed: TUniLabel;
    UniLabel8: TUniLabel;
    paDash1x1_Purple: TUniContainerPanel;
    paDashOrangeImg: TUniContainerPanel;
    imgDashOrange: TUniImage;
    UniLabel6: TUniLabel;
    paDash1x1_Green: TUniContainerPanel;
    paDashGreenImg: TUniContainerPanel;
    imgDashGreen: TUniImage;
    UniLabel3: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    PanelTop: TUniPanel;
    UniFSMenuButton1: TUniFSMenuButton;
    imgIcone: TUniImage;
    UniLabel1: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    labSistema: TUniLabel;
    Toast: TUniFSToast;
    BtCan: TUniFSButton;
    procedure mnuUsuarioClick(Sender: TObject);
    procedure UniFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    procedure Sair1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure RegistraLog(Tipo: String; Historico: String);
    procedure Log2Click(Sender: TObject);
    procedure DashBoardClick(Sender: TObject);
    procedure ContasPadro1Click(Sender: TObject);
    procedure BtCanClick(Sender: TObject);// procedure gravar log
  private
    procedure NovaAba(nomeFormFrame: TFrame; descFormFrame: string; Fechar: Boolean);   // frame lateral
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uDados,
  uFormLogin;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.RegistraLog(Tipo: String; Historico: String);  // procedure gravar log
var
  xERRO: String;
begin
//  exit;
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

// frame lateral
procedure TMainForm.BtCanClick(Sender: TObject);
begin
   forAnivMEs.ShowModal();
end;

procedure TMainForm.ContasPadro1Click(Sender: TObject);
begin
  NovaAba(TFrame(TframeCadMembros),'Membros',True);
end;

procedure TMainForm.DashBoardClick(Sender: TObject);
begin
  PagePrincipal.ActivePage := TabHome; // ativa pagina Principal
end;

procedure TMainForm.Log2Click(Sender: TObject);
begin
  if (not MainModule.UniMainModule.vADMIN) then
  begin
   Toast.Error('Atenção!', 'Usuário não autorizado ', topCenter);
   exit;  // apenas para admin
  end
  else
  NovaAba(TFrame(TframeLogSys), 'log Sys', True);
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

procedure TMainForm.UniFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
begin
    // resposividade na tela
  Self.Left := Round((AWidth / 2)  - (Self.Width / 2));
  Self.Top  := Round((AHeight / 2) - (Self.Height / 2));
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
