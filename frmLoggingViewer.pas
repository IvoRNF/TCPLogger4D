unit frmLoggingViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient, Sockets, ClientLogger,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, IdContext;

type
  TfrmLogginfViewer = class(TForm)
    dbgLogs: TDBGrid;
    dbmMessage: TDBMemo;
    lblMessage: TLabel;
    pnlSearch: TPanel;
    Pesquisa: TLabel;
    edtSearch: TEdit;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    IdTCPServer1: TIdTCPServer;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPServer1Execute(AContext:TIdContext);
    procedure edtSearchChange(Sender: TObject);
  private
    { Private declarations }
    FClient: TLogger;
    procedure Add(AMsg: string);
  public
    { Public declarations }
  end;

var
  frmLogginfViewer: TfrmLogginfViewer;

implementation

{$R *.dfm}

procedure TfrmLogginfViewer.Add(AMsg: string);
begin
   with self.ClientDataSet1 do
   begin
     Append;
     FieldByName('Data').AsDateTime := Now;
     FieldByName('Mensagem').AsString := AMsg;
     Post;
   end;
end;



procedure TfrmLogginfViewer.Button1Click(Sender: TObject);
const
   LArr: array[0..3] of string = ('banana','ok','bibi','uva');
var
  i : integer;
begin

    for i := 0 to 3 do
      self.FClient.Log(LArr[i] );
end;

procedure TfrmLogginfViewer.edtSearchChange(Sender: TObject);
begin
   self.ClientDataSet1.Locate('mensagem',Trim(edtSearch.Text),[loPartialKey,loCaseInsensitive])
end;

procedure TfrmLogginfViewer.FormCreate(Sender: TObject);
begin
   with self.ClientDataSet1 do
   begin
       FieldDefs.Add('Data',ftDateTime);
       FieldDefs.Add('Mensagem',ftString,1024);
       CreateDataSet;
       Open;
   end;
   self.DataSource1.DataSet := self.ClientDataSet1;
   self.IdTCPServer1.Active := True;
   self.FClient := TLogger.Create(self);
end;

procedure TfrmLogginfViewer.IdTCPServer1Execute(AContext: TIdContext);
begin
   self.Add(AContext.Connection.Socket.ReadLn);
end;

end.
