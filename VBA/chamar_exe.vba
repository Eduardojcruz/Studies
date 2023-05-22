Sub ChamarExecutavelPython()
    Dim comando As String
    Dim resultado As Variant
    
    ' Caminho para o executável Python
    comando = "caminho"
    
    ' Executa o executável usando a função Shell
    resultado = Shell(comando, vbNormalFocus)
    
    ' Verifica se a execução foi bem-sucedida
    If resultado <> 0 Then
        MsgBox "Executável Python executado com sucesso!"
    Else
        MsgBox "Falha ao executar o executável Python."
    End If
End Sub
