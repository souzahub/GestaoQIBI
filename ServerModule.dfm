object UniServerModule: TUniServerModule
  OldCreateOrder = False
  TempFolder = 'temp\'
  Port = 8084
  Title = '5'#170' Igreja Batista'
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomFiles.Strings = (
    '/files/style.css')
  CustomMeta.Strings = (
    
      '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/' +
      'bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0i' +
      'XCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" cross' +
      'origin="anonymous">')
  ServerMessages.LoadingMessage = 'Carregando...'
  ServerLimits.MaxSessions = 30
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 368
  Width = 309
end
