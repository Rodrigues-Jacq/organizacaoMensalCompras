#!/bin/bash

clear
echo Bem-vindo a Organização Mensal de Compras
echo
read -p "Informe o mês - Preferencialmente o seu nome: " MES
# contador
CONT=1
read -p "Informe a quantidade de itens a serem comprados: " QUANTIDADE
while [ $CONT -le $QUANTIDADE ] # menor ou igual
do
	echo
	read -p "Informe o nome do produto: " PRODUTO
	read -p "Informe o preço do produto: " PRECO
	let TOTAL="$TOTAL + $PRECO" # adicionado na variável total e mostra apenas para o usuário
	echo Total = $TOTAL
	echo
	DIR=/home/Jacqueline/
	ARQUIVO=OrganizaçãoMensal$MES
	if [ -e $DIR$ARQUIVO ]
	then
		# arquivo existe
		echo "$PRODUTO = $PRECO" >> $ARQUIVO # adiciona no arquivo
	else
		# arquivo não existe
		touch $ARQUIVO # cria arquivo vazio
		echo "$PRODUTO = $PRECO" >> $ARQUIVO # adiciona no arquivo
		fi
		(( CONT++ ))
done
echo >> $ARQUIVO
echo Total = $TOTAL >> $ARQUIVO # adiciona o valor final no arquivo
