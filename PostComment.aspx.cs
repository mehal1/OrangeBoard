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
    public partial class PostComment : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("Id") != null)
            {
                DetailsView1.DefaultMode = DetailsViewMode.ReadOnly;
                detail();
                bindComment();
            }
        }

        void detail()
        {
            SqlConnection con = new SqlConnection();
            string j = Session["id"].ToString();
            string course = Session["ctitle" + j].ToString();
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from BlogPosts where Id=@id And Coursename='"+course+"'", con);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["Id"]);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                ds.Tables[0].Columns.Add("FormDate", typeof(string));
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DateTime date = (DateTime)ds.Tables[0].Rows[0]["BlogDate"];
                    string format = "MMM ddd d, yyyy";
                    ds.Tables[0].Rows[0]["FormDate"] = date.ToString(format);
                }
                DetailsView1.DataSource = ds;
                DetailsView1.DataBind();
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

        void bindComment()
        {
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

                SqlCommand cmd = new SqlCommand("select * from Comment where BlogId=@id And Coursename='" + course + "'", con);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["Id"]);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    GridViewcomment.Visible = false;
                    LabelNoComment.Visible = true;
                }
                else
                {
                    GridViewcomment.Visible = true;
                    LabelNoComment.Visible = false;
                    GridViewcomment.DataSource = ds;
                    GridViewcomment.DataBind();
                }

            }
            catch (Exception)
            {

                throw;
            }
            finally { con.Close(); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string i = Session["id"].ToString();
            string course = Session["ctitle" + i].ToString();
            SqlConnection con = new SqlConnection();

            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            try
            {
                if (txbxcomment.Text != txbxcomment.ToolTip.ToString() || txbxcommentauthor.Text != txbxcommentauthor.ToolTip.ToString())
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("insert into Comment(BlogId, Comment, Name, Date,Coursename) values(@bid,@com,@name,@date,'"+course+"')", con);
                    cmd.Parameters.AddWithValue("@bid", Request.QueryString["Id"]);
                    cmd.Parameters.AddWithValue("@com", txbxcomment.Text);
                    cmd.Parameters.AddWithValue("@name", txbxcommentauthor.Text);
                    cmd.Parameters.AddWithValue("@date", System.DateTime.Now);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    txbxcomment.Text = String.Empty;
                    txbxcommentauthor.Text = String.Empty;
                    bindComment();
                }
                else
                {

                }

            }
            catch (Exception)
            {

                throw;
            }
            finally { con.Close(); }
        }
    }
}