using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for PageUtility
/// </summary>
public class PageUtility
{
    PetHotelEntities petHotelEntities;
    public PageUtility()
    {
        petHotelEntities = new PetHotelEntities();
    }

    public int CalcPageCount(int orderNumber, int pageSize)
    {
        int count = petHotelEntities.MallOrders.Count(o => orderNumber == o.OrderNumber);
        int pageCount = (int)Math.Ceiling((double)count / pageSize);
        return pageCount;
    }


    //public int PageNumber
    //{
    //    get
    //    {
    //        if (Sess["PageNumber"] != null)
    //        {
    //            return Convert.ToInt32(ViewState["PageNumber"]);
    //        }
    //        else
    //        {
    //            return 0;
    //        }
    //    }
    //    set { ViewState["PageNumber"] = value; }
    //}

    public void BindRepeater(string query, Repeater rpt1, Repeater rpt2, int PageNum, int pageSize)
    {
        //DataTable dtData = new DataTable();
        //string conString = ConfigurationManager.ConnectionStrings["PetHotelConnectionString"].ConnectionString;
        //SqlConnection sqlCon = new SqlConnection(conString);
        //sqlCon.Open();
        //SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        //SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        //sqlDa.Fill(dtData);
        //sqlCon.Close();

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["PetHotelConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        cmd.CommandText = query;

        //save the result in data table
        DataTable dt = new DataTable();
        ad.SelectCommand = cmd;
        ad.Fill(dt);


        PagedDataSource pgitems = new PagedDataSource();
        DataView dv = new DataView(dt);
        //pdsData.DataSource = dv;
        //pdsData.AllowPaging = true;

        pgitems.DataSource = dv;
        pgitems.AllowPaging = true;
        pgitems.PageSize = pageSize;
        pgitems.CurrentPageIndex = PageNum;

        if (pgitems.PageCount > 1)
        {
            rpt2.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rpt2.DataSource = pages;
            rpt2.DataBind();
        }
        else
        {
            rpt2.Visible = false;
        }

        //Finally, set the datasource of the repeater
        rpt1.DataSource = pgitems;
        rpt1.DataBind();

        //if (ViewState["PageNumber"] != null)
        //    pdsData.CurrentPageIndex = Convert.ToInt32(ViewState["PageNumber"]);
        //else
        //    pdsData.CurrentPageIndex = 0;
        //if (pdsData.PageCount > 1)
        //{
        //    rpt1.Visible = true;
        //    ArrayList alPages = new ArrayList();
        //    for (int i = 1; i <= pdsData.PageCount; i++)
        //        alPages.Add((i).ToString());
        //    rpt2.DataSource = alPages;
        //    rpt2.DataBind();
        //}
        //else
        //{
        //    rpt1.Visible = false;
        //}
        //rpt2.DataSource = pdsData;
        //rpt2.DataBind();
    }





}