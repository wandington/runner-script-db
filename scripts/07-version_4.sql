ALTER TABLE cartorio.document ADD TIPO_DOCUMENTO VARCHAR2(50);

ALTER TABLE cartorio.document ADD DS_CONSELHO VARCHAR2(50);

ALTER TABLE cartorio.document ADD REGISTRO_CONSELHO VARCHAR2(50);

ALTER TABLE cartorio.document ADD UF_CONSELHO VARCHAR2(20);

ALTER TABLE cartorio.document ADD ESPECIALIDADE VARCHAR2(100);

INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-3, 'Documento não assinado. O conteúdo encontra-se vazio.');
