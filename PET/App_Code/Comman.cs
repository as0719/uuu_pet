using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Mail;

/// <summary>
/// Comman 的摘要描述
/// </summary>
public class Comman
{
    public Comman()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //註冊通知信
    public static void SendRegisterMail(string usermail,string username) {
        MailMessage msg = new MailMessage("nsx336@msn.com", usermail);
        string siteUrl = $"http://{HttpContext.Current.Request.Url.Authority}/f_Index.aspx";
        string mailBody = $"親愛的會員{username}，您的註冊已完成<br><br><a href='{siteUrl}' target='_blank'>PetLover網站</a>歡迎您!! ";

        msg.Subject = "註冊通知信";
        msg.Body = mailBody;
        msg.BodyEncoding = System.Text.Encoding.Unicode;
        msg.IsBodyHtml = true;

        SmtpClient client = new SmtpClient("smtp-mail.outlook.com", 587);
        System.Net.NetworkCredential credential = new System.Net.NetworkCredential("nsx336@msn.com", "bjqs01)&");        
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = credential;

        client.Send(msg);
        client.Dispose();
    }


    public static void SendEmpPwdMail(Employee employee)
    {
        
        MailMessage msg = new MailMessage("nsx336@msn.com", employee.Email);
        string siteUrl = $"http://{HttpContext.Current.Request.Url.Authority}/b_00Main/b_Login.aspx";
        Comman comman = new Comman();
        string genPwd = comman.GenRenderText();

        employee.EmployeePwd = genPwd;
        EmployeeUtility utility = new EmployeeUtility();
        utility.EditEmployee(employee);

        string mailBody = $"親愛的同仁{employee.EmployeeName}，已收到您重新提供密碼的請求<br>新的密碼：{genPwd}<br><br><br>請登入後變更您的密碼<br><br><br>如有疑問請聯絡客服人員<br><a href='{siteUrl}' target='_blank'>PetLover網站</a>竭誠為您服務 ";
        msg.Subject = "員工密碼變更通知信";
        msg.Body = mailBody;
        msg.BodyEncoding = System.Text.Encoding.Unicode;
        msg.IsBodyHtml = true;


        SmtpClient client = new SmtpClient("smtp-mail.outlook.com", 587);
        System.Net.NetworkCredential credential = new System.Net.NetworkCredential("nsx336@msn.com", "bjqs01)&");        
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = credential;

        client.Send(msg);
        client.Dispose();
    }

    public static void SendCustPwdMail(Member member)
    {

        MailMessage msg = new MailMessage("nsx336@msn.com", member.Email);
        string siteUrl = $"http://{HttpContext.Current.Request.Url.Authority}/f_Index.aspx";
        Comman comman = new Comman();
        string genPwd = comman.GenRenderText();

        //member.Password = genPwd;
        MemberUtility utility = new MemberUtility();

        Member modifyMemebr = utility.GetMembersByID(member.CustomerId);
        modifyMemebr.Password = genPwd;

        utility.EditMember(modifyMemebr);

        string mailBody = $"親愛的會員{member.CustomerName}，已收到您重新提供密碼的請求<br>新的密碼：{genPwd}<br><br><br>請登入後變更您的密碼<br><br><br>如有疑問請聯絡客服人員<br><a href='{siteUrl}' target='_blank'>PetLover網站</a>竭誠為您服務 ";
        msg.Subject = "會員密碼變更通知信";
        msg.Body = mailBody;
        msg.BodyEncoding = System.Text.Encoding.Unicode;
        msg.IsBodyHtml = true;


        SmtpClient client = new SmtpClient("smtp-mail.outlook.com", 587);
        System.Net.NetworkCredential credential = new System.Net.NetworkCredential("nsx336@msn.com", "bjqs01)&");        
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = credential;

        client.Send(msg);
        client.Dispose();
    }

    //亂數物件
    Random rnd = new Random(DateTime.Now.Millisecond);
    private string GenRenderText(int chars = 4)
    {
        string code = "12346789ABCDEFGHKLMNPQRTWXYZ@#$%&";
        // 設定預設圖片文字
        string RenderText = "";

        for (int i = 1; i <= chars; i++)
        {
            RenderText += code[rnd.Next(0, code.Length)];
        }
        return RenderText;
    }
    //去機密性文字
    public string StringByOO(string source) {
        string result = "";
        for (int i = 0; i < source.Length; i++)
        {
            if (i == 0 || i == (source.Length - 1))
            {
                if (i == 1)
                {
                    result += "O";
                }
                else {
                    result += source[i];
                }
                
            }
            else {
                result += "O";
            }
        }

        return result;
    }
}
