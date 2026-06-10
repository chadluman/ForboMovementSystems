Attribute VB_Name = "SplitCleats"
Attribute VB_Base = "0{ACF6DD59-8F53-4331-B4A8-8D6DA0B4BE68}{94E7A117-E02C-4238-A642-235D04177EE5}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False
Private Sub CommandButton1_Click()
Dim AvgWidth As Integer
Dim Pro1 As Integer
Dim Pro2 As Integer
Dim Pro3 As Integer

On Error GoTo xend

If LeftIndent.Value = "" Then
    MsgBox ("Please eneter a left indent")
    Exit Sub
End If

If RightIndent.Value = "" Then
    MsgBox ("Please eneter a right indent")
    Exit Sub
End If



QuoteForm.CheckBox1.Value = True
QuoteForm.CheckBox1.Enabled = False

If TwoProf.Value = True Then
    Pro1 = Profile1width.Value
    Pro2 = Profile2width.Value
    AvgWidth = (Pro1 + Pro2) / 2
    Sheets("CalcSheet").Range("b102").Value = "Yes"
    Sheets("CalcSheet").Range("b103").Value = 2
    If Profile1width.Value = "" Then
        MsgBox ("Please eneter a first profile width")
        Exit Sub
    End If

    If Profile2width.Value = "" Then
        MsgBox ("Please eneter a second profile width")
        Exit Sub
    End If

    If Gap1.Value = "" Then
        MsgBox ("Please eneter a first Gap")
        Exit Sub
    End If

ElseIf ThreeProf.Value = True Then
    If Profile1width.Value = "" Then
        MsgBox ("Please eneter a first profile width")
        Exit Sub
    End If

    If Profile2width.Value = "" Then
        MsgBox ("Please eneter a second profile width")
        Exit Sub
    End If

    If Gap1.Value = "" Then
        MsgBox ("Please eneter a first Gap")
        Exit Sub
    End If

    If Profile3width.Value = "" Then
        MsgBox ("Please eneter a third profile width")
        Exit Sub
    ElseIf Gap2.Value = "" Then
        MsgBox ("Please eneter a second Gap")
        Exit Sub
    End If
    Pro1 = Profile1width.Value
    Pro2 = Profile2width.Value
    Pro3 = Profile3width.Value
    AvgWidth = (Pro1 + Pro2 + Pro3) / 3
    Sheets("CalcSheet").Range("b102").Value = "Yes"
    Sheets("CalcSheet").Range("b103").Value = 3
Else
    Sheets("CalcSheet").Range("b102").Value = "Yes"
    Sheets("CalcSheet").Range("b103").Value = TextBox1.Value
    AvgWidth = TextBox2.Value
End If

With QuoteForm

.Label22.Visible = False
.Label34.Visible = False
.Label35.Visible = False
.Label91.Visible = False
.Label90.Visible = False
.CleatWidth.Value = AvgWidth

End With

QuoteForm.CleatIndent.Value = SplitCleats.LeftIndent.Value

SplitCleats.Hide

xend:

Exit Sub

End Sub

Private Sub Gap1_Change()

If ThreeProf = True Then
    threerowgap1.Visible = True
    threerowgap1.Caption = Gap1.Value
ElseIf TwoProf = True Then
    tworowgap1.Visible = True
    tworowgap1.Caption = Gap1.Value
End If

End Sub

Private Sub Gap2_Change()

If ThreeProf = True Then
    threerowgap2.Visible = True
    threerowgap2.Caption = Gap2.Value
End If

End Sub

Private Sub LeftIndent_Change()

edge1.Caption = LeftIndent.Value
edge2.Caption = RightIndent.Value

edge1.Visible = True


End Sub

Private Sub Profile1width_Change()

If ThreeProf = True Then
    threerow1.Visible = True
    threerow1.Caption = Profile1width.Value
ElseIf TwoProf = True Then
    tworow1.Visible = True
    tworow1.Caption = Profile1width.Value
End If

End Sub

Private Sub Profile2width_Change()
If ThreeProf = True Then
    threerow2.Visible = True
    threerow2.Caption = Profile2width.Value
ElseIf TwoProf = True Then
    tworow2.Visible = True
    tworow2.Caption = Profile2width.Value
End If

End Sub

Private Sub Profile3width_Change()

If ThreeProf = True Then
    threerow3.Visible = True
    threerow3.Caption = Profile3width.Value
End If

End Sub

Private Sub RightIndent_Change()

edge1.Caption = LeftIndent.Value
edge2.Caption = RightIndent.Value
edge2.Visible = True

End Sub

Private Sub ThreeProf_Click()
Dim lngWhite As Long
lngWhite = RGB(255, 255, 255)
ThreeProfImage.Visible = True

Gap2.BackColor = lngWhite
Profile3width.BackColor = lngWhite
Profile3width.Enabled = True
Profile1width.BackColor = lngWhite
Profile1width.Enabled = True
Profile2width.BackColor = lngWhite
Profile2width.Enabled = True
Gap1.Enabled = True
Gap1.BackColor = lngWhite

LeftIndent.Value = ""
RightIndent.Value = ""
Profile1width.Value = ""
Gap1.Value = ""
Gap2.Value = ""

Profile2width.Value = ""
Profile3width.Value = ""

edge1.Visible = True
edge2.Visible = True
edge1.Caption = LeftIndent.Value
edge2.Caption = RightIndent.Value

Twoprofimage.Visible = False

Gap2.Enabled = True
Profile3width.Enabled = True


tworow1.Visible = False
tworow1.Caption = ""
tworow2.Visible = False
tworow2.Caption = ""

tworowgap1.Visible = False
tworowgap1.Caption = ""

TextBox1.Visible = False
TextBox1.Value = ""
TextBox2.Visible = False
TextBox2.Value = ""
Label142.Visible = False
Label143.Visible = False
Label145.Visible = False


End Sub

Private Sub TwoProf_Click()

Twoprofimage.Visible = True
lngWhite = RGB(255, 255, 255)

'Gap2.BackColor = lngWhite
'Profile3width.BackColor = lngWhite
Profile1width.BackColor = lngWhite
Profile1width.Enabled = True
Profile2width.BackColor = lngWhite
Profile2width.Enabled = True
Gap1.Enabled = True
Gap1.BackColor = lngWhite

LeftIndent.Value = ""
RightIndent.Value = ""
Profile1width.Value = ""
Gap1.Value = ""
Gap2.Value = ""
Profile2width.Value = ""
Profile3width.Value = ""

edge1.Visible = True
edge2.Visible = True
edge1.Caption = LeftIndent.Value
edge2.Caption = RightIndent.Value

Gap2.Value = ""
Profile3width.Value = ""
Gap2.Enabled = False
Profile3width.Enabled = False
Gap2.BackColor = lngBlack
Profile3width.BackColor = lngBlack


threerow1.Visible = False
threerow1.Caption = ""
threerow2.Visible = False
threerow2.Caption = ""
threerow3.Visible = False
threerow3.Caption = ""
threerowgap1.Visible = False
threerowgap1.Caption = ""
threerowgap2.Visible = False
threerowgap2.Caption = ""

TextBox1.Visible = False
TextBox1.Value = ""
TextBox2.Visible = False
TextBox2.Value = ""
Label142.Visible = False
Label143.Visible = False
Label145.Visible = False


End Sub



Private Sub UnkProf_Click()

TextBox1.Visible = True
TextBox2.Visible = True
Label142.Visible = True
Label143.Visible = True
Label145.Visible = True

threerow1.Visible = False
threerow1.Caption = ""
threerow2.Visible = False
threerow2.Caption = ""
threerow3.Visible = False
threerow3.Caption = ""
threerowgap1.Visible = False
threerowgap1.Caption = ""
threerowgap2.Visible = False
threerowgap2.Caption = ""
tworow1.Visible = False
tworow1.Caption = ""
tworow2.Visible = False
tworow2.Caption = ""

tworowgap1.Visible = False
tworowgap1.Caption = ""

'blackout unused
Gap2.Value = ""
Profile3width.Value = ""
Gap2.Enabled = False
Profile3width.Enabled = False
Gap2.BackColor = lngBlack
Profile3width.BackColor = lngBlack

Gap1.Value = ""
Profile1width.Value = ""
Gap1.Enabled = False
Profile1width.Enabled = False
Gap1.BackColor = lngBlack
Profile1width.BackColor = lngBlack
Profile2width.Value = ""
Profile2width.Enabled = False
Profile2width.BackColor = lngBlack

edge1.Visible = False
edge2.Visible = False
Twoprofimage.Visible = False
ThreeProfImage.Visible = False


End Sub

Private Sub UserForm_Initialize()

SplitCleats.Width = 805
SplitCleats.Height = 445

edge1.Visible = False
edge2.Visible = False
TwoProf.Value = True
Gap2.Enabled = False
Profile3width.Enabled = False
Gap2.BackColor = lngBlack
Profile3width.BackColor = lngBlack

'ThreeProfImage.Visible = False

threerow1.Visible = False
threerow2.Visible = False
threerow3.Visible = False
threerowgap1.Visible = False
threerowgap2.Visible = False

tworow1.Visible = False
tworow2.Visible = False

tworowgap1.Visible = False

TextBox1.Visible = False
TextBox2.Visible = False
Label142.Visible = False
Label143.Visible = False
Label145.Visible = False


End Sub
