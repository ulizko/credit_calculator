class CalculatorService

  attr_reader :amount, :term, :rate, :payoff

  def initialize(params)
    @amount = params[:amount]
    @term = params[:term]
    @rate = params[:rate]
    @payoff = params[:payoff]
  end

  def calc
    (0...term).each_with_object([]) do |month, obj|
      obj << payoff.calculate()
    end
  end

  # def calculate

  #   debt = amount
  #   (0...term).each_with_object([]) do |e, o|
  #     debt = amount - (month_amount * e)
  #     percents = (debt / 100.0) * month_rate
  #     line = {
  #       month: e + 1,
  #       debt: debt,
  #       repayment: month_amount,
  #       percents: percents,
  #       payments: (percents + month_amount).round(2)
  #      }
  #      o << line
  #   end
  # end

  def month_rate(rate)
    (rate.to_f / 12).round(4)
  end

  def month_amount(amount, term)
    (amount.to_f / term).round(2)
  end

  def body_for(month)
    amount - (month_amount * e)
  end

  def an_proc
    amount_after_month * month_rate
  end

  def ann_pay(amount, month_rate, term)
    amount * (month_rate + month_rate / ((1 + month_rate) ** term - 1))
  end

  # def debt
  #   amount - (month_amount * e)
  # end
end

# a = CalculatorService.new(amount: 10000, term: 10, rate: 10)