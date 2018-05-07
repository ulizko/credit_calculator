class CalculatorController < BaseController
  get '/' do
    erb :'index'
  end

  post '/calculate' do
    @schedule = CalculatorService.new(params[:amount].to_f, params[:rate].to_i, params[:term].to_i, calculator).calculate
    erb :'table'
  end

  def calculator
    case params[:payoff]
    when 'standard'
      Classic
    when 'equal'
      Annuity
    end
  end

end