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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection();

            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();
            //get studentId and phonenumber from RegisteredInfo table to verify user
            SqlDataAdapter da = new SqlDataAdapter("select StudentId,PhoneNumber from dbo.RegisteredInfo", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "dbo.RegisteredInfo");
            List<string> studentId = new List<string>();
            List<string> phone = new List<string>();
            foreach (DataRow row in ds.Tables["dbo.RegisteredInfo"].Rows)
            {
                studentId.Add(row["StudentId"].ToString());
                phone.Add(row["PhoneNumber"].ToString());

            }

            if (studentId.Exists(element => element == studId.Text) && phone.Exists(element => element == phoneNo.Text))//check if student exists in registeredInfo table if he exists then only he can register for this website
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;

               //insert into table the restered students data
                    cmd.CommandText = "INSERT INTO dbo.Student values('" + studId.Text + "','" + phoneNo.Text + "','" + email.Text + "','" + zipcode.Text + "','" + name.Text + "','" + address.Text + "'); ";
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("homepage.aspx");
                
            }


        }
    }
}