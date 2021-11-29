# Página: https://afternoon-chamber-65383.herokuapp.com

## Commands

First, install the project dependencies:
```rb
bundle install
yarn install
```

You may need a .env file if the default values for the database configuration do not work (you can look at this values in config/database.yml). Here is an example:
```rb
DATABASE_USERNAME=MyUsername
DATABASE_PASSWORD=MyPassword
```

To run the application, run the following commands (start postgresql first):

```rb
rails db:create
rails db:migrate
rails db:seed
rails server
```

To undo the seeds:
```rb
rails db:drop # And then run the previous commands
```

If you want to create empty migrations:
```rb
rails g migration MigrationName
```

If you want to create a scaffold:
```rb
rails g scaffold Resource attribute:type another:type
```

If you want to delete a scaffold:
```rb
rails d scaffold Resource attribute:type another:type
```

To undo a migration:
```rb
rails db:rollback
```

The app has a previously created user whose credentials are:
- __Email__: `djoe@uc.cl`
- __Password__: `password`
