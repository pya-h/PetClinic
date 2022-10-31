using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetClinic.Views.Customer
{
    public partial class CustomerPanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fullname = Session["Fullname"] as string;
            anchorFullname.InnerText = fullname != "" ? fullname: "PetClinic";
        }
    }
}