DECLARE

  CURSOR C_STATUS (P_STATUS_ID NUMBER) IS
    SELECT COUNT(1)
      FROM CARTORIO.STATUS
     WHERE STATUS_ID = P_STATUS_ID;

  N_COUNT NUMBER := 0;

BEGIN

  OPEN C_STATUS(-994);
  FETCH C_STATUS INTO N_COUNT;
  CLOSE C_STATUS;

  IF N_COUNT <= 0 THEN
    INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-994, 'O certificado não está ativo.');
  ELSE
    UPDATE CARTORIO.STATUS SET MESSAGE = 'O certificado não está ativo.' WHERE STATUS_ID = -994;
  END IF;

  COMMIT;

END;