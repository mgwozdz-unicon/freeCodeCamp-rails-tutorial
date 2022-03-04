# Ruby on Rails Notes
These are the notes I took while going through this free Ruby on Rails course: https://www.youtube.com/watch?v=fmyvWz5TUWg

Install everything here: https://guides.rubyonrails.org/getting_started.html

## To upgrade Ruby version and install Rails:
```
command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
\curl -L https://get.rvm.io | bash -s stable
source /Users/mgwozdz/.rvm/scripts/rvm
rvm | head -n 1
rvm use ruby --install --default
gem install rails
rails --version
```

## Start a new project:
`rails new <project name>`

## Start the server
`rails s`

## Rails generate a controller for the home page:
`rails g controller home index`

## Display report of all routes:
`rails routes`

## Crud scaffold for roster data model command:
`rails g scaffold roster first_name:string last_name:string email:string phone:string`

### Push model into database:
`rails db:migrate`

## Setting up Authentication:
rubygems.org
search for devise
copy version line into Gemfile
`bundle install`
On rubygems.org, click on the Documentation for devise
`rails generate devise:install`
Follow the instructions that were output, including:
```
rails g devise:views
rails generate devise User
rails db:migrate
```

## Setting up Associations (joining two db tables):
https://edgeguides.rubyonrails.org/association_basics.html
In roster data model, add `belongs_to :user`.
In user data model, add `has_many :rosters`
In terminal, generate migration to add user_id to rosters table as an index. Then push the migration.
```
rails g migration add_user_id_to_rosters user_id:integer:index
rails db:migrate
```

## Use Heroku for Hosting
Google "heroku toolbelt" to find the Heroku CLI
Install the CLI
Verify the installation by typing `heroku --version` in the terminal
There will be a warning and a version in the output
Sign up for a free account at heroku.com
In the terminal, enter `heroku login` to login to the CLI
`heroku create`
This will output the url for your app. You can change the name of the app...
`heroku rename railsroster`







