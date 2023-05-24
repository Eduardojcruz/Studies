Sub teste()
ufm.Show
End Sub

Private Sub Btn_Click()
    ' Obter os valores digitados pelo usuário
    Dim email As String
    Dim senha As String

    
    email = TextBoxEmail
    senha = TextBox1
    ufm.Hide
    
    ' Verificar se os campos foram preenchidos
    If email <> "" And senha <> "" Then
        ' Chamar a função ou procedimento que executa o código Python
       macro email, senha
  
    Else
        MsgBox "Por favor, preencha todos os campos."
    End If

End Sub

Sub macro(email As String, senha As String)
    Dim cam_arquivo As String
    Dim nome As String
    Dim email_msg As String
    Dim corpo As String
    Dim comando As String
    Dim caminhoExecutavel As String
    
'Contando quantas linhas tem na coluna "A" para ser utilizado no loop
Total = WorksheetFunction.CountA(Range("A:A")) - 1

'Loop para realizar os envios e também é utilizado o i para pegar as informações da célula
For i = 3 To Total
    
    
    Windows("arquivo.xlsm").Activate
    e_mail = Range("AK" & i).Value
    
    
    'Atribuindo object para manipulação do Word
    Set objWord = CreateObject("Word.application")
    
    'Deixando visivel o word
    objWord.Visible = True
    
        'Atribuindo para manipulação do Word 
        Set arq = objWord.documents.Open("caminho_arquivo")
        Set conteudo = arq.Application.Selection
        
           ' Inserindo na variável do cabeçalho o nome da empresa com quebra de linha.
            Dim valorCabecalho As String
            valorCabecalho = "valor"
            
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
        
            'Inserindo a data no final do Word conforme a cidade, dia mês e ano
            Data = Now
            dia = Day(Data)
            mes = Format(Month(Data), "mmmm")
            Ano = Year(Data)
            
            conteudo.Find.Text = "#d_agora"
            conteudo.Find.Replacement.Text = dia
            conteudo.Find.Execute Replace:=wdReplaceAll
            
            conteudo.Find.Text = "#m_agora"
            conteudo.Find.Replacement.Text = mes
            conteudo.Find.Execute Replace:=wdReplaceAll
            
            conteudo.Find.Text = "#a_agora"
            conteudo.Find.Replacement.Text = Ano
            conteudo.Find.Execute Replace:=wdReplaceAll
        
        
            'Colocando em uma variável caminho e o nome do arquivo para salvar. 
            caminho = "caminho"
            nome = "nome"
            fim = caminho & nome
            
            'Salvando em formato Word para conseguir exportar em PDF
             arq.SaveAs2 (fim & ".docx")
             arq.ExportAsFixedFormat OutputFileName:=fim & ".pdf", ExportFormat:=17
            
            'Fechando o Word
             arq.Close
             objWord.Quit
             
             '--------------------------
             ' Caminho para o executável Python
            
            caminhoExecutavel = "executavel"
            
            'Definir os valores dos argumentos
            login = email
            senha = senha
            nome = nome & ".pdf"
            
            cam_arquivo = caminho & nome
            
            email_msg = "mensagem_de_email"
            corpo = "corpo_do_email"
            
            ' Montar o comando completo com os argumentos
        comando = Chr(34) & caminhoExecutavel & Chr(34) & " " & Chr(34) & login & Chr(34) & " " & Chr(34) & senha & Chr(34) & " " & Chr(34) & cam_arquivo & Chr(34) & " " & Chr(34) & nome & Chr(34) & " " & Chr(34) & email_msg & Chr(34) & " " & Chr(34) & corpo & Chr(34)
            
            ' Executar o comando
            Shell comando, vbNormalFocus
    
Next
MsgBox ("Finalizado com sucesso")
Unload ufm
End Sub