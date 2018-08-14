﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InnerPage.aspx.cs" Inherits="ExpanseExample.InnerPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>

    <script language="javascript" type="text/javascript">
        function okay() {
            window.parent.document.getElementById('btnOkay').click();
        }
        function cancel() {
            window.parent.document.getElementById('btnCancel').click();
        }
    </script>

</head>
<body style="margin: 0px; padding: 0px;">
    <form id="form1" runat="server">
    <div class="popup_Container">
        <div class="popup_Titlebar" id="PopupHeader">
            <div class="TitlebarLeft">
                Iframe content header
            </div>
            <div class="TitlebarRight" onclick="cancel();">
            </div>
        </div>
        <div class="popup_Body">
            <p>page content will go here</p>
        </div>
        <div class="popup_Buttons">
            <input id="btnOkay" value="Done" type="button" runat="server" onclick="okay();" />
            <input id="btnCancel" value="Cancel" type="button" onclick="cancel();" />
        </div>
    </div>
    </form>
</body>
