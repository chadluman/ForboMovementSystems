Attribute VB_Name = "CustList"
Attribute VB_Base = "0{E119EA8A-18A9-4B9F-BBD9-985D272C73BE}{C45FD889-CE84-455F-B566-F08C5094BAA8}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False



Private Sub FilterData2()
Dim Salesrep As String


Dim myDB As Range

With Me
If .ComboBox1.Value < 0 Then Exit Sub
    Salesrep = .ComboBox1.Value
End With

With ActiveWorkbook.Sheets("CustomerList")
Set myDB = .Range("A1:E1").Resize(.Cells(.Rows.Count, 1).End(xlUp).Row)
End With

With myDB
.AutoFilter
.AutoFilter Field:=5, Criteria1:=Salesrep
.SpecialCells(xlCellTypeVisible).AutoFilter Field:=5, Criteria1:=Salesrep
Call UpdateCustListBox(Me.ListBox1, myDB, 1)
.AutoFilter
End With

'Displaythis = Me.ListBox1.List(0, 1)
'MsgBox (Displaythis)

End Sub

Private Sub ComboBox1_Change()
Call FilterData2

End Sub

Private Sub ListBox1_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
'custnum = Me.ListBox1.Value & " " & Me.ListBox1.column(1, Me.ListBox1.ListIndex)
custnum = Me.ListBox1.column(1, Me.ListBox1.ListIndex)

If Me.ListBox1.Value = "Customer" Then GoTo xe

QuoteForm.ComboBox2.Value = custnum
QuoteForm.CustomerNumber.Caption = "Customer No.  " & Me.ListBox1.Value
QuoteForm.CustomerNumber.Visible = True

Sheets("CalcSheet").Range("h3").Value = Me.ListBox1.Value
TextBox1.Value = ""

Unload CustList

xe:
TextBox1.Value = ""
Exit Sub

End Sub

Sub UpdateCustListBox(MyListbox As MSForms.ListBox, zmyDB As Range, columnToList As Long)
Dim cell As Range, dataValues As Range



If zmyDB.SpecialCells(xlCellTypeVisible).Count > zmyDB.Columns.Count Then
    Set dataValues = zmyDB.Resize(zmyDB.Rows.Count + 1)
   ListBox1.Clear ' we clear the listbox before adding new elements
    For Each cell In dataValues.Columns(columnToList).SpecialCells(xlCellTypeVisible)
        With Me.ListBox1
        .AddItem cell.Value
        .List(.ListCount - 1, 1) = cell.Offset(0, 1).Value
        .List(.ListCount - 1, 2) = cell.Offset(0, 2).Value
       ' .List(.ListCount - 1, 3) = cell.Offset(0, 3).Value
       ' .List(.ListCount - 1, 4) = cell.Offset(0, 4).Value
       ' .List(.ListCount - 1, 5) = cell.Offset(0, 5).Value
        End With

    Next cell
Else
    MyListbox.Clear ' if no match then clear listbox
End If

'ListBox1.SetFocus



End Sub



Private Sub TextBox1_AfterUpdate()

Call CustIDFilter

End Sub

Private Sub UserForm_Initialize()
ComboBox1.Visible = False
CustList.Width = 640
CustList.Height = 460
TextBox1.TabIndex = 0



End Sub

Sub CustIDFilter()

Dim zmyDB As Range


'If Me.ComboBox1.Value < 0 Then Exit Sub
CustNo = "*" & Me.TextBox1.Value & "*"
Salesrep = QuoteForm.ComboBox1.Value


With ActiveWorkbook.Sheets("CustomerList")
Set zmyDB = .Range("A1:K1").Resize(.Cells(.Rows.Count, 1).End(xlUp).Row)
End With

With zmyDB
.AutoFilter
.AutoFilter Field:=2, Criteria1:=CustoNo
.AutoFilter Field:=5, Criteria1:=Salesrep
.SpecialCells(xlCellTypeVisible).AutoFilter Field:=2, Criteria1:=CustNo
Call UpdateCustListBox(Me.ListBox1, zmyDB, 1)
.AutoFilter
End With

End Sub

