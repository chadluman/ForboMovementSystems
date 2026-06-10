Attribute VB_Name = "ConveyorSelect"
Attribute VB_Base = "0{AAA34312-9A77-47BC-9D85-336B8904A5C9}{36C205CF-E3A3-4A15-8F97-1EECC508B6C1}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_TemplateDerived = False
Attribute VB_Customizable = False

Sub CommandButton1_Click()


With PullForce
.ComboBox12.Value = "Horizontal"
.ComboBox12.Enabled = False
.Frame1.Visible = False
.Label3.Visible = False
.Label4.Visible = False
.Label34.Visible = False
.Label35.Visible = False
.TextBox3.Visible = False
.TextBox4.Visible = False

End With

Load PullForce
PullForce.Show

Unload ConveyorSelect


End Sub

Sub CommandButton2_Click()

With PullForce
'.ComboBox12.Value = "Horizontal"
.Himg.Visible = False

.Label3.Visible = False
.Label4.Visible = False
.Label34.Visible = False
.Label35.Visible = False
.TextBox3.Visible = False
.TextBox4.Visible = False

End With

Load PullForce
PullForce.Show

Unload ConveyorSelect
End Sub

Sub CommandButton3_Click()

With PullForce
'.ComboBox12.Value = "Horizontal"
.Himg.Visible = False
.IDimg.Visible = False

.Label4.Visible = False
.TextBox4.Visible = False
.Label35.Visible = False

End With

Load PullForce
PullForce.Show

Unload ConveyorSelect
End Sub

Sub CommandButton4_Click()

With PullForce
'.ComboBox12.Value = "Horizontal"
.Himg.Visible = False
.IDimg.Visible = False
.HSimg.Visible = False


End With

Load PullForce
PullForce.Show

Unload ConveyorSelect
End Sub

Private Sub UserForm_Click()

End Sub
