// Function to open the add project modal
function addProject() {
    document.getElementById("addProjectModal").style.display = "block";
}

// Function to close the modal
function closeModal() {
    document.querySelectorAll(".modal").forEach(modal => {
        modal.style.display = "none";
    });
}

// Function to open the edit project modal
function editProject(element) {
    var modal = document.getElementById("editProjectModal");
    modal.style.display = "block";

    // Fetch existing project data and populate the form fields
    var projectRow = element.closest("tr");
    var cells = projectRow.querySelectorAll("td");

    var editProjectForm = document.getElementById("editProjectForm");
    editProjectForm.elements["projectId"].value = projectRow.rowIndex; // Store the row index for later reference

    editProjectForm.elements["title"].value = cells[0].innerText;
    editProjectForm.elements["description"].value = cells[1].innerText;
    editProjectForm.elements["link"].value = cells[2].innerText;
    editProjectForm.elements["imagePath"].value = cells[3].innerText;
    editProjectForm.elements["altText"].value = cells[4].innerText;
}

// Function to delete a project
function deleteProject(element) {
    var projectRow = element.closest("tr");
    projectRow.remove();
}

// Function to open the add social link modal
function addSocialLink() {
    document.getElementById("addSocialLinkModal").style.display = "block";
}

// Function to open the edit social link modal
function editSocialLink(element) {
    var modal = document.getElementById("editSocialLinkModal");
    modal.style.display = "block";

    // Fetch existing social link data and populate the form fields
    var socialLinkRow = element.closest("tr");
    var cells = socialLinkRow.querySelectorAll("td");

    var editSocialLinkForm = document.getElementById("editSocialLinkForm");
    editSocialLinkForm.elements["socialLinkId"].value = socialLinkRow.rowIndex; // Store the row index for later reference

    editSocialLinkForm.elements["altText"].value = cells[0].innerText;
    editSocialLinkForm.elements["imagePath"].value = cells[1].innerText;
    editSocialLinkForm.elements["link"].value = cells[2].innerText;
}

// Function to delete a social link
function deleteSocialLink(element) {
    var socialLinkRow = element.closest("tr");
    socialLinkRow.remove();
}

// Function to handle form submission for adding a project
document.getElementById("addProjectForm").addEventListener("submit", function(event) {
    event.preventDefault();

    var form = this;
    var projectTable = document.getElementById("projectTable");
    var newRow = projectTable.insertRow(-1);

    newRow.innerHTML = `
        <td>${form.elements["title"].value}</td>
        <td>${form.elements["description"].value}</td>
        <td>${form.elements["link"].value}</td>
        <td>${form.elements["imagePath"].value}</td>
        <td>${form.elements["altText"].value}</td>
        <td>
            <button class="edit-btn" onclick="editProject(this)">Edit</button>
            <button class="delete-btn" onclick="deleteProject(this)">Delete</button>
        </td>
    `;

    form.reset();
    closeModal();
});

// Function to handle form submission for editing a project
document.getElementById("editProjectForm").addEventListener("submit", function(event) {
    event.preventDefault();

    var form = this;
    var rowIndex = form.elements["projectId"].value;
    var projectTable = document.getElementById("projectTable");
    var row = projectTable.rows[rowIndex];

    row.cells[0].innerText = form.elements["title"].value;
    row.cells[1].innerText = form.elements["description"].value;
    row.cells[2].innerText = form.elements["link"].value;
    row.cells[3].innerText = form.elements["imagePath"].value;
    row.cells[4].innerText = form.elements["altText"].value;

    closeModal();
});

// Function to handle form submission for adding a social link
document.getElementById("addSocialLinkForm").addEventListener("submit", function(event) {
    event.preventDefault();

    var form = this;
    var socialLinksTable = document.getElementById("socialLinksTable");
    var newRow = socialLinksTable.insertRow(-1);

    newRow.innerHTML = `
        <td>${form.elements["altText"].value}</td>
        <td>${form.elements["imagePath"].value}</td>
        <td>${form.elements["link"].value}</td>
        <td>
            <button class="edit-btn" onclick="editSocialLink(this)">Edit</button>
            <button class="delete-btn" onclick="deleteSocialLink(this)">Delete</button>
        </td>
    `;

    form.reset();
    closeModal();
});

// Function to handle form submission for editing a social link
document.getElementById("editSocialLinkForm").addEventListener("submit", function(event) {
    event.preventDefault();

    var form = this;
    var rowIndex = form.elements["socialLinkId"].value;
    var socialLinksTable = document.getElementById("socialLinksTable");
    var row = socialLinksTable.rows[rowIndex];

    row.cells[0].innerText = form.elements["altText"].value;
    row.cells[1].innerText = form.elements["imagePath"].value;
    row.cells[2].innerText = form.elements["link"].value;

    closeModal();
});


// Function to delete an email entry
function deleteMail(element) {
    var mailRow = element.closest("tr");
    mailRow.remove();
}



// Function to open the add expertise modal
function addExpertise() {
    document.getElementById("addExpertiseModal").style.display = "block";
}

// Function to open the edit expertise modal
function editExpertise(element) {
    var modal = document.getElementById("editExpertiseModal");
    modal.style.display = "block";

    // Fetch existing expertise data and populate the form fields
    var expertiseRow = element.closest("tr");
    var cells = expertiseRow.querySelectorAll("td");

    var editExpertiseForm = document.getElementById("editExpertiseForm");
    editExpertiseForm.elements["expertiseId"].value = expertiseRow.rowIndex; // Store the row index for later reference

    editExpertiseForm.elements["project"].value = cells[0].innerText;
    editExpertiseForm.elements["description"].value = cells[1].innerText;
}

// Function to delete an expertise
function deleteExpertise(element) {
    var expertiseRow = element.closest("tr");
    expertiseRow.remove();
}

// Function to handle form submission for adding an expertise
document.getElementById("addExpertiseForm").addEventListener("submit", function(event) {
    event.preventDefault();

    var form = this;
    var expertiseList = document.getElementById("expertiseList");
    var newItem = document.createElement("li");
    newItem.innerHTML = `
        <strong>${form.elements["project"].value}:</strong> ${form.elements["description"].value}
        <button class="edit-btn" onclick="editExpertise(this)">Edit</button>
        <button class="delete-btn" onclick="deleteExpertise(this)">Delete</button>
    `;
    expertiseList.appendChild(newItem);

    form.reset();
    closeModal();
});

// Function to handle form submission for editing an expertise
document.getElementById("editExpertiseForm").addEventListener("submit", function(event) {
    event.preventDefault();

    var form = this;
    var rowIndex = form.elements["expertiseId"].value;
    var expertiseList = document.getElementById("expertiseList");
    var item = expertiseList.children[rowIndex];

    item.innerHTML = `
        <strong>${form.elements["project"].value}:</strong> ${form.elements["description"].value}
        <button class="edit-btn" onclick="editExpertise(this)">Edit</button>
        <button class="delete-btn" onclick="deleteExpertise(this)">Delete</button>
    `;

    closeModal();
});


