<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using System.Linq;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    [WebMethod]
    public V_Permission GetPermissionByTitle(int permissionId)
    {
        EmployeeUtility utility = new EmployeeUtility();
        return utility.GetPermissionByTitle(permissionId);
    }

    [WebMethod]
    public List<V_JobTitle> GetJobTitles()
    {
        EmployeeUtility utility = new EmployeeUtility();
        return utility.GetJobTitles();
    }

    [WebMethod]
    public V_Employees GetEmployeeById(string eid)
    {
        EmployeeUtility utility = new EmployeeUtility();
        return utility.GetEmployeebyId(eid);
    }

    [WebMethod]
    public List<V_Members> GelAllMember()
    {
        MemberUtility utility = new MemberUtility();
        return utility.GetAllMembers();
    }




    //[WebMethod]
    //public V_Members GetMemberByID(int id)
    //{
    //    MemberUtility utility = new MemberUtility();
    //    return utility.GetMemberById(id);
    //}

    [WebMethod]
    public void insertMember(V_Members vmember)
    {
        PetHotelEntities db = new PetHotelEntities();
        Member member = new Member
        {
            CustomerName = vmember.CustomerName,
            Email = vmember.Email,
            Phone = vmember.Phone,
            Remark = vmember.Remark
        };
        db.Members.Add(member);
        db.SaveChanges();

    }
    [WebMethod]
    public void updateMember(V_Members vmember)
    {
        PetHotelEntities db = new PetHotelEntities();
        Member member = db.Members.Find(vmember.CustomerId);
        member.CustomerName = vmember.CustomerName;
        member.Email = vmember.Email;
        member.Phone = vmember.Phone;
        member.Remark = vmember.Remark;

        db.Entry(member).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }



    //取訓練師id,名稱
    [WebMethod]
    public List<V_EmpTrainer> GetTrainers()
    {
        EmployeeUtility utility = new EmployeeUtility();
        return utility.GetTrainers();
    }

    /// <summary>
    /// 取所有訓練師資料
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public List<V_Trainer> GetTrainersDetail()
    {
        EmployeeUtility utility = new EmployeeUtility();
        return utility.GetTrainersDetail();
    }

    [WebMethod]
    public List<V_GroupCourse> GetGroupCourses()
    {
        CourseUtility utility = new CourseUtility();
        return utility.GetGroupCourses();
    }
    [WebMethod]
    public List<V_GroupCourseActive> GetGroupCourseActives()
    {
        CourseUtility utility = new CourseUtility();
        return utility.GetGroupCourseActive();
    }
    /// <summary>
    /// 檢查是否已有人報名，無人報名課程才能刪除
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [WebMethod]
    public int ChkGroupCourse(int id)
    {
        CourseUtility utility = new CourseUtility();
        return utility.ChkGroupCourse(id);
    }

    /// <summary>
    /// 判斷上課人數是否已滿
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    //[WebMethod]
    //public bool chkPraticeCourseMax(int id)
    //{
    //    CourseUtility utility = new CourseUtility();
    //    return utility.chkPraticeCourseMax(id);
    //}
    [WebMethod]
    public List<InquiryForm> GetAllinquiryForms()
    {
        CourseUtility utility = new CourseUtility();
        return utility.GetAllinquiryForms();
    }

    [WebMethod]
    public List<V_CourseRegistrations> GetCourseRegistrationsByID(int id)
    {
        CourseUtility utility = new CourseUtility();
        return utility.GetCourseRegistrationsByID(id);
    }

    [WebMethod]
    public List<CalendarEvent> GetCourseForCalendar()
    {
        CourseUtility utility = new CourseUtility();
        return utility.GetCourseForCalendar();
    }

    [WebMethod]
    public InquiryForm GetInquiryFormByID(int id)
    {
        CourseUtility utility = new CourseUtility();
        return utility.GetInquiryFormByID(id);
    }

    //===========分頁======================
    [WebMethod]
    public Result GetMemberByPage(int pageSize, int pageIndex)
    {
        //1.Utility
        //2.new NorthwindEntities

        PetHotelEntities db = new PetHotelEntities();

        int totalCount = db.V_Members.Count(); //77

        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<V_Members> members =
                db.V_Members.
                OrderBy(p => p.CustomerId). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new Result()
        {
            TotalCount = totalCount,
            _Members = members
        };
    }
    [WebMethod]
    public Result GeSearchMemberByPage(string keyName, int pageSize, int pageIndex)
    {
        PetHotelEntities db = new PetHotelEntities();


        int totalCount = db.V_Members.Where(m => m.CustomerName.Contains(keyName)).ToList().Count();

        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<V_Members> members =
                db.V_Members.Where(m => m.CustomerName.Contains(keyName)).
                OrderBy(p => p.CustomerId). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new Result()
        {
            TotalCount = totalCount,
            _Members = members
        };
    }

    [WebMethod]
    public ResultEmployee GetEmployeeByPager(int pid, int pageSize, int pageIndex)
    {
        //1.Utility
        //2.new PetHotelEntities
        PetHotelEntities db = new PetHotelEntities();
        int totalCount;
        if (pid == 0)
        {
            totalCount = db.V_EmployeeWithJobTitle.Count();
        }
        else
        {
            totalCount = db.V_EmployeeWithJobTitle.Where(e => e.PermissionID == pid).ToList().Count();
        }


        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;
        List<V_EmployeeWithJobTitle> employees = null;
        if (pid == 0)
        {
            employees =
            db.V_EmployeeWithJobTitle.
            OrderBy(p => p.EmployeeID). //設定排序欄位
            Skip(skipMembers).//忽略前幾筆
            Take(pageSize).//拿後面幾筆
            ToList();
        }
        else
        {
            employees =
            db.V_EmployeeWithJobTitle.Where(e => e.PermissionID == pid).
            OrderBy(p => p.EmployeeID). //設定排序欄位
            Skip(skipMembers).//忽略前幾筆
            Take(pageSize).//拿後面幾筆
            ToList();
        }


        return new ResultEmployee()
        {
            TotalCount = totalCount,
            _Employees = employees
        };
    }
    [WebMethod]
    public ResultCourseActive GetCourseByPager(int pageSize, int pageIndex)
    {
        //1.Utility
        //2.new PetHotelEntities
        PetHotelEntities db = new PetHotelEntities();

        int totalCount = db.V_GroupCourseActive.Count();

        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<V_GroupCourseActive> courseActives =
                db.V_GroupCourseActive.
                OrderBy(c => c.CourseID). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new ResultCourseActive()
        {
            TotalCount = totalCount,
            _Course = courseActives
        };
    }

    [WebMethod]
    public ResultCourse GetAllCourseByPager(int pageSize, int pageIndex)
    {
        //1.Utility
        //2.new PetHotelEntities
        PetHotelEntities db = new PetHotelEntities();

        int totalCount = db.V_GroupCourse.Count();

        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<V_GroupCourse> course =
                db.V_GroupCourse.
                OrderBy(c => c.CourseID). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new ResultCourse()
        {
            TotalCount = totalCount,
            _Course = course
        };
    }



    [WebMethod]
    public ResultCourseRegistration GetCourseRegistrationsByIDByPager(int id, int pageSize, int pageIndex)
    {
        CourseUtility utility = new CourseUtility();
        int totalCount = utility.GetCourseRegistrationsByID(id).Count;
        PetHotelEntities db = new PetHotelEntities();
        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<V_CourseRegistrations> course =
                db.V_CourseRegistrations.Where(c => c.CourseID == id).
                OrderBy(c => c.CourseID). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new ResultCourseRegistration()
        {
            TotalCount = totalCount,
            _Course = course
        };

    }

    [WebMethod]
    public ResultCourseRegistration GetCourseRegistrationsByPhoneEmailByPager(string phone, string email, int pageSize, int pageIndex)
    {
        CourseUtility utility = new CourseUtility();
        List<V_CourseRegistrations> v = utility.GetAllCourseRegistrations();
        List<V_CourseRegistrations> vList = v.Where(c => c.PhoneNumber == phone && c.Email == email).ToList();
        int totalCount;
        totalCount = vList.Count();
       //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<V_CourseRegistrations> course =
                vList.
                OrderBy(c => c.CourseID). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new ResultCourseRegistration()
        {
            TotalCount = totalCount,
            _Course = course
        };
    }

    [WebMethod]
    public ResultInquiryForm GetInquiryFormByPager(string status, int pageSize, int pageIndex)
    {
        //1.Utility
        //2.new PetHotelEntities
        PetHotelEntities db = new PetHotelEntities();
        int totalCount;
        if (status == "請選擇")
        {
            totalCount = db.InquiryForms.Count();
        }
        else
        {
            totalCount = db.InquiryForms.Where(f => f.Status == status).ToList().Count();
        }
        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;
        List<InquiryForm> course = null;
        if (status == "請選擇")
        {
            course = db.InquiryForms.
            OrderBy(c => c.FormNo). //設定排序欄位
            Skip(skipMembers).//忽略前幾筆
            Take(pageSize).//拿後面幾筆
            ToList();
        }
        else
        {
            course = db.InquiryForms.
                    Where(f => f.Status == status).
                    OrderBy(c => c.FormNo). //設定排序欄位
                    Skip(skipMembers).//忽略前幾筆
                    Take(pageSize).//拿後面幾筆
                    ToList();
        }


        return new ResultInquiryForm()
        {
            TotalCount = totalCount,
            _Course = course
        };
    }

   [WebMethod]
    public ResultInquiryForm GetInquiryFormByPhoneEmailByPager(string phone, string email, int pageSize, int pageIndex)
    {
        CourseUtility utility = new CourseUtility();
        List<InquiryForm> f = utility.GetAllinquiryForms();
        List<InquiryForm> result = f.Where(re => re.Q4 == phone && re.Q7 == email).ToList();
        int totalCount;
        totalCount = result.Count();
       //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<InquiryForm> course =
                result.
                OrderBy(c => c.FormNo). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new ResultInquiryForm()
        {
            TotalCount = totalCount,
            _Course = course
        };
    }

    [WebMethod]
    public ResultTrainer GetTrainerByPager(int pageSize, int pageIndex)
    {
        //1.Utility
        //2.new PetHotelEntities
        PetHotelEntities db = new PetHotelEntities();

        int totalCount = db.V_Trainer.Count();

        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<V_Trainer> trainers =
                db.V_Trainer.
                OrderBy(t => t.EmployeeID). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        return new ResultTrainer()
        {
            TotalCount = totalCount,
            _Trainer = trainers
        };
    }

    [WebMethod]
    public ResultOrder GetMemberOrderByPager(int id, int pageSize, int pageIndex)
    {
        OrderUtility utility = new OrderUtility();
        int totalCount = utility.GettAllOrders().Where(o => o.CustomerId == id).ToList().Count;
        PetHotelEntities db = new PetHotelEntities();
        //要忽略掉的前面幾筆資料
        int skipMembers = (pageIndex - 1) * pageSize;

        List<MallOrder> orders =
                db.MallOrders.Where(o => o.CustomerId == id).
                OrderBy(c => c.OrderNumber). //設定排序欄位
                Skip(skipMembers).//忽略前幾筆
                Take(pageSize).//拿後面幾筆
                ToList();

        List<ListMemberOrder> listMemberOrders = orders.Select(o => new ListMemberOrder()
        {
            OrderNumber = o.OrderNumber,
            CustomerId = o.CustomerId,
            DiscountCode = o.DiscountCode,
            SubTotal = o.SubTotal.GetValueOrDefault(0),
            Total = o.Total.GetValueOrDefault(0),
            OrderDate = o.OrderDate,
            OrderTime = o.OrderTime,
            OrderStatus = o.OrderStatus
        }).ToList();

        return new ResultOrder()
        {
            TotalCount = totalCount,
            _mallOrders = listMemberOrders
        };

    }

    /// <summary>
    /// 依EmployeeID取得訓練師所有資訊
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    //[WebMethod]
    //public V_Trainer GetTrainer(int id)
    //{
    //    EmployeeUtility utility = new EmployeeUtility();
    //    return utility.GetTrainer(id);
    //}

    //[WebMethod]
    //public void deleteMember(V_Members vmember)
    //{
    //    System.IO.File.AppendAllText(
    //        Server.MapPath("deleteList.txt"),
    //        string.Format("Name:{0},Price:{1},DateTime:{2}\r\n",
    //        prod.Name, prod.Price, DateTime.Now));
    //}
}
public class Result
{
    public int TotalCount { get; set; }
    public List<V_Members> _Members { get; set; }
}

public class ResultEmployee
{
    public int TotalCount { get; set; }
    public List<V_EmployeeWithJobTitle> _Employees { get; set; }
}


public class ResultCourseActive
{
    public int TotalCount { get; set; }
    public List<V_GroupCourseActive> _Course { get; set; }
}

public class ResultCourse
{
    public int TotalCount { get; set; }
    public List<V_GroupCourse> _Course { get; set; }
}

public class ResultCourseRegistration
{
    public int TotalCount { get; set; }
    public List<V_CourseRegistrations> _Course { get; set; }
}

public class ResultInquiryForm
{
    public int TotalCount { get; set; }
    public List<InquiryForm> _Course { get; set; }
}

public class ResultTrainer
{
    public int TotalCount { get; set; }
    public List<V_Trainer> _Trainer { get; set; }
}
public class ResultOrder
{
    public int TotalCount { get; set; }
    public List<ListMemberOrder> _mallOrders { get; set; }
}
public class ListMemberOrder
{
    public int OrderNumber { get; set; }
    public int CustomerId { get; set; }
    public string DiscountCode { get; set; }
    public int SubTotal { get; set; }
    public int Total { get; set; }
    public string OrderDate { get; set; }
    public string OrderTime { get; set; }
    public string OrderStatus { get; set; }
}