using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManagement_UserManagement : System.Web.UI.Page
{
    NorthwindEntities entities = new NorthwindEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel sidebarPanel = (Panel)Master.FindControl("pnlSidebar");
        sidebarPanel.Visible = false;
    }

    protected override void OnPreRender(EventArgs e)
    {
        //tbEmployeeId.Visible = true;
        ShowEmployee();
    }

    private void ShowEmployee()
    {
        gridEmployees.DataSource = entities.Employees.ToList<Employee>();

        gridEmployees.DataBind();
    }

    protected void btDeleteEmployee_Click(object sender, EventArgs e)
    {
        if(gridEmployees.SelectedIndex != -1)
        {
            int selectedEmployeeId = (int)gridEmployees.SelectedDataKey.Value;
            var matches = from em in entities.Employees
                          where em.EmployeeID == selectedEmployeeId
                          select em;

            Employee employee = matches.Single();
            entities.Employees.Remove(employee);
            entities.SaveChanges();
            gridEmployees.SelectedIndex = -1;

            ShowEmployee();
        }
    }
    protected void btAddNewEmployee_Click(object sender, EventArgs e)
    {
        Employee newEmployee = new Employee();


        if (tbEmail.Text != "" && tbLastName.Text != "" && tbFirstName.Text != "" && tbPassword.Text != "")
        {
            newEmployee.LastName = tbLastName.Text;
            newEmployee.FirstName = tbFirstName.Text;
            newEmployee.Email = tbEmail.Text;
            newEmployee.Password = tbPassword.Text;
            newEmployee.Title = tbTitle.Text;
            newEmployee.SecurityLevel = ddlSecurityLevel.SelectedValue;

            entities.Employees.Add(newEmployee);
            entities.SaveChanges();
        }

        ShowEmployee();
    }
    protected void gridEmployees_SelectedIndexChanged(object sender, EventArgs e)
    {
        //tbEmployeeId.Visible = false;
        
        int selectedEmployeeId = (int)gridEmployees.SelectedDataKey.Value;
        var matches = from em in entities.Employees
                      where em.EmployeeID == selectedEmployeeId
                      select em;

        Employee employee = matches.Single();
        //lblEmployeeID.Text = "Employee ID: " + employee.EmployeeID.ToString();
        tbFirstName.Text = employee.FirstName;
        tbLastName.Text = employee.LastName;
        tbTitle.Text = employee.Title;
        tbEmail.Text = employee.Email;
        tbPassword.Text = employee.Password;
    }
    protected void btUpdateEmployee_Click(object sender, EventArgs e)
    {
        int updateEmployeeId = (int)gridEmployees.SelectedDataKey.Value;

        var matches = from em in entities.Employees
                      where em.EmployeeID == updateEmployeeId
                      select em;

        Employee updateEmployee = matches.Single();
        updateEmployee.LastName = tbLastName.Text;
        updateEmployee.FirstName = tbFirstName.Text;
        updateEmployee.Title = tbTitle.Text;
        updateEmployee.Email = tbEmail.Text;
        updateEmployee.Password = tbPassword.Text;
        updateEmployee.SecurityLevel = ddlSecurityLevel.SelectedValue;

        entities.SaveChanges();
    }
    protected void btAddNewOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("../AddOrder/AddNewOrder.aspx");
    }
}