using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//auth references
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace comp2007Lab4
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            // Handle specific exception.
            if (exc is HttpUnhandledException)
            {
                lblStatus.Text = "An error occurred on this page. Please verify your " +                  
                "information to resolve the issue.";
            }
            // Clear the error from the server.
            Server.ClearError();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            try
            {
                var userStore = new UserStore<IdentityUser>();
                var userManager = new UserManager<IdentityUser>(userStore);
                var user = userManager.Find(txtUsername.Text, txtPassword.Text);

                if (user != null)
                {
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                    authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
                    Response.Redirect("admin/main-menu.aspx");
                }
                else
                {
                    lblStatus.Text = "Invalid username or password.";
                }
            }
            catch (Exception)
            {
                
                Response.Redirect("error.aspx");
            }
        }
    }
}