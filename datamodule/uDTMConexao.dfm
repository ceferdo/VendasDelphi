object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 269
  Width = 625
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    Connected = True
    HostName = '.\SQLEXPRESS'
    Port = 1433
    Database = 'Vendas'
    User = 'sa'
    Password = 'bmb06081956'
    Protocol = 'mssql'
    LibraryLocation = 'C:\ProjetoDelphi\ntwdblib.dll'
    Left = 24
    Top = 16
  end
end
