# frozen_string_literal: true
describe S3J2::DayTrader do
  let(:options) { [17, 3, 6, 9, 15, 8, 6, 1, 10] }

  subject(:day_trader) { described_class.day_trader(options) }

  context 'when the options are empty' do
    it 'raise an error' do
      expect { described_class.day_trader([]) }.to raise_error(ArgumentError)
    end
  end

  context 'when the options have only one element' do
    it 'raise an error' do
      expect { described_class.day_trader([1]) }.to raise_error(ArgumentError)
    end
  end

  it 'work as expected' do
    expect(day_trader).to eq([1, 4])
  end
end
