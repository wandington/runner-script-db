ALTER TABLE cartorio.document ADD CNPJ VARCHAR2(50);

-- início de trecho opcional: só aplicar se cliente utilizar assinatura avançada multiempresa com e-val
GRANT SELECT ON dbamv.pw_documento_clinico TO cartorio;
GRANT SELECT ON dbamv.atendime TO cartorio;
GRANT SELECT ON dbamv.multi_empresas TO cartorio;
GRANT SELECT ON dbamv.paciente TO cartorio;

alter table DBAMV.ASSINATURA_DIGITAL modify NR_CPF_ASSINATURA NULL;
-- fim de trecho opcional: só aplicar se cliente utilizar assinatura avançada multiempresa com e-val

insert into cartorio.status (status_id, message) values ( -20904, 'Falha com o retorno da E-val.');