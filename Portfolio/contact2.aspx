<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    protected void submit_Click(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                    "mssql_portfolioConnectionString"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC sp_InsContact @name, @email, @phone, @message", conn);
            comm.Parameters.Add("@name", System.Data.SqlDbType.VarChar, 64);
            comm.Parameters["@name"].Value = name.Text;
            comm.Parameters.Add("@email", System.Data.SqlDbType.VarChar, 64);
            comm.Parameters["@email"].Value = email.Text;
            comm.Parameters.Add("@phone", System.Data.SqlDbType.VarChar, 19);
            comm.Parameters["@phone"].Value = phone.Text;
            comm.Parameters.Add("@message", System.Data.SqlDbType.VarChar, 1024);
            comm.Parameters["@message"].Value = message.InnerText;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("contact2.aspx");
            }
            catch (SqlException ex)
            {
                // Display error message
                lblError.Text = "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }
</script>

<!--
	Author: Scott Thomas
	Date:	11/1/19
	Personal Portfolio
 -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="utf-8" />
	<title>Scott Thomas</title>
	<link href="css/reset.css" rel="stylesheet" />
	<link href="css/base.css" rel="stylesheet" />
	<link href="css/contact.css" rel="stylesheet" />
	<link href="css/media.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Roboto|Source+Sans+Pro|Text+Me+One" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<nav>
		<ul>
			<li>
				<a href="start.html" class="box" id="li_1">Home</a>
			</li>
			<li>
				<a href="contact2.aspx" class="box" id="li_2">Contact<div id="contact_me">&nbsp;Me</div></a>
			</li>
			<li class="newline"><br /></li>
			<li>
				<a href="videos.html" class="box" id="li_3">Resources</a>
			</li>
			<li>
				<a href="http://www.w3expressions.com/scottthomas1/internetcafe/" class="box" id="li_4">Café</a>
			</li>
		</ul>
	</nav>
	<div class="shadow">
		<h2>Contact Me</h2>
		<div class="Card">
			<div class="box">
				<form id="form1" runat="server">
					<label for="name">Name:</label><br>
					
                    <asp:TextBox ID="name" name="name" runat="server" placeholder='john doe' size="25"></asp:TextBox>
                    <br />
					<br />

					<label for="email">Email:</label><br>
                    <asp:TextBox ID="email" AutoCompleteType="email" name="email" runat="server"  size="40"></asp:TextBox>
                    <br />

					<br />
					
					<label for="phone">Phone Number:</label><br>
					<asp:TextBox runat="server" type="tel" name="phone" size="16" id="phone"></asp:TextBox><br />
					
					<br />

					<label for="message">Message:</label><br>
					<textarea runat="server" cols="75" rows="10" name="message" id="message"></textarea><br />

					<br />

                    <asp:Button ID="submit" runat="server" Text="Submit" class="btn" OnClick="submit_Click"/>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </form>
			</div>
		</div>
		<!-- when i used the footer it caused strange graphical glitches in mobile devices with the applied background -->
		<div class="Card">
			<div class="box" id="footer">
				<div class="center_text">
					<img src="images/phone.png" alt="" />
					<div class="footer_large">Telephone:</div>
					<br class="newline" />
					<a href="tel:+12089495870"> (208)&nbsp;949-5870</a>
					<br />
					<img src="images/letter.png" />
					<div class="footer_large">Email:</div>
					<br class="newline" />
					<a href="mailto:scottthomas1@mycwi.cc"> ScottThomas1@mycwi.cc</a>
					<br />
					<img src="images/facebook.png" alt="facebook" />
					<div class="footer_large">Facebook:</div>
					<br class="newline" />
					<a href="https://wwww.facebook.com/" target="_blank">www.facebook.com</a>
					<br />
					<img src="images/twitter.png" alt="twitter" />
					<div class="footer_large">Twitter:</div>
					<br class="newline" />
					<a href="https://www.twitter.com/" target="_blank">www.twitter.com</a>
					<br />
					<img src="images/linked.png" alt="linkedin" />
					<div class="footer_large">Linkedin:</div>
					<br class="newline" />
					<a href="https://www.linkedin.com/" target="_blank">www.linkedin.com</a>
					<br />
					<img src="images/github.png" alt="github" />
					<div class="footer_large">GitHub:</div>
					<br class="newline" />
					<a href="https://github.com/scottyguythomas/Disk_Inventory/" target="_blank">www.github.com</a>
					<br />
					<a href="https://icons8.com" target="_blank">Icon pack by Icons8</a>
				</div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mssql_portfolioConnectionString %>" SelectCommand="SELECT [CID], [name], [email], [phoneNumber], [message] FROM [contactform]"></asp:SqlDataSource>
			</div>
		</div>
	</div>
</body>
</html>