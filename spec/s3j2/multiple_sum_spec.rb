describe S3J2::MultipleSum do
  describe '#is_multiple_of_3_or_5?' do
    it 'should return TRUE when an integer is a multiple of 3 or 5' do
      expect(described_class.multiple_of_3_or_5?(3)).to be_truthy
      expect(described_class.multiple_of_3_or_5?(5)).to be_truthy
      expect(described_class.multiple_of_3_or_5?(51)).to be_truthy
      expect(described_class.multiple_of_3_or_5?(45)).to be_truthy
    end

    it 'should return FALSE when an integer is NOT a multiple of 3 or 5' do
      expect(described_class.multiple_of_3_or_5?(8)).to be_falsy
      expect(described_class.multiple_of_3_or_5?(13)).to be_falsy
      expect(described_class.multiple_of_3_or_5?(31)).to be_falsy
      expect(described_class.multiple_of_3_or_5?(19)).to be_falsy
    end
  end

  it 'works with 1' do
    expect(described_class.sum_of_3_or_5_multiples(1)).to eq(0)
  end

  it 'works with 0' do
    expect { described_class.sum_of_3_or_5_multiples(0) }.to raise_error(
      /entiers naturels/,
    )
  end

  it 'works with -123' do
    expect { described_class.sum_of_3_or_5_multiples(-123) }.to raise_error(
      /entiers naturels/,
    )
  end

  it 'works with "lol"' do
    expect { described_class.sum_of_3_or_5_multiples('lol') }.to raise_error(
      /entiers naturels/,
    )
  end

  it 'works with 4' do
    expect(described_class.sum_of_3_or_5_multiples(4)).to eq(3)
  end

  it 'works with 6' do
    expect(described_class.sum_of_3_or_5_multiples(6)).to eq(8)
  end

  it 'works with 10' do
    expect(described_class.sum_of_3_or_5_multiples(10)).to eq(23)
  end

  it 'works with 11' do
    expect(described_class.sum_of_3_or_5_multiples(11)).to eq(33)
  end
end
