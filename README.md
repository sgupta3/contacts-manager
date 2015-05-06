##Contacts Manager
### A simple web application to manage your contacts.
This is my first web application using rails. This was my first project assigned to me @Fluid Media Inc.

## Requirements

### Authentication

Give user's the ability to login and logout. Protect all routes from anonymous access (i.e. a user has to be authenticated in order to view/create/edit/update/delete contacts)

### Design

The application needs to have a modern look and feel. You can use Bootstrap or other front-end CSS frameworks.

### Functionality

Once the user is authenticated, the are presented with a list of their contacts in alphabetical order. From this view the user can add a new contact or select an existing contact. Contacts need to capture the following information

- first name
- last name
- email
- phone number

If the user selects an existing contact, they are taken to the contact details page where the following information is to be displayed

- full name
- email
- phone number
- gravatar image (based on the contact's email)

From the details view, the user can choose the edit the contact information or delete the contact entirely. If the user decides to delete the contact, they need to be presented with a confirmation prior to actual deletion.
