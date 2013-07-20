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
//51aspx.com 下载 http://www.51aspx.com
namespace com.eshop.www.DAL
{
    public class MemberLevelDAO
    {
        public bool Add(MemberLevel memberLevel)
        {
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "insert into member_level(max_integral,min_integral,level_name,discount) values (@max_integral,@min_integral,@level_name,@discount)";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@max_integral", DbType.Int32, memberLevel.MaxIntegral);
            database.AddInParameter(cmd, "@min_integral", DbType.Int32, memberLevel.MinIntegral);
            database.AddInParameter(cmd, "@level_name", DbType.String, memberLevel.LevelName);
            database.AddInParameter(cmd, "@discount", DbType.Decimal, memberLevel.Discount);
            int row = database.ExecuteNonQuery(cmd);
            return row > 0;
        }

        public bool Delete(int Id)
        {
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "delete from member_level where Id=@Id";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@Id", DbType.Int32, Id);
            int row = database.ExecuteNonQuery(cmd);
            return row > 0;
        }

        public bool Update(MemberLevel memberLevel)
        {
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "update member_level set max_integral=@max_integral,min_integral=@min_integral,level_name=@level_name,discount=@discount where Id=@Id";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@max_integral", DbType.Int32, memberLevel.MaxIntegral);
            database.AddInParameter(cmd, "@min_integral", DbType.Int32, memberLevel.MinIntegral);
            database.AddInParameter(cmd, "@level_name", DbType.String, memberLevel.LevelName);
            database.AddInParameter(cmd, "@discount", DbType.Decimal, memberLevel.Discount);
            database.AddInParameter(cmd, "@Id", DbType.Int32, memberLevel.Id);
            int row = database.ExecuteNonQuery(cmd);
            return row > 0;
        }

        public MemberLevel GetEntity(int Id)
        {
            MemberLevel memberLevel = new MemberLevel();
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "select max_integral,min_integral,level_name,discount from member_level where Id=@Id";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@Id", DbType.Int32, Id);
            using (IDataReader reader = database.ExecuteReader(cmd))
            {
                if (reader.Read())
                {
                    memberLevel.Id = Id;
                    memberLevel.MaxIntegral = int.Parse(reader["max_integral"].ToString());
                    memberLevel.MinIntegral = int.Parse(reader["min_integral"].ToString());
                    memberLevel.LevelName = reader["level_name"].ToString();
                    memberLevel.Discount = float.Parse(reader["discount"].ToString());
                }
            }
            return memberLevel;
        }

        public DataRecordTable GetList(string fieldList, string orderField, bool orderBy, int pageIndex, int pageSize, string where)
        {
            DataRecordTable table = new DataRecordTable();
            Database database = DatabaseFactory.CreateDatabase();
            DbCommand cmd = database.GetStoredProcCommand("proc_getpagedata");
            database.AddInParameter(cmd, "@TableName", DbType.String, "member_level");
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
        public MemberLevel GetEntityByIntegral(int integral)
        {
            MemberLevel memberLevel = new MemberLevel();
            Database database = DatabaseFactory.CreateDatabase();
            string sql = "select Id, max_integral,min_integral,level_name,discount from member_level where min_integral<=@integral and max_integral>@integral";
            DbCommand cmd = database.GetSqlStringCommand(sql);
            database.AddInParameter(cmd, "@integral", DbType.Int32, integral);
            using (IDataReader reader = database.ExecuteReader(cmd))
            {
                if (reader.Read())
                {
                    memberLevel.Id = int.Parse(reader["Id"].ToString());
                    memberLevel.MaxIntegral = int.Parse(reader["max_integral"].ToString());
                    memberLevel.MinIntegral = int.Parse(reader["min_integral"].ToString());
                    memberLevel.LevelName = reader["level_name"].ToString();
                    memberLevel.Discount = float.Parse(reader["discount"].ToString());
                }
            }
            return memberLevel;
        }
    }
}
