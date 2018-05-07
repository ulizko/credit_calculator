require 'sinatra'

set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, "views") }

get '/' do
  erb :index
end