using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// EmployeeUtility 的摘要描述
/// </summary>
public class EmployeeUtility
{
    PetHotelEntities PetDB;
    public EmployeeUtility()
    {
        PetDB = new PetHotelEntities();
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public int AddPermission(Permission permission)
    {
        PetDB.Permissions.Add(permission);
        return PetDB.SaveChanges();
    }
    public V_Permission GetPermissionByTitle(int permissionId)
    {
        //return PetDB.V_Permissions.Find(permissionId);
        return PetDB.V_Permission.Where(p => p.PermissionID == permissionId).SingleOrDefault();
    }
    public void EditPermmission(Permission permission)
    {
        PetDB.Entry(permission).State = System.Data.Entity.EntityState.Modified;
        PetDB.SaveChanges();
    }
    public List<V_JobTitle> GetJobTitles()
    {
        return PetDB.V_JobTitle.ToList();
    }

    public void AddEmployee(Employee e)
    {
        PetDB.Employees.Add(e);
        PetDB.SaveChanges();
    }

    public Employee CheckEmployee(string Email, string Pwd)
    {
        Employee employee = PetDB.Employees.
             Where(e => e.Email == Email).FirstOrDefault();
        if (employee == null)
        {
            return null;
        }
        if (employee.EmployeePwd == Pwd)
        {
            return employee;
        }
        else
        {
            return null;
        }

    }
    public Employee CheckEmployeeNameMail(string EmpName, string Email)
    {
        return PetDB.Employees.
             Where(e => e.Email == Email && e.EmployeeName == EmpName).
             SingleOrDefault();
    }
    //檢核員工姓名是否重覆
    public Employee CheckEmployeeRepeatByName(string EmpName)
    {
        return PetDB.Employees.
            Where(e => e.EmployeeName == EmpName).SingleOrDefault();
    }
    //檢核員工email是否重覆
    public Employee CheckEmployeeRepeatByEmail(string Email)
    {
        return PetDB.Employees.
            Where(e => e.Email == Email).SingleOrDefault();
    }
    public V_Employees GetEmployeebyId(string eid)
    {
        int id = int.Parse(eid);
        return PetDB.V_Employees.Where(
             emp => emp.EmployeeID == id)
             .SingleOrDefault();
    }
    public Employee GetEmployeebyId(int eid)
    {
        int id = eid;
        return PetDB.Employees.Where(
             emp => emp.EmployeeID == id)
             .SingleOrDefault();
    }
    public void EditEmployee(Employee employee)
    {
        Employee t = PetDB.Employees.Where(e => e.EmployeeID == employee.EmployeeID).SingleOrDefault();
        t.EmployeePwd = employee.EmployeePwd;

        PetDB.Entry(t).State = System.Data.Entity.EntityState.Modified;
        PetDB.SaveChanges();
    }
    public void EditEmployeeData(Employee employee)
    {
        Employee t = PetDB.Employees.Where(e => e.EmployeeID == employee.EmployeeID).SingleOrDefault();
        t.Email = employee.Email;
        t.EmployeeName = employee.EmployeeName;
        t.PermissionID = employee.PermissionID;
        t.StartDate = employee.StartDate;
        t.LeaveDate = employee.LeaveDate;

        PetDB.Entry(t).State = System.Data.Entity.EntityState.Modified;
        PetDB.SaveChanges();
    }
    public List<Employee> GetEmployees()
    {
        return PetDB.Employees.ToList();
    }


    public List<V_EmployeeWithJobTitle> GetAllEmployee()
    {
        return PetDB.V_EmployeeWithJobTitle.ToList();
    }

    public List<V_EmpTrainer> GetTrainers()
    {
        return PetDB.V_EmpTrainer.ToList();
    }

    public List<V_Trainer> GetTrainersDetail()
    {
        return PetDB.V_Trainer.ToList();
    }

    public void AddTrainer(Trainer trainer)
    {
        PetDB.Trainers.Add(trainer);
        PetDB.SaveChanges();
    }

    public V_Trainer GetTrainer(int id)
    {
        return PetDB.V_Trainer.Where(
            t => t.EmployeeID == id).SingleOrDefault();
    }
    public void EditTrainer(Trainer trainer)
    {
        PetDB.Entry(trainer).State = System.Data.Entity.EntityState.Modified;
        PetDB.SaveChanges();
    }
    public void DeleteTrainer(int id)
    {
        Trainer trainer = PetDB.Trainers.Where(t => t.EmployeeID == id).SingleOrDefault();
        PetDB.Trainers.Remove(trainer);
        PetDB.SaveChanges();
    }
}