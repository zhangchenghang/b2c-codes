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
using com.eshop.www.Model;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
namespace com.eshop.www.DAL
{
    public class PageDAO
    {
        public bool Add(Page page)
        {
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "insert into page(page_name,page_file) values (@page_name,@page_file)";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@page_name", DbType.String, page.PageName);
            database.AddInParameter(cmd, "@page_file", DbType.String, page.PageFile);
            int row = database.ExecuteNonQuery(cmd);
            return row > 0;
        }

        public bool Delete(int Id)
        {
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "delete from page where Id=@Id";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@Id", DbType.Int32, Id);
            int row = database.ExecuteNonQuery(cmd);
            return row > 0;
        }

        public bool Update(Page page)
        {
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "update page set page_name=@page_name,page_file=@page_file where Id=@Id";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@page_name", DbType.String, page.PageName);
            database.AddInParameter(cmd, "@page_file", DbType.String, page.PageFile);
            database.AddInParameter(cmd, "@Id", DbType.Int32, page.Id);
            int row = database.ExecuteNonQuery(cmd);
            return row > 0;
        }

        public Page GetEntity(int Id)
        {
            Page page = new Page();
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "select page_name,page_file from page where Id=@Id";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@Id", DbType.Int32, Id);
            using (IDataReader reader = database.ExecuteReader(cmd))
            {
                if (reader.Read())
                {
                    page.Id = Id;
                    page.PageName = reader["page_name"].ToString();
                    page.PageFile = reader["page_file"].ToString();
                }
            }
            return page;
        }

        public DataRecordTable GetList(string fieldList, string orderField, bool orderBy, int pageIndex, int pageSize, string where)
        {
            DataRecordTable table = new DataRecordTable();
            Database database = DatabaseFactory.CreateDatabase();
            DbCommand cmd = database.GetStoredProcCommand("proc_getpagedata");
            database.AddInParameter(cmd, "@TableName", DbType.String, "page");
            database.AddInParameter(cmd, "@FieldList", DbType.String, fieldList);
            database.AddInParameter(cmd, "@PageSize", DbType.Int32, pageSize);
            database.AddInParameter(cmd, "@PageIndex", DbType.Int32, pageIndex);
            database.AddInParameter(cmd, "@OrderField", DbType.String, orderField);
            database.AddInParameter(cmd, "@OrderType", DbType.Boolean, orderBy);
            database.AddInParameter(cmd, "@Where", DbType.String, where);
            database.AddOutParameter(cmd, "@RecordCount", DbType.Int32, 4);
            database.AddOutParameter(cmd, "@PageCount", DbType.Int32, 4);

            DataSet ds = database.ExecuteDataSet(cmd);
            int recordCount = Convert.ToInt32(database.GetParameterValue(cmd, "@RecordCount"));
            int pageCount = Convert.ToInt32(database.GetParameterValue(cmd, "@PageCount"));
            table.Table = ds.Tables[0];
            table.PageSize = pageSize;
            table.PageIndex = pageIndex;
            table.PageCount = pageCount;
            table.RecordCount = recordCount;
            return table;
        }
    }
}
