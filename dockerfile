FROM oraclelinux:7-slim

# Instalar dependências
RUN yum install -y oracle-instantclient-release-el7 && yum install -y oracle-instantclient-basic oracle-instantclient-sqlplus

# Definir variáveis do Oracle Client
ENV LD_LIBRARY_PATH=/usr/lib/oracle/19.8/client64/lib
ENV PATH=$PATH:/usr/lib/oracle/19.8/client64/bin

# Criar diretório para os scripts SQL
WORKDIR /scripts

# Copiar os scripts para o container
COPY scripts /scripts

# Definir o ponto de entrada
ENTRYPOINT ["/scripts/script-db.sh"]