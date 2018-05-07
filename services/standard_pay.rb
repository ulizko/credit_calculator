class StandardPay
  def self.calculate(amount, rate, term)
    debt = amount
    (0...term).each_with_object([]) do |e, o|
      debt = amount - (month_amount * e)
      percents = (debt / 100.0) * month_rate
      line = {
        month: e + 1,
        debt: debt,
        repayment: month_amount,
        percents: percents,
        payments: (percents + month_amount).round(2)
       }
       o << line
    end
  end
end