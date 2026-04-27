unit CLIServer;

interface

uses
  Classes, Sockets,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, IdContext;

type
  TCLIServer = class
  public
    constructor Create;
    destructor Destroy;
    procedure IdTCPServer1Execute(AContext: TIdContext);
  private
    FIdTCPServer1: TIdTCPServer;
    const FPort = 9998;
  end;

implementation

uses
  SysUtils;

constructor TCLIServer.Create;
begin
  inherited Create;
  FIdTCPServer1 := TIdTCPServer.Create(nil);
  FIdTCPServer1.OnExecute := self.IdTCPServer1Execute;
  FIdTCPServer1.DefaultPort := FPort;
  FIdTCPServer1.Active := True;
  Write(Format('Server started at port %d %s',[FPort,#13#10]));
end;

destructor TCLIServer.Destroy;
begin
  FIdTCPServer1.Free;
end;

procedure TCLIServer.IdTCPServer1Execute(AContext: TIdContext);
var
  LTxt, LDateStr: string;
begin
  LDateStr := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
  LTxt := AContext.Connection.Socket.ReadLn;
  Write(Format('%s - %s %s', [LDateStr, LTxt,#13#10]));
end;

end.
