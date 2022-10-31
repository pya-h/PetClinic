using System;
using System.Data;

namespace PetClinic.Views.Customer
{
    public partial class Reserve : System.Web.UI.Page
    {
        private Models.DatabaseHelper connection;
        private const int MAXIMUM_RESERVATIONS_IN_SPECIFIC_DATETIME = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            connection = new Models.DatabaseHelper();
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            string time = ddlTime.SelectedValue.ToString(),
                date = txtDate.Text,
                petType = txtPetType.Value,
                symptoms = txtSymptoms.Value,
                extraNotes = txtExtraNotes.Value,
                currenUserID = Session["ID"] as string;
            string query = "SELECT * FROM Reservation WHERE TimeRange='{0}' AND Date='{1}'";
            DataTable result = connection.GetDataTable(string.Format(query, time, date));
            if(result.Rows.Count > MAXIMUM_RESERVATIONS_IN_SPECIFIC_DATETIME)
            {
                lblResult.InnerText = "This specific time has reached the maximum reservations! Please pick another time or date!";
            }
            else
            {
                query = "INSERT INTO Reservation (Date, TimeRange, PetType, Symptoms, ExtraNotes, ReserverID) values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')";
                connection.SetDataTable(string.Format(query, date, time, petType, symptoms, extraNotes, currenUserID));
                lblResult.InnerText = "Reservation completed!";
                ResetInputs();
            }
        }
        private void ResetInputs()
        {
            txtPetType.Value = "";
            txtSymptoms.Value = "";
            txtExtraNotes.Value = "";
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            ddlTime.SelectedIndex = -1;
        }
    }
}