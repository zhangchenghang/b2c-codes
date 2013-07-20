﻿//--------------------------------------------------
// 网商宝商城免费开源版 V1.0.110909
// 本程序仅用于学习和研究，不得作为商业用途。
// 如需进行商城运营，请与我公司联系购买商业版本。
//
// 东莞市捷联科技有限公司
// 网址：www.128.com.cn
// QQ：1316108492
// 电话：400-678-1128
//--------------------------------------------------

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using com.eshop.www.BLL;
using com.eshop.www.Model;
using com.eshop.www.Tools;

public partial class publish_comment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IsLogin();
            string productId = Request.QueryString["productId"];
            if (!string.IsNullOrEmpty(productId))
                lProductName.Text = new ProductDetailBusiness().GetEntity(int.Parse(productId)).ProductName;
            Save();
        }
    }
    private void IsLogin()
    {
        HttpCookie userName = Request.Cookies[Cookie.UserNameCookieName];
        HttpCookie isYes = Request.Cookies[Cookie.IsLoginCookieName];
        if (userName == null || userName.Value.Length == 0 || isYes == null || isYes.Value != "yes")
        {
            HttpCookie cookie = new HttpCookie(Cookie.PrevPageCookieName);
            cookie.Value = Request.RawUrl;
            Response.Cookies.Add(cookie);
            Response.Redirect("login.aspx");
        }
    }
    private void Save()
    {
        string xing = Request.Form["AOverall"];
        string comment = Request.Form["AText"];
        if (!string.IsNullOrEmpty(xing) && !string.IsNullOrEmpty(comment))
        {
            HttpCookie userName = Request.Cookies[Cookie.UserNameCookieName];
            ProductComment productComment = new ProductComment();
            productComment.Content = comment;
            productComment.IP = Request.UserHostAddress;
            productComment.IsShow = true;
            productComment.ProductId = int.Parse(Request.QueryString["productId"]);
            productComment.Score = float.Parse(xing);
            productComment.UserName = userName.Value;


            int orderItemId = int.Parse(Request.QueryString["itemId"]);
            ProductCommentBusiness productCommmentBusiness = new ProductCommentBusiness();
            OrderItemBusiness orderItemBusiness = new OrderItemBusiness();

            bool isSuccess = productCommmentBusiness.Add(productComment);
            bool isSuccess2 = orderItemBusiness.UpdateIsComment(true, orderItemId);

            if (isSuccess && isSuccess2)
            {
                JavascriptHelper.AlertAndRedirect("发表评论成功","my_comment.aspx");
            }

        }
    }
}
