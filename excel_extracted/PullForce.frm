Attribute VB_Name = "PullForce"
Attribute VB_Base = "0{CC1ACD3D-8F54-489A-A6B3-A666F73C76F9}{9902C769-691C-4304-96B3-A491E5E1F467}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False


Private Sub CommandButton1_Click()
Call CrossCheck
'checks that all required boxes have been filled

If OptionButton1.Value = True Then
    Call RunCalc
End If

If OptionButton2.Value = True Then
    Call OptionButton1_Click
    Call RunCalc
    Call OptionButton2_Click
End If

CommandButton2.Visible = True


End Sub
Sub RunCalc()

'max load
Sheets("PFcalc").Range("i7").Value = TextBox8.Value

Sheets("PFcalc").Range("i8").Value = TextBox9.Value
Sheets("PFcalc").Range("i9").Value = TextBox11.Value
Sheets("PFcalc").Range("i10").Value = TextBox10.Value

Sheets("PFcalc").Range("i16").Value = ComboBox13.Value
Sheets("PFcalc").Range("i17").Value = TextBox12.Value

Sheets("PFcalc").Range("i22").Value = ComboBox12.Value

'CTC
Sheets("PFcalc").Range("i27").Value = TextBox5.Value / 1000

If TextBox3.Visible = True Then
    Sheets("PFcalc").Range("i28").Value = TextBox3.Value / 1000
Else
    Sheets("PFcalc").Range("i28").Value = 0
End If

If TextBox4.Visible = True Then
    Sheets("PFcalc").Range("i29").Value = TextBox4.Value / 1000
Else
    Sheets("PFcalc").Range("i29").Value = 0
End If


'conveyor geometry
If OptionButton3.Value = True Then
    Sheets("PFcalc").Range("i26").Value = "L ; H"
    Sheets("PFcalc").Range("i30").Value = Sqr((TextBox1.Value / 1000) ^ 2 + (TextBox5.Value / 1000) ^ 2)
ElseIf OptionButton4.Value = True Then
    Sheets("PFcalc").Range("i26").Value = "L ; H"
    Sheets("PFcalc").Range("i30").Value = TextBox1.Value / 1000
Else
    Sheets("PFcalc").Range("i26").Value = "L ; Q"
    Sheets("PFcalc").Range("i32").Value = TextBox1.Value
End If

'If OptionButton2.Value = True Then
    'Sheets("PFcalc").Range("n88").Value = Round((TextBox14.Value - 32) * (5 / 9), 2)
'Else
    'Sheets("PFcalc").Range("n88").Value = TextBox14.Value
'End If

Sheets("PFcalc").Range("n88").Value = TextBox14.Value

If Sheets("PFcalc").Range("i30").Value > Sheets("PFcalc").Range("i27").Value Then
    MsgBox ("Your height is bigger than your CTC distance. please revise")
    Exit Sub
Else
    TextBox15.Value = Sheets("PFcalc").Range("c64").Value
    TextBox16.Value = Sheets("PFcalc").Range("m64").Value
End If

End Sub
Sub CrossCheck()

'Dim ComboBox12 As String
'Dim TextBox5 As Long
'Dim TextBox1 As Long
'Dim ComboBox13 As String


If ComboBox12.Value = " " Or ComboBox12.Value = "" Then
    MsgBox ("Please specify if the conveyor is on an incline, decline or straight")
    Exit Sub
End If
If TextBox5.Value = " " Or TextBox5.Value = vbNullString Then
    MsgBox ("Please specify center to center distance")
    Exit Sub
End If

If Frame1.Visible = True Then
    If TextBox1.Value = " " Or TextBox1.Value = vbNullString Then
        MsgBox ("Please specify dimensions X, Z, or A")
        Exit Sub
    End If
End If
'If TextBox2.Value = "" Or vbNullString Then
    'MsgBox ("Please specify dimensions X, Z, or A")
'End If
If ComboBox13.Value = " " Or ComboBox13.Value = vbNullString Then
    MsgBox ("Please specify Belt Type")
    Exit Sub
End If

If TextBox3.Visible = True Then
    If TextBox3.Value = " " Or TextBox3.Value = vbNullString Then
        MsgBox ("Please specify length at area H1")
        Exit Sub
    End If
End If

If TextBox4.Visible = True Then
    If TextBox4.Value = " " Or TextBox4.Value = vbNullString Then
        MsgBox ("Please specify length at area H2")
        Exit Sub
    End If
End If

If TextBox8.Value = " " Or TextBox8.Value = vbNullString Then
    MsgBox ("Please specify the maximum load on the conveyor")
    Exit Sub
End If
If TextBox9.Value = " " Or TextBox9.Value = vbNullString Then
    MsgBox ("Please specify belt weight")
    Exit Sub
End If
'If TextBox10.Value = "" Or vbNullString Then
    'MsgBox ("Please specify accumulated weight")
'End If
If TextBox11.Value = " " Or TextBox11.Value = vbNullString Then
    MsgBox ("Please specify weight of return rollers")
    Exit Sub
End If
If TextBox12.Value = " " Or TextBox12.Value = vbNullString Then
    MsgBox ("Please specify Belt Width")
    Exit Sub
End If
'If TextBox13.Value = " " Or TextBox13.Value = vbNullString Then
    'MsgBox ("Please specify conveyor bed type for friction")
    'Exit Sub
'End If
'If TextBox14.Value = " " Or TextBox14.Value = vbNullString Then
    'MsgBox ("Please specify temperature")
    'Exit Sub
'End If
End Sub


Private Sub CommandButton2_Click()

Sheets("PFDisplay").Protect Password:="engineer"

PullForce.Hide 'hides the user form

Worksheets("PFDisplay").Visible = True

Sheets("PFDisplay").Protect Password:="engineer"
Worksheets("HOME").Visible = False
Sheets("PFDisplay").Activate  'shows the Quote_CSR sheet upon closing user form


End Sub

Private Sub OptionButton3_Click()
If OptionButton2.Value = True Then
    Label32.Caption = "in"
Else
    Label32.Caption = "mm"
End If

End Sub

Private Sub OptionButton4_Click()
If OptionButton2.Value = True Then
    Label32.Caption = "in"
Else
    Label32.Caption = "mm"
End If

End Sub

Private Sub OptionButton5_Click()
Label32.Caption = "Degrees"

End Sub

Private Sub UserForm_Initialize()

Call ClearContents


If TextBox3.Visible = True Then
    Sheets("PFcalc").Range("i28").Value = zilch
Else
    Sheets("PFcalc").Range("i28").Value = zilch
End If

If TextBox4.Visible = True Then
    Sheets("PFcalc").Range("i29").Value = zilch
Else
    Sheets("PFcalc").Range("i29").Value = zilch
End If


ComboBox12.RowSource = "PFcalc!h21:h23"
ComboBox13.RowSource = "PFcalc!k37:k38"
ComboBox14.RowSource = "PFcalc!s10:s12"

OptionButton1.Value = True
CommandButton2.Visible = False
TextBox15.Enabled = False
TextBox16.Enabled = False


Label31.Caption = "mm"
Label32.Caption = "mm"
Label34.Caption = "mm"
Label35.Caption = "mm"
Label40.Caption = "mm"

ComboBox11.Value = "mm"

Label36.Caption = "kg"
Label37.Caption = "kg"
Label38.Caption = "kg"
Label39.Caption = "kg"

Label42.Caption = "°C"
TextBox14.Value = 23

End Sub
Private Sub OptionButton2_Click()

Label31.Caption = "in"
Label32.Caption = "in"
'Label33.Caption = "in"
Label34.Caption = "in"
Label35.Caption = "in"
Label40.Caption = "in"

ComboBox11.Value = "in"

Label36.Caption = "lbs"
Label37.Caption = "lbs"
Label38.Caption = "lbs"
Label39.Caption = "lbs"

Label42.Caption = "°F"

Label45.Caption = "lbs/in"
Label46.Caption = "lbs/in"

If TextBox5.Value <> "" Then
    TextBox5.Value = Round(TextBox5.Value / 25.4, 2)
End If
If TextBox1.Value <> "" Then
    If OptionButton5.Value = True Then
        TextBox1.Value = TextBox1.Value
    Else
        TextBox1.Value = Round(TextBox1.Value / 25.4, 2)
    End If
End If
'If TextBox2.Value <> "" Then
    'TextBox2.Value = Round(TextBox2.Value / 25.4, 2)
'End If
If TextBox3.Value <> "" Then
    TextBox3.Value = Round(TextBox3.Value / 25.4, 2)
End If
If TextBox4.Value <> "" Then
    TextBox4.Value = Round(TextBox4.Value / 25.4, 2)
End If

If TextBox8.Value <> "" Then
    TextBox8.Value = Round(TextBox8.Value * 2.20462, 2)
End If
If TextBox9.Value <> "" Then
    TextBox9.Value = Round(TextBox9.Value * 2.20462, 2)
End If
If TextBox10.Value <> "" Then
    TextBox10.Value = Round(TextBox10.Value * 2.20462, 2)
End If
If TextBox11.Value <> "" Then
    TextBox11.Value = Round(TextBox11.Value * 2.20462, 2)
End If

If TextBox12.Value <> "" Then
    TextBox12.Value = Round(TextBox12.Value / 25.4, 2)
End If

If TextBox14.Value <> "" Then
    TextBox14.Value = Round(((TextBox14.Value) * (9 / 5) + 32), 2)
End If

If TextBox15.Value <> "" Then
    TextBox15.Value = Round(TextBox15.Value * 5.59974, 2)
    TextBox16.Value = Round(TextBox16.Value * 5.59974, 2)
End If



End Sub
Private Sub OptionButton1_Click()

Label31.Caption = "mm"
Label32.Caption = "mm"
'Label33.Caption = "mm"
Label34.Caption = "mm"
Label35.Caption = "mm"
Label40.Caption = "mm"

ComboBox11.Value = "mm"

Label36.Caption = "kg"
Label37.Caption = "kg"
Label38.Caption = "kg"
Label39.Caption = "kg"

Label42.Caption = "°C"

Label45.Caption = "Kg/cm"
Label46.Caption = "Kg/cm"

If TextBox5.Value <> "" Then
    TextBox5.Value = Round(TextBox5.Value * 25.4, 2)
End If
If TextBox1.Value <> "" Then
    If OptionButton5.Value = True Then
        TextBox1.Value = TextBox1.Value
    Else
        TextBox1.Value = Round(TextBox1.Value * 25.4, 2)
    End If
End If
'If TextBox2.Value <> "" Then
    'TextBox2.Value = Round(TextBox2.Value * 25.4, 2)
'End If
If TextBox3.Value <> "" Then
    TextBox3.Value = Round(TextBox3.Value * 25.4, 2)
End If
If TextBox4.Value <> "" Then
    TextBox4.Value = Round(TextBox4.Value * 25.4, 2)
End If

If TextBox8.Value <> "" Then
    TextBox8.Value = Round(TextBox8.Value / 2.20462, 2)
End If
If TextBox9.Value <> "" Then
    TextBox9.Value = Round(TextBox9.Value / 2.20462, 2)
End If
If TextBox10.Value <> "" Then
    TextBox10.Value = Round(TextBox10.Value / 2.20462, 2)
End If
If TextBox11.Value <> "" Then
    TextBox11.Value = Round(TextBox11.Value / 2.20462, 2)
End If

If TextBox12.Value <> "" Then
    TextBox12.Value = Round(TextBox12.Value * 25.4, 2)
End If

If TextBox14.Value <> "" Then
    TextBox14.Value = Round((TextBox14.Value - 32) * (5 / 9), 2)
End If

If TextBox15.Value <> "" Then
    TextBox15.Value = Round(TextBox15.Value / 5.59974, 2)
    TextBox16.Value = Round(TextBox16.Value / 5.59974, 2)
End If

End Sub


Private Sub UserForm_Click()

End Sub
