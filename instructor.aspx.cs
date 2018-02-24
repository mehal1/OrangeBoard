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

namespace OrangeBoard
{
    public partial class instructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            //  con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            /**load all data through session for displaying course information on course page like course Title,Location/classroom,day the class is conducted on*/
            string a = Session["suidValue"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select NumberOfCourses from dbo.Instructor where InstructorId='"+ Session["suidValue"].ToString() + "' ;", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "dbo.Instructor");
            SqlDataAdapter da2 = new SqlDataAdapter("select CourseId, CourseTitle, LocationofCourse, Timing, DaysOfWeek from dbo.Course where InstructorId='" + Session["suidValue"].ToString() + "' ;", con);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "dbo.Course");
            List<string> CourseIds = new List<string>();
            List<string> suid = new List<string>();
            List<string> Courses = new List<string>();
            List<string> CourseLocation = new List<string>();
            List<string> CourseTiming = new List<string>();
            List<string> CourseDay= new List<string>();
            foreach (DataRow row in ds.Tables["dbo.Instructor"].Rows)
            {
                suid.Add(row["NumberOfCourses"].ToString());//get data from instructor table accroding to query
            }
            foreach (DataRow row in ds2.Tables["dbo.Course"].Rows)
            {
                CourseIds.Add(row["CourseId"].ToString());
                Courses.Add(row["CourseTitle"].ToString());
                CourseLocation.Add(row["LocationofCourse"].ToString());
                CourseTiming.Add(row["Timing"].ToString());
                CourseDay.Add(row["DaysOfWeek"].ToString());
            }
            System.Web.UI.HtmlControls.HtmlGenericControl br1 = new System.Web.UI.HtmlControls.HtmlGenericControl("BR");
            addhere.Controls.Add(br1);
            for (int i= 0;i<Int32.Parse(suid[0]);i++)
            {
                Button b = new Button();//for dynamically creating buttons according to courses instructor is teaching which are stored in database
                b.ID = "button" + i;
                b.Attributes.Add("onclick", "return true;");
                b.Click += Button_Click;
                b.CommandArgument = ""+i;
                b.Attributes.Add("runat", "server");
                b.Text = Courses[i].ToString();
                addhere.Controls.Add(b);
                System.Web.UI.HtmlControls.HtmlGenericControl br2 = new System.Web.UI.HtmlControls.HtmlGenericControl("BR");
                addhere.Controls.Add(br2);
                Session["cid" + i] = CourseIds[i];
                Session["ctitle"+i] = Courses[i];
                Session["clocation" + i] = CourseLocation[i];
                Session["ctiming" + i] = CourseTiming[i];
                Session["cday" + i] = CourseDay[i];             
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;//triggers onclick for dynamically created button
            Session["id"] = button.CommandArgument;
            string a = Session["id"].ToString();
           Response.Redirect("c1.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("c1.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}