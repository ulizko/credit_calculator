require "ostruct"

class CalcStandard
  attr_reader :amount, :term, :rate, :period

  def initialize(amount, term, rate)
    @amount = amount
    @term = term
    @rate = rate
    @period = 0
  end

  def calculate
    # @period += 1
    (0...term).each_with_object([]) do |el, obj|
      @period = el
      obj << OpenStruct.new(base: base_sum, percents: percents, left: left, month_payment: month_payment)
    end
  end

  def base_sum
    amount / term.to_f
  end

  def percents
    left * month_rate
  end

  def left
    amount - base_sum * period
  end

  def month_payment
    base_sum + percents
  end

  def month_rate
    (rate.to_f / 12 / 100).round(4)
  end

end