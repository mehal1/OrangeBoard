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
    public partial class studenthomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection();
            
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            string a = Session["suidValue"].ToString();
            SqlCommand cmd = new SqlCommand("select count(*) from dbo.CourseEnrollment where StudentId='" + Session["suidValue"].ToString() + "' ;", con);

            List<string> noOfCourses = new List<string>();
            SqlDataReader rdr = cmd.ExecuteReader();
          
                
                // while there are more result rows.....
                while (rdr.Read())
                {
                    int mystr = rdr.GetInt32(0);
                    // grab the 0-index value from the result row
                    noOfCourses.Add((mystr.ToString()));
                }

                con.Close();
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
                con2.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter da2 = new SqlDataAdapter("select c.CourseId, CourseTitle, LocationofCourse, Timing, DaysOfWeek from dbo.Course as c, dbo.CourseEnrollment as ce where  StudentId='"+Session["suidValue"] +"' AND c.CourseId=ce.CourseId;", con2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, "dbo.Course");
                List<string> Courses = new List<string>();
                List<string> CourseIds = new List<string>();
                List<string> CourseLocation = new List<string>();
                List<string> CourseTiming = new List<string>();
                List<string> CourseDay = new List<string>();
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
                for (int i = 0; i < Int32.Parse(noOfCourses[0]); i++)
                {

                    Button b = new Button();//dynamic creation of buttons according to courses enrolled by student
                    b.ID = "button" + i;
                    b.Attributes.Add("onclick", "return true;");
                    b.Click += Button_Click;
                    b.CommandArgument = "" + i;
                    b.Attributes.Add("runat", "server");
                    b.Text = Courses[i].ToString();
                    addhere.Controls.Add(b);
                    System.Web.UI.HtmlControls.HtmlGenericControl br2 = new System.Web.UI.HtmlControls.HtmlGenericControl("BR");
                    addhere.Controls.Add(br2);
                    Session["cid"+i]= CourseIds[i];
                    Session["ctitle" + i] = Courses[i];
                    Session["clocation" + i] = CourseLocation[i];
                    Session["ctiming" + i] = CourseTiming[i];
                    Session["cday" + i] = CourseDay[i];
                    con2.Close();
                }
           
        }
            


        
        protected void Button_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;//triggers onclick for dynamically created button
            Session["id"] = button.CommandArgument;
            string a = Session["id"].ToString();
            Response.Redirect("studentcourse.aspx");
        }
    }
}