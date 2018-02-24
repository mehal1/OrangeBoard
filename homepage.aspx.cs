using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Data;
//using Clockwork;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Net;

namespace OrangeBoard
{
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["suidValue"]= txtboxsuid.Text;//store session data to keep track of which student has logged in
            SqlConnection con = new SqlConnection();
            // con.ConnectionString= @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select StudentId from dbo.Student", con);
            SqlDataAdapter da2 = new SqlDataAdapter("select InstructorId from dbo.Instructor", con);
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            da.Fill(ds, "dbo.Student");
            da2.Fill(ds2, "dbo.Instructor");
            List<string> studentId = new List<string>();
            List<string> instructorid = new List<string>();
            foreach (DataRow row in ds.Tables["dbo.Student"].Rows)//get data from student table according to query
            {
                studentId.Add(row["StudentId"].ToString());

            }
            foreach (DataRow row in ds2.Tables["dbo.Instructor"].Rows)//get data from instructor table according to query
            {
                instructorid.Add(row["InstructorId"].ToString());

            }

            if (studentId.Exists(element => element == txtboxsuid.Text) )
            {
                Response.Redirect("studenthomepage.aspx");//if student logins go to students homepage
            }
            else if (instructorid.Exists(element => element == txtboxsuid.Text) )
            {
                Response.Redirect("instructor.aspx");//if instructor logins go to instructors homepage

            }
            else if(txtboxsuid.Text=="CS12345")
            {
                Response.Redirect("CareerServices.aspx"); //if career services staff logins go to career services homepage
            }
            con.Close();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void sendmail(Object sender,EventArgs e)//sends mail for contacting us at orangeboard for any queries/suggestion about website
        {
            string txtEmail = "orange.board.syracuse@gmail.com";
            string txtTo = "mkchaudh@syr.edu";
            string ssub = "This email is from "+ contactName.Text +""+ contactSubject.Text;

            string body = contactMessage.Text;
            using (MailMessage mm = new MailMessage(txtEmail, txtTo))
            {
                mm.Subject = ssub;
                mm.Body = body;

                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();//send mail using SMTP client
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(txtEmail, "orangeboard");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);

            }
        }     
       
    }
}