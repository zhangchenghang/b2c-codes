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
using com.eshop.www.Model;
using com.eshop.www.BLL;
using com.eshop.www.Tools;

public partial class modify_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IsLogin();
            DataRead();
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
    private void DataRead()
    {
        HttpCookie userName = Request.Cookies[Cookie.UserNameCookieName];
        Member member = new MemberBusiness().GetEntityByUserName(userName.Value);
        txtUserName.Text = member.UserName;
        txtEmail.Text = member.Email;
        txtMobile.Text = member.Mobile;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text.Trim();
        string mobile = txtMobile.Text.Trim();
        string email = txtEmail.Text.Trim();
        if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(email))
            return;

        MemberBusiness memberBusiness = new MemberBusiness();
        HttpCookie cookie = Request.Cookies[Cookie.UserNameCookieName];
        Member member = memberBusiness.GetEntityByUserName(cookie.Value);

        if (member.UserName != userName)
        {
            bool isSame = memberBusiness.IsSameUserName(userName);
            if (isSame)
            {
                JavascriptHelper.Alert("有相同的用户名,请换一个用户名");
                return;
            }
            cookie.Value = userName;
            Response.Cookies.Add(cookie);
            new ProductCommentBusiness().UpdateUserName(userName,member.UserName);

        }
        if (member.Email != email)
        {
            bool isSame = memberBusiness.IsSameEmail(email);
            if (isSame)
            {
                JavascriptHelper.Alert("已经存在相同的电子邮箱,请换一个电子邮箱");
                return;
            }
        }

        member.UserName = userName;
        member.Email = email;
        member.Mobile = mobile;
        bool isSuccess = memberBusiness.Update(member);
        if (isSuccess)
        {
            JavascriptHelper.AlertAndRedirect("修改个人信息成功","my_profile.aspx");
        }

    }
}
