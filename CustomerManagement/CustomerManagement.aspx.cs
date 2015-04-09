using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerManagement_CustomerManagement : System.Web.UI.Page
{
    NorthwindEntities entities = new NorthwindEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel sidebarPanel = (Panel)Master.FindControl("pnlSidebar");
        sidebarPanel.Visible = false; 
    }

    protected override void OnPreRender(EventArgs e)
    {
        lblError.Visible = false;
        ShowCustomer();
    }
    private void ShowCustomer()
    {
        tbCustomerId.Text = "";
        tbCompanyName.Text = "";
        tbContectName.Text = "";
        tbContectTitle.Text = "";
        tbPhone.Text = "";
        gridCustmoers.DataSource = entities.Customers.ToList<Customer>();

        gridCustmoers.DataBind();
    }
    protected void gridCustmoers_SelectedIndexChanged(object sender, EventArgs e)
    {

        tbCustomerId.Visible = false;
        string selectedCustomerId = (string)gridCustmoers.SelectedDataKey.Value;

        var matches = from c in entities.Customers
                      where c.CustomerID == selectedCustomerId
                      select c;

        Customer selectedCustomer = matches.Single();
        tbCustomerId.Text = selectedCustomer.CustomerID;
        
        tbCompanyName.Text = selectedCustomer.CompanyName;
        tbContectName.Text = selectedCustomer.ContactName;
        tbContectTitle.Text = selectedCustomer.ContactTitle;
        tbPhone.Text = selectedCustomer.Phone;
    }
    protected void btAddNewCustomer_Click(object sender, EventArgs e)
    {
        Customer newCustomer = new Customer();

        newCustomer.CustomerID = tbCustomerId.Text;
        newCustomer.CompanyName = tbCompanyName.Text;
        newCustomer.ContactName = tbContectName.Text;
        newCustomer.ContactTitle = tbContectTitle.Text;
        newCustomer.Phone = tbPhone.Text;

        entities.Customers.Add(newCustomer);
        entities.SaveChanges();

        ShowCustomer();
    }
    protected void btUpdateCustomer_Click(object sender, EventArgs e)
    {
        if (gridCustmoers.SelectedIndex != -1)
        {
            string selectedCustomerId = (string)gridCustmoers.SelectedDataKey.Value;

            var matches = from c in entities.Customers
                          where c.CustomerID == selectedCustomerId
                          select c;

            Customer selectedCustomer = new Customer();
            selectedCustomer = matches.Single();
            //selectedCustomer.CustomerID = tbCustomerId.Text;
            selectedCustomer.CompanyName = tbCompanyName.Text;
            selectedCustomer.ContactName = tbContectName.Text;
            selectedCustomer.ContactTitle = tbContectTitle.Text;
            selectedCustomer.Phone = tbPhone.Text;
            entities.SaveChanges();

            gridCustmoers.SelectedIndex = -1;
            ShowCustomer();
        }
    }
    protected void btDeleteCustomer_Click(object sender, EventArgs e)
    {
        if (gridCustmoers.SelectedIndex != -1)
        {
            string selectedCustomerId = (string)gridCustmoers.SelectedDataKey.Value;

            var matches = from c in entities.Customers
                          where c.CustomerID == selectedCustomerId
                          select c;

            Customer selectedCustomer = new Customer();
            selectedCustomer = matches.Single();

            entities.Customers.Remove(selectedCustomer);
            entities.SaveChanges();
            gridCustmoers.SelectedIndex = -1;
            ShowCustomer();
        }
        else
        {
            lblError.Visible = true;
            lblError.Text = "Please select a customer";
        }
    }
    protected void btAddNewOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("../AddOrder/AddNewOrder.aspx");
    }
}