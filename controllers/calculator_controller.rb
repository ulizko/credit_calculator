class CalculatorController < BaseController
  get '/' do
    erb :'index'
  end

  post '/calculate' do
    erb :'table'
  end

end