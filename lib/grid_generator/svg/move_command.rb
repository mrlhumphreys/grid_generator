require_relative './path_command'

module GridGenerator
  module Svg 
    class MoveCommand < GridGenerator::Svg::PathCommand
      def type
        'M'
      end
    end
  end
end

