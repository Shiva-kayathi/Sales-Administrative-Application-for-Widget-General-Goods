using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddOrder_AddNewUser : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel sidebarPanel = (Panel)Master.FindControl("pnlSidebar");
        sidebarPanel.Visible = true;

        LinkButton linkButton1 = (LinkButton)Master.FindControl("sidebarButton1");
        ((LinkButton)Master.FindControl("sidebarButton2")).Visible = false;
        ((LinkButton)Master.FindControl("sidebarButton3")).Visible = false;

        if (!IsPostBack)
        {
            Image logo = (Image)Master.FindControl("programLogo");
            logo.ImageUrl = "~/App_Themes/Images/SAT.png";

            linkButton1.Text += "Go Back";
        }

        linkButton1.Click += LinkButton1_Click;

        //if(User.IsInRole("Admin")
        //{
        //    linkButton1.Click += LinkButton1_Click;
        //    Response.Redirect("../UserManagement/UserManagement.aspx");
        //}

        lblError.Visible = false;

        lblDisplayEmployeeID.Text = HttpContext.Current.User.Identity.Name;
    }

    void LinkButton1_Click(object sender, EventArgs e)
    {
        if(User.IsInRole("Admin"))
        {
            Response.Redirect("../UserManagement/UserManagement.aspx");
        }
        else if(User.IsInRole("User"))
        {
            Response.Redirect("../CustomerManagement/CustomerManagement.aspx");
        }
    }



    protected void btnAddOrder_Click(object sender, EventArgs e)
    {
        int employeeId = int.Parse(lblDisplayEmployeeID.Text);
        //int employeeId = int.Parse(tbEmployeeID.Text);
        string customerId = tbCustomerID.Text;
        //DateTime orderDate = (DateTime) tbOrderDate.Text;
        //DateTime requiredDate = tbRequiredDate.Text;
        int shipVia = int.Parse(ddlShipVia.SelectedValue);

        Order newOrder = new Order();
        newOrder.EmployeeID = employeeId;
        newOrder.CustomerID = customerId;
        newOrder.ShipVia = shipVia;

        lblError.Visible = true;
        NorthwindEntities entities = new NorthwindEntities();
        var c = from cust in entities.Customers
                     where (cust.CustomerID == customerId)
                     select cust;
        if (c.Count() > 0)
        {            
            entities.Orders.Add(newOrder);
            entities.SaveChanges();
            lblError.Text = "Successfully Added";
        }
        else
        {
            lblError.Text = "Failed, The customer ID is not exist";
        }        
    }
}