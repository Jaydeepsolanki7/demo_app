<h1>Bus Booking System</h1>
A bus booking system built with Ruby on Rails, using several popular gems such as Devise, Kaminari, LetterOpener, Faker, and Rolify.

<h1>Features</h1>

User authentication and authorization using Devise and Rolify.
Paginated booking listings with Kaminari.
Development email previews with LetterOpener.
Seed data generation with Faker.
Table of Contents
Installation
Usage
Configuration
Contributing
License
Installation
To get the bus booking system up and running on your local machine, follow these steps:

Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/bus-booking-system.git
Install the required gems:

bash
Copy code
bundle install
Set up the database:

bash
Copy code
rails db:create
rails db:migrate
Seed the database with sample data (optional):

bash
Copy code
rails db:seed
Start the Rails server:

bash
Copy code
rails server
The application should now be running at http://localhost:3000.

Usage
User Authentication
The system uses Devise for user authentication. New users can sign up, while existing users can log in.

Bus Booking
Users can browse available buses and book tickets.
Booking listings are paginated using Kaminari.
Email Previews
You can preview emails sent by the application in development mode using LetterOpener. Access email previews at http://localhost:3000/rails/mailers.

User Roles
User roles and authorization are managed with Rolify. Roles include Admin and User.

Configuration
Environment Variables
Set up your environment variables in a .env file or your preferred method for managing secrets. Required variables may include:

DATABASE_URL: Your database connection URL.
SECRET_KEY_BASE: Rails application secret key.
MAILER_EMAIL: Email for sending booking confirmations.
MAILER_PASSWORD: Password for sending booking confirmations.
...
Seed Data
You can customize seed data by modifying the db/seeds.rb file.

Admin Role
To assign an admin role to a user, use the Rails console:

ruby
Copy code
user = User.find_by(email: 'admin@example.com')
user.add_role(:admin)
Production Deployment
When deploying to production, set up a production-ready database and ensure you configure your web server appropriately. Also, secure your environment variables and consider using a production-ready email service.

Contributing
Contributions are welcome! Feel free to open issues or pull requests.

