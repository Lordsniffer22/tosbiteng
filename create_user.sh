#!/bin/bash

usuario=$1
senha=$2
validade=$3
limite=$4

dataValidade=$(date "+%Y-%m-%d" -d "+$validade days")
password=$(perl -e 'print crypt($ARGV[0], "password")' $senha)

useradd -M -s /bin/false -e $dataValidade -p $password -c "$4, $2" $usuario

if [ $? -eq 0 ]; then
    echo "User created"
    echo "$senha" > /etc/SSHPlus/senha/$usuario
    echo "$usuario $limite" >> /root/usuarios.db
fi
