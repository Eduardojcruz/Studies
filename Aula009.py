"""
Operadores lógicos

and (e) or (ou) not (não)
and -- Precisa ser tudo verdadeiro
or -- Pelo menos uma
not -- Inverter expressões

"""
var_1 = 1
var_2 = 2
if var_1 == 1 and var_2 == 1:
    print("Erro")
elif var_1 == 1 and var_2 == 2:
    print(f"{var_1=} e {var_2=}")
else:
    print("Erro")

if var_1 == 1 or var_2 == 2:
    print("Um dos itens é verdadeiro")
    print("Erro")

print(not True)
print(not False)