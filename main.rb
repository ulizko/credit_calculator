require 'sinatra/base'
require "ostruct"
require './controllers/base_controller.rb'
require './controllers/calculator_controller.rb'
require './services/calculator_service.rb'
require './services/classic.rb'
require './services/annuity.rb'

class Main < Sinatra::Base

  use CalculatorController 
end
