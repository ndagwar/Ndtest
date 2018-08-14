<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditExpanse.aspx.cs" Inherits="ExpanseExample.EditExpanse" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="blendTrans(Duration=0.5)" http-equiv="Page-Enter" />
	<meta content="blendTrans(Duration=0.5)" http-equiv="Page-Exit" />
    <title></title>

    <script language="javascript" type="text/javascript">
        function getbacktostepone() {
            window.location = "EditExpanse.aspx";
        }
        function onSuccess() {
            setTimeout(okay, 2000);
        }
        function onError() {
            setTimeout(getbacktostepone, 2000);
        }
        function okay() {
            var UIMODE = $get('hdnWindowUIMODE').value;
            if (UIMODE == "EDIT")
                window.parent.document.getElementById('ButtonEditDone').click();
            else {
                window.parent.document.getElementById('btnOkay').click();
                getbacktostepone();
            }
        }
        function cancel() {
            var UIMODE = $get('hdnWindowUIMODE').value;
            if (UIMODE == "EDIT")
                window.parent.document.getElementById('ButtonEditCancel').click();
            else
                window.parent.document.getElementById('btnCancel').click();
        }
    </script>

</head>
<body style="margin: 0px; padding: 0px;">
    <form id="form1" runat="server">
    <input type="hidden" value="" runat="server" id="hdnWindowUIMODE" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="popup_Container">
        <div class="popup_Titlebar" id="PopupHeader">
            <div class="TitlebarLeft">
                Edit Expanse
            </div>
            <div class="TitlebarRight" onclick="cancel();">
            </div>
        </div>
        <div class="popup_Body">
            <asp:MultiView ID="MultiViewExpanse" runat="server">
                <asp:View ID="ViewInput" runat="server">
                    <table>
                        <tr>
                            <td>
                                Category
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxCategory" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="*" ControlToValidate="TextBoxCategory"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Date
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
                                <cc1:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="TextBoxDate" PopupPosition="TopLeft">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="*" ControlToValidate="TextBoxDate"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Amount
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxAmount" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="*" ControlToValidate="TextBoxAmount"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="ViewSuccess" runat="server">
                    <p>
                        You have added a new expanse successfully<br />
                        Dialog will close automatically in two second</p>
                    <asp:LinkButton runat="server" ID="lnkAddAnother" OnClick="lnkAddAnother_Click"></asp:LinkButton>
                </asp:View>
                <asp:View ID="ViewError" runat="server">
                    <p>
                        Error occured adding expanse<br />
                        Please wait<br />
                        Redirecting to step one</p>
                </asp:View>
            </asp:MultiView>
        </div>
        <div class="popup_Buttons">
            <asp:Button ID="btnOkay" Text="Done" runat="server" OnClick="btnOkay_Click" />
            <input id="btnCancel" value="Cancel" type="button" onclick="cancel();" />
        </div>
    </div>
    </form>
</body>
</html>
