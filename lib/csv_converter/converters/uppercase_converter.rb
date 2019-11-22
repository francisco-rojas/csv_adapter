# frozen_string_literal: true

module CSVConverter
  module Converters
    # Converts a string to uppercase
    class UppercaseConverter < BaseConverter
      # Converts a string to uppercase
      # @return [String] if *data* is empty returns an empty string.
      def call
        call!
      rescue CSVConverter::Error
        nullable_object
      end

      # Converts a string to uppercase
      # @return [String] if *data* is empty an error is raised.
      def call!
        raise ArgumentError, 'no data provided' if data.blank?

        data.upcase
      rescue StandardError => e
        raise CSVConverter::Error.new(e.message, options)
      end

      private

      def nullable_object
        ''
      end
    end
  end
end
