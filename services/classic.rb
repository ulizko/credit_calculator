class Classic
  
  def initialize(amount, month_rate, term)
    @amount = amount
    @term = term
    @month_rate = month_rate
    @period = 0
  end
  
  def calculate
    (0...term).each_with_object([]) do |el, obj|
      @period = el
      obj << OpenStruct.new(base: base_sum, percents: percents, left: left, month_payment: month_payment)
    end
  end
  
  private
  
  attr_reader :amount, :term, :month_rate, :period

  def base_sum
    @base_sum ||= (amount / term.to_f).round(2)
  end

  def percents
    (left * month_rate).round(2)
  end

  def left
    (amount - base_sum * period).round(2)
  end

  def month_payment
    (base_sum + percents).round(2)
  end
end
