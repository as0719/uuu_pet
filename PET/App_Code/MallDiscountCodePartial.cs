using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MallDiscountCodePartial
/// </summary>
public partial class MallDiscountCode
{
    public string Status
    {
        get
        {
            if (DateTime.ParseExact(this.EndDate, "yyyyMMdd", CultureInfo.InvariantCulture) < DateTime.Now.Date)
            //if (Convert.ToDateTime(this.StartDate) > DateTime.Now)
            {
                return "已過期";
            }

            else if ((DateTime.ParseExact(this.StartDate, "yyyyMMdd", CultureInfo.InvariantCulture) <= DateTime.Now.Date ) 
                    & (DateTime.ParseExact(this.EndDate, "yyyyMMdd", CultureInfo.InvariantCulture) >= DateTime.Now.Date))
            {
                return "使用中";
            }

            else if (DateTime.ParseExact(this.StartDate, "yyyyMMdd", CultureInfo.InvariantCulture) > DateTime.Now.Date)
            {
                return "待生效";
            }

            return "";
        }
    }
}
