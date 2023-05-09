require_relative './path_command'

module GridGenerator
  module Svg 
    class QuadraticCommand < GridGenerator::Svg::PathCommand
      def type
        'Q'
      end
    end
  end
end

