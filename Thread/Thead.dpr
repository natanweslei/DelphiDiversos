program Thead;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  Processo in 'Processo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
