using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Data;
using Clockwork;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace OrangeBoard
{
    public partial class CareerServices : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            // con.ConnectionString= @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
             con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            try
            {
                string query = "SELECT PhoneNumber FROM dbo.Student as s, dbo.StudentCareerInform as sc WHERE degree= '" + degree.Text + "' AND major = '" + major.Text + "' AND programmingLanguages= '" + programming.Text + "' AND workex >= " + Exyears.Text + " AND s.StudentId = sc.studId ;";

                // Create a SqlCommand object and pass the constructor the connection string and the query string.
                SqlCommand queryCommand = new SqlCommand(query, con);

                con.Open();

                ArrayList ar = new ArrayList();//arraylist for storing phone numbers of students
                int i = 0;
                using (SqlDataReader reader = queryCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ar.Add(reader[0].ToString()); //This writes first column values for your all rows.
                        i = i + 1;
                    }
                }
                string[] a = ar.ToArray(typeof(string)) as string[];

                API api = new API("517b63d0706f907bdb548a4d8d6f49ba75b7b34b");//get an api from clockworksms website for sending text messages
                int l = a.Length;           
                string b = message.Text;
                for (i = 0; i < l; i++)
                {
                    Response.Write(a[i] + " ");
                    SMSResult result = api.Send(new SMS { To = a[i], Message = b });
                }
            }


            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                con.Close();
            }

            Response.Redirect("CareerServices.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            // con.ConnectionString= @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            // con.ConnectionString = @"" + "C:\\Users\\Mehal K Chaudhari\\Source\\Repos\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            con.Open();            
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
           //for getting alumni recod according to any records like according to company,job position,etc or combination of those records
            int n = 0;
            cmd.CommandText = "Select * FROM dbo.AlumniRecord where ";
            if (!string.IsNullOrWhiteSpace(Aname.Text))
            {
                if (n > 0)
                {
                    cmd.CommandText = cmd.CommandText + " AND ";
                }
                cmd.CommandText = cmd.CommandText + "AlumniName = '" + Aname.Text + "'";
                n++;
            }
            if (!string.IsNullOrWhiteSpace(ajob.Text))
            {
                if (n > 0)
                {
                    cmd.CommandText = cmd.CommandText + " AND ";
                }
                cmd.CommandText = cmd.CommandText + "positionInCompany = '" + ajob.Text+"'";
                n++;
            }
            if (!string.IsNullOrWhiteSpace(amajor.Text))
            {
                {
                    if (n > 0)
                    {
                        cmd.CommandText = cmd.CommandText + " AND ";
                    }
                    cmd.CommandText = cmd.CommandText + "OtherRecord LIKE '%" + amajor.Text + "%'";
                    n++;
                }
            }
                if (!string.IsNullOrWhiteSpace(aother.Text))
                {

                    if (n > 0)
                    {
                        cmd.CommandText = cmd.CommandText + " AND ";
                    }
                    cmd.CommandText = cmd.CommandText + "OtherRecord LIKE '%" + aother.Text + "%'";
                    n++;
                }
                if (!string.IsNullOrWhiteSpace(acompany.Text))
                {
                    if (n > 0)
                    {
                        cmd.CommandText = cmd.CommandText + " AND ";
                    }
                    cmd.CommandText = cmd.CommandText + "CompanyName = '" + acompany.Text + "'"; ;
                    n++;

                }
                cmd.CommandText = cmd.CommandText + ";";
                cmd.ExecuteNonQuery();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd.CommandText, con);

                DataSet ds = new DataSet();
                dataAdapter.Fill(ds);

                
            dataAdapter.Fill(ds, "dbo.AlumniRecord");
            List<string> result = new List<string>();
                foreach (DataRow row in ds.Tables["dbo.AlumniRecord"].Rows)
                {
                    result.Add(row["AlumniName"].ToString());
                }

            GridView2.DataSource = ds.Tables["dbo.AlumniRecord"];//this gridview will show results of alumni records
            GridView2.DataBind();
        }
        }
    }

