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
      'select * from CAD_MEMBROS order by ID desc')
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
  end
  object FDTransaction1: TFDTransaction
    Connection = UniMainModule.FDConnection1
    Left = 32
    Top = 24
  end
end
