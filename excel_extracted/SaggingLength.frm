Attribute VB_Name = "SaggingLength"
Attribute VB_Base = "0{59BF3F03-BCA8-4B85-8745-68F077B1BF7E}{85CB6DE2-D0C6-4D69-ACBD-DEE5C54260EC}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False
Private Sub CommandButton1_Click()

OptionButton1.Value = True

Sheets("SaggingBeltLengthCalculation").Range("f5").Value = TextBox8.Value
Sheets("SaggingBeltLengthCalculation").Range("f6").Value = TextBox9.Value
Sheets("SaggingBeltLengthCalculation").Range("f7").Value = TextBox10.Value
Sheets("SaggingBeltLengthCalculation").Range("f8").Value = TextBox11.Value
Sheets("SaggingBeltLengthCalculation").Range("f9").Value = TextBox12.Value
Sheets("SaggingBeltLengthCalculation").Range("f11").Value = TextBox13.Value
Sheets("SaggingBeltLengthCalculation").Range("f12").Value = TextBox14.Value

With QuoteForm
    .BeltLength.Value = Sheets("SaggingBeltLengthCalculation").Range("f15").Value
    .ComboBox4.Value = "mm"
End With

SaggingLength.Hide

End Sub

Private Sub UserForm_Initialize()


OptionButton1.Value = True


Label1.Caption = "mm"
Label2.Caption = "mm"
Label3.Caption = "degrees"
Label4.Caption = "mm"
Label5.Caption = "mm"
Label6.Caption = "mm"
Label44.Caption = "mm"


End Sub

Private Sub OptionButton2_Click()

Label3.Caption = "degrees"
Label1.Caption = "in"
Label2.Caption = "in"
Label4.Caption = "in"
Label5.Caption = "in"
Label6.Caption = "in"
Label44.Caption = "in"


If TextBox8.Value <> "" Then
    TextBox8.Value = Round(TextBox8.Value / 25.4, 2)
End If
If TextBox9.Value <> "" Then
    TextBox9.Value = Round(TextBox9.Value / 25.4, 2)
End If

If TextBox11.Value <> "" Then
    TextBox11.Value = Round(TextBox11.Value / 25.4, 2)
End If

If TextBox12.Value <> "" Then
    TextBox12.Value = Round(TextBox12.Value / 25.4, 2)
End If
If TextBox13.Value <> "" Then
    TextBox13.Value = Round(TextBox13.Value / 25.4, 2)
End If

If TextBox14.Value <> "" Then
    TextBox14.Value = Round(TextBox14.Value / 25.4, 2)
End If




End Sub
Private Sub OptionButton1_Click()

Label3.Caption = "degrees"
Label1.Caption = "mm"
Label2.Caption = "mm"
Label4.Caption = "mm"
Label5.Caption = "mm"
Label6.Caption = "mm"
Label44.Caption = "mm"


If TextBox8.Value <> "" Then
    TextBox8.Value = Round(TextBox8.Value * 25.4, 2)
End If
If TextBox9.Value <> "" Then
    TextBox9.Value = Round(TextBox9.Value * 25.4, 2)
End If

If TextBox11.Value <> "" Then
    TextBox11.Value = Round(TextBox11.Value * 25.4, 2)
End If

If TextBox12.Value <> "" Then
    TextBox12.Value = Round(TextBox12.Value * 25.4, 2)
End If
If TextBox13.Value <> "" Then
    TextBox13.Value = Round(TextBox13.Value * 25.4, 2)
End If

If TextBox14.Value <> "" Then
    TextBox14.Value = Round(TextBox14.Value * 25.4, 2)
End If

End Sub

Private Sub UserForm_Click()

End Sub
