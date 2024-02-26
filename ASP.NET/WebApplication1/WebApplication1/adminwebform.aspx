<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminwebform.aspx.cs" Inherits="WebApplication1.adminwebform" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel</title>
    <link rel="stylesheet" href="admin.css" />
    <style>
        /* Add your custom styles here */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Admin Panel</h1>



<!-- Social Media Link Section -->


<div class="section">
    <h2>Social Links</h2>
    <div class="actions">
        <asp:Button ID="addSocialLinkBtn" runat="server" CssClass="add-btn" Text="Add Social Link" OnClick="addSocialLink_Click" />
    </div>
    <asp:GridView ID="socialLinksTable" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:TemplateField HeaderText="Alt Text">
            <ItemTemplate>
                <asp:Label ID="lblAltText" runat="server" Text='<%# Eval("AltText") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Image Path">
            <ItemTemplate>
                <asp:Label ID="lblImagePath" runat="server" Text='<%# Eval("ImagePath") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Link">
            <ItemTemplate>
                <asp:Label ID="lblLink" runat="server" Text='<%# Eval("Link") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="editSocialButton" runat="server" Text="Edit" CssClass="edit-btn" OnClick="editSocialLink_Click" />
                <asp:Button ID="deleteSocialButton" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteSocialLink_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


</div>

<!-- Add Social Link Modal -->
<div id="addSocialLinkModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Add Social Link</h2>
        <asp:Panel ID="addSocialLinkForm" runat="server">
            <label for="altText">Alt Text:</label>
            <asp:TextBox ID="altText" runat="server" required></asp:TextBox>
            <label for="imagePath">Image Path:</label>
            <asp:TextBox ID="imagePath" runat="server" required></asp:TextBox>
            <label for="link">Link:</label>
            <asp:TextBox ID="link" runat="server" required></asp:TextBox>
            <asp:Button ID="addSocialLink" runat="server" Text="Add" OnClick="AddSocialLink_Click" />
        </asp:Panel>
    </div>
</div>

<!-- Edit Social Link Modal -->
<div id="editSocialLinkModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Edit Social Link</h2>
        <asp:Panel ID="editSocialLinkForm" runat="server">
            <asp:HiddenField ID="editSocialLinkId" runat="server" />
            <label for="editAltText">Alt Text:</label>
            <asp:TextBox ID="editAltText" runat="server" required></asp:TextBox>
            <label for="editImagePath">Image Path:</label>
            <asp:TextBox ID="editImagePath" runat="server" required></asp:TextBox>
            <label for="editLink">Link:</label>
            <asp:TextBox ID="editLink" runat="server" required></asp:TextBox>
            <asp:Button ID="editSocialLink" runat="server" Text="Update" OnClick="EditSocialLink_Click" />
        </asp:Panel>
    </div>
</div>




<!-- Projects Section -->


<div class="section">
    <h2>Projects</h2>
    <div class="actions">
        <asp:Button ID="addProjectBtn" runat="server" CssClass="add-btn" Text="Add Project" OnClick="addProject_Click" />
    </div>
    <asp:GridView ID="projectGridView" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Link" HeaderText="Link" />
            <asp:BoundField DataField="ImagePath" HeaderText="Image Path" />
            <asp:BoundField DataField="AltText" HeaderText="Alt Text" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="editProjectBtn" runat="server" Text="Edit" CssClass="edit-btn" OnClick="editProject_Click" />
                    <asp:Button ID="deleteProjectBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteProject_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- Add Project Modal -->
<div id="addProjectModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Add Project</h2>
        <asp:Panel ID="addProjectPanel" runat="server">
            <label for="addTitle">Title:</label>
            <asp:TextBox ID="addTitle" runat="server" required></asp:TextBox>
            <label for="addDescription">Description:</label>
            <asp:TextBox ID="addDescription" runat="server" TextMode="MultiLine" required></asp:TextBox>
            <label for="addLink">Link:</label>
            <asp:TextBox ID="addLink" runat="server" required></asp:TextBox>
            <label for="addImagePath">Image Path:</label>
            <asp:TextBox ID="addImagePath" runat="server" required></asp:TextBox>
            <label for="addAltText">Alt Text:</label>
            <asp:TextBox ID="addAltText" runat="server" required></asp:TextBox>
            <asp:Button ID="addProject" runat="server" Text="Add" OnClick="AddProject_Click" />
        </asp:Panel>
    </div>
</div>

<!-- Edit Project Modal -->
<div id="editProjectModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Edit Project</h2>
        <asp:Panel ID="editProjectPanel" runat="server">
            <asp:HiddenField ID="editProjectId" runat="server" />
            <label for="editTitle">Title:</label>
            <asp:TextBox ID="editTitle" runat="server" required></asp:TextBox>
            <label for="editDescription">Description:</label>
            <asp:TextBox ID="editDescription" runat="server" TextMode="MultiLine" required></asp:TextBox>
            <label for="editLink">Link:</label>
            <asp:TextBox ID="TextBox1" runat="server" required></asp:TextBox>
            <label for="editImagePath">Image Path:</label>
            <asp:TextBox ID="TextBox2" runat="server" required></asp:TextBox>
            <label for="editAltText">Alt Text:</label>
            <asp:TextBox ID="TextBox3" runat="server" required></asp:TextBox>
            <asp:Button ID="editProject" runat="server" Text="Edit" OnClick="EditProject_Click" />
        </asp:Panel>
    </div>
</div>





<!-- Expertise Details Section -->




<div class="section">
    <h2>Expertise Details</h2>
    <div class="actions">
        <asp:Button ID="addExpertiseBtn" runat="server" CssClass="add-btn" Text="Add Expertise" OnClick="addExpertise_Click" />
    </div>
    <asp:GridView ID="expertiseGridView" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Project" HeaderText="Project" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="editExpertiseBtn" runat="server" Text="Edit" CssClass="edit-btn" OnClick="editExpertise_Click" />
                    <asp:Button ID="deleteExpertiseBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteExpertise_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- Add Expertise Modal -->
<div id="addExpertiseModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Add Expertise</h2>
        <asp:Panel ID="addExpertisePanel" runat="server">
            <label for="addProject">Project:</label>
            <asp:TextBox ID="TextBox4" runat="server" required></asp:TextBox>
            <label for="addDescription">Description:</label>
            <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" required></asp:TextBox>
            <asp:Button ID="addExpertise" runat="server" Text="Add" OnClick="AddExpertise_Click" />
        </asp:Panel>
    </div>
</div>

<!-- Edit Expertise Modal -->
<div id="editExpertiseModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Edit Expertise</h2>
        <asp:Panel ID="editExpertisePanel" runat="server">
            <asp:HiddenField ID="editExpertiseId" runat="server" />
            <label for="editProject">Project:</label>
            <asp:TextBox ID="TextBox6" runat="server" required></asp:TextBox>
            <label for="editDescription">Description:</label>
            <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" required></asp:TextBox>
            <asp:Button ID="editExpertise" runat="server" Text="Update" OnClick="EditExpertise_Click" />
        </asp:Panel>
    </div>
</div>






<!-- Skill Percentage Section -->



<div class="section">
            <h2>Skills</h2>
            <div class="actions">
                <asp:Button ID="addSkillBtn" runat="server" CssClass="add-btn" Text="Add Skill" OnClick="addSkill_Click" />
            </div>
            <asp:GridView ID="skillsGridView" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Skill_name" HeaderText="Skill Name" />
                    <asp:BoundField DataField="Skill_percent" HeaderText="Skill Percent" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="editSkillBtn" runat="server" Text="Edit" CssClass="edit-btn" OnClick="editSkill_Click" />
                            <asp:Button ID="deleteSkillBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteSkill_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Add Skill Modal -->
        <div id="addSkillModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Add Skill</h2>
                <asp:Panel ID="addSkillPanel" runat="server">
                    <label for="addSkillName">Skill Name:</label>
                    <asp:TextBox ID="addSkillName" runat="server" CssClass="textbox" required></asp:TextBox>
                    <label for="addSkillPercent">Skill Percent:</label>
                    <asp:TextBox ID="addSkillPercent" runat="server" CssClass="textbox" required></asp:TextBox>
                    <asp:Button ID="btnAddSkill" runat="server" Text="Add" CssClass="btn" OnClick="AddSkill_Click" />
                </asp:Panel>
            </div>
        </div>

        <!-- Edit Skill Modal -->
        <div id="editSkillModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Edit Skill</h2>
                <asp:Panel ID="editSkillPanel" runat="server">
                    <asp:HiddenField ID="editSkillId" runat="server" />
                    <label for="editSkillName">Skill Name:</label>
                    <asp:TextBox ID="editSkillName" runat="server" CssClass="textbox" required></asp:TextBox>
                    <label for="editSkillPercent">Skill Percent:</label>
                    <asp:TextBox ID="editSkillPercent" runat="server" CssClass="textbox" required></asp:TextBox>
                    <asp:Button ID="btnEditSkill" runat="server" Text="Update" CssClass="btn" OnClick="EditSkill_Click" />
                </asp:Panel>
            </div>
        </div>









        <!-- Mail Section -->



<div class="section">
    <h2>Inbox</h2>
    <asp:GridView ID="mailGridView" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" />
            <asp:BoundField DataField="msg" HeaderText="Message" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="deleteMailBtn" runat="server" Text="Delete" CssClass="delete-btn" OnClick="deleteMail_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>










    
    
    
    
    </form>
    <script src="admin.js"></script>
</body>
</html>
