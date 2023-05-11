"""
Repetições

Dois loops

"""

qtds_linhas = 4
qtds_coluna = 4
 
linha = 1

while linha <= qtds_linhas:
    coluna = 1
    while coluna <= qtds_coluna:
        print(linha, coluna)
        coluna +=1
    linha +=1
print("Acabou")