using System;
using System.Data;

namespace PetClinic.Views.Staff
{
    public partial class Users : System.Web.UI.Page
    {
        Models.DatabaseHelper connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new Models.DatabaseHelper();
            LoadUsers();
        }

        private void LoadUsers()
        {
            string query = "SELECT * FROM Users";
            gridUsers.DataSource = connection.GetDataTable(query);
            gridUsers.DataBind();
        }

        private bool IsUnique(string username)
        {
            string query = "SELECT * FROM Users WHERE Username='{0}'";
            DataTable result = connection.GetDataTable(string.Format(query, username.ToLower()));
            return result.Rows.Count == 0;
        }
        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            try
            {
                string fullname = txtFullname.Value,
                    location = txtLocation.Value,
                    username = txtUsername.Value,
                    phonenumber = txtPhonenumber.Value,
                    gender = ddlGender.SelectedValue,
                    userType = ddlUserType.SelectedValue,
                    password = txtPassword.Value;
                if (IsUnique(username))
                {

                    string query = "INSERT INTO Users (Username, Fullname, Location, Phonenumber, Password, Gender, UserType) values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')";
                    connection.SetDataTable(string.Format(query, username, fullname, location, phonenumber, password, gender, userType));
                    LoadUsers();
                    lblResult.InnerText = "User registered!";
                    ResetInputs();
                }
                else
                    lblResult.InnerText = "This username is taken!";
            }
            catch (Exception ex)
            {
                lblResult.InnerText = ex.Message;
            }
        }

        private void ResetInputs()
        {
            txtFullname.Value = txtLocation.Value = txtUsername.Value = txtPhonenumber.Value = txtPassword.Value = "";
            ddlGender.SelectedIndex = -1;
        }

        protected void gridUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUsername.Value = gridUsers.SelectedRow.Cells[2].Text;
            txtFullname.Value = gridUsers.SelectedRow.Cells[3].Text;
            txtLocation.Value = gridUsers.SelectedRow.Cells[4].Text;
            txtPhonenumber.Value = gridUsers.SelectedRow.Cells[5].Text;
            txtPassword.Value = gridUsers.SelectedRow.Cells[6].Text;
            ddlUserType.SelectedValue = gridUsers.SelectedRow.Cells[7].Text;
            ddlGender.SelectedValue = gridUsers.SelectedRow.Cells[8].Text;
        }

        protected void btnEditUser_Click(object sender, EventArgs e)
        {
            try
            {
                string fullname = txtFullname.Value,
                    location = txtLocation.Value,
                    username = txtUsername.Value,
                    phonenumber = txtPhonenumber.Value,
                    gender = ddlGender.SelectedValue,
                    userType = ddlUserType.SelectedValue,
                    password = txtPassword.Value,
                    selectedUsername = gridUsers.SelectedRow.Cells[2].Text;
                if (username.ToLower() == selectedUsername.ToLower() || IsUnique(username))
                {

                    string query = "UPDATE Users SET Username='{0}', Fullname='{1}', Location='{2}', Phonenumber='{3}', Password='{4}', Gender='{5}', UserType='{6}' WHERE ID='{7}'";
                    connection.SetDataTable(string.Format(query, username, fullname, location, phonenumber, password, gender, userType, gridUsers.SelectedRow.Cells[1].Text));
                    LoadUsers();
                    lblResult.InnerText = "User editted!";
                    ResetInputs();
                }
                else
                    lblResult.InnerText = "This username is taken!";
            }
            catch (Exception ex)
            {
                lblResult.InnerText = ex.Message;
            }
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            try
            {
                string userPassword = gridUsers.SelectedRow.Cells[6].Text;
                if (txtPassword.Value == userPassword)
                {
                    string query = "DELETE FROM Users WHERE ID='{0}'";
                    connection.SetDataTable(string.Format(query, gridUsers.SelectedRow.Cells[1].Text));
                    LoadUsers();
                    lblResult.InnerText = "Reservation Removed!";
                    ResetInputs();
                }
                else
                {
                    lblResult.InnerText = "To remove this user you must provide his/her correct password!";
                }
            }
            catch (Exception ex)
            {
                lblResult.InnerText = ex.Message;
            }
        }
    }
}