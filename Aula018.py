"""
Repetições
while (enquanto)
Executa uma ação enquanto uma condição for verdadeira

"""
contador = 1

while True:
    contador=contador + 1
    
    
    if contador == 100:
        break
    if contador == 10:
        print("Não vou mostrar o 10")
        continue
    print(contador)
print("Acabou")


    