<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFrameExample.aspx.cs"
    Inherits="ExpanseExample.IFrameExample" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="min-height: 700px;">
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Button ID="Button1" runat="server" Text="Click here to show iframe in modalpopup" />
        <cc1:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="ModalPopupBG"
            runat="server" CancelControlID="btnCancel" OkControlID="btnOkay" TargetControlID="Button1"
            PopupControlID="Panel1" Drag="true" PopupDragHandleControlID="PopupHeader">
        </cc1:ModalPopupExtender>
        <div id="Panel1" style="display: none;" class="popupConfirmation">
            <iframe id="frameeditexpanse" frameborder="0" src="InnerPage.aspx" height="161">
            </iframe>
            <div class="popup_Buttons" style="display: none">
                <input id="btnOkay" value="Done" type="button" />
                <input id="btnCancel" value="Cancel" type="button" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
