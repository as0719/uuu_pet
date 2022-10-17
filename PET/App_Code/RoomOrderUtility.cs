using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class RoomOrderUtility
{
    PetHotelEntities PetRoom;


    public RoomOrderUtility()
    {
        PetRoom = new PetHotelEntities();
    }
    public Member GetMember()
    {
        int i = 1;
        return PetRoom.Members.Where(m => m.CustomerId == i).SingleOrDefault();
    }
    //public void BookingOrder(Room e)
    //{
    //    PetRoom.Rooms.Add(e);
    //    PetRoom.SaveChanges();
    //    //e.RoomId
    //}

    public List<RoomOrder> GetAllRoomOrders()
    {
        return PetRoom.RoomOrders.ToList();
    }

    public List<RoomOrderDetail> GetAllRoomOrderDetails()
    {
        return PetRoom.RoomOrderDetails.ToList();
    }

    public bool searchCus(int id)
    {
        Member member = new Member();
        List<Member> members = PetRoom.Members.ToList();

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

    public bool IfDateHasSelected(string type, string start, string end)
    {
        Room room = new Room();
        //RoomOrder roomOrder = new RoomOrder();
        List<Room> rooms = PetRoom.Rooms.ToList();

        //轉型checkin checkout日期
        DateTime StartDate = DateTime.ParseExact(start, "yyyy/MM/dd", System.Globalization.CultureInfo.InvariantCulture);
        DateTime EndDate = DateTime.ParseExact(end, "yyyy/MM/dd", System.Globalization.CultureInfo.InvariantCulture);

        RoomOrderUtility roomOrderUtility = new RoomOrderUtility();
        List<RoomOrder> roomOrders = roomOrderUtility.GetAllRoomOrders();

        List<Room> test = new List<Room>();
        foreach (var item in roomOrders)
        {
            if (type == item.RoomType)
            {
                
                //比較輸入的日期跟table內時間
                if (((StartDate > item.CheckOut && EndDate > item.CheckOut)
                    || (StartDate < item.CheckIn && EndDate < item.CheckIn))
                    && (StartDate > DateTime.Now && EndDate > DateTime.Now))
                {
                    return true;
                }
            }
            break;
        }

        return true;
    }
    //public bool IfDateHasSelectedEnd(string type, string end)
    //{
    //    Room room = new Room();
    //    //RoomOrder roomOrder = new RoomOrder();
    //    List<Room> rooms = PetRoom.Rooms.ToList();

    //    //DateTime StartDate = DateTime.ParseExact(start, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
    //    DateTime EndDate = DateTime.ParseExact(end, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);

    //    RoomOrderUtility roomOrderUtility = new RoomOrderUtility();
    //    List<RoomOrder> roomOrders = roomOrderUtility.GetAllRoomOrders();

    //    List<Room> test = new List<Room>();
    //    foreach (var item in roomOrders)
    //    {
    //        if (type == item.RoomType)
    //        {
    //            //轉型checkin checkout日期
    //            //DateTime cki = DateTime.ParseExact(item.CheckIn, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
    //            //DateTime cko = DateTime.ParseExact(item.CheckOut, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);

    //            //比較輸入的日期跟table內時間
    //            if (((EndDate > item.CheckOut) || (EndDate < item.CheckIn)) && (EndDate > DateTime.Now))
    //            {
    //                return true;
    //            }
    //        }
    //        break;
    //    }

    //    return true;
    //}

    public void AddRoomOrderDetails(RoomOrderDetail roomOrderdetail)
    {
        PetRoom.RoomOrderDetails.Add(roomOrderdetail);

        PetRoom.SaveChanges();
    }

    public int AddRoomOrder(RoomOrder roomOrder)
    {
        PetRoom.RoomOrders.Add(roomOrder);

        PetRoom.SaveChanges();

        return roomOrder.RoomOrderId;
    }

    public RoomOrder GetRoomOrder(int o)
    {
        RoomOrder roomOrder = PetRoom.RoomOrders.
            Where(p => p.RoomOrderId == o).
            SingleOrDefault();

        return roomOrder;
    }

    public RoomOrderDetail GetRoomOrderDetail(int o)
    {
        RoomOrderDetail roomOrderDetail = PetRoom.RoomOrderDetails.
            Where(p => p.RoomOrderId == o).FirstOrDefault();

        return roomOrderDetail;
    }

    public void EditRoomOrder(RoomOrder roomOrder)
    {
        PetRoom.Entry(roomOrder).State = System.Data.Entity.EntityState.Modified;

        PetRoom.SaveChanges();
    }

    public void DeleteRoomOrder(int o)
    {
        RoomOrder roomOrder = PetRoom.RoomOrders.
            Where(p => p.RoomOrderId == o).
            SingleOrDefault();

        PetRoom.RoomOrders.Remove(roomOrder);

        PetRoom.SaveChanges();
    }


    public void EditRoomOrderDetail(RoomOrderDetail roomOrderDetail)
    {
        PetRoom.Entry(roomOrderDetail).State = System.Data.Entity.EntityState.Modified;

        PetRoom.SaveChanges();
    }

    public void DeleteRoomOrderDetail(int o)
    {
        RoomOrderDetail roomOrderDetail = PetRoom.RoomOrderDetails.
            Where(p => p.RoomOrderId == o).
            SingleOrDefault();

        PetRoom.RoomOrderDetails.Remove(roomOrderDetail);

        PetRoom.SaveChanges();
    }

    public List<RoomOrderDetail> GetRoom(int id)
    {
        return PetRoom.RoomOrderDetails.Where(s => s.RoomOrderId == id).ToList();
    }

}