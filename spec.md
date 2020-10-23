### Specifications for the Sinatra Assessment
Specs:

 [x]Use Sinatra to build the app
 I used the corneal gem for the initial set up, used MVC, and created tables for migrtions. 

 [x]Use ActiveRecord for storing information in a database
 ActiveRecord was used within the models (user and anime class) to store information.

 [x]Include more than one model class (e.g. User, Post, Category)
 There is a User model class and a Anime model class.

 [x]Include at least one has_many relationship on your User model (e.g. User has_many Posts)
 The User model has_many Animes.

 [x]Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
 The Anime model belongs_to User.

 [x]Include user accounts with unique login attribute (username or email)
User model validates uniqnuess of username and email.

 [x]Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
 The belongs_to resource (anime model) has routes that contains creating, reading, updating, and destroying within the AnimesController.

 [x]Ensure that users can't modify content created by other users
 Current users cant modify content that is created by another user.

 [x]Include user input validations
 User input validations are included.

 [x]BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 -There are flash messages that shows validation failures and also success flash messages.

 [x]Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
 -[x]You have a large number of small Git commits
 -[x]Your commit messages are meaningful
 -[x]You made the changes in a commit that relate to the commit message
 -[x]You don't include changes in a commit that aren't related to the commit message