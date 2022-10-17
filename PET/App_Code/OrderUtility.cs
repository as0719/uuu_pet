using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderUtility
/// </summary>
public class OrderUtility
{
    PetHotelEntities petHotelEntities;

    public OrderUtility()
    {
        petHotelEntities = new PetHotelEntities();
    }

    public List<MallOrder> GettAllOrders()
    {
        return petHotelEntities.MallOrders.ToList();
    }

    public MallOrder GetOrder(int id) //給id改資料
    {
        MallOrder order = petHotelEntities.MallOrders.Where(p => id == p.OrderNumber)
            .SingleOrDefault(); //不可以用Single會報錯

        return order;
    }

    //因為一個Order會有很多條Detail所以一定要用List
    public List<MallOrdersDetail> GetOrderDetail(int id)
    {
        return petHotelEntities.MallOrdersDetails.Where(m => m.OrderNumber == id).ToList();
    }



    public void OrderAdd(MallOrder m)
    {
        petHotelEntities.MallOrders.Add(m);

        petHotelEntities.SaveChanges();
    }

    public void OrderDetailAdd(List<MallOrdersDetail> md)
    {
        foreach (MallOrdersDetail item in md)
        {
            petHotelEntities.MallOrdersDetails.Add(item);

        }
        petHotelEntities.SaveChanges();


    }
    public void OrderEdit(MallOrder mo)
    {
        petHotelEntities.Entry(mo).State = System.Data.Entity.EntityState.Modified;
        petHotelEntities.SaveChanges();
    }

    public void OrderDetailEdit(List<MallOrdersDetail> mod_list)
    {
        foreach (var item in mod_list)
        {
            petHotelEntities.Entry(item).State = System.Data.Entity.EntityState.Modified;
        }

        petHotelEntities.SaveChanges();
    }

    //public List<V_MallOrderDetails> GetMallOrderDetails_V()
    //{
    //    return petHotelEntities.V_MallOrderDetails.ToList();
    //}

}