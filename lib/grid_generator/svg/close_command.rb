require_relative './path_command'

module GridGenerator
  module Svg 
    class CloseCommand < GridGenerator::Svg::PathCommand
      def type
        'Z'
      end

      def +(_offset)
        self
      end

      def to_s
        type
      end
    end
  end
end

