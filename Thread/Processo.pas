unit Processo;

interface

uses
  System.Classes, Forms, Vcl.ComCtrls, System.SysUtils;

type
  TProcesso = class(TThread)
  private
    FIntervalor: Integer;
    FProgressBarr: TProgressBar;
  public
    constructor Create(AProgressBarr: TProgressBar; AIntervalor: Integer); reintroduce;
  protected
    procedure Execute; override;
  end;

implementation

constructor TProcesso.Create(AProgressBarr: TProgressBar; AIntervalor: Integer);
begin
  inherited Create(True);

  FreeOnTerminate := True;
  FProgressBarr := AProgressBarr;
  FIntervalor := AIntervalor;
end;

procedure TProcesso.Execute;
var
  i: Integer;
begin
  inherited;

  for i := 0 to 100 do begin
    if Terminated then
      Break;

    Sleep(FIntervalor * 1000);

    Synchronize(
      procedure
      begin
        FProgressBarr.Position := FProgressBarr.Position + 1;
      end
    );
  end;
end;

end.
