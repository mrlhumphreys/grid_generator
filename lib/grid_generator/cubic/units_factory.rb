module GridGenerator
  module Cubic
    class UnitsFactory
      def initialize(side:, type:, units:)
        raise ArgumentError "Unknown Side" unless [:top, :front, :right].include?(side)
        raise ArgumentError "Unknown Type" unless [:width, :height, :offset].include?(type)
        @side = side
        @type = type
        @units = units
      end

      attr_reader :side, :type, :units

      def top_unit
        case type
        when :width
          Matrix.column_vector([units, units/2])
        when :height
          Matrix.column_vector([-units, units/2])
        when :offset
          Matrix.column_vector([units,0])
        end
      end

      def front_unit
        case type
        when :width
          Matrix.column_vector([units, units/2])
        when :height
          Matrix.column_vector([0, units])
        when :offset
          Matrix.column_vector([0,0])
        end
      end

      def right_unit
        case type
        when :width
          Matrix.column_vector([units, (units*-0.5).to_i])
        when :height
          Matrix.column_vector([0, units])
        when :offset
          Matrix.column_vector([0,(units*0.5).to_i])
        end
      end

      def build
        case side
        when :top
          top_unit
        when :front
          front_unit
        when :right
          right_unit
        end
      end
    end
  end
end

