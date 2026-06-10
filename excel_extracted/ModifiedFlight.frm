Attribute VB_Name = "ModifiedFlight"
Attribute VB_Base = "0{C4B41039-099D-4571-93CE-429B06ECBE64}{F520A2FB-CA3D-4DFF-AC88-0BEC6A3E7039}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False
Private Sub CleatHeight_Change()

totalheight.Caption = CleatHeight.Value
totalheight.Visible = True
Image1.Visible = True

CleatHeight.RowSource = QuoteForm.CleatHeight.RowSource

End Sub

Private Sub CommandButton1_Click()

Dim partheight As Integer
Dim cutotheight As Integer

If CleatHeight.Value = "" Then
    MsgBox ("Please enter cleat height to cut from")
    Exit Sub
End If
If RequestedHeight.Value = "" Then
    MsgBox ("Please enter desired height to cut to")
    Exit Sub
End If

partheight = CleatHeight.Value
cuttoheight = RequestedHeight.Value

If cuttoheight > partheight Then
    MsgBox ("Please select a larger profile height to cut from")
    Exit Sub
End If

Sheets("CalcSheet").Range("e89").Value = cuttoheight

With QuoteForm
    .CleatHeight.Value = partheight
    .CleatHeight.Enabled = False
    .TextBox5.Value = "Cleat height " & partheight & " mm modified to height " & cuttoheight & " mm"
End With

ModifiedFlight.Hide


End Sub

Private Sub RequestedHeight_Change()
modiheight.Caption = RequestedHeight.Value
modiheight.Visible = True

End Sub

Private Sub UserForm_Initialize()

modiheight.Visible = False
totalheight.Visible = False
Image1.Visible = False

End Sub
