using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((Image)Master.FindControl("programLogo")).ImageUrl = "~/App_Themes/Images/SAT.png";

        if(!Request.IsAuthenticated)
        {
            ((Panel)Master.FindControl("pnlSidebar")).Visible = false;
        }
        else
        {
            if(User.IsInRole("Admin"))
            {
                Response.Redirect("~/UserManagement/UserManagement.aspx");
            }
            else if(User.IsInRole("User"))
            {
                Response.Redirect("~/CustomerManagement/CustomerManagement.aspx");
            }
        }
    }
}