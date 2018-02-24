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
    public partial class StudentCareerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void WorkAdd_Click(object sender, EventArgs e)//for dynamically adding controls to add more work experience
        {
           
            System.Web.UI.HtmlControls.HtmlGenericControl div1 =
                                    new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div1.Attributes.Add("class", "five columns header-col");

            System.Web.UI.HtmlControls.HtmlGenericControl l1= new System.Web.UI.HtmlControls.HtmlGenericControl("H1");
            l1.InnerHtml = "Company:";
            div1.Controls.Add(l1);


            System.Web.UI.HtmlControls.HtmlGenericControl div2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div2.Attributes.Add("class","seven columns main-col");

            System.Web.UI.HtmlControls.HtmlGenericControl div21 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div21.Attributes.Add("class", "row item");

            System.Web.UI.HtmlControls.HtmlGenericControl div22 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div22.Attributes.Add("class", "twelve columns");
            TextBox txtcompany = new TextBox();
            txtcompany.Attributes.Add("runat", "server");
            txtcompany.Attributes.Add("style", "Width:295px");

            div2.Controls.Add(div21);
            div2.Controls.Add(div22);
            div2.Controls.Add(txtcompany);

            System.Web.UI.HtmlControls.HtmlGenericControl div3 =
                                   new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div3.Attributes.Add("class", "five columns header-col");

            System.Web.UI.HtmlControls.HtmlGenericControl l2 = new System.Web.UI.HtmlControls.HtmlGenericControl("H1");
            l2.InnerHtml = "Job Title:";
            div3.Controls.Add(l2);



            System.Web.UI.HtmlControls.HtmlGenericControl div4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div4.Attributes.Add("class", "seven columns main-col");

            System.Web.UI.HtmlControls.HtmlGenericControl div41 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div41.Attributes.Add("class", "row item");

            System.Web.UI.HtmlControls.HtmlGenericControl div42 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div42.Attributes.Add("class", "twelve columns");
            TextBox txtjobtitle = new TextBox();
            txtjobtitle.Attributes.Add("runat", "server");
            txtjobtitle.Attributes.Add("style", "Width:295px");

            div4.Controls.Add(div41);
            div4.Controls.Add(div42);
            div4.Controls.Add(txtjobtitle);

            System.Web.UI.HtmlControls.HtmlGenericControl div5 =
                                              new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div5.Attributes.Add("class", "five columns header-col");

            System.Web.UI.HtmlControls.HtmlGenericControl l3 = new System.Web.UI.HtmlControls.HtmlGenericControl("H1");
            l3.InnerHtml = "Number of Years:";
            div5.Controls.Add(l3);

           

            System.Web.UI.HtmlControls.HtmlGenericControl div6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div6.Attributes.Add("class", "seven columns main-col");

            System.Web.UI.HtmlControls.HtmlGenericControl div61 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div61.Attributes.Add("class", "row item");

            System.Web.UI.HtmlControls.HtmlGenericControl div62 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div62.Attributes.Add("class", "twelve columns");
            TextBox txtyears = new TextBox();
            txtyears.Attributes.Add("runat", "server");
            txtyears.Attributes.Add("style", "Width:295px");

            div6.Controls.Add(div61);
            div6.Controls.Add(div62);
            div6.Controls.Add(txtyears);



            System.Web.UI.HtmlControls.HtmlGenericControl div7 =
                                              new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div7.Attributes.Add("class", "five columns header-col");

            System.Web.UI.HtmlControls.HtmlGenericControl l4 = new System.Web.UI.HtmlControls.HtmlGenericControl("H1");
            l4.InnerHtml = "Job Resposibilities:";
            div7.Controls.Add(l4);
          



            System.Web.UI.HtmlControls.HtmlGenericControl div8 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div8.Attributes.Add("class", "seven columns main-col");

            System.Web.UI.HtmlControls.HtmlGenericControl div81 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div81.Attributes.Add("class", "row item");

            System.Web.UI.HtmlControls.HtmlGenericControl div82 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div82.Attributes.Add("class", "twelve columns");
            TextBox txtResponsibilities = new TextBox();
            txtResponsibilities.Attributes.Add("runat", "server");
            txtResponsibilities.Attributes.Add("style", "Width:295px; height:100px;");
           
           

            div8.Controls.Add(div81);
            div8.Controls.Add(div82);
            div8.Controls.Add(txtResponsibilities);


            jobdiv.Controls.Add(div1);
            jobdiv.Controls.Add(div2);
            jobdiv.Controls.Add(div3);
            jobdiv.Controls.Add(div4);
            jobdiv.Controls.Add(div5);
            jobdiv.Controls.Add(div6);
            jobdiv.Controls.Add(div7);
            jobdiv.Controls.Add(div8);





            
        }
        protected void ProjectAdd_Click(object sender, EventArgs e)
        {


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\App_Data\OrangeBoard.mdf" + ";Integrated Security=True";
            // con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + "F:\\3sem\\mehal125\\OrangeBoard\\OrangeBoard\\App_Data\\OrangeBoard.mdf;" + "Integrated Security=True";
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            //insert into table StudentCareerInform for keeping track of experience/ new projects /new programming skills that student learns
            cmd.CommandText = "INSERT INTO StudentCareerInform(studId, degree, major, programmingLanguages, Company, jobtitle, workex, jobResponsibility, projTitle, projectComplitionDate, projectTech, projResposibility) VALUES ('" + "287773263" + "','" + degree.Text + "','" + major.Text + "','" 
                + programming.Text + "','" + Company.Text + "','" + jobTitle.Text + "','"+  Exyears.Text + "','" + jobResponsibility.Text +
                "','"+ projectTitle.Text +"','" + projCompletionDate.Text + "','"+ technology.Text +  "','" 
                + Projresponsibiity.Text+ "');";
                cmd.ExecuteNonQuery();
                con.Close();
            Response.Redirect("studenthomepage.aspx");
        }
    }
}