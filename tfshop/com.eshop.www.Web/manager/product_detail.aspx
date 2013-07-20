<%@ Page Language="C#" MasterPageFile="~/manager/admin.master" AutoEventWireup="true" CodeFile="product_detail.aspx.cs" Inherits="manager_product_detail" Title="��Ʒ����" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="js/validata.field.js" type="text/javascript"></script>
<script src="editor/kindeditor.js" type="text/javascript" charset="utf-8"></script>
<link href="css/detail.css" rel="stylesheet" type="text/css" />  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
var indexNum = $('ul#ul_nav li').index($('#li_product'));
$tabs.tabs('select',indexNum);
$("#product_content_page").css({ "background-image": "url(image/A-dmin-0122.gif)" });
</script>
<div id="content">
    <div id="content_input" style="width:720px;">
    <form id="form1"  action="" runat="server">
        <div id="tip">
        <h2>��Ʒ����</h2>
        <p>��ο��ұߵ���ʾ��������޸��������Ϣ
            </p></div>
        <table id="inputTable" width="100%">
            <tr>
                <td colspan="6" align="right" class="inputTableTd">
                    <asp:Button ID="btnDelete2" runat="server" Text="ɾ��" onclick="btnDelete_Click" OnClientClick="return ask()" />
                    <asp:Button ID="btnReset2" runat="server" Text="����" onclick="btnReset_Click" />
                    <asp:Button ID="btnSave2" runat="server" Text="����" onclick="btnSave_Click" OnClientClick="return validata()" />
                    <asp:Button ID="btnNext2" runat="server" Text="��һ��" onclick="btnNext_Click" />
                    <asp:Button ID="btnPrev2" runat="server" Text="��һ��" onclick="btnPrev_Click" />
                    <asp:Button ID="btnReturn2" runat="server" Text="����" onclick="btnReturn_Click" />&nbsp;
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">
                    ����&nbsp;<font color="red">*</font>
                </td>
                <td class="inputTableTd" colspan="5">
                    <asp:TextBox ID="txtProductName" runat="server" Width="80%"></asp:TextBox>
                </td>
             </tr>
             <tr>   
                <td class="inputTableTd">
                    �����
                </td>
                <td class="inputTableTd" width="150">
                    <asp:TextBox ID="txtOrderBy" runat="server"></asp:TextBox>
                </td>
                <td class="inputTableTd">
                ���
                </td>
                <td class="inputTableTd">
                    <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                </td>
                <td class="inputTableTd">
                ������
                </td>
                <td class="inputTableTd">
                <asp:TextBox ID="txtSaleNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">
                    һ���˵�&nbsp;<font color="red">*</font>
                </td>
                <td class="inputTableTd">
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlCategory_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="inputTableTd">
                    �����˵�
                </td>
                <td class="inputTableTd">
                    <asp:DropDownList ID="ddlSecondCategory" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlSecondCategory_SelectedIndexChanged">
                        <asp:ListItem Value="0">--��ѡ��һ���˵�--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="inputTableTd">
                    �������
                </td>
                <td class="inputTableTd">
                    <asp:DropDownList ID="ddlThirdCategory" runat="server">
                    <asp:ListItem Value="0">--��ѡ������˵�--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">
                     ����Ʒ��
                </td>
                <td class="inputTableTd" colspan="5">
                    <asp:DropDownList ID="ddlBrand" runat="server">
                    <asp:ListItem Value="0">--��ѡ��һ���˵�--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td class="inputTableTd">
                    ��ʾ
                </td>
                <td class="inputTableTd">
                    <asp:CheckBox ID="chkIsShow" runat="server" Text="��ʾ" Checked="true" />
                </td>
                <td class="inputTableTd">
                    �Ƽ�
                </td>
                <td class="inputTableTd">
                    <asp:CheckBox ID="chkIsRecomment" runat="server" Text="�Ƽ�" />
                </td>
                <td class="inputTableTd">
                    ����
                </td>
                <td class="inputTableTd">
                    <asp:CheckBox ID="chkIsComment" runat="server" Text="��������" Checked="true" />
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">
                    ����
                </td>
                <td class="inputTableTd">
                    <asp:CheckBox ID="chkIsHot" runat="server" Text="������Ʒ" />
                </td>
                <td class="inputTableTd">
                    ����
                </td>
                <td class="inputTableTd">
                    <asp:CheckBox ID="chkIsNew" runat="server" Text="���²�Ʒ" Checked="true" />
                </td>
                <td class="inputTableTd">
                    �ػ�
                </td>
                <td class="inputTableTd">
                    <asp:CheckBox ID="chkIsDiscount" runat="server" Text="�ػݲ�Ʒ" />
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">
                    ԭ��
                </td>
                <td class="inputTableTd">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td class="inputTableTd">
                    ���ۼ�
                </td>
                <td class="inputTableTd">
                    <asp:TextBox ID="txtSalePrice" runat="server"></asp:TextBox>
                </td>
                <td class="inputTableTd">
                    �ͻ���
                </td>
                <td class="inputTableTd">
                    <asp:TextBox ID="txtIntegral" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">
                    �б�ͼƬ
                </td>
                <td class="inputTableTd" colspan="5" valign="middle">
                    <asp:HiddenField ID="hiddenImage" runat="server" />
                    <asp:HiddenField ID="hiddenImageId" runat="server" />
                    <a runat="server" id="aImageUrl" target="_blank">
                     <asp:Image ID="imgImages" runat="server" Width="50" Height="50" ImageUrl="image/no.jpg" BorderWidth="1" BorderStyle="Solid" /></a>
                     <asp:FileUpload ID="fuUploadList" runat="server" />&nbsp;<asp:Button ID="btnUploadList" runat="server" Text="�ϴ�" onclick="btnUploadList_Click" />
                </td>
            </tr>
            <tr>
                <td  class="inputTableTd">
                    ��ϸҳͼƬ
                </td>
                <td class="inputTableTd" colspan="5">
                    <table id="mytable" width="100%">
                        <tr>
                            <th>���</th>
                            <th>��ϸҳͼƬ</th>
                            <th>��Ӧ�Ŵ�ͼ</th>
                            <th>Ĭ�ϵ�һ��</th>
                            <th>����</th>
                        </tr>
                        <asp:Repeater ID="rProductImage" runat="server" 
                            onitemcommand="rProductImage_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td align="center"><%#Container.ItemIndex+1 %></td>
                                    <td align="center"><a href='/upload-file/images/product/<%#Eval("Image") %>'  target='_blank'><img src='/upload-file/images/product/<%#Eval("Image") %>' width="50" height="50" /></a></td>
                                    <td align="center"><a href='/upload-file/images/product/<%#Eval("ZoomImage") %>'  target='_blank'><img src='/upload-file/images/product/<%#Eval("ZoomImage") %>' width="50" height="50" /></a></td>
                                    <td align="center"><%#bool.Parse(Eval("IsDefault").ToString())?"��":"��" %></td>
                                    <td align="center">
                                        <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("Image") %>' CommandName="delete">ɾ��</asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                    <br />
                    <table width="100%">
                        <tr>
                            <td>��ϸҳͼƬ</td>
                            <td><asp:FileUpload ID="fuDetailImage" runat="server" /></td>
                            <td>�Ŵ�ͼ</td>
                            <td><asp:FileUpload ID="fuDetailZoomImage" runat="server" /></td>
                            <td>Ĭ�ϵ�һ��<asp:CheckBox ID="chkIsDefault" runat="server" /></td>
                            <td><asp:Button ID="btnUploadDetail" runat="server" Text="�ϴ�" 
                                    onclick="btnUploadDetail_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">�ؼ���</td>
                <td colspan="5" class="inputTableTd">
                    <asp:TextBox ID="txtKeywords" runat="server" Width="300"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">ժҪ</td>
                <td colspan="5" class="inputTableTd">
                    <asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" Rows="3" Columns="69"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="inputTableTd">����&nbsp;<font color="red">*</font></td>
                <td colspan="5" class="inputTableTd">
                <textarea id="txtContent"  runat="server" style="width:600px;height:300px;">
                
                </textarea>
                <script type="text/javascript">
                    KE.show({
                            id : '<%=txtContent.ClientID %>',
                            imageUploadJson : '/manager/handler/upload_json.ashx'
                    });
                </script>
                </td>
            </tr>
            
            <tr>
                <td colspan="6" align="right">
                    <asp:Button ID="btnDelete" runat="server" Text="ɾ��" onclick="btnDelete_Click" OnClientClick="return ask()" />
                    <asp:Button ID="btnReset" runat="server" Text="����" onclick="btnReset_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="����" onclick="btnSave_Click" OnClientClick="return validata()" />
                    <asp:Button ID="btnNext" runat="server" Text="��һ��" onclick="btnNext_Click" />
                    <asp:Button ID="btnPrev" runat="server" Text="��һ��" onclick="btnPrev_Click" />
                    <asp:Button ID="btnReturn" runat="server" Text="����" onclick="btnReturn_Click" />&nbsp;
                </td>
            </tr>
        </table>
    </form>
    </div>
    <div id="content_note">
        <h2>����ע������</h2>
        <ul>
            <li>��ɫ*��Ϊ������</li>
            <li>һ������ռ�����ַ�</li>
            <li>��Ʒ�������100���ַ�</li>
            <li>����ű��������֣����Ϊ����������ǰ</li>
            <li style=" height:60px">�ؼ������50���ַ����ж���ؼ��֣�<br />����ã�����</li>
            <li>ժҪ���300���ַ�</li>
            <li>�۸����Ϊ����</li>
            <li>��������������Ҫ���׸���</li>
            <li>���ֱ���Ϊ����</li>
        </ul>    
    </div>
</div>
<script type="text/javascript">
function ask(){
    if(!confirm('ȷ��Ҫɾ����ǰ��¼��'))
        return false;
}
function validata(){
    var productName = $.trim($("#<%=txtProductName.ClientID %>").val());
    var orderBy = $.trim($("#<%=txtOrderBy.ClientID %>").val());
    var category = $("#<%=ddlCategory.ClientID %>").val();
    var keywords = $.trim($("#<%=txtKeywords.ClientID %>").val());
    var summary = $.trim($("#<%=txtSummary.ClientID %>").val());
    var content = KE.html("<%=txtContent.ClientID %>");
    var price = $.trim($("#<%=txtPrice.ClientID %>").val());
    var salePrice = $.trim($("#<%=txtSalePrice.ClientID %>").val());
    var integral = $.trim($("#<%=txtIntegral.ClientID %>").val());
    var saleNumber = $.trim($("#<%=txtSaleNumber.ClientID %>").val());
    var stock = $.trim($("#<%=txtStock.ClientID %>").val());
    if(productName.length==0){
        alert("���������");
        return false;
    }
    if(validataField.getStrLength(productName)>100){
        alert("�����ַ��������ƣ����100���ַ���һ�����������ַ�");
        return false;
    }
    var orderReg = /^\d+$/;
    if(orderBy.length>0){
        if(!orderReg.test(orderBy)){
            alert("����ű���Ϊ����");
            return false;
        }
    }
    if(saleNumber.length>0){
        if(!orderReg.test(saleNumber)){
            alert("����������������");
            return false;
        }
    }
    if(stock.length>0){
        if(!orderReg.test(stock)){
            alert("����������");
            return false;
        }
    }
    if(category=="0"){
        alert("��ѡ������Ŀ¼");
        return false;
    }
    if(validataField.getStrLength(keywords)>50){
        alert("�ؼ����ַ��������ƣ����50���ַ���һ�����������ַ�");
        return false;
    }
    if(validataField.getStrLength(summary)>300){
        alert("ժҪ�ַ��������ƣ����300���ַ���һ�����������ַ�");
        return false;
    }
    if(content.length==0){
        alert("�������Ʒ����");
        return false;
    }
    var priceReg = /^\d+(.)?\d{0,1}/;
    if (price.length > 0 || salePrice.length > 0) {
        if (!priceReg.test(price) || !priceReg.test(salePrice)) {
            alert("�۸�����������");
            return false;
        }
    }
    if (integral.length > 0) {
        if (!orderReg.test(integral)) {
            alert("��������������");
            return false;
        }
    }
}
</script>
</asp:Content>

