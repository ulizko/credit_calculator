class CalculatorService
  attr_reader :calculator, :rate

  def initialize(amount, rate, term, calculator)
    @rate = rate
    @calculator = calculator.new(amount, month_rate, term)
  end

  def calculate
    calculator.calculate
  end

  private

  def month_rate
    (rate.to_f / 12 / 100).round(7)
  end
end
