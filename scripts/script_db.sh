#!/bin/bash

echo "Aguardando o banco de dados ficar disponível..."
sleep 5  # Ajuste esse tempo conforme necessário

echo "Executando scripts SQL..."
for script in /scripts/*.sql; do
  echo "Executando $script"
  echo exit | sqlplus "$DB_USER/$DB_PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$DB_HOST)(PORT=$DB_PORT))(CONNECT_DATA=(SERVICE_NAME=$DB_SERVICE)))" @"$script"
done

echo "Todos os scripts foram executados com sucesso!"