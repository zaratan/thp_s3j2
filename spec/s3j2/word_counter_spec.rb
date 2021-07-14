# frozen_string_literal: true
describe S3J2::WordCounter do
  let(:text) { 'below' }
  let(:dictionary) do
    %w[below down go going horn how howdy it i low own part partner sit]
  end

  subject(:word_count) { described_class.word_counter(text, dictionary) }

  it 'counts correctly' do
    expect(word_count).to eq({ 'below' => 1, 'low' => 1 })
  end

  context 'with a sentence' do
    let(:text) { "Howdy partner, sit down! How's it going?" }

    it 'counts words correctly' do
      {
        'down' => 1,
        'how' => 2,
        'howdy' => 1,
        'go' => 1,
        'going' => 1,
        'it' => 2,
        'i' => 3,
        'own' => 1,
        'part' => 1,
        'partner' => 1,
        'sit' => 1
      }
    end
  end
end
