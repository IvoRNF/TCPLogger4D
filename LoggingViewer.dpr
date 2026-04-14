program LoggingViewer;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  frmLoggingViewer in 'frmLoggingViewer.pas' {frmLogginfViewer},
  ClientLogger in 'ClientLogger.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogginfViewer, frmLogginfViewer);
  Application.Run;
end.
