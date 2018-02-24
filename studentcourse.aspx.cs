using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Data;
//using Clockwork;
using System.Configuration;


namespace OrangeBoard
{
    public partial class studentcourse : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {//get session data to display course infromation for course enrolled 
            string i = Session["id"].ToString();
            coursetitle.InnerText = Session["ctitle" + i].ToString();
            courselocation.InnerText = Session["clocation" + i].ToString();
            coursetiming.InnerText = Session["ctiming" + i].ToString();
            courseday.InnerText = Session["cday" + i].ToString();
            SqlConnection con = new SqlConnection();           
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            //con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select CourseId,CourseContent,AssignmentQuestion from dbo.CourseContent where CourseId = '" + Session["cid" + i].ToString() + "';", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "dbo.CourseContent");           
            List<string> showfiles = new List<string>();          
            foreach (DataRow row in ds.Tables["dbo.CourseContent"].Rows)
            {
                showfiles.Add(row["CourseContent"].ToString());
                showfiles.Add(row["AssignmentQuestion"].ToString());
            }
            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/courseContent/"));
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {
                    if (showfiles.Contains(Path.GetFileName(filePath)))
                    {
                        files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                    }
                }
                GridView1student.DataSource = files;//this gridview displays Coursecontent uploaded by instructor
                GridView1student.DataBind();

            }
        }
        protected void DownloadFile(object sender, EventArgs e)//for downloading content uploaded by professor/instructor
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }


        protected void UploadFile(object sender, EventArgs e)//upload and submit the assignment for the course
        {             
            try
            {
                string fileName = Path.GetFileName(FileUpload1assignment.PostedFile.FileName);
                if (fileName != null)
                {
                    FileUpload1assignment.PostedFile.SaveAs(Server.MapPath("~/assignment1/") + fileName);
                    string i = Session["id"].ToString();
                    SqlConnection con = new SqlConnection();
                    // con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
                    con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
                    con.Open();
                    string a = Session["suidValue"].ToString();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "INSERT INTO dbo.Assignment(CourseId,StudentId, Assignment) VALUES('"+ Session["cid" + i].ToString() + "','" + Session["suidValue"].ToString() + "', '" + fileName + "')" + ";";
                        cmd.ExecuteNonQuery();
                        con.Close();
                    Response.Redirect(Request.Url.AbsoluteUri);
                    Label1assignment.Text = "File successfully uploaded";
                }

            }
            catch
            {
                Label1assignment.Text = "No file uploaded !!! Please insert the file";
            }

        }
            
        protected void DeleteFile(object sender, EventArgs e)// for deleting any assignment file uploaded by student
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);
        }



        protected void viewuploadedfiles(object sender, EventArgs e)//for displaying submitted assignmnts
        {
            SqlConnection con = new SqlConnection();
            string i = Session["id"].ToString();
            //  con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select Assignment from dbo.Assignment where StudentId='" + Session["suidValue"].ToString() + "' AND CourseId = '" + Session["cid" + i].ToString() + "';", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "dbo.Assignment");
            SqlDataAdapter da2 = new SqlDataAdapter("select CourseTitle, LocationofCourse, Timing, DaysOfWeek from dbo.Course where InstructorId='" + Session["suidValue"].ToString() + "' ;", con);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "dbo.Course");
            List<string> suid = new List<string>();
            List<string> showfiles = new List<string>();
            List<string> Courses = new List<string>();
            List<string> CourseLocation = new List<string>();
            List<string> CourseTiming = new List<string>();
            List<string> CourseDay = new List<string>();
            foreach (DataRow row in ds.Tables["dbo.Assignment"].Rows)
            {
                showfiles.Add(row["Assignment"].ToString());
            }
            foreach (DataRow row in ds2.Tables["dbo.Course"].Rows)
            {
                Courses.Add(row["CourseTitle"].ToString());
                CourseLocation.Add(row["LocationofCourse"].ToString());
                CourseTiming.Add(row["Timing"].ToString());
                CourseDay.Add(row["DaysOfWeek"].ToString());
            }
                                                            
            string[] filePaths2= { };
            filePaths2=Directory.GetFiles(Server.MapPath("~/assignment1/"));                     
            List<ListItem> files2 = new List<ListItem>();
            foreach (string filePath in filePaths2)
             {
                if (showfiles.Contains(Path.GetFileName(filePath)))
                {
                    files2.Add(new ListItem(Path.GetFileName(filePath), filePath));
                }
             }
                GridView1assignment.DataSource = files2;//This gridview show the assignments submitted
                GridView1assignment.DataBind();
            }

        protected void Button1_Click(object sender, EventArgs e)//open discussion forum page if student clicks on view discussions
        {
            Response.Redirect("DiscussionForum.aspx");
        }
    }

}




