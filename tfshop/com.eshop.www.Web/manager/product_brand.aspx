﻿<%@ Page Title="产品品牌" Language="C#" MasterPageFile="~/manager/admin.master" AutoEventWireup="true" CodeFile="product_brand.aspx.cs" Inherits="back_stage_product_brand" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="js/loading-min.js" type="text/javascript"></script>
<script src="js/jquery.bgiframe.min.js" type="text/javascript"></script>
<script src="js/swfobject.js" type="text/javascript"></script>
<script src="js/jquery.uploadify.v2.0.3.js" type="text/javascript"></script>
<script src="js/list.js" type="text/javascript"></script>
<link href="css/uploadify.css" rel="stylesheet" type="text/css" />
<link href="css/list.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#content_left{float:left;clear:left;}
#content_center{float:left;}
.TreeStyle{margin-left:15px; margin-top:10px; font-size:12px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
var indexNum = $('ul#ul_nav li').index($('#li_product'));
$tabs.tabs('select',indexNum);
$("#product_brand_page").css({ "background-image": "url(image/A-dmin-0122.gif)" });
</script>
 <form id="form1"  action="" runat="server">
 <div id="content">   
    <div id="content_left">
             <div  id="LeftTitle">
            
            </div>
        <asp:TreeView ID="TreeView1" runat="server" ImageSet="Msdn" NodeWrap="True" 
                onselectednodechanged="TreeView1_SelectedNodeChanged" CssClass="TreeStyle" 
                ExpandDepth="1" >
                <ParentNodeStyle Font-Bold="False" />
                <HoverNodeStyle Font-Underline="True" BackColor="#CCCCCC" 
                    BorderColor="#888888" />
                <SelectedNodeStyle Font-Underline="False" 
                    HorizontalPadding="3px" VerticalPadding="1px" BackColor="White" 
                    BorderColor="#888888" BorderStyle="Solid" BorderWidth="1px" />
                <NodeStyle Font-Names="Verdana" Font-Size="12px" ForeColor="Black" 
                    HorizontalPadding="5px" NodeSpacing="1px" VerticalPadding="5px"  />
            </asp:TreeView>
    </div>
    <div id="content_center">
    <div id="content_head">
        <ul>
            <li>
                以品牌名搜索:<input type="text" id="txtSearch" /></li><li>
                <input type="button" id="btnSearch" value="" class="btnSearch" />
            </li>
            <li><input type="button" value="" id="btnDisplayAdv" class="btnDisplayAdv" /></li>
            <li><asp:Button ID="btnAdd" runat="server" Text="" onclick="btnAdd_Click" CssClass="btnAdd" /></li>
            <li><asp:Button ID="btnAllDel" runat="server" Text="" 
                    OnClientClick="return ValidataSelect()" onclick="btnAllDel_Click" CssClass="btnAllDel" /></li>
            <li><input type="button" value="" onclick="window.location.reload()" class="btnReload"/></li>
        </ul>
    </div>
    <div id="page">
        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条，共%RecordCount%条记录"
                        CustomInfoTextAlign="Left" FirstPageText="首页" LastPageText="尾页" LayoutType="Table"
                        NextPageText="下一页" PagingButtonLayoutType="Span" PrevPageText="上一页" ShowBoxThreshold="10"
                        ShowCustomInfoSection="Left" SubmitButtonText="Go" TextAfterPageIndexBox="页"
                        TextBeforePageIndexBox="转到" PageSize="10" AlwaysShow="true" ShowPageIndexBox="Always"
                        OnPageChanged="AspNetPager1_PageChanged"></webdiyer:AspNetPager>
    </div>
    <div id="content_body">
        <table id="mytable">
            <asp:Repeater ID="rData" runat="server" onitemcommand="rData_ItemCommand">
                <HeaderTemplate>
                    <tr>
                        <th><input type="checkbox" name="chkAll" id="chkAll" onclick="selectData()" /><label for="chkAll">全选</label></th>
                        <th>序号</th>
                        <th>品牌名</th>
                        <th>排序号</th>
                        <th>是否显示</th>
                        <th>所属目录</th>
                        <th>操作</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:CheckBox ID="chkselect" runat="server" Text="" ToolTip='<%#Eval("Id") %>' /></td>
                        <td><%#Container.ItemIndex+1 %></td>
                        <td><%#Eval("brand_name") %></td>
                        <td><%#Eval("order_by") %></td>
                        <td><%#bool.Parse(Eval("is_show").ToString())?"是":"否"%></td>
                        <td><%#new com.eshop.www.BLL.ProductCategoryBusiness().GetEntity(int.Parse(Eval("category_id").ToString())).CategoryName %></td>
                        <td>
                            <asp:LinkButton ID="btnUpdate" runat="server" Text="修改" CommandName="update" CommandArgument='<%#Eval("Id") %>' />&nbsp;
                            <asp:LinkButton ID="btnDelete" runat="server" Text="删除" CommandName="delete" CommandArgument='<%#Eval("Id") %>' OnClientClick="return ask()" />&nbsp;
                            <asp:LinkButton ID="btnRelate" runat="server" Text="相关产品" CommandName="relate" CommandArgument='<%#Eval("Id") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <div id="page2">
        <webdiyer:AspNetPager ID="AspNetPager2" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条，共%RecordCount%条记录"
                        CustomInfoTextAlign="Left" FirstPageText="首页" LastPageText="尾页" LayoutType="Table"
                        NextPageText="下一页" PagingButtonLayoutType="Span" PrevPageText="上一页" ShowBoxThreshold="10"
                        ShowCustomInfoSection="Left" SubmitButtonText="Go" TextAfterPageIndexBox="页"
                        TextBeforePageIndexBox="转到" PageSize="10" AlwaysShow="true" ShowPageIndexBox="Always"
                        OnPageChanged="AspNetPager2_PageChanged"></webdiyer:AspNetPager>
    </div>
    </div>
   
</div>
<div id="advSearch" title="高级搜索">
    <table>
        <tr>
            <td>品牌名</td>
            <td><input type="text" id="txtBrandName" /></td>
            
        </tr>
        <tr>
            <td>是否显示</td>
            <td>
                <select id="selIsShow">
                    <option value="-1">--请选择--</option>
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="开始搜索" onclick="advSearch()" />
            </td>
        </tr>
    </table>
</div>
</form>
<script type="text/javascript">
$(document).ready(function() {
    $("#advSearch").dialog({ autoOpen: false, zIndex: 100 });

    $("#btnSearch").bind("click", function() {
        var search = $.trim($("#txtSearch").val());
        window.location.href = "product_brand.aspx?brandName=" + search;
    });

    $("#btnDisplayAdv").bind("click", function() {
        $("#advSearch").dialog("open");
    });
});
function advSearch(){
    var brandName = $.trim($("#txtBrandName").val());
    var isShow = $("#selIsShow").val();
    var query="";
    if (brandName.length > 0)
        query += "&brandName=" + brandName;
    if(isShow!=-1)
        query+="&isShow="+isShow;
    if(query.length>0)
        query = query.substring(1);
    window.location.href="product_brand.aspx?"+query;
}
</script>
</asp:Content>

