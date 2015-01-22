Steps:

- add devise gem to Gemfile

```
rails g devise install
rails g devise:install
```
follow the instructions for devise

-
```
rails g devise:views
rails g devise User
bundle exec rake db:migrate
```
-  user and photos association in models (has_many, belongs_to)

```
rails g migration add_user_id_to_photos user_id:integer:index
rake db:migrate
```

- fix db connection error in rails c  --> config/applicaton.rb
- 