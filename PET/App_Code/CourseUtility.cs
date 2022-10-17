using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CourseUtility
/// </summary>
public class CourseUtility
{
    PetHotelEntities PetDB;
    public CourseUtility()
    {
        PetDB = new PetHotelEntities();
    }
    /// <summary>
    /// 全部團體課程,管理用
    /// </summary>
    /// <returns></returns>
    public List<V_GroupCourse> GetGroupCourses()
    {
        return PetDB.V_GroupCourse.ToList();
        //return PetDB.V_GroupCourse.OrderByDescending(g=>g.StartDate).ToList();
    }
    public List<V_GroupCourseActive> GetGroupCourseActive() {
        return PetDB.V_GroupCourseActive.ToList();
    }

    public List<CalendarEvent> GetCourseForCalendar() {
        List<CalendarEvent> eventsList = new List<CalendarEvent>();        
        List<V_GroupCourse> groupCours = GetGroupCourses();
        foreach (V_GroupCourse item in groupCours)
        {
            CalendarEvent calEvent = new CalendarEvent();
            calEvent.id = item.CourseID.ToString();
            calEvent.start = $"{item.StartDate.Replace('/', '-')} {item.StartTime}";
            calEvent.end = $"{item.StartDate.Replace('/', '-')} {item.EndTime}";

            calEvent.title = item.CourseName;
            calEvent.color = "#1221ba";  //填入色碼　
            eventsList.Add(calEvent);
        }

        return eventsList;
    }


    public GroupCours GetGroupCourseByID(int id)
    {
        return PetDB.GroupCourses.Where(g => g.CourseID == id).SingleOrDefault();
    }
    public void AddCourse(GroupCours groupCours)
    {
        PetDB.GroupCourses.Add(groupCours);
        PetDB.SaveChanges();

    }
    public void EditCourse(GroupCours groupCours)
    {
        PetDB.Entry(groupCours).State = System.Data.Entity.EntityState.Modified;
        PetDB.SaveChanges();
    }
    public string DeleteCourse(int id)
    {
        if (ChkGroupCourse(id) == 0)
        {
            GroupCours groupCours = PetDB.GroupCourses.Where(g => g.CourseID == id).SingleOrDefault();
            if (groupCours != null)
            {
                PetDB.GroupCourses.Remove(groupCours);
                PetDB.SaveChanges();
                return "";
            }
        }
        return "已有報名";
    }

    /// <summary>
    /// 檢查是否已有人報名
    /// </summary>
    /// <param name="id">團體課程id</param>
    /// <returns></returns>
    public int ChkGroupCourse(int id)
    {
        return PetDB.CourseRegistrations.Count(g => g.CourseID == id);
    }
    public void AddCourseRegister(CourseRegistration courseRegistration)
    {
        PetDB.CourseRegistrations.Add(courseRegistration);
        PetDB.SaveChanges();
    }

    /// <summary>
    /// 判斷上課人數是否已滿
    /// </summary>
    /// <param name="id"></param>
    /// <returns>true:上課人數已滿</returns>
    public bool chkPraticeCourseMax(int id)
    {
        List<CourseRegistration> courseRegistrations = PetDB.CourseRegistrations.
            Where(r => r.CourseID == id).ToList();

        GroupCours groupCours = PetDB.GroupCourses.Where(g => g.CourseID == id).SingleOrDefault();
        int intPer = courseRegistrations.Sum(r => r.JoinPeopleNumber).GetValueOrDefault(0);
        int intPet = courseRegistrations.Sum(r => r.JoinPetNumber).GetValueOrDefault(0);

        return (intPer >= groupCours.MaximumPeople || intPet >= groupCours.MaximumPet);
    }

    public List<V_CourseRegistrations> GetAllCourseRegistrations() {
        return PetDB.V_CourseRegistrations.ToList();
    }

    public List<V_CourseRegistrations> GetCourseRegistrationsByID(int id) {
       return PetDB.V_CourseRegistrations.Where(c => c.CourseID == id).ToList();

    }

    public void DeleteCourseRegistrationsByID(int id) {
       CourseRegistration courseRegistration= PetDB.CourseRegistrations.
            Where(c => c.CourseRegisterID == id).SingleOrDefault();
        PetDB.CourseRegistrations.Remove(courseRegistration);
        PetDB.SaveChanges();
    }

    /// <summary>
    /// 判斷上課人數是否已滿
    /// </summary>
    /// <param name="id"></param>
    /// <param name="Person"></param>
    /// <param name="Pet"></param>
    /// <returns>true:上課人數已滿</returns>
    public bool chkPraticeCourseMax(int id, int Person, int Pet)
    {
        List<CourseRegistration> courseRegistrations = PetDB.CourseRegistrations.
                Where(r => r.CourseID == id).ToList();

        GroupCours groupCours = PetDB.GroupCourses.Where(g => g.CourseID == id).SingleOrDefault();
        int intPer = courseRegistrations.Sum(r => r.JoinPeopleNumber).GetValueOrDefault(0);
        int intPet = courseRegistrations.Sum(r => r.JoinPetNumber).GetValueOrDefault(0);

        return ((intPer + Person) > groupCours.MaximumPeople) || ((intPet + Pet) > groupCours.MaximumPet);
    }

    public void AddInquiryForm(InquiryForm inquiryForm)
    {              
        PetDB.InquiryForms.Add(inquiryForm);
        PetDB.SaveChanges();
    }

    public List<InquiryForm> GetAllinquiryForms() {
        return PetDB.InquiryForms.ToList();
    }

    public InquiryForm GetInquiryFormByID(int id) {
        return PetDB.InquiryForms.Where(f => f.FormNo == id).SingleOrDefault();
    }

    public void EditInquiryForm(InquiryForm inquiryForm) {
        PetDB.Entry(inquiryForm).State = System.Data.Entity.EntityState.Modified;
        PetDB.SaveChanges();
    }

    public void DelInquiryForm(int id) {
        InquiryForm inquiry = GetInquiryFormByID(id);
        PetDB.InquiryForms.Remove(inquiry);
        PetDB.SaveChanges();
    }

}

