using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DiscountUtility
/// </summary>
public class DiscountUtility
{
    PetHotelEntities PetHotelEntities;


    public DiscountUtility()
    {
        PetHotelEntities = new PetHotelEntities();
    }

    public List<MallDiscountCode> GetAllDiscounts()
    {
        return PetHotelEntities.MallDiscountCodes.ToList();
    }

    public MallDiscountCode GetDiscountCode(int id, string discountcount) //給id改資料
    {
        MallDiscountCode discount = PetHotelEntities.MallDiscountCodes.Where(p => discountcount == p.DiscountCode && id == p.No)
            .SingleOrDefault(); //不可以用Single會報錯

        return discount;
    }

    public void DiscountAdd(MallDiscountCode d)
    {
        PetHotelEntities.MallDiscountCodes.Add(d);

        PetHotelEntities.SaveChanges();
    }

    public void DiscountEdit(MallDiscountCode d)
    {
        PetHotelEntities.Entry(d).State = System.Data.Entity.EntityState.Modified;
        PetHotelEntities.SaveChanges();
    }

    public void DiscountDelete(int id)
    {
        MallDiscountCode discountCode = PetHotelEntities.MallDiscountCodes.Where(d => id == d.No).SingleOrDefault(); //不可以用Single會報錯
        PetHotelEntities.MallDiscountCodes.Remove(discountCode);
        PetHotelEntities.SaveChanges();
    }


}