using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;

namespace WebApplication1
{
    public partial class adminwebform : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindSocialMediaLinks();
                BindProjects();
                BindExpertise();
                BindSkills();
                BindMailData();
            }

        }


        //   Social Media Link Section  //

        protected void BindSocialMediaLinks()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                string query = "SELECT AltText, ImagePath, Link FROM SocialMediaLinks";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    // Open the connection
                    connection.Open();

                    // Create a SqlDataAdapter
                    using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        // Bind the data to the GridView
                        socialLinksTable.DataSource = dataTable;
                        socialLinksTable.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }


        protected void addSocialLink_Click(object sender, EventArgs e)
        {
            // AddSocialLink_Click event handler
        }

        protected void editSocialLink_Click(object sender, EventArgs e)
        {
            // editSocialLink_Click event handler
        }

        protected void deleteSocialLink_Click(object sender, EventArgs e)
        {
            // deleteSocialLink_Click event handler
        }

        protected void AddSocialLink_Click(object sender, EventArgs e)
        {
            // AddSocialLink_Click event handler
        }

        protected void EditSocialLink_Click(object sender, EventArgs e)
        {
            // EditSocialLink_Click event handler
        }




        //   Project Section  //



        protected void BindProjects()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                string query = "SELECT Title, Description, Link, ImagePath, AltText FROM Projects";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            projectGridView.DataSource = dataTable;
                            projectGridView.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }



        protected void addProject_Click(object sender, EventArgs e)
        {
            // Add project logic here
        }

        protected void editProject_Click(object sender, EventArgs e)
        {
            // Edit project logic here
        }

        protected void deleteProject_Click(object sender, EventArgs e)
        {
            // Delete project logic here
        }

        protected void AddProject_Click(object sender, EventArgs e)
        {
            // Add project modal logic here
        }

        protected void EditProject_Click(object sender, EventArgs e)
        {
            // Edit project modal logic here
        }



        //   Expertise Details Section  //


        protected void BindExpertise()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                string query = "SELECT Project, Description FROM Expertise_details";

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            expertiseGridView.DataSource = dataTable;
                            expertiseGridView.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        protected void addExpertise_Click(object sender, EventArgs e)
        {
            // Add expertise logic here
        }

        protected void editExpertise_Click(object sender, EventArgs e)
        {
            // Edit expertise logic here
        }

        protected void deleteExpertise_Click(object sender, EventArgs e)
        {
            // Delete expertise logic here
        }

        protected void AddExpertise_Click(object sender, EventArgs e)
        {
            // Handle add expertise button click
        }

        protected void EditExpertise_Click(object sender, EventArgs e)
        {
            // Handle edit expertise button click
        }




        //   Skills Percentage Section  //




        protected void BindSkills()
        {
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string query = "SELECT Skill_name, Skill_percent FROM Expertise";

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable skillsDataTable = new DataTable();
                    adapter.Fill(skillsDataTable);

                    skillsGridView.DataSource = skillsDataTable;
                    skillsGridView.DataBind();
                }
            }
        }
        protected void addSkill_Click(object sender, EventArgs e)
        {
            // Method to handle adding a new skill
        }

        protected void editSkill_Click(object sender, EventArgs e)
        {
            // Method to handle editing an existing skill
        }

        protected void deleteSkill_Click(object sender, EventArgs e)
        {
            // Method to handle deleting an existing skill
        }

        protected void AddSkill_Click(object sender, EventArgs e)
        {
            // Method to handle adding a new skill to the database
        }

        protected void EditSkill_Click(object sender, EventArgs e)
        {
            // Method to handle updating an existing skill in the database
        }




        // Mail Section


        protected void BindMailData()
        {
            try
            {
                // Connection string to your database
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                // SQL query to select data from the Contact table
                string query = "SELECT [Name], [Email], [Subject], [msg] FROM Contact";

                // Establishing connection and command objects
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Opening the connection
                        connection.Open();

                        // Creating a SqlDataAdapter to fill the DataTable
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            // Creating a DataTable to hold the retrieved data
                            DataTable mailData = new DataTable();

                            // Filling the DataTable with data from the database
                            adapter.Fill(mailData);

                            // Binding the DataTable to the GridView
                            mailGridView.DataSource = mailData;
                            mailGridView.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions
                Console.WriteLine("An error occurred while retrieving mail data: " + ex.Message);
            }
        }

        protected void deleteMail_Click(object sender, EventArgs e)
        {
            // Handle delete button click event here
        }








    }



}