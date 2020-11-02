object dmDados: TdmDados
  OldCreateOrder = False
  Height = 431
  Width = 403
  object FDUsuario: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from USUARIO order by ID desc')
    Left = 32
    Top = 232
    object FDUsuarioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDUsuarioPERFIL: TStringField
      FieldName = 'PERFIL'
      Origin = 'PERFIL'
      Size = 15
    end
    object FDUsuarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object FDUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
    end
    object FDUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 10
    end
  end
  object FDQueryAuxiliar: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      '')
    Left = 32
    Top = 88
  end
  object FDQueryLogSys: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from LOGSYS order by ID desc')
    Left = 32
    Top = 160
    object FDQueryLogSysID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQueryLogSysDIA: TSQLTimeStampField
      FieldName = 'DIA'
      Origin = 'DIA'
    end
    object FDQueryLogSysLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 30
    end
    object FDQueryLogSysOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      Size = 30
    end
    object FDQueryLogSysOCORRENCIA: TStringField
      FieldName = 'OCORRENCIA'
      Origin = 'OCORRENCIA'
      Size = 100
    end
  end
  object FDCadMembros: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from CAD_MEMBROS order by NOME')
    Left = 32
    Top = 304
    object FDCadMembrosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDCadMembrosDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'DT_NASCIMENTO'
    end
    object FDCadMembrosDT_BATISMO: TDateField
      FieldName = 'DT_BATISMO'
      Origin = 'DT_BATISMO'
    end
    object FDCadMembrosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDCadMembrosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object FDCadMembrosNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object FDCadMembrosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object FDCadMembrosCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object FDCadMembrosEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object FDCadMembrosUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDCadMembrosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object FDCadMembrosDATASTATUS_ATIVO: TDateField
      FieldName = 'DATASTATUS_ATIVO'
      Origin = 'DATASTATUS_ATIVO'
    end
    object FDCadMembrosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = FDCadMembrosSTATUSGetText
      Size = 10
    end
    object FDCadMembrosATIVO: TIntegerField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'ATIVO'
      OnGetText = FDCadMembrosATIVOGetText
      Calculated = True
    end
    object FDCadMembrosAUSENTE: TIntegerField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'AUSENTE'
      OnGetText = FDCadMembrosAUSENTEGetText
      Calculated = True
    end
    object FDCadMembrosEXCLUIDO: TIntegerField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'EXCLUIDO'
      OnGetText = FDCadMembrosEXCLUIDOGetText
      Calculated = True
    end
    object FDCadMembrosOBITO: TIntegerField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'OBITO'
      OnGetText = FDCadMembrosOBITOGetText
      Calculated = True
    end
  end
  object FDTransaction1: TFDTransaction
    Connection = UniMainModule.FDConnection1
    Left = 32
    Top = 24
  end
  object FDMembrosAtivos: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      
        'SELECT DT_BATISMO, NOME, DATA_CADASTRO, STATUS, DATASTATUS_ATIVO' +
        ' FROM CAD_MEMBROS Where STATUS = '#39'ativo'#39'order by NOME  ;')
    Left = 296
    Top = 32
    object FDMembrosAtivosDT_BATISMO: TDateField
      FieldName = 'DT_BATISMO'
      Origin = 'DT_BATISMO'
    end
    object FDMembrosAtivosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDMembrosAtivosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object FDMembrosAtivosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = FDMembrosAtivosSTATUSGetText
      Size = 10
    end
    object FDMembrosAtivosDATASTATUS_ATIVO: TDateField
      FieldName = 'DATASTATUS_ATIVO'
      Origin = 'DATASTATUS_ATIVO'
    end
  end
  object FDMembrosObito: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      
        'SELECT DT_BATISMO, NOME, DATA_CADASTRO, STATUS, DATASTATUS_ATIVO' +
        ' FROM CAD_MEMBROS Where STATUS = '#39'obito'#39' order by NOME;')
    Left = 296
    Top = 96
    object FDMembrosObitoDT_BATISMO: TDateField
      FieldName = 'DT_BATISMO'
      Origin = 'DT_BATISMO'
    end
    object FDMembrosObitoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDMembrosObitoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object FDMembrosObitoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = FDMembrosObitoSTATUSGetText
      Size = 10
    end
    object FDMembrosObitoDATASTATUS_ATIVO: TDateField
      FieldName = 'DATASTATUS_ATIVO'
      Origin = 'DATASTATUS_ATIVO'
    end
  end
  object FDMembrosAusente: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      
        'SELECT DT_BATISMO, NOME, DATA_CADASTRO, STATUS, DATASTATUS_ATIVO' +
        ' FROM CAD_MEMBROS Where STATUS = '#39'ausente'#39' order by NOME;')
    Left = 296
    Top = 160
    object FDMembrosAusenteDT_BATISMO: TDateField
      FieldName = 'DT_BATISMO'
      Origin = 'DT_BATISMO'
    end
    object FDMembrosAusenteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDMembrosAusenteSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = FDMembrosAusenteSTATUSGetText
      Size = 10
    end
    object FDMembrosAusenteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object FDMembrosAusenteDATASTATUS_ATIVO: TDateField
      FieldName = 'DATASTATUS_ATIVO'
      Origin = 'DATASTATUS_ATIVO'
    end
  end
  object FDMembrosExcluido: TFDQuery
    Connection = UniMainModule.FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      
        'SELECT DT_BATISMO, NOME, DATA_CADASTRO, STATUS, DATASTATUS_ATIVO' +
        ' FROM CAD_MEMBROS Where STATUS = '#39'excluido'#39' order by NOME;')
    Left = 296
    Top = 232
    object FDMembrosExcluidoDT_BATISMO: TDateField
      FieldName = 'DT_BATISMO'
      Origin = 'DT_BATISMO'
    end
    object FDMembrosExcluidoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDMembrosExcluidoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object FDMembrosExcluidoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = FDMembrosExcluidoSTATUSGetText
      Size = 10
    end
    object FDMembrosExcluidoDATASTATUS_ATIVO: TDateField
      FieldName = 'DATASTATUS_ATIVO'
      Origin = 'DATASTATUS_ATIVO'
    end
  end
end
