"""Faça um programa que peça ao usuário para digitar um número inteiro,
informe se este número é par ou ímpar. Caso o usuário não digite um número
inteiro, informe que não é um número inteiro."""

numero_int = input("Digite um número inteiro: ")

try:
    numero_int = int(numero_int)
    divisao = numero_int%2 

    if  divisao == 0:
        print(f"O numero {numero_int} é par")
    else:
         print(f"O numero {numero_int} é ímpar")
except:
    print("Numero informado não é interiro")