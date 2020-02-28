# README

This README would normally document whatever steps are necessary to INSTRUCTIONS _ _ _ __ __ _ _ _ RANDOM COMMANDS :::::::::

bundle rake db:create rake db:migrate rake db:test:prepare rake db:seed

*rails new 'app name'

*Add gem 'jquery-rails' to GemFile

&& Add group :development, :test do gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] gem 'rspec-rails' gem 'launchy' gem 'pry' end to Gemfile

bundle exec rails generate rspec:install (in Terminal)

run rails server in Root dir of project [rails s]

rake db:create

rails g migration create_[class] (plural)

Go into db/migrate/2438403258923095723509[project_name] & Add columns EX. t.column(:title, :string) && t.timestamps() * t.string: name*

*rake db:migrate

*rake db:test:prepare

*create new file in app/models/[class_name].rb (singular naming)and Add class [class_name] < ApplicationRecord end

rails g migration create_[class] for additional classes

FOR MANY 2 MANY RELATIONSHIPS { * rails g migration join_[class]and[class] (for join tables)

*Add
create_table :albums_artists, id: false do |t| t.belongs_to :artist, index: true t.belongs_to :album, index: true end in [class]_[class].rb (alpha + plural)

*Add has_and_belongs_to_many(:class) (plural)

                        in app/models/class.rb
}

---->  t.integer :product_id  <-------  Don't forget!! (singular!!!!)
in new migration, set up relationship between Class1 and Class2 "rails g migration add_foreign_key_for_[class2]"

in new migration, set up foreign key relationship between Class1 and Class2

create a new Model for class in 'app/models/class_name.rb (singular)

Class2 belongs_to :class1, Class1 has_many :class2

class Song < ApplicationRecord
  belongs_to :album
end

class Album < ApplicationRecord
  has_many :songs
end
Add 'models' folder to spec folder and add the album_spec.rb & song_spec.rb

Add require 'rails_helper' to album_spec.rb

Add group :test do gem 'shoulda-matchers' end to GemFile ¡AFTER! all other blocks

Add
Shoulda::Matchers.configure do |config| config.integrate do |with| with.test_framework :rspec with.library :rails end end to spec/rails_helper.rb

Add require 'rails_helper'

      describe Album do
        it { should have_many :songs }
      end                                          
                                      to spec/models/album_spec.rb
Add require 'rails_helper'

   describe Album do
     it { should belong_to :albums }
   end                                          
                                  to spec/models/song_spec.rb
========MANY TO MANY ======
describe(Album) do it { should have_and_belong_to_many :employees }
end
Add validation for title and length: spec/models/album_spec.rb

describe(Album) do it { should validate_length_of(:name).is_at_most(100) } end

Add validation logic in app/models/album.rb

class Album < ApplicationRecord validates :name, presence: true end

*Add
before_save(:titleize_survey)

              private
              def titleize_survey
                self.title = self.title.titleize
              end

              end                                                            
                                           to app/models/album.rb
*Add Rails.application.routes.draw do root to: 'albums#index' resources :albums do resources :songs end end

                  ========MANY TO MANY ======  



                  ===========================
                                         to config/routes.rb
Check routes in terminal (rake routes)

Add "app/controllers/[class]s_controller.rb" file

"class [Class]sController < ApplicationController"

make all the ruby methods
rename album to survey
change :genre to :author
Add layout views folders/files for new/edit forms in "apps/views/[class]s edit.html.erb index.html.erb new.html.erb show.html.erb

Add _errors.html.erb

<% if object.errors.any? %>

Please fix these errors:
<% object.errors.full_messages.each do |message| %>
<%= message %>
<% end %>
<% end %> to apps/views/layouts
*Add _[class]_form.html.erb" (w/ underscores)

                                    to apps/views/layouts/
*Add
<%= render "layouts/errors", :object => @[class]] %>

        <%= form_for @[class]] do |f| %>
        <%= f.label :div_name %>
        <%= f.text_field :div_name %>
        <%= f.submit %>
        <% end %>
                                     to apps/views/layouts/[class]
Add 'faker' to Gemfile & bundle

Add Division.destroy_all Employee.destroy_all

50.times do |index| divisions = [] divisions.push(Division.create!(div_name: Faker::TvShows::BreakingBad.episode)) divisions rand(3..15).times do |employee| divisions.each do |division| Employee.create! :name => Faker::Superhero.name, :division_id => division.id end end end

p "Created #{Division.count} divisions" to db/seeds.rb

++++++++AUTHENTIFICATION INSTRUCTIONS+++++++++++

*uncomment "bcrypt" gem and bundle (ensure that require "bcrypt" is in config/application.rb)

rails g migration add_users class AddUsers < ActiveRecord::Migration[5.0] def change create_table :users do |t| t.column :email, :string t.column :password_hash, :string t.column :password_salt, :string end end end
*Rake db:migrate / rake db:test:prepare

*Add "user.rb" to app/models folder

*Add class User < ApplicationRecord attr_accessor :password validates_confirmation_of :password validates :email, :presence => true, :uniqueness => true before_save :encrypt_password

      def encrypt_password
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
      end

      def self.authenticate(email, password)
        user = User.find_by "email = ?", email
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          user
        else
          nil
        end
      end
    end
                         to app/models/user.rb
*Add
get '/signup' => 'users#new' post '/users' => 'users#create'

        get '/signin' => 'sessions#new'
        post '/signin' => 'sessions#create'
        get '/signout' => 'sessions#destroy'

                                    to config/routs.rb
*Add "users_controller.rb" & "sessions_controller.rb"

                 to app/controllers
*Add class UsersController < ApplicationController

def new @user = User.new end

def create @user = User.new(user_params) if @user.save flash[:notice] = "You've successfully signed up!" session[:user_id] = @user.id redirect_to "/" else flash[:alert] = "There was a problem signing up." redirect_to '/signup' end end

private

def user_params params.require(:user).permit(:email, :password, :password_confirmation) end end

                            to users_controller.rb
*Add

class SessionsController < ApplicationController def create @user = User.authenticate(params[:email], params[:password]) if @user flash[:notice] = "You've signed in." session[:user_id] = @user.id redirect_to "/" else flash[:alert] = "There was a problem signing in. Please try again." redirect_to signin_path end end

def destroy session[:user_id] = nil flash[:notice] = "You've signed out." redirect_to "/" end end to sessions_controller.rb

*Add

protect_from_forgery with: :exception helper_method :current_user

def current_user if session[:user_id] @current_user ||= User.find(session[:user_id]) end end to app/controllers/application_controller.rb

add app/views/users/new.html.erb

Sign up
<%= form_for @user do |f| %> <%= f.label "Email" %> <%= f.text_field :email %> <%= f.label "Password" %> <%= f.password_field :password %> <%= f.label :password_confirmation %> <%= f.password_field :password_confirmation %> <%= f.submit "Sign Up" %> <% end %>
      app/views/sessions/new.html.erb
        <h1>Sign in</h1>
        <%= form_tag signin_path do %>
          <%= label_tag :email %>
          <%= text_field_tag :email %>
          <%= label_tag :password %>
          <%= password_field_tag :password %>
          <%= submit_tag "Sign in" %>
        <% end %>
add
app/views/layouts/application.html.erb

<% if current_user %> <%= current_user.email %> | <%= link_to "Sign out", '/signout' %> <% else %> <%= link_to "Sign up", 'signup' %> | <%= link_to "Sign in", '/signin' %> <% end %>

add

app/controllers/application_controller.rb

  class ApplicationController < ActionController::Base

  …

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

  end
add
app/controllers/just_another_controller.rb class JustAnotherController < ApplicationController before_action :authorize, only: [:secret]

  def secret
  end

end
restart rails server!!!
*Add factory_bot_rails -- to Gemfile in test:

*Add factories.rb into spec folder and put in :::

FactoryBot.define do factory(:task) do name {'Knit the sock monkey'} end end

*Add gem 'simplecov', require: false to Gemfile

Bundle install!
*Add

require 'simplecov'

SimpleCov.start

             to spec/spec_helper
*change config/environments/test.rb to....

      config.eager_load = true
