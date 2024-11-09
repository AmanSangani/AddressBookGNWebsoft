using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.Country
{
    public partial class demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Recreate TextBoxes on every postback to persist them
            if(IsPostBack && int.TryParse(txtNumberOfTextBoxes.Text, out int numberOfTextBoxes))
            {
                CreateTextBoxes(numberOfTextBoxes);
            }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            // Generate TextBoxes based on user input
            if(int.TryParse(txtNumberOfTextBoxes.Text, out int numberOfTextBoxes))
            {
                CreateTextBoxes(numberOfTextBoxes);
            }
            else
            {
                lblResult.Text = "Please enter a valid number.";
            }
        }

        private void CreateTextBoxes(int count)
        {
            // Clear any existing TextBoxes before adding new ones
            mainPanel.Controls.Clear();

            for(int i = 0; i < count; i++)
            {
                TextBox dynamicTextBox = new TextBox
                {
                    ID = "dynamicTextBox" + i,
                    CssClass = "form-control margin-bottom-10"
                };

                // Add the TextBox to the main panel
                mainPanel.Controls.Add(dynamicTextBox);
                mainPanel.Controls.Add(new LiteralControl("<br />")); // Add line break for spacing
            }
        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            lblResult.Text = ""; // Clear previous results

            // Retrieve values from each dynamically created TextBox
            for(int i = 0; i < mainPanel.Controls.Count; i++)
            {
                if(mainPanel.Controls[i] is TextBox dynamicTextBox)
                {
                    // Append each TextBox value to the result label
                    lblResult.Text += "Value " + (i + 1) + ": " + dynamicTextBox.Text + "<br />";
                }
            }
        }
    }
}