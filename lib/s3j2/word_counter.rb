# frozen_string_literal: true
module S3J2
  module WordCounter
    # Count the number of occurences of a word in a dictionary.
    # @param [String] sentence The sentence to be split up to count.
    # @param [Array] dictionary The dictionary to count the words in.
    # @return [Hash] The number of occurences for each words in the dictionary.
    def self.word_counter(text, dictionary)
      words = text.downcase.scan(/\w+/)

      dictionary
        .each
        .with_object({}) do |word, result|
          if (size = (words.filter { |w| w.include?(word.downcase) }).size) > 0
            result[word] ||= 0
            result[word] += size
          end
        end
    end

    def self.file_to_dict(path)
      File.readlines(path).map(&:strip)
    end
  end
end
