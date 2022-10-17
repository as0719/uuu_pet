using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RoomUtility
/// </summary>
public class RoomUtility
{
    PetHotelEntities PetRoom;
    
   
    public RoomUtility()
    {
        PetRoom = new PetHotelEntities();
    }
    public Member GetMember()
    {
        int i = 1;
        return PetRoom.Members.Where(m => m.CustomerId == i).SingleOrDefault();
    }

    public bool IfRoomExist(string type)
    {
        Room room = new Room();
        List<Room> rooms = PetRoom.Rooms.ToList();
        

        foreach (var item in rooms)
        {
            if (item.RoomType == type)
            {
                return true;
                //break;
            }

        }
        return false;
    }

    

    public List<Room> GetAllRooms()
    {
        return PetRoom.Rooms.ToList();
    }

    public List<Rooms> GetRoomByStatus(string status)
    {
        //   return PetRoom.Rooms.Where(s => s.Status == status).ToList();

        return PetRoom.Rooms.Select(s => new Rooms() { 
            RoomType = s.RoomType,
            PetType = s.PetType,
            Price = s.Price,
            Status = s.Status,
            RoomImageUrl= s.RoomImageUrl
        }).Where(s=>s.Status == status).ToList();
    }

    public List<Room> GetRoomByRoomType(string roomtype)
    {
        return PetRoom.Rooms.Where(s => s.RoomType.Contains(roomtype)).ToList();



        //return PetRoom.Rooms.Select(s => new Rooms()
        //{
        //    RoomType = s.RoomType,
        //    PetType = s.PetType,
        //    Price = s.Price,
        //    Status = s.Status,
        //    RoomImageUrl = s.RoomImageUrl
        //}).Where(s => s.RoomType == roomtype).ToList();
    }

    public void AddRoom(Room room)
    {
        PetRoom.Rooms.Add(room);

        PetRoom.SaveChanges();
    }

    public Room GetRooms(string types)
    {
        Room room = PetRoom.Rooms.
            Where(p => p.RoomType == types).
            SingleOrDefault();

        return room;
    }



    public void EditRoom(Room room)
    {
        PetRoom.Entry(room).State = System.Data.Entity.EntityState.Modified;

        PetRoom.SaveChanges();
    }

    public void DeleteRoom(string r)
    {
        Room room = PetRoom.Rooms.
            Where(p => p.RoomType == r).
            SingleOrDefault();

        PetRoom.Rooms.Remove(room);

        PetRoom.SaveChanges();
    }



}