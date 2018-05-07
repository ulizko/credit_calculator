class CalcAnn
  attr_reader :amount, :term, :rate, :period, :left

  def initialize(amount, term, rate)
    @amount = amount
    @term = term
    @rate = rate
    @period = 0
    @left = amount
  end

  def calculate
    # @period += 1
    (0...term).each_with_object([]) do |el, obj|
      # @period = el
      obj << OpenStruct.new(base: base_sum, percents: percents, left: left, month_payment: month_payment)
      @left -= base_sum
    end
  end

  def base_sum
    month_payment - percents
  end

  def percents
    left * month_rate
  end

  # def left
  #   amount - base_sum * period
  # end

  def month_payment
    amount * (month_rate + month_rate / ((1 + month_rate) ** term - 1))
  end

  def month_rate
    (rate.to_f / 12 / 100).round(7)
  end

end