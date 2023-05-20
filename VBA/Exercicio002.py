"""
Faça um programa que pergunte a hora ao usuário e, baseando-se no horário 
descrito, exiba a saudação apropriada. Ex. 
Bom dia 0-11, Boa tarde 12-17 e Boa noite 18-23.

"""

horas = input("Informe a hora em números inteiros: ")

if horas.isdigit():
    horas = int(horas)
    if horas <= 11 and horas >= 0:
        print("Bom dia")
    elif horas <= 17 and horas >=12:
        print("Boa tarde")

    elif horas <= 23 and horas >=18:
        print("Boa noite")

    else:
        print("Horas informadas estão incorreta")
else:
    print("Horas digitadas estão incorreta")