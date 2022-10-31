using System;
using System.Data;
using System.Data.SqlClient;


namespace PetClinic.Models
{
    public class DatabaseHelper
    {
        private readonly SqlConnection connection;
        private readonly SqlCommand command;
        private DataTable dataTable;
        private readonly string connectionString;
        private SqlDataAdapter dataAdapter;

        public DataTable GetDataTable(string query)
        {
            this.dataTable = new DataTable();
            this.dataAdapter = new SqlDataAdapter(query, this.connectionString);
            this.dataAdapter.Fill(this.dataTable);
            return this.dataTable;
        }

        public int SetDataTable(string query)
        {
            if (this.connection.State == ConnectionState.Closed) this.connection.Open();
            this.command.CommandText = query;
            int result = this.command.ExecuteNonQuery();
            this.connection.Close();
            return result;
        }

        public DatabaseHelper(string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database\PetClinic.mdf;Integrated Security=True;Connect Timeout=30")
        {

            AppDomain.CurrentDomain.SetData("DataDirectory", @"D:\pya\c#\PetClinic\PetClinic"); // IMPORTANT EDIT THIS WITH THE PROJECT LOCATION ON YOUR SYSTEM

            this.connectionString = connectionString;
            this.connection = new SqlConnection(this.connectionString);
            this.command = new SqlCommand
            {
                Connection = this.connection
            };
        }
    }
}