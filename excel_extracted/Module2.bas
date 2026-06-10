Attribute VB_Name = "Module2"
Sub QuitnClear()

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

Sheets("CalcSheet").Range("d53").Value = "No"

'Clear cleats
Sheets("CalcSheet").Range("d67").Value = "No"
Sheets("CalcSheet").Range("d78").Value = " "
Sheets("CalcSheet").Range("d77").Value = " "
Sheets("CalcSheet").Range("e69").Value = " "
Sheets("CalcSheet").Range("d81").Value = " "
Sheets("CalcSheet").Range("d79").Value = " "
Sheets("CalcSheet").Range("e86").Value = " "
Sheets("CalcSheet").Range("f87").Value = " "

Sheets("CalcSheet").Range("d46").Value = " "
Sheets("CalcSheet").Range("d49").Value = " "
Sheets("CalcSheet").Range("d47").Value = " "
Sheets("CalcSheet").Range("d40").Value = " "
Sheets("CalcSheet").Range("d41").Value = " "
Sheets("CalcSheet").Range("d42").Value = " "
Sheets("CalcSheet").Range("d44").Value = " "
Sheets("CalcSheet").Range("E43").Value = ""
Sheets("CalcSheet").Range("E89").Value = ""

Sheets("CalcSheet").Range("d48").Value = " "

Worksheets("HOME").Visible = True
Worksheets("QUOTE_CSR").Visible = False

Sheets("QUOTE_CSR").Range("b22").Value = " "
Sheets("QUOTE_CSR").Range("b23").Value = " "
Sheets("QUOTE_CSR").Range("b24").Value = " "

Sheets("Tables").Range("r7").Value = ""
Sheets("Tables").Range("u12").Value = ""
Sheets("Tables").Range("x12").Value = ""

Sheets("QUOTE_CSR").Unprotect Password:="engineer"
Sheets("QUOTE_CSR").Rows("50:57").EntireRow.Hidden = True
Sheets("QUOTE_CSR").Range("b50:b57").Value = ""
Sheets("QUOTE_CSR").Rows("59").EntireRow.Hidden = True
Sheets("QUOTE_CSR").Range("b59").Value = ""
Sheets("QUOTE_CSR").Rows("61").EntireRow.Hidden = True
Sheets("QUOTE_CSR").Range("b61").Value = ""
Sheets("QUOTE_CSR").Rows("63").EntireRow.Hidden = True
Sheets("QUOTE_CSR").Range("b63").Value = ""
Sheets("QUOTE_CSR").Range("b64").Value = ""
Sheets("QUOTE_CSR").Range("b65").Value = ""
Sheets("QUOTE_CSR").Rows("65").EntireRow.Hidden = True
Sheets("QUOTE_CSR").Range("b65").Value = ""
Sheets("CalcSheet").Range("d97").Value = ""
Sheets("QUOTE_CSR").Range("b17").Value = ""
Sheets("CalcSheet").Range("d44").Value = ""
Sheets("CalcSheet").Range("d51").Value = ""
Sheets("CalcSheet").Range("d65").Value = ""
Sheets("CalcSheet").Range("d88").Value = ""
Sheets("QUOTE_CSR").Rows("72").EntireRow.Hidden = True
Sheets("QUOTE_CSR").Protect Password:="engineer" ' ,AllowFormatingRows:=True
Sheets("CalcSheet").Range("b99").Value = ""
Sheets("CalcSheet").Range("b100").Value = ""
Sheets("CalcSheet").Range("b102").Value = ""
Sheets("CalcSheet").Range("b103").Value = ""

Sheets("CalcSheet").Range("h12").Value = ""
Sheets("CalcSheet").Range("h3").Value = ""

Unload QuoteForm
Unload SaggingLength

End Sub
Sub EditQuote()


QuoteForm.Show



End Sub
Sub PDFsave()

Dim nname As String

On Error GoTo xend
Dim FSO
Dim Driven 'name of the drive to be saved to
Dim Foldn 'name of the folder in the drive
Dim iii As String
Dim rrr As String


Call GetLoggedInUserName

Application.ScreenUpdating = False
Application.DisplayAlerts = False
Workbooks("Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR").Range("Z2").Value = Now
'cust = Workbooks("TEST Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR").Range("B2").Value
instant = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR").Range("AA2").Value
sman = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR").Range("B1").Value
CustNo = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("CalcSheet").Range("H3").Value

If Workbooks("Fullsan Quote Request Form.xlsm").Sheets("CalcSheet").Range("D22").Value <> 0 Then
    nname = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("CalcSheet").Range("D22").Value
Else
    nname = ""
End If
    
'check if drive name is OneDrive or OneDrive-Forbo

'check folder name options
iFolderPath = "C:\Users\" & Environ$("UserName") & "\OneDrive - Forbo\Mattheson Devin's Files - Fullsan Quote"
Set Driven = CreateObject("Scripting.FileSystemObject")

If Driven.FolderExists(iFolderPath) Then
    iii = "Mattheson Devin's Files - Fullsan Quote"
Else
    iii = "Fullsan Quote"
End If

'Check if folder already exists and if not create one
'sFolderPath = "\\us01sfiles02\Siegling Share\Fullsan (Sales)\Quotes\" & sman
sFolderPath = "C:\Users\" & Environ$("UserName") & "\OneDrive - Forbo\Fullsan Quote\Quotes\" & sman

Set FSO = CreateObject("Scripting.FileSystemObject")

If FSO.FolderExists(sFolderPath) Then
    GoTo SaveFile
Else
    FSO.CreateFolder (sFolderPath)
End If

SaveFile:

On Error Resume Next

Dim monoquote As Worksheet
Set monoquote = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR")

'With monoquote
    '.Range("a1:b53").ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
   "C:\Users\musdmatt\Desktop\Fullsanqt\Quotetopdf", Quality:= _
    xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas:=False, _
   ' OpenAfterPublish:=False
'End With


With monoquote
    .Range("a1:b76").ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
   "C:\Users\" & Environ$("UserName") & "\OneDrive - Forbo\" & iii & "\Quotes\" & sman & "\" & "Quote- " & nname & " " & CustNo & " -" & instant, Quality:= _
    xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas:=False, _
    OpenAfterPublish:=False
End With

'With monoquote
   ' .Range("a1:b76").ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
   '"\\us01sfiles02\Siegling Share\Fullsan (Sales)\Quotes\" & sman & "\" & "Quote- " & nname & " " & CustNo & " -" & instant, Quality:= _
   ' xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas:=False, _
   ' OpenAfterPublish:=False
'End With

'C:\Users\musdmatt\OneDrive - Forbo\Fullsan Quote

'MsgBox (Environ$("UserName"))

Exit Sub
xend:
MsgBox "An error has occured - please make sure everything has run correctly."

End Sub
Sub DateConvert()
Attribute DateConvert.VB_ProcData.VB_Invoke_Func = " \n14"
'
' DateConvert Macro
'

'
    Range("Z2").Select
    Selection.Copy
    Range("Z3").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
End Sub

Sub pfPDFsave()

Dim nname As String

On Error GoTo xend
Dim FSO



Call GetLoggedInUserName

Application.ScreenUpdating = False
Application.DisplayAlerts = False
Workbooks("Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR").Range("Z2").Value = Now
'cust = Workbooks("TEST Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR").Range("B2").Value
instant = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("QUOTE_CSR").Range("AA2").Value
Project = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("PFDisplay").Range("C12").Value
CustNo = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("PFDisplay").Range("C10").Value

    

'Check if folder already exists and if not create one
'sFolderPath = "\\us01sfiles02\Siegling Share\Fullsan (Sales)\Quotes\" & sman
sFolderPath = "C:\Users\" & Environ$("UserName") & "\OneDrive - Forbo\Fullsan Quote\Pull Force Calculations\" & CustNo

Set FSO = CreateObject("Scripting.FileSystemObject")

'if a fodler for this customer exists save here otherwise create one
If FSO.FolderExists(sFolderPath) Then
    GoTo SaveFile
Else
    FSO.CreateFolder (sFolderPath)
End If

SaveFile:

On Error Resume Next

Dim monocalc As Worksheet
Set monocalc = Workbooks("Fullsan Quote Request Form.xlsm").Sheets("PFDisplay")

'With monoquote
    '.Range("a1:b53").ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
   "C:\Users\musdmatt\Desktop\Fullsanqt\Quotetopdf", Quality:= _
    xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas:=False, _
   ' OpenAfterPublish:=False
'End With


With monocalc
    .Range("a1:m69").ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
   "C:\Users\" & Environ$("UserName") & "\OneDrive - Forbo\Fullsan Quote\Pull Force Calculations\" & CustNo & "\" & "Calc- " & CustNo & " " & Project & " -" & instant, Quality:= _
    xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas:=False, _
    OpenAfterPublish:=False
End With

'With monoquote
   ' .Range("a1:b76").ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
   '"\\us01sfiles02\Siegling Share\Fullsan (Sales)\Quotes\" & sman & "\" & "Quote- " & nname & " " & CustNo & " -" & instant, Quality:= _
   ' xlQualityStandard, IncludeDocProperties:=True, IgnorePrintAreas:=False, _
   ' OpenAfterPublish:=False
'End With

'C:\Users\musdmatt\OneDrive - Forbo\Fullsan Quote

'MsgBox (Environ$("UserName"))

Exit Sub
xend:
MsgBox "An error has occured - please make sure everything has run correctly."

End Sub

Sub Displaypdf()

PullForcePDF.Show

End Sub

