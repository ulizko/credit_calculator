require 'sinatra/base'

class Main < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    erb :index
  end
end