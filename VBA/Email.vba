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
        '   Inserindo a data no final do Word conforme a cidade, dia mês e ano
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
            caminho = "Caminho"
            nome =  Cells(i, 20).Value
            fim = caminho & nome
            
            'Salvando em formato Word para conseguir exportar em PDF
             arq.SaveAs2 (fim & ".docx")
             arq.ExportAsFixedFormat OutputFileName:=fim & ".pdf", ExportFormat:=17
            
            'Fechando o Word
             arq.Close
             objWord.Quit
            
            'Como não vamos precisar estou excluindo o Word
            Kill fim & ".docx"
            anexo = fim & ".pdf"
            'Abrindo o Outlook e colocando o e_mail para envio, assunto e corpo do e-mail,
            With novo_email
            .display
            .Attachments.Add anexo
            .Subject = "sub"
            .Body = "CONTEUDO"
            .To = e_mail
            
            ' Exibir uma caixa de diálogo de confirmação
            MsgBox ("Por gentileza, validar informações")
            
            'Após validado será exibido a msg para enviar ou cancelar a execução
            If MsgBox("Deseja enviar o e-mail?", vbYesNo) = vbYes Then
                .Send
            Else
                MsgBox ("Cancelado o envio do e-mail")
                Exit Sub
            End If
        End With
  
Next
MsgBox ("Finalizado com sucesso")
End Sub