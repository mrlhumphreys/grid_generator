require_relative './path_command'

module GridGenerator
  module Svg 
    class LineCommand < GridGenerator::Svg::PathCommand
      def type
        'L'
      end
    end
  end
end

