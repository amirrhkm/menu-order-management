# Resturant Menu Management System

#### This project is developed using a combination of HTML and CSS alongside JSP (Jakarta Server Page) and Java. Additionally, it utilizes Oracle RDBMS and JDBC (Java Database Connectivity) for database interaction. It comprises four distinct modules that seamlessly connect and interact to complement each other's functionalities: For instance, the [1] Menu Module presents the menu list and associated details for the restaurant, while the [2] Staff Module ensures that only authorized personnel can access and perform CRUD operations to modify the menu list. The [3] Order Module facilitates the retrieval and display of all available menu items for customers to select and place orders. Finally, the [4] Kitchen Module serves to display confirmed orders placed by customers. Further details regarding each module are outlined below.

<p align="center">
  <img src="https://github.com/amirrhkm/menu-order-management/assets/152793780/518b013e-a0e7-40e9-a84d-c232fe339fb8" alt="menu_simple_diagram"/>
</p>

---

### Staff Module
The primary objective of this module is to **restrict access** to authorized personnel only. However, registration of a staff account for access is limited to individuals holding higher positions within the organization. For instance, managers are required to input their ID for access verification, after which the system validates whether the ID corresponds to a manager *(M)*, restaurant manager *(RM)*, or area manager *(AM)*. If the ID field is left empty, validations are executed, prompting the user to enter the correct ID. In case of an incorrect position ID, the system prompts with an **"Invalid ID"** message. Upon successful verification, the account creation process can proceed. Subsequently, authenticated staff members can log in and access the menu management module.

###### *this readme is incomplete!*
###### *database authorization is no longer functional!*
