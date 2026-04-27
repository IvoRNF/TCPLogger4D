program CLILoggerServer;

{$APPTYPE CONSOLE}

uses
  SysUtils, CLIServer;

var
  FCLIServer: TCLIServer;
begin
  try
    try
      WriteLn('Starting TCP Server...');
      FCLIServer := TCLIServer.Create;
      ReadLn;
    except
      on E: Exception do
        WriteLn(E.Classname, ': ', E.Message);
    end
  finally
    FCLIServer.Free;
  end;
end.
