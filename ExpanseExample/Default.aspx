<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExpanseExample._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script language="javascript" type="text/javascript">
    function ShowEditModal(ExpanseID) {
        var frame = $get('IframeEdit');
        frame.src = "EditExpanse.aspx?UIMODE=EDIT&EID=" + ExpanseID;
        $find('EditModalPopup').show();
    }
    function EditCancelScript() {
        var frame = $get('IframeEdit');
        frame.src = "DemoLoading.aspx";
    }
    function EditOkayScript() {
        RefreshDataGrid();
        EditCancelScript();
    }
    function RefreshDataGrid() {
        $get('btnSearch').click();
    }
    function NewExpanseOkay() {
        $get('btnSearch').click();
    }
</script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="Container">
        <br />
        <h2>
            Expanse Tracker</h2>
        <div class="ToolBar">
            <asp:Button ID="btnAddNew" runat="server" Text="New Expanse" />
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="ModalPopupBG"
                runat="server" CancelControlID="btnCancel" OkControlID="btnOkay" TargetControlID="btnAddNew"
                PopupControlID="Panel1" Drag="true" PopupDragHandleControlID="PopupHeader" OnOkScript="NewExpanseOkay();">
            </cc1:ModalPopupExtender>
            <div class="popup_Buttons" style="display: none">
                <input id="btnOkay" value="Done" type="button" />
                <input id="btnCancel" value="Cancel" type="button" />
            </div>
            <div id="Panel1" style="display: none;" class="popupConfirmation">
                <iframe id="frameeditexpanse" frameborder="0" src="EditExpanse.aspx" height="203"
                    scrolling="no"></iframe>
            </div>
            <asp:Button ID="btnSearch" runat="server" Text="ReloadGrid" 
                onclick="btnSearch_Click"/>
        </div>
        <div class="GridContainer">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataKeyNames="ID" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None"
                        ShowFooter="True" Width="100%" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound"
                        OnRowCommand="GridView1_RowCommand" 
                        onpageindexchanging="GridView1_PageIndexChanging">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount">
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName=""
                                        Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="MyDelete" Text="Delete"></asp:LinkButton>
                                    <cc1:ModalPopupExtender BackgroundCssClass="ModalPopupBG" ID="lnkDelete_ModalPopupExtender"
                                        runat="server" TargetControlID="lnkDelete" PopupControlID="DivDeleteConfirmation"
                                        OkControlID="ButtonDeleleOkay" CancelControlID="ButtonDeleteCancel">
                                    </cc1:ModalPopupExtender>
                                    <cc1:ConfirmButtonExtender ID="lnkDelete_ConfirmButtonExtender" runat="server" Enabled="True"
                                        TargetControlID="lnkDelete" DisplayModalPopupID="lnkDelete_ModalPopupExtender">
                                    </cc1:ConfirmButtonExtender>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ExpanseExample.ExpanseClassesDataContext"
                        TableName="Expanses" OrderBy="ID desc">
                    </asp:LinqDataSource>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <%--this is the modal popup for the delete confirmation--%>
    <asp:Panel runat="server" ID="DivDeleteConfirmation" Style="display: none;" class="popupConfirmation">
        <div class="popup_Container">
            <div class="popup_Titlebar" id="PopupHeader">
                <div class="TitlebarLeft">
                    Delete Expanse</div>
                <div class="TitlebarRight" onclick="$get('ButtonDeleteCancel').click();">
                </div>
            </div>
            <div class="popup_Body">
                <p>
                    Are you sure, you want to delete the expanse?
                </p>
            </div>
            <div class="popup_Buttons">
                <input id="ButtonDeleleOkay" value="Okay" type="button" />
                <input id="ButtonDeleteCancel" value="Cancel" type="button" />
            </div>
        </div>
    </asp:Panel>
    <%--this is the html code for edit window--%>
<asp:Button ID="ButtonEdit" runat="server" Text="Edit Expanse" style="display:none" />
<cc1:ModalPopupExtender ID="ModalPopupExtender2" BackgroundCssClass="ModalPopupBG"
    runat="server" CancelControlID="ButtonEditCancel" OkControlID="ButtonEditDone" 
    TargetControlID="ButtonEdit" PopupControlID="DivEditWindow" 
    OnCancelScript="EditCancelScript();" OnOkScript="EditOkayScript();"
    BehaviorID="EditModalPopup">
</cc1:ModalPopupExtender>
<div class="popup_Buttons" style="display: none">
    <input id="ButtonEditDone" value="Done" type="button" />
    <input id="ButtonEditCancel" value="Cancel" type="button" />
</div>
<div id="DivEditWindow" style="display: none;" class="popupConfirmation">
    <iframe id="IframeEdit" frameborder="0" height="203" scrolling="no">
    </iframe>
</div>
    </form>
</body>
</html>
