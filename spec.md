# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Used Sinatra to handle requests to and from the server.
- [x] Use ActiveRecord for storing information in a database - Used rake migrations to create tables and association between users and squirrels.
- [x] Include more than one model class (e.g. User, Post, Category) - My models are Users and Squirrels.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - A User has many Squirrels
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Squirrels belong to a User
- [x] Include user accounts with unique login attribute (username or email) - users can create accounts with unique usernames and emails and log in.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Users can create new Squirrels, view individual Squirrels, edit and delete only their own Squirrels.
- [x] Ensure that users can't modify content created by other users - The logged in user is checked against the Squirrel's owner to confirm ownership before a Squirrel can be edited or delted
- [x] Include user input validations - Users cannot enter blank information into the forms.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - no error messages in this version, but there is error handling for invalid routes.
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
