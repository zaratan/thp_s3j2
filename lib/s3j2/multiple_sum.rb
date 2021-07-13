# frozen_string_literal: true
module S3J2
  module MultipleSum
    def self.multiple_of_3_or_5?(current_number)
      current_number % 3 == 0 || current_number % 5 == 0
    end

    # Will sum all the multiple of 3 and 5 from 1 to upto the given number
    # @param [Integer] upto
    # @return [Integer] Result of the sum
    def self.sum_of_3_or_5_multiples(upto)
      unless upto.to_i > 0
        raise 'Yo ! Je ne prends que les entiers naturels. TG'
      end
      (1..(upto - 1)).inject(0) do |sum, i|
        multiple_of_3_or_5?(i) ? sum + i : sum
      end || 0
    end
  end
end
