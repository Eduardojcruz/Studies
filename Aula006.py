#Calculo de IMC
nome = input("Nome:")
altura = float(input("Altura: "))
peso = float(input("Peso: "))
imc = peso / altura ** 2
print("{} tem {} de altura, pesa {} quilos e seu imc é {}".format(nome,altura,peso,imc))