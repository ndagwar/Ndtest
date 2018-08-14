<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidatorCalloutInsideModalpopup.aspx.cs"
    Inherits="ExpanseExample.ValidatorCalloutInsideModalpopup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script language="javascript" type="text/javascript">
    function ClearUI() {
        $find("textValidator").hide();
    }
    function IsValid() {
        var textbox = $get("TextBox1");
        if (textbox.value == "") {
            return false;
        }
        else
            return true;
    }
    function ClosePopup() {
        if (IsValid()) {
            $find('modalwithinput').hide();
            alert("You have given your name");
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="min-height: 700px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Button ID="Button1" runat="server" Text="Click here to show the modal" CausesValidation="false"/>
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="ModalPopupBG"
                runat="server" CancelControlID="btnCancel" OnCancelScript="ClearUI();"  TargetControlID="Button1"
                PopupControlID="Panel1" Drag="true" PopupDragHandleControlID="PopupHeader" BehaviorID="modalwithinput">
            </cc1:ModalPopupExtender>
            <div id="Panel1" class="popupConfirmation" style="display: none;">
                <div class="popup_Container">
                    <div class="popup_Titlebar" id="PopupHeader">
                        <div class="TitlebarLeft">
                            Popup Header</div>
                        <div class="TitlebarRight" onclick="$get('btnCancel').click();">
                        </div>
                    </div>
<div class="popup_Body">
    <p>Enter you name:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
        ControlToValidate="TextBox1" runat="server" 
        ErrorMessage="Please Enter your name" 
        SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
        <cc1:ValidatorCalloutExtender 
            ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" 
            BehaviorID="textValidator">
        </cc1:ValidatorCalloutExtender>
    </p>
</div>
                    <div class="popup_Buttons">
                        <asp:Button runat="server" id="btnOkay" Text="Done"  OnClientClick="ClosePopup();"/>
                        <input id="btnCancel" value="Cancel" type="button" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
