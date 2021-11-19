# README

## Commands

To run the application, run the following commands (start postgresql first)

```rb
rails db:create
rails db:migrate
rails db:seed
rails server
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
