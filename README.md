# Setup

This project is built using Docker. You do not need docker to run the application but I will include instructions on how to setup the docker environment. 



Install Docker.


In the root directory the one with the Dockerfile and docker-compose.yml files in it run these commands.

 - docker-compose build

 This should grab and then build the linux environment form the images that are listed in the Dockerfile and docker-compose.yml


 - docker-compose up 

 This will bring up the necessary containers.

 We have one linux container where our project will live and another container for the database we are using Postgresql.

 - docker-compose down

 This will bring down the containers when you are done with them. 

 From here on out running the application is simply just using regular rails/rake commands, with the condition that you need to prefix them with this:

 - docker-compose run web {command}

 This basically runs the command you give it in the specific project container where the rails application is hosted. 


 So to get started please run:

 - docker-compose run web rake db:create

 This will create our database in our postgres container

 - docker-compose run web rake db:migrate

 As all rails users can probably guess this will migrate our database and get the schema set up.

 - docker-compose run web rake db:seed

 This command will seed our Postgres database with the data from the two CSV files provided by bonobos.

 If you would like to see the code where this is written you can find it in /db/seeds.rb


 Alright you should be up and running now!
 - http://localhost:3000


# Explanation of approach

This project is built using ruby.2.3.3, rails 5, and a React frontend.

The reason I went with Ruby on Rails was simply that that is one of the frameworks where I am fairly comfortable. I also knew that it would be fairly easy to parse a CSV and use it to seed a DB in rails, and that creating a JSON api would be easy too. Rails also makes it easy to integrate tests and dynamic frontends like react, through specific gems like react-rails.

The reason I chose docker was because, not only am I a huge fan of using docker, it makes it very easy to create the same exact environment on different Dev machines. Docker allows for quick and, most of the time painless, compartmentalization and containment of different aspects of the application, like the web server and the DB.

The reason I chose postgres was simply because I am a big fan, for a database this small and simple we could have used any relational database framework, but when applications scale Postgres, especially the new versions, has significant performance improvements over MYSQL and MSSQL. So if we wanted to add hundreds of thousands of products and items then postgres might still be a good fit.

The reason I went with React, was because the task of rendering a page by calling data from a JSON api seemed like a perfect use for react and JSX syntax. React is great for dynamically altering the DOM, and although it is not like we are frequently updating the DOM on this site, react makes it very easy to render data from an API on the page.


# Improvements

If I had more time, I kept myself to the 3-4 hour limit, I would like to explore building this out in a different framework besides rails. Rails in my honest opinion seems like a little overkill for this application. The reason I went with it is because I knew rails had the capabilities to do this, and it would be fairly painless.

I would really like to investigate more slim frameworks to build this out, like PHP's Slim Framework, Ruby's Sinatra, and maybe even Node.JS Express.

What I would really like to do is build this in a Server-less environment, it seems that this small scale application would be a great opportunity to use Lambda functions and API gateway to connect to a database. You could hook up your Lambda functions to the Database and then call your lambda functions through API endpoints invoked form an S3 bucket hosted site, then you could render the JSON data returned by the API with some simple frontend work. 

That solution would need far fewer files haha.

# Thanks

Thank you guys for giving me this wonderful opportunity to code! I got to use react which I haven’t touched for a few months so I definitely feel a little less rusty after this haha. Thanks!


