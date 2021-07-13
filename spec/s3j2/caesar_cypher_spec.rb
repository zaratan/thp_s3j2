# frozen_string_literal: true
describe S3J2::CaesarCypher do
  let(:text) { 'Hello, world!' }
  let(:shift) { 3 }

  subject(:cypher_text) { described_class.caesar_cypher(text, shift) }

  context 'when the text is empty' do
    let(:text) { '' }
    it 'returns an empty text' do
      expect(cypher_text).to eq ''
    end
  end

  context 'with a normal text' do
    it 'shifts the text by the correct amount' do
      expect(cypher_text).to eq 'Khoor, zruog!'
    end
  end

  context 'when the text has an upcase letter' do
    let(:text) { 'A' }

    it 'keeps the string as upcase' do
      expect(cypher_text).to eq 'D'
    end
  end

  context 'when the text has an downcase letter' do
    let(:text) { 'a' }

    it 'keeps the string as downcase' do
      expect(cypher_text).to eq 'd'
    end
  end

  context 'when the text has an unknown letter' do
    let(:text) { 'a∂a' }

    it 'keeps the letter where it is' do
      expect(cypher_text).to eq 'd∂d'
    end
  end

  context 'when the shift is 0' do
    let(:shift) { 0 }

    it 'returns the same text' do
      expect(cypher_text).to eq text
    end
  end

  context 'when the shift is negative' do
    let(:shift) { -1 }
    let(:text) { 'az' }

    it 'shifts correctly' do
      expect(cypher_text).to eq 'zy'
    end
  end

  context 'when the shift is not a number' do
    let(:shift) { 'a' }

    it 'raises an error' do
      expect { cypher_text }.to raise_error(ArgumentError)
    end
  end
end
