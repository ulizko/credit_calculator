class Annuity
  
  def initialize(amount, month_rate, term)
    @amount = amount
    @term = term
    @month_rate = month_rate
    @left = amount
  end
  
  def calculate
    (0...term).each_with_object([]) do |el, obj|
      obj << OpenStruct.new(base: base_sum, percents: percents, left: left, month_payment: month_payment)
      @left = (left - base_sum).round(2)
    end
  end

  private

  attr_reader :amount, :term, :month_rate, :left

  def base_sum
    (month_payment - percents).round(2)
  end

  def percents
    (left * month_rate).round(2)
  end

  def month_payment
    @month_payment ||= (amount * (month_rate + month_rate / ((1 + month_rate) ** term - 1))).round(2)
  end
end
