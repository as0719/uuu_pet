using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;




public class ShoppingItem
{
    public string ProductID { get; set; }
    public string Category { get; set; }
    public string ProductName { get; set; }
    public int Price { get; set; }
    //public string Description { get; set; }
    public string Spec { get; set; }
    public string ImageUrl { get; set; }
    public int Stock { get; set; }
    public int Amount { get; set; }
    public string DiscountCode { get; set; }
    public decimal NumberOfDiscounts { get; set; }

    public int SubTotal
    {
        get //唯讀屬性
        {
            return Price * Amount;
        }
    }
    public int Total
    {
        get //唯讀屬性
        {
            return Price * Amount;
        }
    }
    public int AllSubTotal { get; set; }
    public decimal AllTotal { get; set; }


}