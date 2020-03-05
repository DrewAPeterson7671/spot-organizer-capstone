# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* Three Places

* # config/application.rb

* RSpotify::authenticate("<your_client_id>", "<your_client_secret>")

* # config/initializers/omniauth.rb

* require 'rspotify/oauth'
* Rails.application.config.middleware.use OmniAuth::Builder do
*  provider :spotify, "<your_client_id>", "<your_client_secret>", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
* end

* https://medium.com/@cam_irmas/crazy-train-exploring-the-spotify-api-with-rails-part-1-81eac0475cb1

* https://www.rubydoc.info/github/guilhermesad/rspotify/master/frames

* bundle rake db:create rake db:migrate rake db:test:prepare rake db:seed

* rails new 'app name'

* Add gem 'jquery-rails' to GemFile

* rails new spotify-demo -d postgresql -T

* && Add group :development, :test do gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] gem 'rspec-rails' gem 'launchy' gem 'pry' end to Gemfile

* bundle install
* bundle exec figaro install
* bundle exec rails generate rspec:install (in Terminal)
* rake db:create
* rake db:migrate
* rake db:test:prepare
* rake routes
* rails s


figaro
https://github.com/laserlemon/figaro
create figaro files, see email.


rails g migration create_[class] (plural)

https://github.com/omniauth/omniauth
