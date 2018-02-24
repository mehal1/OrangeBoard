using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrangeBoard
{
    public partial class discussionForum : System.Web.UI.Page
    { 
         protected void Page_Load(object sender, EventArgs e)
        {
            string i = Session["id"].ToString();
            string course = Session["ctitle" + i].ToString();
            txbxTitle.Text = course;
            BindBlog();
        }

        void BindBlog()//shows all the discussions/posts according to course
        {//get session data to start discussion according to course
            string i = Session["id"].ToString();
            string course = Session["ctitle" + i].ToString();
            SqlConnection con = new SqlConnection();

            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from BlogPosts where Coursename='"+ course + "' order by BlogDate desc ", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                cmd.Dispose();
            }
            catch (Exception k)
            {
                Response.Write(k.Message);
                //throw;
            }
            finally
            {
                con.Close();
            }

        }

        protected void discussforum_onClick(object sender, EventArgs e)//when u click on view disscusion,it shows all discussions including previously started, currently going , etc accoding to selection
        {
            SqlConnection con = new SqlConnection();

            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            string i = Session["id"].ToString();
            string course = Session["ctitle" + i].ToString();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into BlogPosts(Title,Content,Author, BlogDate,Coursename) values(@title,@content,@author,@date, '"+course+"')", con);
                cmd.Parameters.AddWithValue("@title", txbxTitle.Text);
                cmd.Parameters.AddWithValue("@content", txbxContent.Text);
                cmd.Parameters.AddWithValue("@author", txbxAuthor.Text);
                cmd.Parameters.AddWithValue("@date", System.DateTime.Now);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception k)
            {
                Response.Write(k.Message);
                //throw;
            }
            finally { con.Close(); }
        }
    }
}
