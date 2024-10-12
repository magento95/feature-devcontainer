#!/bin/bash

set -e

# Verifica se PHP è installato
if ! command -v php &> /dev/null
then
    echo "PHP non è stato installato!"
    exit 1
fi

# Verifica la versione di PHP
PHP_VERSION=$(php -v | grep -o -m 1 "PHP 8.1")
if [[ "$PHP_VERSION" != "PHP 8.1" ]]; then
    echo "La versione di PHP installata non è corretta!"
    exit 1
fi

# Verifica se Composer è installato (se selezionato)
if ! command -v composer &> /dev/null
then
    echo "Composer non è stato installato!"
    exit 1
fi

echo "Test completato con successo!"
