Job Board Project
=================

Another Rails exercise, this time I built a basic job board application.  Users
can create and edit an account, log in and out, create and post jobs and logged
in users can apply for jobs.  Built over a three day period from 11-30 to 12-2 
2015.  Currently this is very bare bones, a site like this could have an enormous 
number of features.  At a later date a basic suite of tests using the RSpec 
framework was added.

The application is currently deployed to Heroku and can be viewed at 
https://my-jobs-board.herokuapp.com/

To get this up and running
--------------------------
_Note: This project was built in the Ruby development environment at https://c9.io/.
This simulates an IDE built on Unix.  This project should run properly on any *nix
machine (Linux, MacOS X, etc.) but getting this to work on Windows is difficult due 
to lack of support of the necessary tools.  If the user has any difficulties, I
recommend creating a Cloud9 account (seriously, it's awesome) and uploading the 
project there._

1. Clone the project.  
2. Make sure you have Ruby installed.  If not, get it [here](https://www.ruby-lang.org/en/downloads/). 
3. From the command line make sure you have bundler installed by entering "gem install bundler"
4. Navigate to the root folder of the project.
5. Run "bundle install" and rake db:migrate to set things up.  
6. Run "rails server" to get things running.  On Cloud9 run "rails s -b $IP -p $PORT"
7. Open your browser and navigate to "http://localhost:3000"  There you should see
the page.  If you are running this on Cloud9 the URL will be different, the terminal
will show you the correct URL.
8. When you're done, simply hit ctrl/cmd + c to quit the server.

Components used
---------------
* Ruby on Rails
* BCrypt
* Sass CSS
* Bootstrap
* ActionMailer
* RSpec
* ShouldaMatchers

Possible future additions
-------------------------
* Implement persistent user sessions
* Add editing and deletion of accounts and jobs
* Add additional components to the application process, including file uploads