unit ClientLogger;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, IdContext;

type

  TLogger = class
  private
    const
     FPort: Integer = 9998;
    var
      FIdTCPClient1: TIdTCPClient;

  public
      constructor Create(AOwner: TComponent);
      destructor Destroy;
      procedure Log(AMsg: string);
  end;

  procedure LogText(AText: string);

implementation

var
  FClient: TLogger;

procedure LogText(AText: string);
begin
   if not Assigned(FClient) then
   begin
     FClient := TLogger.Create(nil);
   end;

   FClient.Log(AText);

end;


{ TLogger }

constructor TLogger.Create(AOwner: TComponent);
begin
  self.FIdTCPClient1 := TIdTCPClient.Create(AOwner);
  self.FIdTCPClient1.Port := self.FPort;
  self.FIdTCPClient1.Host := 'localhost';

  self.FIdTCPClient1.Connect;
end;

destructor TLogger.Destroy;
begin
  self.FIdTCPClient1.Free;
end;

procedure TLogger.Log(AMsg: string);
begin
   if not self.FIdTCPClient1.Connected then
      raise Exception.Create('Disconnected');
     self.FIdTCPClient1.Socket.WriteLn(AMsg);
end;


initialization

finalization
  if(Assigned(FClient)) then
  begin
    FClient.Free;
  end;
end.
