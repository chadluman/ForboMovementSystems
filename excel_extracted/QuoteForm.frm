Attribute VB_Name = "QuoteForm"
Attribute VB_Base = "0{A65CB14E-248A-47EF-9E65-3E449055BB76}{63F6C863-0995-4161-AED9-8A68B66DABF9}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False


Private Sub BeltLenAdj_Change()
Sheets("CalcSheet").Range("e30").Value = BeltLenAdj.Value 'When changing the adjusted belt length, send the value to the calc sheet
End Sub

Private Sub BeltLenAdj_DropButtonClick()
Frame6.Visible = True
Lenopt1.Caption = Sheets("CalcSheet").Range("h28").Value & "  " & "(" & Sheets("CalcSheet").Range("f28").Value & " mm )" & "  " & Sheets("CalcSheet").Range("e28").Value & " lugs"
Lenopt2.Caption = Sheets("CalcSheet").Range("h29").Value & "  " & "(" & Sheets("CalcSheet").Range("f29").Value & " mm )" & "  " & Sheets("CalcSheet").Range("e29").Value & " lugs"

'lists the length options for the adjusted length in the box
End Sub

Private Sub BeltLength_Change() 'Upon changing Belt length
ComboBox4.Enabled = True
BeltLenAdj.Value = " " 'adjusted length cleared
BeltLenAdj.Enabled = True
RequestedCltPitch = " "  'flight pitch cleared
TextBox19.Value = " "    'pitch value cleared
NoOfCleats.Value = " "   'number of cleats cleared
NoOfLugs.Value = " "     'number of lugs cleared


Sheets("CalcSheet").Range("d18").Value = ComboBox3.Value
Sheets("CalcSheet").Range("e25").Value = BeltLength.Value  'Put entered belt length in calc sheet cell e25
BeltLenAdj.RowSource = "CalcSheet!F28:F29" 'the options for adjusted belt length taken from cells F28 and F29
If ComboBox3.Value = "FLT" Then
    BeltLenAdj.Value = Sheets("CalcSheet").Range("F29").Value
End If

End Sub




Private Sub BeltWidth_AfterUpdate() 'After changing the belt width

LugRowText.Visible = False
LugRowQty.Visible = False
LugRowQty.Value = 1

If ComboBox5.Value = "mm" Then
    Sheets("CalcSheet").Range("e33").Value = BeltWidth.Value  'if the width is in mm then just put the width in the sheet
    WidthCheck = Sheets("CalcSheet").Range("e33").Value * (1 / 25.4)
    If ComboBox3.Value = "CD" Then
    If WidthCheck >= 27.56 And WidthCheck <= 36.01 Then
        LugRowText.Visible = True
        LugRowQty.Visible = True
        LugRowQty.Enabled = True
    ElseIf WidthCheck > 36.01 And WidthCheck < 53.15 Then
        LugRowText.Visible = True
        LugRowQty.Visible = True
        LugRowQty.Value = 2
        LugRowQty.Enabled = False
    ElseIf WidthCheck > 53.15 Then
        LugRowText.Visible = True
        LugRowQty.Visible = True
        LugRowQty.Value = 3
        LugRowQty.Enabled = False
    End If
    End If
   
    
ElseIf ComboBox5.Value = "in" Then
    Sheets("CalcSheet").Range("e33").Value = BeltWidth.Value * 25.4  'of the width is in inch multiply by 25.4 befor eputting it in the sheet
    Sheets("QUOTE_CSR").Range("b24").Value = BeltWidth.Value
    WidthCheck = Sheets("CalcSheet").Range("e33").Value * (1 / 25.4)
    If ComboBox3.Value = "CD" Then
    If WidthCheck >= 27.27 And WidthCheck <= 36.01 Then
        LugRowText.Visible = True
        LugRowQty.Visible = True
        LugRowQty.Enabled = True
    ElseIf WidthCheck > 36 Then
        LugRowText.Visible = True
        LugRowQty.Visible = True
        LugRowQty.Value = 2
        LugRowQty.Enabled = False
    ElseIf WidthCheck > 53.15 Then
        LugRowText.Visible = True
        LugRowQty.Visible = True
        LugRowQty.Value = 3
        LugRowQty.Enabled = False
    End If
    End If

End If


End Sub

Private Sub BeltWidth_Change()
ComboBox5.Enabled = True
End Sub

Private Sub BotGuideQty_Change()
GuideLocationBottom.Value = " "  'hides/clears location and spacing information in case somone decided to go back and change quantity
GuideSpacingLabel2.Visible = False
GuideSpacingBottom.Value = " "
GuideSpacingBottom.Visible = False
Label50.Visible = False

If BotGuideQty.Value = 1 Then
    GuideLocationBottom.RowSource = "DRAWING_DATA!E13:E15" 'if there is only one guide only give single guide options
Else
    GuideLocationBottom.RowSource = "DRAWING_DATA!E16:E17"
End If
End Sub


Private Sub BotGuideSelect_AfterUpdate()
    Sheets("CalcSheet").Range("d40").Value = BotGuideSelect.Value  'put the selection in the calc sheet
End Sub

Private Sub CleatHeight_AfterUpdate()
Sheets("DRAWING_DATA").Range("a143").Value = CleatHeight.Value & CleatType.Value & CleatThickness.Value
Label66.Caption = Sheets("DRAWING_DATA").Range("a144").Value
Label66.Visible = True

End Sub

Private Sub CLEATNO_Click() 'blakcs out all options if no is picked for if the belt has flights
Dim lngBlack As Long
lngBlack = RGB(0, 0, 0)

CleatType.Enabled = False
CleatType.BackColor = lngBlack
CleatType.Value = " "

CleatSurface.Enabled = False
CleatSurface.BackColor = lngBlack
CleatSurface.Value = " "

CleatThickness.Enabled = False
CleatThickness.BackColor = lngBlack
CleatThickness.Value = " "

CleatHeight.Enabled = False
CleatHeight.BackColor = lngBlack
CleatHeight.Value = " "

CleatWidth.Enabled = False
CleatWidth.BackColor = lngBlack
CleatWidth.Value = vbNullString

CleatIndent.Enabled = False
CleatIndent.BackColor = lngBlack
CleatIndent.Value = " "

RequestedCltPitch.Enabled = False
RequestedCltPitch.BackColor = lngBlack
RequestedCltPitch.Value = " "

TextBox5.Enabled = False
Sheets("CalcSheet").Range("d67").Value = "No"
Sheets("CalcSheet").Range("E89").Value = ""

OptionButton6.Enabled = False
OptionButton6.Value = False
OptionButton5.Value = True

CommandButton9.Visible = False


End Sub

Private Sub CleatSurface_Change()

If CleatSurface.Value = "Smooth" Then
    CleatThickness.RowSource = "DRAWING_DATA!E172:E173"  'If smooth is selected then pull smooth options
Else
    CleatThickness.RowSource = "DRAWING_DATA!F172:F173"   'otherwise pull textured
End If



End Sub



Private Sub CleatThickness_Change()  'cleat option filters

Dim rWsrc As String

If CleatType.Value = "ANGLED" Then
    If CleatThickness.Value = 3.4 Then
        CleatHeight.RowSource = "DRAWING_DATA!U27:U34"
    ElseIf CleatThickness.Value = 4 Then
        CleatHeight.RowSource = "DRAWING_DATA!W27:W34"
    ElseIf CleatThickness.Value = 6 Then
        CleatHeight.RowSource = "DRAWING_DATA!Y27:Y34"
    ElseIf CleatThickness.Value = 7 Then
        CleatHeight.RowSource = "DRAWING_DATA!AA27:AA34"
    End If
ElseIf CleatType.Value = "STRAIGHT" Then
    If CleatThickness.Value = 3.4 Then
        CleatHeight.RowSource = "DRAWING_DATA!U18:U25"
    ElseIf CleatThickness.Value = 4 Then
        CleatHeight.RowSource = "DRAWING_DATA!W18:W25"
    ElseIf CleatThickness.Value = 6 Then
        CleatHeight.RowSource = "DRAWING_DATA!Y18:Y25"
    ElseIf CleatThickness.Value = 7 Then
        CleatHeight.RowSource = "DRAWING_DATA!AA18:AA25"
    End If
ElseIf CleatType.Value = "SHORT BENT" Then
    If CleatThickness.Value = 3.4 Then
        CleatHeight.RowSource = "DRAWING_DATA!U36:U40"
    ElseIf CleatThickness.Value = 4 Then
        CleatHeight.RowSource = "DRAWING_DATA!W36:W40"
    ElseIf CleatThickness.Value = 6 Then
        CleatHeight.RowSource = "DRAWING_DATA!Y36:Y40"
    ElseIf CleatThickness.Value = 7 Then
        CleatHeight.RowSource = "DRAWING_DATA!AA36:AA40"
    End If
ElseIf CleatType.Value = "BENT" Then
    If CleatThickness.Value = 3.4 Then
        CleatHeight.RowSource = "DRAWING_DATA!U42:U44"
    ElseIf CleatThickness.Value = 4 Then
        CleatHeight.RowSource = "DRAWING_DATA!W42:W44"
    ElseIf CleatThickness.Value = 6 Then
        CleatHeight.RowSource = "DRAWING_DATA!Y42:Y44"
    ElseIf CleatThickness.Value = 7 Then
        CleatHeight.RowSource = "DRAWING_DATA!AA42:AA44"
    End If
ElseIf CleatType.Value = "SCOOP" Then
    If CleatThickness.Value = 3.4 Then
        CleatHeight.RowSource = "DRAWING_DATA!U46:U51"
    ElseIf CleatThickness.Value = 4 Then
        CleatHeight.RowSource = "DRAWING_DATA!W46:W51"
    ElseIf CleatThickness.Value = 6 Then
        CleatHeight.RowSource = "DRAWING_DATA!Y46:Y51"
    ElseIf CleatThickness.Value = 7 Then
        CleatHeight.RowSource = "DRAWING_DATA!AA46:AA51"
    End If
ElseIf CleatType.Value = "V GUIDE" Then
    If CleatThickness.Value = 6 Then
        CleatHeight.Value = 4
    ElseIf CleatThickness.Value = 8 Then
        CleatHeight.Value = 5
    ElseIf CleatThickness.Value = 10 Then
        CleatHeight.Value = 6
    ElseIf CleatThickness.Value = 13 Then
        CleatHeight.Value = 8
    ElseIf CleatThickness.Value = 17 Then
        CleatHeight.Value = 11
    End If
Sheets("DRAWING_DATA").Range("a143").Value = CleatHeight.Value & CleatType.Value & CleatThickness.Value
Label66.Caption = Sheets("DRAWING_DATA").Range("a144").Value
Label66.Visible = True
End If

rWsrc = CleatHeight.RowSource
ModifiedFlight.CleatHeight.RowSource = rWsrc
CommandButton9.Visible = True

End Sub





Private Sub CleatType_Change()

If CleatType.Value = "V GUIDE" Then
    CleatSurface.Value = "Smooth"
    CleatThickness.RowSource = "DRAWING_DATA!G172:G176"
End If

End Sub

Private Sub CleatWidth_Change()
Sheets("CalcSheet").Range("e86").Value = CleatWidth.Value
End Sub

Private Sub CLEATYES_Click()
Dim lngWhite As Long
lngWhite = RGB(255, 255, 255)

CleatType.Enabled = True
CleatType.BackColor = lngWhite
CleatSurface.Enabled = True
CleatSurface.BackColor = lngWhite
CleatThickness.Enabled = True
CleatThickness.BackColor = lngWhite
CleatHeight.Enabled = True
CleatHeight.BackColor = lngWhite
CleatWidth.Enabled = True
CleatWidth.BackColor = lngWhite
CleatIndent.Enabled = True
CleatIndent.BackColor = lngWhite
RequestedCltPitch.Enabled = True
RequestedCltPitch.BackColor = lngWhite
TextBox5.Enabled = True
Sheets("CalcSheet").Range("d67").Value = "Yes"

OptionButton6.Enabled = True

SplitFlights.Visible = True


End Sub

Private Sub ComboBox1_AfterUpdate()
listlen = Sheet15.Cells(Rows.Count, 1).End(xlUp).Offset(1, 0).Row

If ComboBox1.Value = "Other" Then
    ComboBox2.RowSource = "CustomerList!B2:B" & listlen
Else

If ComboBox1.Value = "Other" Then GoTo xe


answer = MsgBox("Would you like to load specific customers for this salesperson?", vbQuestion + vbYesNo + vbDefaultButton2, "Message Box Title")

If answer = vbYes Then
    'CustList.Label1.Caption = "Customers for:  " & ComboBox1.Value
    CustList.ComboBox1.Value = QuoteForm.ComboBox1.Value
    CustList.Show
    CustList.ComboBox1.Visible = False
    
Else
    Exit Sub
End If

End If

xe:
Exit Sub
End Sub

Private Sub ComboBox11_Change()

Me.Label30.Visible = True
Label30.Caption = ComboBox11.Value  'match the units in the unit converter

End Sub









Private Sub ComboBox16_Change()

End Sub

Private Sub ComboBox18_Change()


End Sub

Private Sub ComboBox2_AfterUpdate()

On Error GoTo xend

Sheets("CalcSheet").Range("D3").Value = ComboBox2.Value

If Sheets("CalcSheet").Range("h3").Value = "" Then
    CustomerNumber.Caption = "Customer No.  " & Sheets("CalcSheet").Range("H5").Value
Else
CustomerNumber.Caption = "Customer No.  " & Sheets("CalcSheet").Range("H3").Value

End If

CustomerNumber.Visible = True

xend:
Exit Sub
End Sub

Private Sub ComboBox2_DropButtonClick()
    Sheets("CalcSheet").Range("h3").Value = ""
End Sub

Private Sub ComboBox4_Change()

Dim lngFT As Integer

If ComboBox4.Value = "mm" Then
    Sheets("CalcSheet").Range("e25").Value = BeltLength.Value  'Put entered belt length in calc sheet cell e25
ElseIf ComboBox4.Value = "ft" Then
    TextBox20.Visible = True
    Label67.Visible = True
    Sheets("CalcSheet").Range("e25").Value = BeltLength.Value * 12 * 25.4
    'Sheets("QUOTE_CSR").Range("b22").Value = BeltLength.Value
End If
BeltLenAdj.RowSource = "CalcSheet!F28:F29" 'the options for adjusted belt length taken from cells F28 and F29
If ComboBox3.Value = "FLT" Then
    BeltLenAdj.Value = Sheets("CalcSheet").Range("F29").Value
End If
If ComboBox4.Value = "mm" Then
    TextBox20.Value = ""
    TextBox20.Visible = False
    Label67.Visible = False
End If
End Sub

Private Sub ComboBox5_Change()
If ComboBox5.Value = "mm" Then
    Sheets("CalcSheet").Range("e33").Value = BeltWidth.Value
ElseIf ComboBox5.Value = "in" Then
    Sheets("CalcSheet").Range("e33").Value = BeltWidth.Value * 25.4
    Sheets("QUOTE_CSR").Range("b24").Value = BeltWidth.Value
End If

LugRowText.Visible = False
LugRowQty.Visible = False
LugRowQty.Value = 1

WidthCheck = Sheets("CalcSheet").Range("e33").Value * (1 / 25.4)

If ComboBox3.Value = "CD" Then
If WidthCheck >= 27.27 And WidthCheck <= 36.01 Then
    LugRowText.Visible = True
    LugRowQty.Visible = True
    LugRowQty.Enabled = True
ElseIf WidthCheck > 36.01 Then
    LugRowText.Visible = True
    LugRowQty.Visible = True
    LugRowQty.Value = 2
    LugRowQty.Enabled = False
End If
End If

End Sub



Private Sub ComboBox6_Change()

End Sub

Private Sub CommandButton3_Click()
CleatWidth.Value = Sheets("CalcSheet").Range("i38").Value
CleatIndent.Value = (Sheets("CalcSheet").Range("i35").Value - Sheets("CalcSheet").Range("i38").Value) / 2
End Sub


Private Sub CommandButton4_Click()
    ActiveWorkbook.FollowHyperlink "\\us01sfiles02\Siegling Share\Fullsan (Sales)\zFiles\FabOptions.JPG"
End Sub

Private Sub CommandButton5_Click()
ActiveWorkbook.FollowHyperlink "\\us01sfiles02\Siegling Share\Fullsan (Sales)\zFiles\SW.JPG"
End Sub

Private Sub CommandButton6_Click()
ActiveWorkbook.FollowHyperlink "\\us01sfiles02\Siegling Share\Fullsan (Sales)\zFiles\Flight.JPG"
End Sub

Private Sub CommandButton7_Click()
Load SaggingLength
SaggingLength.Show

End Sub

Private Sub CommandButton8_Click()

If ComboBox5.Value = "mm" Then
    CleatWidth.Value = BeltWidth.Value - (2 * CleatIndent.Value)
Else
    'CleatWidth.Value = BeltWidth.Value * 25.4 - (2 * CleatIndent.Value)
End If

End Sub

Private Sub CommandButton9_Click()
ModifiedFlight.Show

End Sub

Private Sub GuideSpacing_AfterUpdate()
'    rm = Sheets("CalcSheet").Range("e33").Value - Sheets("CalcSheet").Range("i52").Value
'    TextBox15.Value = rm
'    If GuideSpacing.Value > rm Then
'        GuideSpacing.BackColor = vbRed
'    ElseIf GuideSpacing.Value <= rm Then
'        GuideSpacing.BackColor = vbWhite
'    End If
End Sub

Private Sub GuideSpacing_Change()
If LGTOPYES = True Then
    'rm = Sheets("CalcSheet").Range("e33").Value - Sheets("CalcSheet").Range("i52").Value
End If
If GuideLocation.Value = "Single guide - Indent from edge to center" Then
    Sheets("CalcSheet").Range("e50").Value = Sheets("CalcSheet").Range("e33").Value - GuideSpacing.Value - 0.5 * Sheets("CalcSheet").Range("i52").Value
ElseIf GuideLocation.Value = "Multiple guides - Center to center" Then
    Sheets("CalcSheet").Range("e50").Value = GuideSpacing.Value
'    If GuideSpacing.Value > rm Then
'        GuideSpacing.BackColor = vbRed
'    ElseIf GuideSpacing.Value <= rm Then
'        GuideSpacing.BackColor = vbWhite
'    End If
End If
End Sub




Private Sub GuideSpacingBottom_Change()
If GuideLocationBottom.Value = "Single guide - Indent from edge to center" Then
    Sheets("CalcSheet").Range("e43").Value = Sheets("CalcSheet").Range("e33").Value - GuideSpacingBottom.Value - 0.5 * Sheets("CalcSheet").Range("i53").Value
ElseIf GuideLocationBottom.Value = "Multiple guides - Center to center" Then
    Sheets("CalcSheet").Range("e43").Value = GuideSpacingBottom.Value
End If
End Sub

Private Sub GussetNum_Change()

If GussetNum.Value = vbNullString Then
    TextBox24.Value = vbNullString
Else
    TextBox24.Value = GussetNum.Value * 3
End If

End Sub





Private Sub Image10_Click()

ActiveWorkbook.FollowHyperlink "\\us01sfiles02\Siegling Share\Fullsan (Sales)\zFiles\Flight.JPG"
End Sub

Private Sub Image8_Click()
    ActiveWorkbook.FollowHyperlink "\\us01sfiles02\Siegling Share\Fullsan (Sales)\zFiles\flightspacing.JPG"

End Sub
















Private Sub OptionButton1_Click()
QuoteForm.Zoom = 100
QuoteForm.Height = 706
QuoteForm.Width = 900
End Sub

Private Sub OptionButton10_Click()
ComboBox18.Enabled = True

End Sub

Private Sub OptionButton11_Click()

Dim n As String

If SWHeight.Value < 39 Then
    n = 2
ElseIf SWHeight > 128 Then
    n = 6
Else
    n = 4
End If

TextBox14.Value = TextBox14.Value & "Snaps on sidewall. Additional line items 878350 and 878351, QTY " & n & " each"



End Sub

Private Sub OptionButton2_Click()
QuoteForm.Zoom = 90
QuoteForm.Height = 706 * 0.9
QuoteForm.Width = 900 * 0.9
End Sub

Private Sub OptionButton3_Click()
QuoteForm.Zoom = 80
QuoteForm.Height = 706 * 0.8
QuoteForm.Width = 900 * 0.8
End Sub

Private Sub OptionButton4_Click()
QuoteForm.Zoom = 59
QuoteForm.Height = 706 * 0.6
QuoteForm.Width = 900 * 0.6
End Sub

Private Sub OptionButton5_Click()
GussetNum.Value = vbNullString
SpFabpc.Enabled = True
TextBox24.Enabled = True
SpFabpc.Value = vbNullString
TextBox24.Value = vbNullString
TextBox22.Text = vbNullString

End Sub

Private Sub OptionButton6_Click()
SpFabpc.Value = "Cut outs on belt ends"
SpFabpc.Enabled = False
TextBox24.Enabled = False
TextBox22.Text = "*GUSSETED FLIGHTS*"

End Sub

Private Sub OptionButton9_Click()
ComboBox18.Enabled = False
ComboBox18.Value = ""

End Sub

Sub SWSurface_Change() 'Once belt surface type is selected...

If Me.ComboBox3.Value = "CD" Then  'Checks if belt type is CD
    If SWSurface.Value = "Smooth" Then
        SWHeight.RowSource = "DRAWING_DATA!U2:U9"  'If smooth is selected then pull smooth options
    Else
        SWHeight.RowSource = "DRAWING_DATA!W2:W9"   'otherwise pull textured
    End If
End If

If Me.ComboBox3.Value = "PD1" Then  'Checks if belt type is PD1
    If Me.SWSurface.Value = "Smooth" Then
        SWHeight.RowSource = "DRAWING_DATA!AC2:AC6"   'If smooth is selected then pull smooth options
    Else
        SWHeight.RowSource = "DRAWING_DATA!AC2:AC6"   'otherwise pull textured
    End If
End If

If Me.ComboBox3.Value = "PD2" Then  'Checks if belt type is PD2
    If Me.SWSurface.Value = "Smooth" Then
        SWHeight.RowSource = "DRAWING_DATA!Y2:Y8"  'If smooth is selected then pull smooth options
    Else
        SWHeight.RowSource = "DRAWING_DATA!AA2:AA9"    'otherwise pull textured
    End If
End If

If Me.ComboBox3.Value = "FLT" Then  'Checks if belt type is FLT
    If Me.SWSurface.Value = Smooth Then
        If SWPitch.Value = "40" Then
            SWHeight.RowSource = "DRAWING_DATA!U2:U9"
        ElseIf SWPitch.Value = "26" Then
            SWHeight.RowSource = "DRAWING_DATA!AC2:AC6"
        ElseIf SWPitch.Value = "50" Then
            SWHeight.RowSource = "DRAWING_DATA!Y2:Y8"
        End If
    Else
        If SWPitch.Value = "40" Then
            SWHeight.RowSource = "DRAWING_DATA!W2:W9"
        ElseIf SWPitch.Value = "26" Then
            SWHeight.RowSource = "DRAWING_DATA!AC2:AC6"
        ElseIf SWPitch.Value = "50" Then
            SWHeight.RowSource = "DRAWING_DATA!AA2:AA9"
        End If
    End If
End If

SWHeight.Value = " "
End Sub


Private Sub SIDEWALLNO_Click()
Dim lngBlack As Long
lngBlack = RGB(0, 0, 0)

SWSurface.Enabled = False
SWSurface.BackColor = lngBlack
SWSurface.Value = " "
SWHeight.Enabled = False
SWHeight.BackColor = lngBlack
SWHeight.Value = " "
SWIndent.Enabled = False
SWIndent.BackColor = lngBlack
SWIndent.Value = " "
Label45.Caption = " "

SWPitch.Enabled = False
SWPitch.BackColor = lngBlack
SWPitch.Value = " "

TextBox14.Enabled = False
Sheets("CalcSheet").Range("d53").Value = "No"

End Sub

Private Sub SIDEWALLYES_Click() 'If YES to "Is there sidewall?"
Dim lngWhite As Long
lngWhite = RGB(255, 255, 255)

SWSurface.Enabled = True
SWSurface.BackColor = lngWhite
SWHeight.Enabled = True
SWHeight.BackColor = lngWhite
SWIndent.Enabled = True
SWIndent.BackColor = lngWhite

SWPitch.BackColor = lngWhite
SWPitch.Enabled = True

If Me.ComboBox3.Value = "CD" Then  'Checks if belt type is CD
    SWPitch.Value = "40"
    SWPitch.Enabled = False
End If

If Me.ComboBox3.Value = "PD1" Then  'Checks if belt type is PD1
    SWPitch.Value = "26"
    SWPitch.Enabled = False
End If

If Me.ComboBox3.Value = "PD2" Then  'Checks if belt type is PD2
    SWPitch.Value = "50"
    SWPitch.Enabled = False
End If

TextBox14.Enabled = True
Sheets("CalcSheet").Range("d53").Value = "Yes"

End Sub

Private Sub SWHeight_Change()

On Error GoTo xend

Sheets("CalcSheet").Range("d60").Value = SWHeight.Value
If Me.ComboBox3.Value = "CD" Then  'Checks if belt type is CD
    If SWSurface.Value = "Smooth" Then
        Label45.Caption = Sheets("DRAWING_DATA").Range("v12").Value
    Else
        Label45.Caption = Sheets("DRAWING_DATA").Range("x12").Value
    End If
End If

If Me.ComboBox3.Value = "PD1" Then  'Checks if belt type is PD1
    If Me.SWSurface.Value = "Smooth" Then
        Label45.Caption = Sheets("DRAWING_DATA").Range("ad12").Value
    Else
        Label45.Caption = Sheets("DRAWING_DATA").Range("af12").Value
    End If
End If

If Me.ComboBox3.Value = "PD2" Then  'Checks if belt type is PD2
    If Me.SWSurface.Value = "Smooth" Then
        Label45.Caption = Sheets("DRAWING_DATA").Range("z12").Value
    Else
        Label45.Caption = Sheets("DRAWING_DATA").Range("ab12").Value
    End If
End If

If Me.ComboBox3.Value = "FLT" Then  'Checks if belt type is FLT
    If Me.SWSurface.Value = "Smooth" Then
        If SWPitch.Value = "40" Then
            Label45.Caption = Sheets("DRAWING_DATA").Range("v12").Value
        ElseIf SWPitch.Value = "26" Then
            Label45.Caption = Sheets("DRAWING_DATA").Range("ad12").Value
        ElseIf SWPitch.Value = "50" Then
            Label45.Caption = Sheets("DRAWING_DATA").Range("z12").Value
        End If
    Else
        If SWPitch.Value = "40" Then
            Label45.Caption = Sheets("DRAWING_DATA").Range("x12").Value
        ElseIf SWPitch.Value = "26" Then
            Label45.Caption = Sheets("DRAWING_DATA").Range("af12").Value
        ElseIf SWPitch.Value = "50" Then
            Label45.Caption = Sheets("DRAWING_DATA").Range("ab12").Value
        End If
    End If
End If

If ComboBox6.Value = "Hinge Lace" Or ComboBox6.Value = "Clipper Lace" Or ComboBox6.Value = "Staple Lace" Or ComboBox6.Value = "Rivet Lace" Then
    Label111.Visible = True
    Label112.Visible = True
    Label113.Visible = True
    OptionButton11.Visible = True
    OptionButton12.Visible = True
    Image9.Visible = True
End If

Exit Sub
xend:
'MsgBox ("Please check the sidewall height")
End Sub

Private Sub CommandButton1_Click()
Dim calc As Worksheet

If ComboBox1.Value = vbNullString Or ComboBox1.Value = " " Then
    MsgBox ("Please select a salesman name")
    Exit Sub
End If
If ComboBox2.Value = vbNullString Or ComboBox2.Value = " " Then
    MsgBox ("Please select a customer name")
    Exit Sub
End If
If ComboBox3.Value = vbNullString Or ComboBox3.Value = " " Then
    MsgBox ("Please select a belt type")
    Exit Sub
End If

If ComboBox5.Value = vbNullString Or ComboBox3.Value = " " Then
    MsgBox ("Please select units for belth width")
    Exit Sub
End If

If BeltQty.Value = vbNullString Or BeltQty.Value = " " Then
    MsgBox ("Please enter a belt quantity")
    Exit Sub
End If
If ComboBox16.Value = " " Or ComboBox16.Value = vbNullString Then
    MsgBox ("Please select a belt material")
    Exit Sub
End If
If BeltLength.Value = vbNullString Or BeltLength.Value = " " Then
    MsgBox ("Please enter a belt length")
    Exit Sub
End If
If BeltWidth.Value = vvbNullString Or BeltWidth.Value = " " Then
    MsgBox ("Please enter a belt width")
    Exit Sub
End If
If BeltLenAdj.Value = vbNullString Or BeltLenAdj.Value = " " Then
    MsgBox ("Please enter a belt adjusted length")
    Exit Sub
End If
If ComboBox6.Value = vbNullString Or ComboBox6.Value = " " Then
    MsgBox ("Please enter a an endless type")
    Exit Sub
End If

'Set values on the calculation sheet equal to entered values from user form
Sheets("CalcSheet").Range("d2").Value = ComboBox1.Value 'add salesman name
Sheets("CalcSheet").Range("d3").Value = ComboBox2.Value 'add customer to calc sheet
Sheets("CalcSheet").Range("d18").Value = ComboBox3.Value 'add type of belt to calc sheet
Sheets("CalcSheet").Range("d20").Value = ComboBox16.Value 'add product name to calc sheet
Sheets("CalcSheet").Range("d36").Value = ComboBox6.Value 'add splice to calc sheet
'Sheets("CalcSheet").Range("e25").Value = BeltLength.Value 'add belt length to calc sheet
'Sheets("CalcSheet").Range("e33").Value = BeltWidth.Value 'add belt width to cal csheet
Sheets("CalcSheet").Range("e30").Value = BeltLenAdj.Value 'add adjusted belt length to calc sheet
Sheets("CalcSheet").Range("d21").Value = BeltQty.Value 'add belt qty to calc sheet

Sheets("CalcSheet").Range("d22").Value = TextBox21.Value 'add customer material number
Sheets("QUOTE_CSR").Range("b17").Value = TextBox26.Value 'add general notes to CSR sheet

'Belt Width
If ComboBox5.Value = "mm" Then
    Sheets("CalcSheet").Range("e33").Value = BeltWidth.Value
ElseIf ComboBox5.Value = "in" Then
    Sheets("CalcSheet").Range("e33").Value = BeltWidth.Value * 25.4
    Sheets("QUOTE_CSR").Range("b24").Value = BeltWidth.Value
End If

'Guides top
If LGTOPYES.Value = True Then

    If GuideLocation.Value = " " Then
        MsgBox ("Please enter top guide location")
        Exit Sub
    End If
    
    If TopGuideSelect.Value = " " Then
        MsgBox ("Please enter Top guide material")
        Exit Sub
    End If
    
    If TopGuideQty.Value = " " Then
        MsgBox ("Please enter top guide quantity")
        Exit Sub
    End If
       If GuideLocation.Value = "Single guide - Indent from edge to center" Then
        If GuideSpacing.Value = " " Then
            MsgBox ("Please enter indent distance")
            Exit Sub
        Else
            Sheets("CalcSheet").Range("e50").Value = Sheets("CalcSheet").Range("e33").Value - 2 * GuideSpacing.Value
        End If
    ElseIf GuideLocation.Value = "Multiple guides - Center to center" Then
            If GuideSpacing.Value = " " Then
            MsgBox ("Please enter center to center distance")
            Exit Sub
        Else
            Sheets("CalcSheet").Range("e50").Value = GuideSpacing.Value
        End If
    End If
    
    Sheets("CalcSheet").Range("d46").Value = "Yes"
    Sheets("CalcSheet").Range("d46").Value = "Yes"
    Sheets("CalcSheet").Range("d49").Value = GuideLocation.Value
    Sheets("CalcSheet").Range("d47").Value = TopGuideSelect.Value
    Sheets("CalcSheet").Range("d48").Value = TopGuideQty.Value
    Sheets("CalcSheet").Range("d51").Value = TextBox15.Value

    'If Sheets("CalcSheet").Range("i41").Value = True Then
        'MsgBox ("Your guide spacing is not valid")
        'Exit Sub
    'End If

Else
    Sheets("CalcSheet").Range("d46").Value = "No"
End If

'Bottom Guides
If LGBOTYES.Value = True Then
    
    If GuideLocationBottom.Value = " " Then
        MsgBox ("Please enter bottom guide location")
        Exit Sub
    End If
    
    If BotGuideSelect.Value = " " Then
        MsgBox ("Please enter bottom guide material")
        Exit Sub
    End If
    
    If BotGuideQty.Value = " " Then
        MsgBox ("Please enter bottom guide quantity")
        Exit Sub
    End If
       If GuideLocationBottom.Value = "Single guide - Indent from edge to center" Then
        If GuideSpacingBottom.Value = " " Then
            MsgBox ("Please enter indent distance")
            Exit Sub
        Else
            Sheets("CalcSheet").Range("e43").Value = GuideSpacingBottom.Value
        End If
    ElseIf GuideLocationBottom.Value = "Multiple guides - Center to center" Then
            If GuideSpacingBottom.Value = " " Then
            MsgBox ("Please enter center to center distance")
            Exit Sub
        Else
            Sheets("CalcSheet").Range("e43").Value = GuideSpacingBottom.Value
        End If
    End If
    
    Sheets("CalcSheet").Range("d39").Value = "Yes"
    Sheets("CalcSheet").Range("d42").Value = GuideLocationBottom.Value
    Sheets("CalcSheet").Range("d40").Value = BotGuideSelect.Value
    Sheets("CalcSheet").Range("d41").Value = BotGuideQty.Value
    
    If LGTOPYES.Value = False Then
        Sheets("CalcSheet").Range("d44").Value = TextBox15.Value
    End If
        
    If Sheets("CalcSheet").Range("i42").Value = True Then
        MsgBox ("Your bottom guide spacing is not valid")
        Exit Sub
    End If
Else
    Sheets("CalcSheet").Range("d39").Value = "No"
End If

'Cleats/Flgihts
If CLEATYES.Value = True Then

    If CleatType.Value = " " Then
        MsgBox ("Please enter flight Type")
        Exit Sub
    End If
    
    If CleatSurface.Value = " " Then
        MsgBox ("Please enter flight Surface type")
        Exit Sub
    End If
    
    If CleatThickness.Value = " " Then
        MsgBox ("Please enter flight Thickness")
        Exit Sub
    End If

    If CleatHeight.Value = " " Then
        MsgBox ("Please enter flight Material")
        Exit Sub
    End If

    If CleatWidth.Value = " " Then
        MsgBox ("Please enter flight Width")
        Exit Sub
    End If

    If CleatIndent.Value = " " Then
        MsgBox ("Please enter flight Indent")
        Exit Sub
    End If

    If RequestedCltPitch.Value = " " Then
        MsgBox ("Please enter Requested Flight Pitch")
        Exit Sub
    End If
    
    If Sheets("CalcSheet").Range("i70").Value = True Then
        MsgBox ("Your Flights are too wide")
        Exit Sub
    End If
    
    If RequestedCltPitch.Value < 50 Then
        MsgBox ("Flight centers must be at least 50 mm")
        Exit Sub
    End If
    
    If CheckBox1.Value = True Then
        Sheets("CalcSheet").Range("d87").Value = "Multiple cleats - Indent from edge"
    Else
        Sheets("CalcSheet").Range("d87").Value = "Single flight - Indent from edge"
    End If
    
    Sheets("CalcSheet").Range("d67").Value = "Yes"
    Sheets("CalcSheet").Range("d78").Value = CleatThickness.Value
    Sheets("CalcSheet").Range("d77").Value = CleatType.Value
    Sheets("CalcSheet").Range("e69").Value = RequestedCltPitch.Value
    Sheets("CalcSheet").Range("d79").Value = CleatHeight.Value
    Sheets("CalcSheet").Range("d81").Value = Label66.Caption
    Sheets("CalcSheet").Range("e86").Value = CleatWidth.Value
    Sheets("CalcSheet").Range("f87").Value = CleatIndent.Value
    Sheets("CalcSheet").Range("d80").Value = CleatSurface.Value
    Sheets("CalcSheet").Range("d88").Value = TextBox5.Value
Else
    Sheets("CalcSheet").Range("d67").Value = "No"
End If

'Sidewall
If SIDEWALLYES.Value = True Then
Sheets("CalcSheet").Range("d53").Value = "Yes"
    If SWPitch.Value = "" Then
        MsgBox ("Please enter sidewall pitch")
        Exit Sub
    End If
    If SWHeight.Value = " " Then
        MsgBox ("Please enter sidewall height")
        Exit Sub
    End If
    If SWIndent.Value = " " Then
        MsgBox ("Please enter sidewall indent")
        Exit Sub
    End If
    If SWSurface.Value = " " Then
        MsgBox ("Please enter sidewall surface type")
        Exit Sub
    End If
    If Sheets("CalcSheet").Range("i62").Value = True Then
        MsgBox ("Your sidewall Indent is too small")
        Exit Sub
    End If
    If Sheets("CalcSheet").Range("i63").Value = True Then
        MsgBox ("WARNING: Your sidewall may be larger than possible by fabrication. Please check with fabrication and engineering")
        'Exit Sub
    End If
    
    Dim SWH As Integer 'Checks to see if cleats are taller than sidewall and asks user if they want to continue
    Dim CLH As Integer
    SWH = SWHeight.Value
    CLH = CleatHeight.Value
    
    If CLH > SWH Then
        response = MsgBox("Your flights are taller than your sidewall. Are you sure you want to continue?", vbYesNo + vbQuestion)
        
        If response = vbYes Then
            
        Else
            Exit Sub
        End If
    End If
    
Sheets("CalcSheet").Range("d61").Value = Label45.Caption 'add sidewall material to calc sheet
Sheets("CalcSheet").Range("d59").Value = SWSurface.Value
Sheets("CalcSheet").Range("d60").Value = SWHeight.Value
Sheets("CalcSheet").Range("e62").Value = SWIndent.Value
Sheets("CalcSheet").Range("d65").Value = TextBox14.Value
Else
    Sheets("CalcSheet").Range("d53").Value = "No"
End If

' Special Fab
Sheets("QUOTE_CSR").Unprotect Password:="engineer"
If SpFabm.Value <> vbNullString Then
    If TextBox23.Value = " " Or TextBox23.Value = vbNullString Then
        MsgBox ("Please enter a special fabrication quantity")
        Exit Sub
    Else
    Sheets("QUOTE_CSR").Range("b59").Value = TextBox23.Value
    Sheets("QUOTE_CSR").Rows("59").Hidden = False
    Sheets("QUOTE_CSR").Range("b58").Locked = True
    End If
End If
If SpFabpc.Value <> vbNullString Then
    If TextBox24.Value = " " Or TextBox24.Value = vbNullString Then
        MsgBox ("Please enter a special fabrication quantity")
        Exit Sub
    Else
    Sheets("QUOTE_CSR").Range("b61").Value = TextBox24.Value
    Sheets("QUOTE_CSR").Rows("61").Hidden = False
    Sheets("QUOTE_CSR").Range("b60").Locked = True
    End If
End If
If SpFab2pc.Value <> vbNullString Then
    If TextBox25.Value = " " Or TextBox25.Value = vbNullString Then
        MsgBox ("Please enter a special fabrication quantity")
        Exit Sub
    Else
    Sheets("QUOTE_CSR").Range("b63").Value = TextBox25.Value
    Sheets("QUOTE_CSR").Rows("63").Hidden = False
    Sheets("QUOTE_CSR").Range("b62").Locked = True
    End If
End If
If SpFab3pc.Value <> vbNullString Then
    If TextBox27.Value = " " Or TextBox27.Value = vbNullString Then
        MsgBox ("Please enter a special fabrication quantity")
        Exit Sub
    Else
    Sheets("QUOTE_CSR").Range("b65").Value = TextBox27.Value
    Sheets("QUOTE_CSR").Rows("65").Hidden = False
    Sheets("QUOTE_CSR").Range("b64").Locked = True
    End If
End If

If OptionButton6.Value = True Then
    If GussetNum.Value = vbNullString Or GussetNum.Value = " " Then
        MsgBox ("Please enter a gusset quantity")
        Exit Sub
    End If
Sheets("CalcSheet").Range("b99").Value = "Yes"
Sheets("CalcSheet").Range("b100").Value = (CleatHeight.Value * GussetNum.Value * NoOfCleats.Value) / 2000
End If

If OptionButton10.Value = True Then
    If ComboBox18.Value <> "" Then
        Sheets("CalcSheet").Range("b102").Value = "Yes"
        Sheets("CalcSheet").Range("b103").Value = ComboBox18.Value
    End If
End If


Sheets("CalcSheet").Range("h12").Value = LugRowQty.Value


Sheets("Tables").Range("r7").Value = SpFabm.Value
Sheets("Tables").Range("u12").Value = SpFabpc.Value
Sheets("Tables").Range("x12").Value = SpFab2pc.Value
Sheets("Tables").Range("aa12").Value = SpFab3pc.Value
Sheets("CalcSheet").Range("d97").Value = TextBox22.Value
If Imperial.Value = True Then
    Sheets("QUOTE_CSR").Rows("72").Hidden = False
    Sheets("QUOTE_CSR").Rows("71").Hidden = True
End If
If Metric.Value = True Then
    Sheets("QUOTE_CSR").Rows("72").Hidden = True
    Sheets("QUOTE_CSR").Rows("71").Hidden = False
End If
Sheets("QUOTE_CSR").Protect Password:="engineer"

QuoteForm.Hide 'hides the user form

Worksheets("QUOTE_CSR").Visible = True

Sheets("QUOTE_CSR").Protect Password:="engineer"
Worksheets("HOME").Visible = False
Sheets("QUOTE_CSR").Activate  'shows the Quote_CSR sheet upon closing user form

End Sub


Private Sub CommandButton2_Click()
MsgBox ("The adjusted belt length is the length options based on lug pitch")
End Sub

Private Sub Convert_Click()  'Unit Conversion

If ComboBox11.Value = " " Then
    MsgBox ("Please enter a unit to convert to")
    Exit Sub
Else
    If ComboBox10.Value = "in" Then
        If ComboBox11.Value = "mm" Then
            TextBox7.Value = TextBox6.Value * 25.4
        ElseIf ComboBox11.Value = "m" Then
            TextBox7.Value = TextBox6.Value * (25.4 / 1000)
        ElseIf ComboBox11.Value = "ft" Then
            TextBox7.Value = TextBox6.Value * (1 / 12)
        ElseIf ComboBox11.Value = "in" Then
            TextBox7.Value = TextBox6.Value
        Else
            MsgBox ("Please enter a starting unit to covert from")
        End If
    ElseIf ComboBox10.Value = "mm" Then
        If ComboBox11.Value = "mm" Then
            TextBox7.Value = TextBox6.Value
        ElseIf ComboBox11.Value = "m" Then
            TextBox7.Value = TextBox6.Value * (1 / 1000)
        ElseIf ComboBox11.Value = "ft" Then
            TextBox7.Value = TextBox6.Value * (25.4 / 12)
        ElseIf ComboBox11.Value = "in" Then
            TextBox7.Value = TextBox6.Value / 25.4
        Else
            MsgBox ("Please enter a starting unit to covert from")
        End If
    ElseIf ComboBox10.Value = "m" Then
        If ComboBox11.Value = "mm" Then
            TextBox7.Value = TextBox6.Value * 1000
        ElseIf ComboBox11.Value = "m" Then
            TextBox7.Value = TextBox6.Value
        ElseIf ComboBox11.Value = "ft" Then
            TextBox7.Value = TextBox6.Value * (25.4 / 1200)
        ElseIf ComboBox11.Value = "in" Then
            TextBox7.Value = TextBox6.Value * (25.4 / 1000)
        Else
            MsgBox ("Please enter a starting unit to covert from")
        End If
    ElseIf ComboBox10.Value = "ft" Then
        If ComboBox11.Value = "mm" Then
            TextBox7.Value = TextBox6.Value * (25.4) * (12)
        ElseIf ComboBox11.Value = "m" Then
            TextBox7.Value = TextBox6.Value * (12) * (25.4 / 1000)
        ElseIf ComboBox11.Value = "ft" Then
            TextBox7.Value = TextBox6.Value
        ElseIf ComboBox11.Value = "in" Then
            TextBox7.Value = TextBox6.Value * (12)
        Else
            MsgBox ("Please enter a starting unit to covert from")
        End If
    Else
        MsgBox ("please double check units")
    End If
            
End If


End Sub


Private Sub GuideLocation_Change()
GuideSpacing.Value = " "
If GuideLocation.Value = "Single guide - Indent from edge to center" Then
    GuideSpaceLabel.Visible = True
    GuideSpacing.Visible = True
    Label40.Visible = True
    GuideSpaceLabel.Caption = "Indent ETC"
ElseIf GuideLocation.Value = "Multiple guides - Center to center" Then
    GuideSpaceLabel.Visible = True
    GuideSpacing.Visible = True
    Label40.Visible = True
    GuideSpaceLabel.Caption = "Center to Center"
ElseIf GuideLocation.Value = "Single guide - Center top side" Then
    Sheets("CalcSheet").Range("e50").Value = " "
    GuideSpacing.Value = ""
    Label40.Visible = False
    GuideSpaceLabel.Visible = False
    GuideSpacing.Visible = False
ElseIf GuideLocation.Value = "Single guide - Flush to edge" Then
    Sheets("CalcSheet").Range("e50").Value = Sheets("CalcSheet").Range("e33").Value - Sheets("CalcSheet").Range("i52").Value
    GuideSpacing.Value = ""
    Label40.Visible = False
    GuideSpaceLabel.Visible = False
    GuideSpacing.Visible = False
ElseIf GuideLocation.Value = "Multiple guides - Flushed to edge" Then
    Sheets("CalcSheet").Range("e50").Value = Sheets("CalcSheet").Range("e33").Value - Sheets("CalcSheet").Range("i52").Value
    GuideSpacing.Value = ""
    Label40.Visible = False
    GuideSpaceLabel.Visible = False
    GuideSpacing.Visible = False
Else
    GuideSpaceLabel.Visible = False
    GuideSpacing.Visible = False
    Label40.Visible = False
    GuideSpacing.Value = " "
End If

End Sub



Private Sub GuideLocationBottom_Change()
GuideSpacingBottom.Value = " "
If GuideLocationBottom.Value = "Single guide - Indent from edge to center" Then
    GuideSpacingLabel2.Visible = True
    GuideSpacingBottom.Visible = True
    Label50.Visible = True
    GuideSpacingLabel2.Caption = "Indent ETC"
ElseIf GuideLocationBottom.Value = "Multiple guides - Center to center" Then
    GuideSpacingLabel2.Visible = True
    GuideSpacingBottom.Visible = True
    Label50.Visible = True
    GuideSpacingLabel2.Caption = "Center to Center"
ElseIf GuideLocationBottom.Value = "Single guide - Center pulley side" Then
    Sheets("CalcSheet").Range("e43").Value = Sheets("CalcSheet").Range("e33").Value / 2
    Label50.Visible = False
    GuideSpacingBottom.Value = ""
    GuideSpacingLabel2.Visible = False
    GuideSpacingBottom.Visible = False
ElseIf GuideLocationBottom.Value = "Single guide - Flush to edge" Then
    Sheets("CalcSheet").Range("e43").Value = Sheets("CalcSheet").Range("e33").Value - Sheets("CalcSheet").Range("i53").Value
    Label50.Visible = False
    GuideSpacingBottom.Value = ""
    GuideSpacingLabel2.Visible = False
    GuideSpacingBottom.Visible = False
ElseIf GuideLocationBottom.Value = "Multiple guides - Flushed to edge" Then
    Sheets("CalcSheet").Range("e43").Value = Sheets("CalcSheet").Range("e33").Value - Sheets("CalcSheet").Range("i53").Value
    Label50.Visible = False
    GuideSpacingBottom.Value = ""
    GuideSpacingLabel2.Visible = False
    GuideSpacingBottom.Visible = False
Else
    GuideSpacingLabel2.Visible = False
    GuideSpacingBottom.Visible = False
    Label50.Visible = False
    GuideSpacingBottom.Value = " "
End If

End Sub

Private Sub LGBOTNO_Click()

Dim lngBlack As Long
lngBlack = RGB(0, 0, 0)

BotGuideSelect.Enabled = False
BotGuideSelect.BackColor = lngBlack
BotGuideSelect.Value = " "
BotGuideQty.Enabled = False
BotGuideQty.BackColor = lngBlack
BotGuideQty.Value = " "
GuideLocationBottom.Enabled = False
GuideLocationBottom.BackColor = lngBlack
GuideLocationBottom.Value = " "
Sheets("CalcSheet").Range("d39").Value = "No"

End Sub

Private Sub LGBOTYES_Click()

Dim lngWhite As Long
lngWhite = RGB(255, 255, 255)

BotGuideSelect.Enabled = True  'Allows bottom guide options when YES is selected/clicked
BotGuideQty.Enabled = True
GuideLocationBottom.Enabled = True


BotGuideSelect.BackColor = lngWhite
BotGuideQty.BackColor = lngWhite
GuideLocationBottom.BackColor = lngWhite

TextBox15.Enabled = True
Sheets("CalcSheet").Range("d39").Value = "Yes"

End Sub

Private Sub LGTOPNO_Click()

Dim lngBlack As Long
lngBlack = RGB(0, 0, 0)

TopGuideSelect.Enabled = False
TopGuideSelect.BackColor = lngBlack
TopGuideSelect.Value = " "
TopGuideQty.Enabled = False
TopGuideQty.BackColor = lngBlack
TopGuideQty.Value = " "
GuideLocation.Enabled = False
GuideLocation.BackColor = lngBlack
GuideLocation.Value = " "
Sheets("CalcSheet").Range("d46").Value = "No"

End Sub

Private Sub LGTOPYES_Click()

Dim lngWhite As Long
lngWhite = RGB(255, 255, 255)

TopGuideSelect.Enabled = True  'allows editing of guide options when YES is clicked
TopGuideQty.Enabled = True
GuideLocation.Enabled = True

TopGuideSelect.BackColor = lngWhite
TopGuideQty.BackColor = lngWhite
GuideLocation.BackColor = lngWhite

TextBox15.Enabled = True

Sheets("CalcSheet").Range("d46").Value = "Yes"

End Sub

Private Sub RequestedCltPitch_AfterUpdate()

Sheets("CalcSheet").Range("e69").Value = RequestedCltPitch.Value
TextBox19.Value = Sheets("CalcSheet").Range("e71").Value
NoOfLugs = Sheets("CalcSheet").Range("F70").Value
NoOfCleats = Sheets("CalcSheet").Range("e74").Value
Label97.Visible = True
Label97.Caption = Sheets("CalcSheet").Range("f74").Value & " mm"
End Sub

Private Sub SWIndent_Change()
Sheets("CalcSheet").Range("e69").Value = SWHeight.Value
Sheets("CalcSheet").Range("e62").Value = SWIndent.Value
Label45.Visible = True

End Sub



Private Sub TextBox20_AfterUpdate()
'On Error GoTo xend

'inch = Me.TextBox20.Value

Sheets("CalcSheet").Range("e25").Value = (BeltLength.Value * 12 * 25.4 + TextBox20.Value * 25.4)
BeltLenAdj.RowSource = "CalcSheet!F28:F29"
'Sheets("QUOTE_CSR").Range("b23").Value = TextBox20.Value
If ComboBox3.Value = "FLT" Then
    BeltLenAdj.Value = Sheets("CalcSheet").Range("F29").Value
End If

Exit Sub
xend:
Sheets("CalcSheet").Range("e25").Value = (BeltLength.Value * 12 * 25.4)
End Sub

Private Sub ToggleButton1_Click()
If CLEATNO.Value = True Then
MsgBox ("Please select yes for cleats and enter configuration first")
Else
SplitCleats.Show
End If

End Sub

Private Sub TopGuideQty_Change()
GuideLocation.Value = " "
GuideSpaceLabel.Visible = False
GuideSpacing.Value = " "
GuideSpacing.Visible = False
Label40.Visible = False

If TopGuideQty.Value = 1 Then 'changes options based on guide quantity
    GuideLocation.RowSource = "DRAWING_DATA!E21:E23"
Else
    GuideLocation.RowSource = "DRAWING_DATA!E16:E17"
End If
End Sub

Private Sub TopGuideSelect_AfterUpdate()
    Sheets("CalcSheet").Range("d47").Value = TopGuideSelect.Value
End Sub

Sub UserForm_Initialize() 'Conditions set upon opening user form


Dim lngBlack As Long
Dim lngWhite As Long
lngBlack = RGB(0, 0, 0) 'setting for hsading a text box black
lngWhite = RGB(255, 255, 255)

'Temporary locking the length and width units to mm
'ComboBox4.Value = "mm"
'ComboBox5.Value = "mm"
ComboBox4.Enabled = False
ComboBox5.Enabled = False

CustomerNumber.Visible = False

Metric.Value = True

' Sets date in user form to today's date
Me.DateBox.Value = Date

' Sets salesman dropdown menu equal to table in
'ComboBox1.RowSource = "Tables!A2:A3"

ComboBox3.RowSource = "Tables!G2:G5"  'Sets options for Belt type


BeltLenAdj.Enabled = False

'ComboBox4.RowSource = "Tables!I2:I5" 'sets unit options for lenth and width
'ComboBox5.RowSource = "Tables!I2:I5"
ComboBox11.RowSource = "Tables!I2:I5"
ComboBox10.RowSource = "Tables!I2:I5"

LugRowQty.RowSource = "DRAWING_DATA!AN2:AN4"

MultiPage1.Visible = False  'Hides fabrication options other than endless
MultiPage1.Pages("Perforations").Visible = False
'MultiPage1.Pages("Page4").Visible = False 'hides specific pages

Frame6.Visible = False

'If ComboBox3.Value = FLT Then  'Checks if the belt type is flat, otherwise hides bottom guide option

    'BottomGuides.Visible = True
'Else
    'BottomGuides.Visible = False
'End If

GuideSpaceLabel.Visible = False
GuideSpacing.Visible = False
Label40.Visible = False
    
QuoteForm.Height = 706
QuoteForm.Width = 900
OptionButton1.Value = True

TextBox20.Visible = False
Label67.Visible = False

BeltLenAdj.Value = " "

'Initial contraints for LG TOP
LGTOPNO.Value = True 'Sets "have top guides?" option to no

TopGuideSelect.Enabled = False
TopGuideSelect.BackColor = lngBlack
TopGuideQty.Enabled = False
TopGuideQty.BackColor = lngBlack
GuideLocation.Enabled = False
GuideLocation.BackColor = lngBlack

'Initial contraints for LG Bottom
LGBOTNO.Value = True

BotGuideSelect.Enabled = False
BotGuideSelect.BackColor = lngBlack
BotGuideQty.Enabled = False
BotGuideQty.BackColor = lngBlack
GuideLocationBottom.Enabled = False
GuideLocationBottom.BackColor = lngBlack


TextBox15.Enabled = False

'Initial Sidewall option constraints
SIDEWALLNO.Value = True
OptionButton12.Value = True

SWSurface.Enabled = False
SWSurface.BackColor = lngBlack
SWHeight.Enabled = False
SWHeight.BackColor = lngBlack
SWIndent.Enabled = False
SWIndent.BackColor = lngBlack

TextBox14.Enabled = False

    Label111.Visible = False
    Label112.Visible = False
    Label113.Visible = False
    OptionButton11.Visible = False
    OptionButton12.Visible = False
    Image9.Visible = False

'Initial Cleat options contraints
CLEATNO.Value = True

CleatType.Enabled = False
CleatType.BackColor = lngBlack
CleatSurface.Enabled = False
CleatSurface.BackColor = lngBlack
CleatThickness.Enabled = False
CleatThickness.BackColor = lngBlack
CleatHeight.Enabled = False
CleatHeight.BackColor = lngBlack
CleatWidth.Enabled = False
CleatWidth.BackColor = lngBlack
CleatIndent.Enabled = False
CleatIndent.BackColor = lngBlack
RequestedCltPitch.Enabled = False
RequestedCltPitch.BackColor = lngBlack
Label66.Visible = False
TextBox5.Enabled = False
Label97.Visible = False

SpFabm.Value = vbNullString
SpFabpc.Value = vbNullString
SpFab2pc.Value = vbNullString
SpFab3pc.Value = vbNullString

Me.Label30.Visible = False 'hides unit label in unit converter
Me.Label45.Visible = False 'hides sidewall part number/name label

OptionButton5.Value = True 'have gussets set to no
OptionButton9.Value = True 'have split cleats set to no
SplitFlights.Visible = False
OptionButton6.Enabled = False
ComboBox18.Enabled = False

BeltLength.Enabled = False

LugRowText.Visible = False
LugRowQty.Visible = False

CommandButton9.Visible = False


End Sub

Sub ComboBox1_Change() 'Load customers based on what the salesman name is changed to


Dim calc As Worksheet

Set calc = ThisWorkbook.Sheets("CalcSheet")

With calc
    .Cells(2, 4) = ComboBox1.Text 'Add salesman name to the calc sheet
    
End With

Dim sname As String

On Error GoTo xend

listlen = Sheet15.Cells(Rows.Count, 1).End(xlUp).Offset(1, 0).Row


ComboBox2.RowSource = "CustomerList!B2:B" & listlen



xend:
Exit Sub

End Sub
Sub ComboBox3_Change() 'After picking drive type give list of belt material
ComboBox16.Value = vbNullString
BeltLength.Value = vbNullString
BeltLenAdj.Value = " "
RequestedCltPitch = " "
TextBox19.Value = " "
NoOfCleats.Value = " "
NoOfLugs.Value = " "
If CLEATYES.Value = True Then
    MsgBox ("Please re-enter the belt length and flight information")
    MultiPage1.Visible = False
End If

If SIDEWALLYES.Value = True Then
    SWSurface.Value = ""
    SWHeight.Value = ""
    If Me.ComboBox3.Value = "CD" Then
        SWPitch.Value = "40"
       ' SWPitch.Enabled = False
    ElseIf Me.ComboBox3.Value = "PD2" Then
        SWPitch.Value = "50"
        'SWPitch.Enabled = False
    ElseIf Me.ComboBox3.Value = "PD1" Then
        SWPitch.Value = "26"
        'SWPitch.Enabled = False
    ElseIf Me.ComboBox3.Value = "FLT" Then
        SWPitch.Value = ""
        SWPitch.Enabled = True
    End If
End If

If ComboBox3.Value = "CD" Then
    ComboBox16.RowSource = "DRAWING_DATA!A54:A68"
    ComboBox6.RowSource = "Tables!K2:K7"
    BottomGuides.Visible = False
    Label43.Visible = True
    BeltLenAdj.Visible = True
    Label44.Visible = True
    CommandButton2.Visible = True
ElseIf ComboBox3.Value = "PD1" Then
    ComboBox16.RowSource = "DRAWING_DATA!A69:A70"
    BottomGuides.Visible = False
    Label43.Visible = True
    BeltLenAdj.Visible = True
    Label44.Visible = True
    CommandButton2.Visible = True
    LugRowText.Visible = False
    LugRowQty.Visible = False
ElseIf ComboBox3.Value = "PD2" Then
    ComboBox16.RowSource = "DRAWING_DATA!A71:A77"
    BottomGuides.Visible = False
    Label43.Visible = True
    BeltLenAdj.Visible = True
    Label44.Visible = True
    CommandButton2.Visible = True
    LugRowText.Visible = False
    LugRowQty.Visible = False
ElseIf ComboBox3.Value = "FLT" Then
    ComboBox16.RowSource = "DRAWING_DATA!A78:A96"
    ComboBox6.RowSource = "Tables!K2:K9"
    BottomGuides.Visible = True
    Label43.Visible = False
    BeltLenAdj.Visible = False
    Label44.Visible = False
    CommandButton2.Visible = False
    LugRowText.Visible = False
    LugRowQty.Visible = False
Else
    ComboBox16.RowSource = "DRAWING_DATA!A2:A20"
    BottomGuides.Visible = True
End If

If ComboBox3.Value = "FLT" Then
    Label60.Visible = False
    NoOfLugs.Visible = False
Else
    Label60.Visible = True
    NoOfLugs.Visible = True
End If

'TextBox20.Value = ""
'TextBox20.Visible = False
'Label67.Visible = False
BeltLength.Enabled = True
ComboBox4.Value = "mm"
ComboBox4.Enabled = False

End Sub



Sub AddFab_Click()
If BeltLenAdj.Value = " " Then
    MsgBox ("Please enter an adjusted length")
    Exit Sub
End If


MultiPage1.Visible = True 'Show the multipage
Me.MultiPage1.Value = 0

Label99.Visible = False
Label100.Visible = False
Label101.Visible = False
Label102.Visible = False
GussetNum.Visible = False
OptionButton6.Visible = False
OptionButton5.Visible = False
SplitFlights.Visible = False

End Sub

Private Sub savetopdf()

On Error GoTo xend

Application.ScreenUpdating = False
Application.DisplayAlerts = False

On Error Resume Next

Dim monoquote As Worksheet
Set monoquote = .Sheets("QUOTE_CSR")

With monoquote
    .Range("a1:b53").ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
    "C:\Users\musdmatt\Desktop\Fullsanqt\Quotetopdf", Quality:= _
    xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas:=False, _
    OpenAfterPublish:=False
End With

Exit Sub
xend:
MsgBox "An error has occured - please make sure everything has run correctly."

End Sub
