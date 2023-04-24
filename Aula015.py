"""
try -> tentar executar o código
except -> ocorreu algum erro ao tentar executar

"""

numero = input("Vou dobrar o número que você digitar: ")

try:
    numero = int(numero)
    print(f"O dobro de {numero} é {numero  * 2}")
except:
    print("Erro")