require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/food.rb'
require_relative './controllers/food_controllers.rb'

use Rack::MethodOverride

run FoodController
