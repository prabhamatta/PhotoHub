# Instructions to build this cool app
-----------------------------------

```
rails new PhotoHub
```
- add gems to Gemfile
```
gem 'haml', '~> 4.0.6'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'simple_form', '~> 3.1.0'
```
 
```
bundle install
 ```
 - create Photo model
 ``` 
 rails g model Photo title:string description:text
 bundle exec rake db:migrate
 rails g controller Photos 
 ```
 - add paths to routes
 ```
 resources: photos
 root "photos#index"
 ```

CRUD for Photo
-
- create basic views for photos - index, edit, new for Photo
- start with 'new' and 'create' in Photo controller
- create form partial

```
rails g simple_form:install --bootstrap
```
- configure flash mesg in layout/application.erb (convert erb into haml)
- add before_action find_pin in Photo controller
- edit, show, delete and update in Photo controller
- edit, show, delete and update changes in views

User functionality
-
- add devise gem to Gemfile
```
rails g devise install
rails g devise:install
```
- follow the instructions for devise
```
rails g devise:views
rails g devise User
bundle exec rake db:migrate
```
- registration and session features
- flash mesgs

User and Photos association
-
 - in models (has_many, belongs_to)

```
rails g migration add_user_id_to_photos user_id:integer:index
rake db:migrate
```
- fix db connection error in rails c  --> config/applicaton.rb
- add styling (change assest/js, css, haml files)

Upload photos functionality
-
- add paperclip gem
- install image magick
- to attach image to photo, add has_attached_file and validates_attachment_content_type in Photo model
```
rails g paperclip photo image
```
- edit controller permitted phtoto_params to include image
- change show,edit and index views to show image tag

More styling with masonry gem
-
 ```
 gem 'masonry-rails', '~> 0.2.4'
 ```
- add in application.js, application.css
- changes to index, edit, show views

Photo voting functionality
-
```
gem 'acts_as_votable', '~> 0.10.0'
```
```
rails g acts_as_votable:migration
rake db:migrate
```
- add acts_as_votable in Photo model
- modify show view for upvoting

More Styling to Photo edit and User pages
-
- modify devise registration and session views
- modify photo edit view


Convert erb into haml files
-
- add `gem "erb2haml", :group => :development` to Gemfile
``` 
bundle install
bundle exec rake haml:replace_erbs
```
Restart the server `rails s`



