using System;
using System.Data;

namespace PetClinic.Views.Authentication
{
    public partial class Register : System.Web.UI.Page
    {
        private Models.DatabaseHelper connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new Models.DatabaseHelper();
        }
        private bool IsUnique(string username)
        {
            string query = "SELECT * FROM Users WHERE Username='{0}'";
            DataTable result = connection.GetDataTable(string.Format(query, username.ToLower()));
            return result.Rows.Count == 0;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string fullname = txtFullname.Value,
                    location = txtLocation.Value,
                    username = txtUsername.Value,
                    phonenumber = txtPhonenumber.Value,
                    gender = ddlGender.SelectedValue,
                    userType = "Customer",
                    password = txtPassword.Value;
                if (IsUnique(username))
                {

                    string query = "INSERT INTO Users (Username, Fullname, Location, Phonenumber, Password, Gender, UserType) values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')";
                    connection.SetDataTable(string.Format(query, username, fullname, location, phonenumber, password, gender, userType));
                    Response.Redirect("Login.aspx");
                }
                else
                    lblResult.InnerText = "This username is taken!";
            }
            catch (Exception ex)
            {
                lblResult.InnerText = ex.Message;
            }
        }
    }
}