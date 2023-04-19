"""
Operadores de comparação
2 > 1
2 >= 2
1 < 2
'a' == 'a'
'a' != 'b'
"""
primeiro_valor = input('Digite um valor: ')
segundo_valor = input('Digite outro valor: ')

if primeiro_valor >=  segundo_valor:
    print(f'{primeiro_valor=} é maior ou igual que o {segundo_valor=}')

else:
    print(f'{segundo_valor=} é maior que o {primeiro_valor=}') 