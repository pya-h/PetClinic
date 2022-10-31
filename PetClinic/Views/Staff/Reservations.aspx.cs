using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetClinic.Views.Staff
{
    public partial class Reservations : System.Web.UI.Page
    {
        private Models.DatabaseHelper connection;
        private int selectedItemID;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new Models.DatabaseHelper();
            LoadReservations();
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        private void LoadReservations()
        {
            string query = "SELECT * FROM Reservation";
            gridReservations.DataSource = connection.GetDataTable(query);
            gridReservations.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            try
            {
                string time = ddlTime.SelectedValue.ToString(),
                    date = txtDate.Text,
                    petType = txtPetType.Value,
                    symptoms = txtSymptoms.Value,
                    extraNotes = txtExtraNotes.Value;
                
                string query = "INSERT INTO Reservation (Date, TimeRange, PetType, Symptoms, ExtraNotes, ReserverID) values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')";
                connection.SetDataTable(string.Format(query, date, time, petType, symptoms, extraNotes, Session["ID"] as string));
                LoadReservations();
                lblResult.InnerText = "Time reserved!";
                ResetInputs();
            }
            catch (Exception ex)
            {
                lblResult.InnerText = ex.Message;
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

        protected void gridReservations_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedItemID = Convert.ToInt32(gridReservations.SelectedRow.Cells[1].Text);
            lblResult.InnerText = "";
            txtDate.Text = gridReservations.SelectedRow.Cells[2].Text;
            ddlTime.SelectedValue = gridReservations.SelectedRow.Cells[3].Text;
            txtPetType.Value = gridReservations.SelectedRow.Cells[4].Text;
            txtSymptoms.Value = gridReservations.SelectedRow.Cells[5].Text;
            txtExtraNotes.Value = gridReservations.SelectedRow.Cells[6].Text;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                string time = ddlTime.SelectedValue.ToString(),
                    date = txtDate.Text,
                    petType = txtPetType.Value,
                    symptoms = txtSymptoms.Value,
                    extraNotes = txtExtraNotes.Value;

                string query = "UPDATE Reservation SET Date='{0}', TimeRange='{1}', PetType='{2}', Symptoms='{3}', ExtraNotes='{4}' WHERE ID='{5}'";
                string resrverID = gridReservations.SelectedRow.Cells[1].Text;
                connection.SetDataTable(string.Format(query, date, time, petType, symptoms, extraNotes, resrverID));
                LoadReservations();
                lblResult.InnerText = "Reservation editted!";
                ResetInputs();
            }
            catch (Exception ex)
            {
                lblResult.InnerText = ex.Message;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "DELETE FROM Reservation WHERE ID='{0}'";
                connection.SetDataTable(string.Format(query, gridReservations.SelectedRow.Cells[1].Text));
                LoadReservations();
                lblResult.InnerText = "Reservation Removed!";
                ResetInputs();
            }
            catch (Exception ex)
            {
                lblResult.InnerText = ex.Message;
            }
        }
    }
}