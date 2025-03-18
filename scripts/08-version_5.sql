INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-4, 'Quantidade máxima de documentos na requisição atingida.');

INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-5, 'Existe(m) documento(s) já assinado(s).');

ALTER TABLE cartorio.document ADD PDF_PACIENTE BLOB;
ALTER TABLE cartorio.document ADD P7S_PACIENTE BLOB;
INSERT INTO cartorio.status VALUES (-20, 'Ocorreu um erro ao salvar a resposta da assinatura do documento.');
INSERT INTO cartorio.status VALUES (-21, 'PIN não enviado na requisição.');

ALTER TABLE CARTORIO.DOCUMENT ADD ID_CLIENT NUMBER; 

ALTER TABLE cartorio.document ADD (INSTANCIA NUMBER DEFAULT 1 NOT NULL);

INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-22, 'PIN enviado está incorreto.');
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-23, 'Usuário não possui certificado emitido ou válido.');
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-24, 'Multiempresa referente a esse documento não possui CNPJ cadastrado.');

INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-21003, 'Sua última assinatura foi realizada em uma empresa diferente da atual. Por favor, tente novamente e insira o PIN para assinar na empresa que você acabou de abrir.');