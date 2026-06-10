Attribute VB_Name = "Module1"
Sub RectangleRoundedCorners1_Click()

Call GetLoggedInUserName

Sheets("CalcSheet").Range("d2").Value = " "
Sheets("CalcSheet").Range("d3").Value = " "
Sheets("CalcSheet").Range("d18").Value = " "
Sheets("CalcSheet").Range("d20").Value = " "
Sheets("CalcSheet").Range("d36").Value = " "
Sheets("CalcSheet").Range("e25").Value = " "
Sheets("CalcSheet").Range("e33").Value = " "
Sheets("CalcSheet").Range("e30").Value = " "
Sheets("CalcSheet").Range("d21").Value = " "
Sheets("CalcSheet").Range("d61").Value = " "
Sheets("CalcSheet").Range("d22").Value = ""

'clear top guides
Sheets("CalcSheet").Range("d46").Value = " "
Sheets("CalcSheet").Range("d49").Value = " "
Sheets("CalcSheet").Range("d47").Value = " "
Sheets("CalcSheet").Range("d48").Value = " "

Sheets("CalcSheet").Range("e50").Value = " "


'clear Bottom Guides

Sheets("CalcSheet").Range("d39").Value = " "
Sheets("CalcSheet").Range("d42").Value = " "
Sheets("CalcSheet").Range("d40").Value = " "
Sheets("CalcSheet").Range("d41").Value = " "
Sheets("CalcSheet").Range("e43").Value = " "

Sheets("CalcSheet").Range("e43").Value = " "


'sidewall
Sheets("CalcSheet").Range("d59").Value = " "
Sheets("CalcSheet").Range("d60").Value = " "
Sheets("CalcSheet").Range("e62").Value = " "


'Clear cleats
Sheets("CalcSheet").Range("d67").Value = "No"
Sheets("CalcSheet").Range("d78").Value = " "
Sheets("CalcSheet").Range("d77").Value = " "
Sheets("CalcSheet").Range("e69").Value = " "
Sheets("CalcSheet").Range("d81").Value = " "
Sheets("CalcSheet").Range("d79").Value = " "
Sheets("CalcSheet").Range("e86").Value = " "
Sheets("CalcSheet").Range("f87").Value = " "


QuoteForm.Show



End Sub


Sub PullForceCalculator()

ConveyorSelect.Show

End Sub

Sub PullForceCalculator2()


Load PullForce

With PullForce

    .ComboBox14.Value = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("CalcSheet").Range("P43").Value
    .TextBox12.Value = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("CalcSheet").Range("E33").Value
    .TextBox9.Value = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("CalcSheet").Range("C114").Value
End With


ConveyorSelect.Show

End Sub

Sub GetLoggedInUserName()

Dim strUserName As String

strUserName = Environ("UserName")


'MsgBox (strUserName)

End Sub
Sub ClearContents()

zilch = ""

Sheets("PFcalc").Range("i7").Value = zilch

Sheets("PFcalc").Range("i8").Value = zilch
Sheets("PFcalc").Range("i9").Value = zilch
Sheets("PFcalc").Range("i10").Value = zilch

Sheets("PFcalc").Range("i16").Value = zilch
Sheets("PFcalc").Range("i17").Value = zilch

Sheets("PFcalc").Range("i22").Value = zilch

'CTC
Sheets("PFcalc").Range("i27").Value = zilch


'conveyor geometry

    Sheets("PFcalc").Range("i26").Value = "L ; H"
    Sheets("PFcalc").Range("i30").Value = zilch
    Sheets("PFcalc").Range("i32").Value = zilch

Sheets("PFcalc").Range("n88").Value = 23

End Sub
Sub ClearContents2()

zilch = ""

Sheets("PFcalc").Range("i7").Value = zilch

Sheets("PFcalc").Range("i8").Value = zilch
Sheets("PFcalc").Range("i9").Value = zilch
Sheets("PFcalc").Range("i10").Value = zilch

Sheets("PFcalc").Range("i16").Value = zilch
Sheets("PFcalc").Range("i17").Value = zilch

Sheets("PFcalc").Range("i22").Value = zilch




'conveyor geometry

    Sheets("PFcalc").Range("i26").Value = "L ; H"
    Sheets("PFcalc").Range("i30").Value = zilch
    Sheets("PFcalc").Range("i32").Value = zilch

Sheets("PFcalc").Range("n88").Value = 23
Sheets("PFDisplay").Unprotect Password:="engineer"
Sheets("PFDisplay").Range("c10").Value = zilch
Sheets("PFDisplay").Range("c12").Value = zilch
Sheets("PFDisplay").Range("c15").Value = zilch
Sheets("PFDisplay").Protect Password:="engineer"

End Sub

Sub Clear2Home()

Call ClearContents2

Worksheets("HOME").Visible = True
Worksheets("PFDisplay").Visible = False

End Sub


