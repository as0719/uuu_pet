using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MemberUtility 的摘要描述
/// </summary>
public class MemberUtility
{
    PetHotelEntities PetDB;
    public MemberUtility()
    {
        PetDB = new PetHotelEntities();
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<V_Members> GetAllMembers()
    {
        return PetDB.V_Members.ToList(); ;

    }

    public V_Members GetMemberById(int id) {
       return PetDB.V_Members.Where(m => m.CustomerId == id).FirstOrDefault();
    }

    public Member GetMembersByID(int id) {
        return PetDB.Members.Where(m => m.CustomerId == id).FirstOrDefault();
    }

    public int AddMember(Member m)
    {
        PetDB.Members.Add(m);
        PetDB.SaveChanges();
        return m.CustomerId;
    }

    public Member ChkMember(string email, string password) {

        Member member = PetDB.Members.Where(
            m => m.Email == email).FirstOrDefault();
        if (member == null)
        {
            return null;
        }
        else {
            if (member.Password == password)
            {
                return member;
            }
            else
            {
                return null;
            }
        }
        
    }

    public Member CheckMemberNameMail(string MemberName, string Email) {
        return PetDB.Members.Where(
            m => m.CustomerName == MemberName && m.Email == Email).
            FirstOrDefault();
    }

    public void EditMember(Member m) {
        //所有的修改，如會員自行修改密碼、後台改資料
        PetDB.Entry(m).State = System.Data.Entity.EntityState.Modified;
        PetDB.SaveChanges();
    }

}