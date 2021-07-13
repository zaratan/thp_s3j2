# frozen_string_literal: true
module S3J2
  module DayTrader
    Roi = Struct.new(:roi, :days)

    # It returns the best possible gain given the coming day values.
    # @param [Array] day_values
    # @return [Integer] Max gain
    def self.day_trader(options)
      if !options.is_a?(Array) || options.size < 2
        raise ArgumentError,
              "Option format isn't right. It should be an array with at least 2 elements."
      end
      rois(options).max_by(&:roi).days
    end

    def self.rois(day_prices)
      day_prices.map.with_index do |current_day, index|
        roi_day(day_prices.slice(index..), current_day, index)
      end
    end

    def self.roi_day(day_prices, current_day, index)
      max = day_prices.max
      max_index = day_prices.index(max)
      roi = max - current_day
      Roi.new(roi, [index, max_index + index])
    end
  end
end
