"""
Exercicio
Peça para usuario digitar nome e idade
Se nom,e e idade forem digitados:
    exiba
        nome
        idade
        invertido o nome
        se contem espaços
        tamanho do nome
        primeira letra
        ultima letra
    se nada for digitado
        exiba msg de erro
"""
nome_user  = input("Digite seu nome: ")
idade  = input("Digite sua idade: ")

if nome_user and idade:
    print("Seu nome é {}".format(nome_user))
    print("Sua idade é {}".format(idade))
    print("Seu nome invertido é {}".format(nome_user[::-1]))
    if ' ' in nome_user:
        print("Seu nome contem espaço.")
    else:
        print("Seu nome não contem espaço.")

    print("Seu nome tem {} letrar".format(len(nome_user)))
    print("Seu primeira letra do nome é {}".format(nome_user[0]))
    print("Seu ultima letra do seu nome é {}".format(nome_user[-1]))
else:
    print("Erro, não digitou nome ou idade")