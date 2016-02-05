## Date A Programmer ("Замуж За Программиста") -  online dating for programmers and non programmers.
Meet new smart people, learn and create programming, find a job

## Technologies and services

* Ruby On Rails (Ruby Version 2.1.1, Rails Version 4.1.1)
* HAML (for views)
* Mandrill (to send emails with notifications)
* Amazon AWS S3 (to store photo files)
* Heroku to run the application and the chat server
* Cloudfront (to cache assets to get high performance of the main application)
* Postgresql database
* Faye (for the realtime chat) 
* Puma web server

## License
* The code is licensed under Apache License 2.00
* Copyright &copy; 2014-2015 Evgenii Mironichev

#### Founder and Junior Developer: Evgenii Mironichev [@emironic](https://twitter.com/emironic)
#### Leading Developer, Backend & Frontend, JS, Deployment, Design: Nitin Barai (http://www.sheltersoft.in) <a href="mailto:info@sheltersoft.in?subject=DATEPROG">info@sheltersoft.in</a>

## Instructions

### Setting up development environment on local machine

1. clone the repo, install required bundle, copy default files, run migrations and seed data on your local machine,

```bash
~/ $ git clone git@github.com:emirn/dateprog.git
~/ $ cd dateprog
~/dateprog $ bundle install
~/dateprog $ cp config/application-default.yml config/application.yml
~/dateprog $ cp config/database-default.yml config/database.yml
~/dateprog $ cp config/application-default.yml config/application.yml
~/dateprog $ cp gitignore-default .gitignore
~/dateprog $ rake db:create
~/dateprog $ rake db:reset
```

2. Now you may run the local server

```bash
~/dateprog $ rails s
```

Note: If you are using [Cloud9](https://c9.io) IDE then use the following command instead:
```bash
~/dateprog $ rails s -b $IP -p $PORT
```

**DEFAULT LOGINS**
- admin control panel at `http://localhost:3000/admin/login` with `admin@example.com` as login and `dateprog` as password
- test users: `test1@example.com` as login and `12345` as default password

4. Realtime chat server: clone and run your own faye rails server required for the realtime chat

````bash
~/dateprog $ cd ..
~/ $ git clone https://github.com/nitinbarai777/dateprogfaye.git
~/ $ cd dateprogfaye
````

-  create the application for Faye server on Heroku and deploy the `dateprogfaye` application to it
  
````bash
~/dateprogfaye $ git push heroku master
````

- in the local `dateprog` folder do the following
  - copy the URL of your Faye server on Heroku from browser (for example `https://YOURFAYEINSTANCE.herokuapp.com`)
  - paste that URL into the `FAYE_ENDPOINT` variable in the `config/application.yml`

4. Precompile assets for Dateprog application for the production (to run on Heroku):

````bash
~/dateprog $ RAILS_ENV=production rake assets:precompile
~/dateprog $ git add .
~/dateprog $ git commit -m "assets were precompiled for the production"
````

5. Create the application on Heroku to deploy the `dateprog` app into it
6. Setup the production environment varables for Heroku

The project uses [Figaro](https://github.com/laserlemon/figaro) gem that uses environment variables to store tokens and keys in application.yml.
Variables are stored in /config/application.yml that you **have** to update with your own generated keys and tokens.

````bash
~/dateprog $ figaro heroku:set -e production
````

7. Finally push the `dateprog` to the Heroku to run in production

````bash
~/dateprog $ git push heroku master
````

8. Run the database migration on Heroku and seed the default data

````bash
~/dateprog $ heroku run rake db:migrate
~/dateprog $ heroku run rake db:seed
````

9. See `config/application.yml` for tokens and variables you will need to set for use 3rd party services to upload photo, send emails etc

