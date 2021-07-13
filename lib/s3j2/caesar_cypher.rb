module S3J2
  module CaesarCypher
    # Will cypher the text by shifting it by the given shift amount
    # @param text [String] the text to cypher
    # @param shift [Integer] the amount to shift the text by
    # @return [String] the cyphered text
    def self.caesar_cypher(text, shift)
      raise ArgumentError, 'Shift is not a number' unless shift.is_a?(Integer)

      (shift % 26)
        .times
        .with_object(text.to_s.dup) { |_, res| res.tr!('a-zA-Z', 'b-zaB-ZA') }
    end
  end
end
