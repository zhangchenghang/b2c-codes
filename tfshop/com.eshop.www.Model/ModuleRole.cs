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
using System.Linq;
using System.Text;

namespace com.eshop.www.Model
{
    public class ModuleRole
    {
        /// <summary>
        /// ID号
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Module Id号
        /// </summary>
        public int ModuleId { get; set; }
        /// <summary>
        /// 那一个角色Id号
        /// </summary>
        public int RoleId { get; set; }
    }
}
