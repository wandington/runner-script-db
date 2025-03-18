DECLARE

  CURSOR C_STATUS (P_STATUS_ID NUMBER) IS
    SELECT COUNT(1) 
      FROM CARTORIO.STATUS  
     WHERE STATUS_ID = P_STATUS_ID;

  N_COUNT NUMBER := 0;

BEGIN

  OPEN C_STATUS(999); 
  FETCH C_STATUS INTO N_COUNT;
  CLOSE C_STATUS;

  IF N_COUNT <= 0 THEN
    INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (999, 'Aguardando Assinatura.');
  END IF;
  
  OPEN C_STATUS(998); 
  FETCH C_STATUS INTO N_COUNT;
  CLOSE C_STATUS;

  IF N_COUNT <= 0 THEN
    INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (998, 'Processando assinatura.');
  END IF;
  
  OPEN C_STATUS(-998); 
  FETCH C_STATUS INTO N_COUNT;
  CLOSE C_STATUS;

  IF N_COUNT <= 0 THEN
    INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-998, 'Número de tentativas excedidos.');
  END IF;

  OPEN C_STATUS(-997); 
  FETCH C_STATUS INTO N_COUNT;
  CLOSE C_STATUS;

  IF N_COUNT <= 0 THEN
    INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-997, 'A assinatura não é válida.');
  END IF;
  
  OPEN C_STATUS(-995); 
  FETCH C_STATUS INTO N_COUNT;
  CLOSE C_STATUS;

  IF N_COUNT <= 0 THEN
    INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-995, 'Ocorreu um problema ao processar documento no catório digital.');
  END IF;
  
  OPEN C_STATUS(0); 
  FETCH C_STATUS INTO N_COUNT;
  CLOSE C_STATUS; 

  IF N_COUNT <= 0 THEN
    INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (0, 'Operação realizada com sucesso.');
  else
	UPDATE CARTORIO.STATUS SET MESSAGE= 'Operação realizada com sucesso.' WHERE STATUS_ID = 0;
  END IF;
  
  COMMIT;
  
END;
/

INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10001,   'Erro não especificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10102, 'Erro ao decodificar assinatura (CMS).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10106, 'Erro ao abrir Store de certificados.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10107, 'O certificado não foi encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10131, 'O certificado não está associado à aplicação.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10135, 'Assinatura para verificação não informada na requisição (Atributo ''Signature.Value'' vazio).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10136, 'O parâmetro alias não pode ser nulo ou vazio.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10137, 'O parâmetro encodedContainer está incorreto.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10138, 'O parâmetro containerPassword está incorreto.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10139, 'O parâmetro containerProtection está incorreto.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10140, 'O parâmetro thumbprint não pode ser nulo ou vazio.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10141, 'Ocorreu um erro ao decodificar o SALT.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10142, 'Ocorreu um erro ao decodificar o SEED.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10143, 'Certificados associados a aplicações não podem ser removidos.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10171, 'Propósito extendido idKpTimeStamping inválido para o tipo de certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10202, 'Conteúdo Base64 da assinatura inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10203, 'Assinatura não possui o formato esperado (BER ou DER).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10204, 'Atributo assinado SigningTime inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10205, 'Conteúdo Base64 da requisição inválido (Atributo RequestDocument.Content).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10245, 'Valor do MessageImprint do carimbo de tempo não confere com assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10246, 'Ocorreu uma exceção ao verificar o carimbo de tempo (TST).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10253, 'O tipo de certificado possui um período de validade maior que o prazo esperado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10254, 'O campo Other Name para os dados do titular pessoa física possui um tamanho inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10255, 'O campo Other Name para os dados do título de eleitor possui um tamanho inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10256, 'O campo Other Name para o Cadastro Específico do INSS (CEI) de pessoa física possui um tamanho inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10257, 'O campo Other Name para o Registro de Identidade Civil (RIC) possui um tamanho inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10258, 'O campo Other Name para os dados do titular pessoa jurídica possui um tamanho inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10259, 'O campo Other Name para o Cadastro Específico do INSS (CEI) de pessoa jurídica possui um tamanho inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10260, 'O campo Other Name para Cadastro Nacional de Pessoa Jurídica (CNPJ) possui um tamanho inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10302, 'Certificado revogado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10303, 'Propósito de uso da chave inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10306, 'O certificado está inativo.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10307, 'Assinatura digital inválida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10309, 'Conteúdo não encontrado na assinatura (CMS Attached).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10310, 'Cadeia de certificação incompleta.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10311, 'Não foi fechada cadeia de certificação com nenhum certificado raiz confiável.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10312, 'O certificado ou um dos certificados da cadeia não possui propósito válido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10313, 'O certificado ou um dos certificados da cadeia não possui assinatura válida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10314, 'O certificado ou um dos certificados da cadeia está fora do período de validade.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10315, 'Autoridade Certificadora Raiz não é ICP-BRASIL.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10316, 'Algum certificado da cadeia está revogado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10317, 'Não foi possível determinar a revogação de um dos certificados.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10318, 'A lista de certificados confiáveis usada para montar a cadeia de certificação não é válida no tempo.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10319, 'A lista de certificados confiáveis usada para montar a cadeia de certificação não possui assinatura válida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10320, 'Algum certificado da cadeia não possui extensão válida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10321, 'Algum certificado da cadeia possui Policy Constraints inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10322, 'Algum certificado da cadeia possui Basic Constraints inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10323, 'Algum certificado da cadeia possui Name Constraints inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10324, 'Algum certificado da cadeia possui Name Constraints que não são suportados.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10325, 'Algum certificado da cadeia possui Name Constraints que não estão definidos.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10326, 'Algum certificado da cadeia possui Name Constraints que não são permitidos.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10327, 'Algum certificado da cadeia possui Name Constraints que está explicitamente excluído.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10328, 'Algum certificado da cadeia possui estado de revogação OFF-LINE.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10329, 'Algum certificado da cadeia não possui Issuance Policy.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10330, 'Erro desconhecido em algum certificado da cadeia.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10331, 'Propósito extendido de uso da chave não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10332, 'Propósito extendido de uso da chave inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10333, 'Propósito de não repúdio não encontrado no certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10334, 'Ticket inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10335, 'Certificado bloqueado devido a tentativa de uso incorreta.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10336, 'Uso do ticket não configurado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10337, 'Ocorreu um erro ao associar o ticket ao certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10338, 'Ocorreu um erro ao decodificar o ticket do certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10340, 'Algum certificado da cadeia não possui Basic Constraints.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10341, 'Certificado de autoridade certificadora não possui o propósito de uso de assinatura de chave.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10342, 'Certificado não possui o propósito extendido de uso de autenticação de cliente.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10343, 'Extensão EnhancedKeyUsage do certificado de TimeStampToken deve ser marcada como Critica.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10344, 'Extensão EnhancedKeyUsage do certificado de TimeStampToken deve conter apenas um único propósito.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10345, 'Certificado do TimeStampToken não possui o propósito extendido idKpTimeStamping.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10346, 'Política do certificado inválida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10347, 'Política do certificado de TimeStampToken inválida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10348, 'Campo NextUpdate da CRL inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10349, 'Extensão ''CrlDistributionPoint'' não encontrada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10350, 'Campo ''FullName'' não encontrado na estrutura ''CrlDistributionPoint''.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10351, 'Campo ''FullName'' vazio na estrutura ''CrlDistributionPoint''.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10352, 'TagNo do campo ''FullName'' da estrutura ''CrlDistributionPoint'' não é do tipo ''UniformResourceIdentifier''.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10353, 'Erro ao criar contexto para CRL.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10354, 'Exceção ao verificar período de validade do certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10355, 'Exceção ao verificar cadeia de certificação.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10356, 'Propósito de uso de chave inválido para certificado assinante de OCSP - Esperado DigitalSignature e/ou NonRepudiation.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10357, 'Propósito de uso de chave inválido para certificado assinante de CRL - Esperado CRLSign.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10358, 'Verificação da revogação por CRL não efetuada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10359, 'Tipo de container não suportado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10360, 'Container possui mais de um certificado entidade final.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10361, 'Container possui mais de uma chave privada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10362, 'Container não possui uma chave privada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10363, 'Container não possui um certificado entidade final.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10364, 'Chave pública do certificado entidade final não corresponde a chave privada do container.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10365, 'O certificado não está inativo.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10366, 'Tipo de repositório inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10371, 'A chave já está cadastrada no sistema.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10402, 'Exceção ao verificar assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10403, 'Certificado do signatário não encontrado no caminho de certificação.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10408, 'Ocorreu uma exceção ao carregar o container.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10409, 'Exceção ao obter o endereço de distribuição da CRL (CDP) do certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10416, 'Exceção ao verificar propósito do certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10418, 'Exceção ao obter a lista de certificados revogados (CRL).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10425, 'Exceção ao verificar assinatura digital.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10430, 'Ocorreu uma exceção ao encriptar a senha de proteção.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10502, 'CRL não ideal. A data de referência é maior que a data efetiva da CRL.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10604, 'Ocorreu uma exceção ao separar signatários de documento assinado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10607, 'Ponteiro nulo.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10611, 'Certificado do TSA não encontrado na estampilha temporal (TST).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10704, 'Não foi encontrado o SignerInfo.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10705, 'Identificador da política de assinatura não encontrado (SignaturePolicyID).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10706, 'Identificador da política de assinatura inválido (SignaturePolicyID).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10707, 'Resumo criptográfico da política de assinatura inválido (SignaturePolicyID).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10708, 'Atributo assinado SigningCertificate não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10709, 'Atributo assinado SigningCertificate inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10710, 'Atributo assinado SigningCertificateV2 não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10711, 'Atributo assinado SigningCertificateV2 inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10724, 'Identificador do tipo de conteúdo assinado inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10725, 'Resumo criptográfico da mensagem incorreto.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10726, 'Identificação do certificado assinante não encontrada no atributo assinado SigningCertificate.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10727, 'Resumo criptográfico do certificado assinante inválido no atributo assinado SigningCertificate.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10728, 'Emissor/Serial do certificado assinante inválido no atributo assinado SigningCertificate.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10729, 'Identificação do certificado assinante não encontrada no atributo assinado SigningCertificateV2.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10730, 'Resumo criptográfico do certificado assinante inválido no atributo assinado SigningCertificateV2.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10731, 'Emissor/Serial do certificado assinante inválido no atributo assinado SigningCertificateV2.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10733, 'Algoritmo do resumo criptográfico da política de assinatura inválido (SignaturePolicyID).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10734, 'Política de assinatura não encontrada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10735, 'Algoritmo criptográfico e/ou tamanho de chave inválidos para política de assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10736, 'Referência de tempo anterior ao período de vigência da política de assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10737, 'Referência de tempo posterior ao período de vigência da política de assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10738, 'Período de vigência da política de assinatura inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10739, 'Política de assinatura revogada antes da referência de tempo da assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10740, 'Não foi possível obter a política de assinatura a partir da URI.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10741, 'Qualificador da política de assinatura inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10742, 'Quantidade de qualificadores da política de assinatura incorreta - esperado spuri.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10743, 'Atributo assinado esperado pela política de assinatura não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10744, 'Uso inválido do identificador de algoritmo DEFAULT na estrutura ESSCertIDv2.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10745, 'DOC-ICP-15 v6 Nota 1 Campo sigPolicyQualifiers não encontrado na estrutura SignaturePolicyId.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10746, 'DOC-ICP-15 v6 Nota 1 Campo SigQualifier não encontrado na estrutura SignaturePolicyId.SigPolicyQualifierInfo[0].')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10747, 'DOC-ICP-15 v6 Nota 3 Campo parameters encontrado na estrutura SignedData.digestAlgorithms.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10748, 'DOC-ICP-15 v6 Nota 3 Campo parameters encontrado na estrutura SignerInfo.digestAlgorithm.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10749, 'DOC-ICP-15 v6 Nota 3 Campo parameters encontrado na estrutura SignaturePolicyId.sigPolicyHash.hashAlgorithm.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10750, 'Atributo não assinado esperado pela política de assinatura não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10751, 'Assinatura da consulta à revogação online (OCSP) inválida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10752, 'Horário de atualização da OCSP é posterior ao horário do sistema.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10753, 'Próxima atualização da OCSP é anterior ao horário do sistema.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10754, 'Ocorreu uma exceção ao verificar a revogação do certificado por OCSP.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10755, 'Ocorreu uma falha ao verificar a revogação do certificado por OCSP.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10756, 'Atributo não assinado CertificateRefs não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10757, 'Atributo não assinado CertificateRefs inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10758, 'Quantidade de certificados no atributo assinado CertificateRefs inválida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10759, 'Atributo não assinado RevocationRefs não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10760, 'Atributo não assinado RevocationRefs inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10761, 'Atributo não assinado RevocationValues não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10762, 'Nenhuma referência de validação foi encontrada no atributo não assinado RevocationValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10763, 'Cadeia de certificação inválida para o atributo não assinado RevocationValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10764, 'Atributo não assinado CertificateValues não encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10765, 'Atributo não assinado CertificateValues inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10766, 'Certificado entidade final não permitido no atributo não assinado CertificateValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10767, 'Cadeia de certificação inválida no atributo não assinado CertificateValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10768, 'Referências de certificados diferente de certificados nos atributos não assinados CertificateRefs e CertificateValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10769, 'Referência de certificado do atributos não assinado CertificateRefs não encontrada no atributo CertificateValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10770, 'Atributo não assinado CertificateRefs não encontrado para validar atributo CertificateValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10771, 'Lista de certificados revogados referenciada no atributo não assinado RevocationRefs não foi encontrada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10772, 'Referências de revogação diferente de LCRs nos atributos não assinados RevocationRefs e RevocationValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10773, 'Referência de revogação do atributo não assinado RevocationRefs não encontrada no atributo RevocationValues.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10774, 'Propriedade assinada DataFormatObject não encontrada da assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10775, 'Conteúdo XML da requisição inválido (Atributo RequestDocument.Content).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10776, 'Conteúdo XML da assinatura inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10777, 'Exceção ao verificar assinatura digital XMLDSig.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10778, 'A assinatura não está no formato XAdES.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10779, 'Algoritmo de resumo criptográfico da referência não está de acordo com a política de assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10780, 'Transformação de canonização não está de acordo com a política de assinatura.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10800, 'Não foi encontrada uma lista de certificados revogados (CRL) equivalente dentro da assinatura (CMS).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10801, 'Exceção ao obter a lista de certificados revogados (CRL) da assinatura (CMS).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10803, 'Não foi possível obter a estampilha temporal (TST) a partir da assinatura (CMS).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10805, 'Exceção ao unir documento e os signatários.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10806, 'Exceção ao assinar.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10811, 'Assinatura da lista de certificados revogados (CRL) inválida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10813, 'Erro ao obter o emissor da lista de certificados revogados (CRL).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10815, 'Ocorreu um erro ao usar a chave privada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10817, 'Erro ao codificar a estampilha temporal (TST).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10818, 'Exceção ao adicionar a estampilha temporal (TST).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10822, 'Certificado não possui o atributo Authority Information Access.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10823, 'Ocorreu um erro ao obter emissores do certificado a partir da URL.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10824, 'Exceção ao obter emissores do certificado a partir da URL.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10825, 'Falha ao obter estampilha temporal (TST) a partir da Autoridade de Carimbo de Tempo (TSA).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10831, 'Não foi possível decriptar o PIN do usuário.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10832, 'Não foi possível informar o PIN do usuário à CSP.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10833, 'O PIN do usuário está incorreto.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10840, 'Certificado da estampilha temporal (TST) diferente do esperado (Cert Servidor TSA).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10842, 'Erro ao obter data e hora a partir da estampilha de tempo (TST).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10843, 'Ocorreu um erro ao gerar o serialNumber para a estampilha de tempo (TST).')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10844, 'Ocorreu uma exceção ao obter emissores do certificado a partir da URL.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10901, 'SIGDESC inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10902, 'FRIENDLYNAME inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-10903, 'Ocorreu um erro ao gerar o ticket.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20110, 'A mensagem foi recebida e ainda será processada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20120, 'Você está registrado no sistema.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20130, 'O certificado é válido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20131, 'A CSR é válido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20132, 'O certificado é marcado como revogado, então usuário final será informado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20140, 'A assinatura é válida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20200, 'Um argumento na solicitação está faltando:%S')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20201, 'Erro entre os argumentos do pedido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20202, 'A mensagem é muito grande ou um de seus argumentos tem o comprimento errado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20203, 'Não pode lidar com determinado MIME-Type ou estilo de codificação.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20204, 'A AP solicitou um tipo de chave, a utilização de chaves ou assinatura política que o MSS não suporta.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20205, 'equipamento móvel do usuário final não consegue lidar com este tipo de dados.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20206, 'O pedido ou é parâmetros são duplicados.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20210, 'largura de banda insuficiente esquerda para realizar a transação.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20211, 'O número máximo de tentativas excedido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20212, 'O usuário deve pagar pelo uso de certificado, mas ele está fora de crédito.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20220, 'A AP é desconhecido ou a autenticação é errado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20221, 'O MSS quer antes de negociar com o AP a utilização de assinaturas XML nas mensagens.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20222, 'O mecanismo de autenticação não foi especificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20300, 'O MSS não poderia entrar em contato com o equipamento móvel do usuário final.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20301, 'A operação expirou.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20310, 'Esta transação é desconhecido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20311, 'Este enduser é desconhecida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20312, 'Este serviço adicional é desconhecida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20320, 'Erro durante o processo de assinatura no equipamento móvel.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20321, 'Erro durante a geração do certificado no equipamento móvel.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20400, 'O cliente cancelou a transação.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20410, 'A verificação de integridade falhou.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20411, 'A autenticação falhou.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20412, 'A descodificação da mensagem falhou.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20413, 'A mensagem não pôde ser decodificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20420, 'A versão da mensagem não é apropriado para o receptor.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20421, 'O receptor estava esperando uma chave simétrica.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20422, 'O receptor não estava esperando uma chave simétrica.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20423, 'Esta mensagem não é suposto ser recebido no momento.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20424, 'A chave de autenticação expirou.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20425, 'A nova chave não é aceitável.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20430, 'Esta mensagem não existe no equipamento móvel ou que foi excluído.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20431, 'Não há nenhum usuário móvel com este ID.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20440, 'Erro interno.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20450, 'Este serviço adicional não pode ser ativado para este telemóvel ou esta empresa.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20451, 'Este serviço adicional não é permitido ou não é suportado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20452, 'Este serviço adicional já foi ativado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20500, 'Esta plataforma é desconhecida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20501, 'O token é incorreto.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20502, 'identificador único é inválido.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20503, 'identificador único já registrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20600, 'O certificado é inválido, sem dar mais detalhes.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20601, 'A CSR é inválido, sem dar mais detalhes.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20602, 'O CRL é inválida, sem dar mais detalhes.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20603, 'Um certificado X509 não poderia ser construída.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20604, 'O certificado foi revogado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20605, 'O certificado está expirado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20606, 'A data atual precede a um no campo NOT_BEFORE do certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20607, 'O certificado é bloqueado ou em um dos estados de operação pendente.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20608, 'O certificado foi emitido por uma autoridade de certificação desconhecida ou não confiável')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20609, 'O certificado usa um tamanho de chave que não é suportado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20620, 'Nenhum certificado foi encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20621, 'cadeia de confiança não foi encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20622, 'A chave privada do certificado não foi encontrado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20630, 'O smartcard encontrou um erro durante a operação.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20631, 'O PIN do cartão inteligente foi bloqueado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20632, 'O smartcard é bloqueado e não pode ser mais utilizado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20633, 'O smartcard não está conectado no equipamento móvel.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20640, 'O pino é errado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20650, 'Este certificado não pode ser revogada.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20660, 'Este certificado já existe no banco de dados do servidor e não pode ser duplicado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20661, 'O usuário não é o proprietário do certificado.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20662, 'A chave pública no certificado é diferente da chave pública contida no CSR.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20700, 'A assinatura não é válida.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20710, 'O modelo não existe.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20711, 'O documento não pode ser encontrado no armazenamento interno.')
/
INSERT INTO CARTORIO.STATUS(STATUS_ID, MESSAGE) VALUES (-20712, 'O documento baixado na url tem outro hash.')
/
ALTER TABLE CARTORIO.SIGNATURE ADD CERTIFICATE_TYPE VARCHAR(255) NULL
/
ALTER TABLE CARTORIO.SIGNATURE ADD MESSAGE VARCHAR(500) NULL
/
ALTER TABLE CARTORIO.SIGNATURE ADD SUBJECT VARCHAR2(500) NULL
/
ALTER TABLE CARTORIO.SIGNATURE ADD ISSUER VARCHAR2(500) NULL
/
ALTER TABLE CARTORIO.DOCUMENT ADD NAME VARCHAR2(255) NULL
/
COMMIT
/
