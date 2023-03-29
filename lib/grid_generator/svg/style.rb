module GridGenerator
  module Svg 
    class Style
      def initialize(fill: , stroke: , stroke_width: 1, opacity: 1) 
        @fill = fill
        @stroke = stroke
        @stroke_width = stroke_width
        @opacity = opacity
      end

      attr_reader :fill, :stroke, :stroke_width, :opacity

      def to_s
        "fill:#{fill};stroke:#{stroke};stroke-width:#{stroke_width};opacity:#{opacity};"
      end
    end
  end
end
