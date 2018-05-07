describe CalculatorService do
  let(:amount) { 100_000 }
  let(:rate) { 10 }
  let(:term) { 6 }

  describe 'calculator' do
    it 'has calculator class to equals Classic' do
      subject = described_class.new(amount, rate, term, Classic)
      expect(subject.calculator).to be_a Classic
    end

    it 'has calculator class to equals Annuity' do
      subject = described_class.new(amount, rate, term, Annuity)
      expect(subject.calculator).to be_a Annuity
    end

    it 'raise error if calculator is unacceptable' do
      expect { described_class.new(amount, rate, term, Hash) }.to raise_error(ArgumentError)
    end
  end

  describe '#calculate' do
    context 'when calculator is Classic' do

      subject { described_class.new(amount, rate, term, Classic) }

      it 'has sum of base  payments equals amount' do
        sum = subject.calculate.sum(&:base).round
        expect(sum).to eq amount
      end
    end

    context 'when calculator is Annuity' do

      subject { described_class.new(amount, rate, term, Annuity) }

      it 'has each month payment equals 17156.14' do
        month_payments = subject.calculate.map(&:month_payment)
        expect(month_payments).to all(eq 17156.14)
      end
    end
  end
end