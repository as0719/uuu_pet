using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PetUtility
/// </summary>
public class PetUtility
{
    PetHotelEntities Pets;


    public PetUtility()
    {
        Pets = new PetHotelEntities();
    }
    //public Member GetMember()
    //{
    //    int i = 1;
    //    return PetPet.Members.Where(m => m.CustomerId == i).SingleOrDefault();
    //}


    public List<Pet> GetAllPets()
    {
        return Pets.Pets.ToList();
    }


    public bool searchCus(int id)
    {
        Member member = new Member();
        List<Member> members = Pets.Members.ToList();

        foreach (var item in members)
        {
            if (item.CustomerId == id)
            {
                return true;
                //break;
            }
            
        }
        return false;
    }


    public void AddPet(Pet p)
    {
        Pets.Pets.Add(p);

        Pets.SaveChanges();
    }

    public Pet GetPets(int pets)
    {
        Pet Pet = Pets.Pets.
            Where(p => p.Id == pets).
            SingleOrDefault();

        return Pet;
    }



    public void EditPet(Pet Pet)
    {
        Pets.Entry(Pet).State = System.Data.Entity.EntityState.Modified;

        Pets.SaveChanges();
    }

    public void DeletePet(int r)
    {
        Pet Pet = Pets.Pets.
            Where(p => p.Id == r).
            SingleOrDefault();

        Pets.Pets.Remove(Pet);

        Pets.SaveChanges();
    }



}