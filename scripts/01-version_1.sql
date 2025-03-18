CREATE USER CARTORIO IDENTIFIED BY mvregistry
DEFAULT TABLESPACE mvcartorio_D
/

GRANT resource,create session to CARTORIO
/

ALTER USER CARTORIO quota unlimited on mvcartorio_D
/

ALTER USER CARTORIO quota unlimited on mvcartorio_I
/

ALTER USER CARTORIO quota unlimited on mvcartorio_L
/

CREATE TABLE CARTORIO.STATUS (
		STATUS_ID NUMBER NULL,
		MESSAGE VARCHAR(2000) NOT NULL
     ) 
TABLESPACE mvcartorio_D
/

ALTER TABLE CARTORIO.STATUS ADD CONSTRAINT CNT_STATUS_PK PRIMARY KEY (STATUS_ID)
/

COMMENT ON TABLE  CARTORIO.STATUS  IS ''
/

COMMENT ON COLUMN CARTORIO.STATUS.STATUS_ID IS ''
/

COMMENT ON COLUMN CARTORIO.STATUS.MESSAGE IS ''
/

GRANT DELETE,INSERT,SELECT,UPDATE ON CARTORIO.STATUS TO MV2000
/

CREATE TABLE CARTORIO.DOCUMENT (
  DOCUMENT_ID NUMBER NOT NULL,
  STATUS_ID NUMBER NOT NULL,
  CONTENT BLOB NULL,
  ORIGIN  VARCHAR(500) NULL,
  JMS  VARCHAR(1) DEFAULT 'N' NULL,
  CONTRACT  VARCHAR(2000) NULL,
  DOCUMENT_TYPE VARCHAR(500) NOT NULL,
  REFERENCE_TIME TIMESTAMP NULL,
  METHOD VARCHAR(500) NOT NULL,
  METHOD_TYPE VARCHAR(500) NOT NULL
) 
TABLESPACE mvcartorio_D
/

ALTER TABLE CARTORIO.DOCUMENT ADD CONSTRAINT CNT_DOCUMENT_PK PRIMARY KEY(DOCUMENT_ID)
/

ALTER TABLE CARTORIO.DOCUMENT ADD CONSTRAINT CNT_DOCUMENT_FK FOREIGN KEY(STATUS_ID) REFERENCES CARTORIO.STATUS(STATUS_ID)
/

CREATE INDEX IND_DOCUMENT_FK ON CARTORIO.DOCUMENT(STATUS_ID)
   TABLESPACE mvcartorio_I
/

ALTER TABLE CARTORIO.DOCUMENT MOVE LOB(CONTENT) STORE AS (TABLESPACE mvcartorio_L)
/

GRANT DELETE,INSERT,SELECT,UPDATE ON CARTORIO.DOCUMENT TO MV2000
/

CREATE TABLE CARTORIO.SIGNATURE (
  SIGNATURE_ID NUMBER NOT NULL,
  DOCUMENT_ID NUMBER NOT NULL,
  HASH BLOB NULL,
  ALIAS VARCHAR(500) NULL,
  KEY_TYPE VARCHAR(255) NULL,
  SIGNER_TYPE VARCHAR(255) NULL,
  TOKEN_TYPE VARCHAR(255) NULL,
  SIGNATURE_TYPE VARCHAR(500) NULL,
  VALUE          BLOB NULL,
  REFERENCE_TIME TIMESTAMP NULL
) 
TABLESPACE mvcartorio_D
/

ALTER TABLE CARTORIO.SIGNATURE ADD CONSTRAINT CNT_SIGNATURE_PK PRIMARY KEY(SIGNATURE_ID)
/

ALTER TABLE CARTORIO.SIGNATURE ADD CONSTRAINT CNT_SIGNATURE_FK FOREIGN KEY(DOCUMENT_ID) REFERENCES CARTORIO.DOCUMENT(DOCUMENT_ID)
/

CREATE INDEX IND_SIGNATURE_FK ON CARTORIO.SIGNATURE(DOCUMENT_ID)
   TABLESPACE mvcartorio_I
/

ALTER TABLE CARTORIO.SIGNATURE MOVE LOB(HASH) STORE AS (TABLESPACE mvcartorio_L)
/

ALTER TABLE CARTORIO.SIGNATURE MOVE LOB(VALUE) STORE AS (TABLESPACE mvcartorio_L)
/

GRANT DELETE,INSERT,SELECT,UPDATE ON CARTORIO.SIGNATURE TO MV2000
/

CREATE SEQUENCE CARTORIO.HIBERNATE_SEQUENCE
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  INCREMENT BY 1
  NOCYCLE
  NOORDER
  CACHE 20
/