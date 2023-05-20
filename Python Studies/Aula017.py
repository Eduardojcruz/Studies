"""
Flag( Bandeira)- Marcar um local
None = não valor
is e is not = é ou não é

"""
#v1 = 'b'
#print(id(v1))

condicao = False
passou_if = None

if condicao:
    print('Faça algo')
    passou_if = True
else: 
    print("não faça algo")

print(passou_if, passou_if is None)

print(passou_if, passou_if is  not None)