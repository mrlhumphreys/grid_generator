module GridGenerator
  module Svg 
    class Path 
      def initialize(d: , style:)
        @d = case d
             when String
               d
             when Array
               d.map(&:to_s).join(' ')
             else
               raise ArgumentError, "d must be String or Array" 
             end
        @style = case style
                 when GridGenerator::Svg::Style
                   style.to_s
                 when String
                   style
                 else
                   raise ArgumentError, "style must be String or Style" 
                 end
      end

      attr_reader :d, :style

      def to_svg
        "<path d=\"#{d}\" style=\"#{style}\" />"
      end
    end
  end
end
