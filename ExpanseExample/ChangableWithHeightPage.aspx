<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangableWithHeightPage.aspx.cs"
    Inherits="ExpanseExample.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script language="javascript" type="text/javascript">
        function pageLoad() {
            window.parent.document.getElementById('JustForTest').click();
        }
        function okay() {
            window.parent.document.getElementById('btnOkay').click();
        }
        function cancel() {
            window.parent.document.getElementById('btnCancel').click();
        }
    </script>

</head>
<body style="margin: 0px; padding: 0px;">
    <form id="form2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="popup_Container" id="Panel1">
        <div class="popup_Titlebar" id="PopupHeader">
            <div class="TitlebarLeft">
                Iframe content header
            </div>
            <div class="TitlebarRight" onclick="cancel();">
            </div>
        </div>
        <div class="popup_Body">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="SmallContent" runat="server" Text="Small Conetent" OnClick="SmallContent_Click" /><asp:Button
                        ID="Button3" runat="server" Text="Big content" OnClick="Button3_Click" />
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View1" runat="server">
                            <div id="Content" style="height: 100px; width: 200px;">
                                This view have small content
                            </div>
                        </asp:View>
                        <asp:View  ID="View2" runat="server">
                            <div id="Content" style="height: 200px; width: 400px;">
                                This view have a big content</div>
                        </asp:View>
                    </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="popup_Buttons">
            <input id="btnOkay" value="Done" type="button" runat="server" onclick="okay();" />
            <input id="btnCancel" value="Cancel" type="button" onclick="cancel();" />
        </div>
    </div>
    </form>
</body>
</html>
