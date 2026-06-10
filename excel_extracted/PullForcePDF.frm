Attribute VB_Name = "PullForcePDF"
Attribute VB_Base = "0{958457EE-AD39-425C-9C34-648560DA458D}{63590E6B-5F3A-4420-A2BA-2DB2E1946793}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False
Private Sub PullForcePDF_Initialize()


Me.CustBox.Value = Sheets("PFDisplay").Range("C10").Value

Me.ProjBox.Value = Sheets("PFDisplay").Range("C12").Value


End Sub

Private Sub CommandButton1_Click()

'unprotect sheet
Sheets("PFDisplay").Unprotect Password:="engineer"

' add customer, project name, and tech data
Sheets("PFDisplay").Range("C10").Value = CustBox.Value

Sheets("PFDisplay").Range("C12").Value = ProjBox.Value

Sheets("PFDisplay").Range("C15").Value = TechData.Value

Call pfPDFsave

Sheets("PFDisplay").Protect Password:="engineer"

'close the user form
Unload PullForcePDF


End Sub

Private Sub Label2_Click()

End Sub

Private Sub UserForm_Click()

End Sub
