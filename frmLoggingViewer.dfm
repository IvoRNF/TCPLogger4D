object frmLogginfViewer: TfrmLogginfViewer
  Left = 0
  Top = 0
  Caption = 'Logging Viewer'
  ClientHeight = 583
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  DesignSize = (
    929
    583)
  PixelsPerInch = 96
  TextHeight = 13
  object lblMessage: TLabel
    Left = 8
    Top = 34
    Width = 78
    Height = 13
    Caption = 'Mensagem atual'
  end
  object dbgLogs: TDBGrid
    Left = 8
    Top = 328
    Width = 937
    Height = 425
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbmMessage: TDBMemo
    Left = 8
    Top = 57
    Width = 521
    Height = 256
    Anchors = [akLeft, akTop, akRight]
    DataField = 'mensagem'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object pnlSearch: TPanel
    Left = 568
    Top = 57
    Width = 353
    Height = 64
    Anchors = [akTop, akRight]
    TabOrder = 2
    object Pesquisa: TLabel
      Left = 7
      Top = 13
      Width = 42
      Height = 13
      Caption = 'Pesquisa'
    end
    object edtSearch: TEdit
      Left = 8
      Top = 32
      Width = 257
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
  end
  object Button1: TButton
    Left = 824
    Top = 280
    Width = 75
    Height = 25
    Caption = 'client teste'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 712
    Top = 184
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 224
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 9998
    OnExecute = IdTCPServer1Execute
    Left = 592
    Top = 176
  end
end
