unit Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,
  Vcl.ComCtrls,
  Processo;

type
  TfMain = class(TForm)
    lbInformeDataProcesso1: TLabel;
    lbInformeDataProcesso2: TLabel;
    pbIntervalo1: TProgressBar;
    pbIntervalo2: TProgressBar;
    btProcessarAnonimo: TButton;
    eIntervalo1: TSpinEdit;
    eIntervalo2: TSpinEdit;
    btProcessar: TButton;
    btParar: TButton;
    gbThreadComClasse: TGroupBox;
    procedure btProcessarAnonimoClick(Sender: TObject);
    procedure btProcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPararClick(Sender: TObject);
  private
    processo_1: TProcesso;
    processo_2: TProcesso;
    procedure ManterComponentes(habilitado: Boolean; limpar_progresso: Boolean);
    procedure DoSincronizar(ProgressBarr: TProgressBar; Intervalo: Integer);
    procedure DoTerminate(Sender: TObject);
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.ManterComponentes(habilitado: Boolean; limpar_progresso: Boolean);
begin
  if limpar_progresso then
  begin
    pbIntervalo1.Position := 0;
    pbIntervalo2.Position := 0;
  end;

  btProcessar.Enabled := Habilitado;
  btParar.Enabled := not btProcessar.Enabled;
end;

procedure TfMain.btPararClick(Sender: TObject);
begin
  if processo_1 <> nil then
    processo_1.Terminate;

  if processo_2 <> nil then
    processo_2.Terminate;
end;

procedure TfMain.btProcessarAnonimoClick(Sender: TObject);
begin
  ManterComponentes(False, True);

  TThread.CreateAnonymousThread(
    procedure
    begin
      DoSincronizar(pbIntervalo1, eIntervalo1.Value);
    end
  ).start;

  TThread.CreateAnonymousThread(
    procedure
    begin
      DoSincronizar(pbIntervalo2, eIntervalo2.Value);
    end
  ).start;
end;

procedure TfMain.btProcessarClick(Sender: TObject);
begin
  ManterComponentes(False, True);

  processo_1 := TProcesso.Create(pbIntervalo1, eIntervalo1.Value);
  processo_1.OnTerminate := DoTerminate;
  processo_1.Start;

  processo_2 := TProcesso.Create(pbIntervalo2, eIntervalo2.Value);
  processo_2.OnTerminate := DoTerminate;
  processo_2.Start;
end;

procedure TfMain.DoTerminate(Sender: TObject);
begin
  ManterComponentes(True, processo_1.Suspended and processo_2.Suspended);
end;

procedure TfMain.DoSincronizar(ProgressBarr: TProgressBar; Intervalo: Integer);
var
  i: Integer;
begin
  for i := 0 to 100 do begin
    Sleep(Intervalo * 1000);
    ProgressBarr.Position := ProgressBarr.Position + 1;
  end;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (processo_1 <> nil) or (processo_2 <> nil) then
  begin
    ShowMessage('N?o ? permitido sair enquanto houver processos em andamento!');
    Abort;
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
