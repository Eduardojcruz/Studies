Sub Criar_doc_1_socio()
'Declarando as variáveis do Outlook
    Dim Outlook As Object, novo_email As Object

'Contando quantas linhas tem na coluna "A" para ser utilizado no loop
Total = WorksheetFunction.CountA(Range("A:A")) - 1

'Loop para realizar os envios e também é utilizado o i para pegar as informações da célula
For i = 3 To Total
    
    'Ativando o excel da 
    Windows("arquivo.xlsm").Activate
    Sheets("aba").Select
    e_mail = Range("AK" & i).Value
    
    'Atribuindo para manipulação do Outlook
    Set Outlook = CreateObject("outlook.application")
    Set novo_email = Outlook.CreateItem(0)
    
    'Atribuindo object para manipulação do Word
    Set objWord = CreateObject("Word.application")
    
    'Deixando visivel o word
    objWord.Visible = True
    
        'Atribuindo para manipulação do Word 
        Set arq = objWord.documents.Open("Caminho")
        Set conteudo = arq.Application.Selection
        
           ' Inserindo na variável do cabeçalho o nome da empresa com quebra de linha.
            Dim valorCabecalho As String
            valorCabecalho = "CONTRATO" & vbCrLf & UCase(Range("T" & i).Value)
            
            'Acessando o cabeçalho.
            Dim cabecalho As Object
            Set cabecalho = conteudo.Sections(1).Headers(1)
            
            ' Inserindo o cabeçalho.
             cabecalho.Range.Text = valorCabecalho
             
             'Alinhando o cabeçalho.
             cabecalho.Range.ParagraphFormat.Alignment = 1
        
        'Conforme a variável no Word vai buscando na planilha e fazendo a substituição conforme a variável #, percorrendo a linha 2 o cabeçalho da planilha e inserindo a linha conforme o i do primeiro for
        For coluna = 1 To 36
            conteudo.Find.Text = Cells(2, coluna).Value
            conteudo.Find.Replacement.Text = Cells(i, coluna).Value
            conteudo.Find.Execute Replace:=wdReplaceAll
        Next
        
            