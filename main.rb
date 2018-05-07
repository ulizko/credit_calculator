require 'sinatra/base'
require './controllers/base_controller.rb'
require './controllers/home_controller.rb'
require './home'

class Main < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }

  register Home

  # get '/' do
  #   erb :index
  # end
end