using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductUtility
/// </summary>
public class ProductUtility
{
    PetHotelEntities PetHotelEntities;


    public ProductUtility()
    {
        PetHotelEntities = new PetHotelEntities();
    }

    public List<MallProduct> GetAllProducts()
    {
        return PetHotelEntities.MallProducts.ToList();
    }


    //public v_MallProduct v_GetProduct(string id) //給id改資料
    //{
    //    v_MallProduct product = PetHotelEntities.v_MallProduct.Where(p => id == p.ProductID)
    //        .SingleOrDefault(); //不可以用Single會報錯

    //    return product;
    //}

    public MallProduct GetProduct(string id) //給id改資料
    {
        MallProduct product = PetHotelEntities.MallProducts.Where(p => id == p.ProductID)
            .SingleOrDefault(); //不可以用Single會報錯

        return product;
    }


    public MallProduct GetProductCate(string cate)
    {
        MallProduct product = PetHotelEntities.MallProducts.Where(p => cate == p.Category)
            .SingleOrDefault();

        return product;
    }


    public List<MallProduct> GetAllProducts_cate(string cate)
    {
        List<MallProduct> mallProducts = PetHotelEntities.MallProducts.ToList();
        List<MallProduct> outMallProducts = new List<MallProduct>();
        foreach (var item in mallProducts)
        {
            if (item.Category == cate)
            {
                outMallProducts.Add(item);
            }
        }
        return outMallProducts;
    }




    public void ProductAdd(MallProduct p)
    {
        PetHotelEntities.MallProducts.Add(p);

        PetHotelEntities.SaveChanges();
    }


    public void ProductEdit(MallProduct p)
    {
        PetHotelEntities.Entry(p).State = System.Data.Entity.EntityState.Modified;
        PetHotelEntities.SaveChanges();
    }

    public void ProductDelete(string id)
    {
        MallProduct product = PetHotelEntities.MallProducts.Where(p => id == p.ProductID).SingleOrDefault(); //不可以用Single會報錯
        PetHotelEntities.MallProducts.Remove(product);
        PetHotelEntities.SaveChanges();
    }

    public void ProductEditStock(string id, int stock)
    {
        MallProduct product = PetHotelEntities.MallProducts.Where(p => id == p.ProductID).SingleOrDefault(); //不可以用Single會報錯
        product.Stock = product.Stock - stock;
        PetHotelEntities.SaveChanges();
    }

}