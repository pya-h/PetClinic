using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetClinic.Views.Staff
{
    public partial class StaffPanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userType = Session["UserType"] as string;
            if (userType != "Staff")
                Response.Redirect("../Authentication/Login.aspx");
            string fullname = Session["Fullname"] as string;
            anchorFullname.InnerText = fullname != "" ? fullname : "PetClinic";
        }
    }
}