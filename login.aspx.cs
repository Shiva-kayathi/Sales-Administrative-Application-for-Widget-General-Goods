using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel sidebarPanel = (Panel)Master.FindControl("pnlSidebar");
        if (!IsPostBack)
        {
            ShowGreeting();
        }
    }

    private void ShowGreeting()
    {
        Panel sidebarPanel = (Panel)Master.FindControl("pnlSidebar");
        sidebarPanel.Visible = false; 
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        tbxUserName.Text = "";
        tbxPassword.Text = "";
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = tbxUserName.Text;
        string password = tbxPassword.Text;

        NorthwindEntities entities = new NorthwindEntities();

        var matches = from em in entities.Employees
                 where (em.Email == email && em.Password == password)
                 select em;

        if(matches.Count() > 0)
        {
            Employee employee = matches.First();
            FormsAuthentication.RedirectFromLoginPage(employee.EmployeeID.ToString(), cbxRemember.Checked);
        }
        else
        {
            lblError.Text = "Incorrect Credential!";
        }
    }
}