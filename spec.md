Specifications for the Sinatra Assessment
Specs:

 Use Sinatra to build the app
 -Yes; I used the corneal gem for the initial set up, used MVC, and created tables for migrtions. 

 Use ActiveRecord for storing information in a database
-Yes; ActiveRecord was used within the models (user and anime class) to store information.

 Include more than one model class (e.g. User, Post, Category)
-Yes; There is a User model class and a Anime model class.

 Include at least one has_many relationship on your User model (e.g. User has_many Posts)
-Yes; The User model has_many Animes.

 Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
-Yes; The Anime model belongs_to User.

 Include user accounts with unique login attribute (username or email)
-Yes; User model validates uniqnuess of username and email.

 Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
-Yes; The belongs_to resource (anime model) has routes that contains creating, reading, updating, and destroying within the AnimesController.

 Ensure that users can't modify content created by other users
-Yes; Current users cant modify content that is created by another user.

 Include user input validations
-Yes; User input validations are included.

 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
-Yes; there are flash messages that shows validation failures and also success flash messages.

 Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
 -Yes; A short description is made; Install instructions are made; The license link is in the LICENSE file. 

Confirm
 You have a large number of small Git commits
 -Yes
 Your commit messages are meaningful
 -Yes
 You made the changes in a commit that relate to the commit message
 -Yes
 You don't include changes in a commit that aren't related to the commit message
 -Yes