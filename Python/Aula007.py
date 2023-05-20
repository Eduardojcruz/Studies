"""
Operações condicionais
if  / elif       / else
se /  se não se /  se não
"""
entrada = input("Você quer sair ou entrar?")

if entrada == 'entrar':
    print("Você entrou")

elif entrada == 'sair':
    print("Você saiu")

else:
    print("Você não digitou nem entrar e nem sair")

condicao1 = False
condicao2 = False
condicao3 = False
condicao4 = False
condicao5 = True

if condicao1:
    print("Código condição 1")

elif condicao2:
    print("Código condição 2")

elif condicao3:
    print("Código condição 3")

elif condicao4:
    print("Código condição 4")

elif condicao5:
    print("Código condição 5")

else:
    print("Nenhuma condição é verdadeira.")