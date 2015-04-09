<%@ Application Language="C#" %>

<script RunAt="server">

    public void Application_AuthenticateRequest(Object src, EventArgs e)
    {
        if(!(HttpContext.Current.User == null))
        {
            if(HttpContext.Current.User.Identity.AuthenticationType == "Forms")
            {
                FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                int employeeId = int.Parse(id.Name);

                NorthwindEntities entities = new NorthwindEntities();
                var employee = (from em in entities.Employees where em.EmployeeID == employeeId select em).First();

                String[] roles = employee.SecurityLevel.Split(',');
                HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(id, roles);
            }
        }
    }

    void Application_Start(object sender, EventArgs e)
    {
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
        new ScriptResourceDefinition
        {
            Path = "~/scripts/jquery-1.7.2.min.js",
            DebugPath = "~/scripts/jquery-1.7.2.min.js",
            CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
            CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
        });

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
