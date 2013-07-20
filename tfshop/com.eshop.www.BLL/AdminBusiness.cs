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
using System.Collections.Generic;
using System.Text;
using com.eshop.www.DAL;
using com.eshop.www.Model;

namespace com.eshop.www.BLL
{
    public class AdminBusiness
    {
        public bool Add(Admin admin)
        {
            return new AdminDAO().Add(admin);
        }

        public bool Delete(int Id)
        {
            return new AdminDAO().Delete(Id);
        }

        public bool Update(Admin admin)
        {
            return new AdminDAO().Update(admin);
        }
        public bool UpdateState(Admin admin)
        {
            return new AdminDAO().UpdateState(admin);
        }
        public bool UpdatePassword(Admin admin)
        {
            return new AdminDAO().UpdatePassword(admin);
        }
        public bool Validate(Admin admin)
        {
            return new AdminDAO().Validate(admin);
        }
        public bool IsSameUserName(Admin admin)
        {
            return new AdminDAO().IsSameUserName(admin);
        }

        public Admin GetEntity(int Id)
        {
            return new AdminDAO().GetEntity(Id);
        }
        public Admin GetEntityByUserName(string adminName)
        {
            return new AdminDAO().GetEntityByUserName(adminName);
        }

        public DataRecordTable GetList(string fieldList, string orderField, bool orderBy, int pageIndex, int pageSize, string where)
        {
            return new AdminDAO().GetList(fieldList,orderField,orderBy,pageIndex,pageSize,where);
        }
    }
}
