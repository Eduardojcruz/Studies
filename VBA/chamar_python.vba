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

