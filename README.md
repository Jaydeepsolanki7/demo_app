<h1>Bus Booking System</h1>
A bus booking system built with Ruby on Rails, using several popular gems such as Devise, Kaminari, LetterOpener, Faker, and Rolify.

<h2>Features</h2>

User authentication and authorization using Devise and Rolify.
Paginated booking listings with Kaminari.
Development email previews with LetterOpener.
Seed data generation with Faker.

<h3>Table of Contents</h3>
Installation
Usage
Configuration
Contributing
License

<h3>Installation</h3>
To get the bus booking system up and running on your local machine, follow these steps:

Clone the repository:

bash

git clone https://github.com/Jaydeepsolanki7/demo_app.git
Install the required gems:

bash
Copy code
bundle install
Set up the database:

Copy code
rails db:create
rails db:migrate
Seed the database with sample data (optional):


Copy code
rails db:seed
Start the Rails server:


Copy code
rails server
The application should now be running at http://localhost:3000.

<h2>Usage</h2>
<h3>User Authentication</h3>
The system uses Devise for user authentication. New users can sign up, while existing users can log in.

<h3>Bus Booking</h3>
Users can browse available buses and book tickets.
Booking listings are paginated using Kaminari.
<h3>Email Previews</h3>
You can preview emails sent by the application in development mode using LetterOpener. Access email previews at http://localhost:3000/rails/mailers.

<h3>User Roles</h3>
User roles and authorization are managed with Rolify. Roles include Admin and User.

<h3>Configuration</h2>
Environment Variables
Set up your environment variables in a .env file or your preferred method for managing secrets. Required variables may include:

<b>DATABASE_URL</b>: Your database connection URL.
<b>SECRET_KEY_BASE</b>: Rails application secret key.
<b>MAILER_EMAIL</b>: Email for sending booking confirmations.
<b>MAILER_PASSWORD</b>: Password for sending booking confirmations.

<h3>Seed Data</h3>
You can customize seed data by modifying the db/seeds.rb file.

<h3>Admin Role</h3>
To assign an admin role to a user, use the Rails console:


user = User.find_by(email: 'admin@example.com')
user.add_role(:admin)
<h3>Production Deployment</h3>
When deploying to production, set up a production-ready database and ensure you configure your web server appropriately. Also, secure your environment variables and consider using a production-ready email service.

