require_relative 'triangle_factory'
require_relative '../rotator'
require_relative '../scaler'

module GridGenerator
  module Pyraminx
    # * 
    # * * *
    # * * * * * 
    class Face
      def initialize(x:, y:, units:, elements:, vertical_scale: 1, rotation_angle: 0)
        @x, @y = x, y
        @units = units
        @elements = elements.split('\n').map { |r| r.split(',') }
        @vertical_scale = vertical_scale 
        @rotation_angle = rotation_angle
      end

      attr_reader :x, :y, :units, :elements, :vertical_scale, :rotation_angle

      def size
        elements.size
      end

      def centre_point
        Matrix.column_vector([
          size * units * 0.5,
          size * Math.sqrt(3) * 0.25 * units
        ])
      end

      def offset
        Matrix.column_vector([x, y])
      end

      def rotator
        @rotator ||= GridGenerator::Rotator.new(angle: rotation_angle, rotation_point: centre_point)
      end

      def scaler
        @scaler ||= GridGenerator::Scaler.new(horizontal_scale: 1, vertical_scale: vertical_scale)
      end

      def start_x_for_row(r)
        (size - 1 - r) * units / 2
      end

      def end_x_for_row(r)
        (size + 1 + r) * units / 2
      end

      def y_for_row(r)
        Math.sqrt(3)/2 * (r + 1) * units
      end

      def vertical_start_point_for_row(r)
        Matrix.column_vector([
          start_x_for_row(r),
          y_for_row(r),
        ])
      end

      def vertical_end_point_for_row(r)
        Matrix.column_vector([
          end_x_for_row(r),
          y_for_row(r)
        ])
      end

      def vertical_lines 
        Array.new(size-1) do |i|
          point_1 = vertical_start_point_for_row(i)
          point_2 = vertical_end_point_for_row(i)

          scaled_1 = scaler.scale(point_1)
          scaled_2 = scaler.scale(point_2)

          transformed_1 = rotator.rotate(scaled_1) + offset
          transformed_2 = rotator.rotate(scaled_2) + offset

          GridGenerator::BaseLine.new( 
            x1: transformed_1[0,0],
            y1: transformed_1[1,0],
            x2: transformed_2[0,0],
            y2: transformed_2[1,0]
          )
        end
      end

      def diagonal_down_start_point_for_row(r)
        Matrix.column_vector([
          start_x_for_row(r),
          y_for_row(r),
        ])
      end

      def diagonal_down_end_point_for_row(r)
        Matrix.column_vector([
          (size - 1 - r)*units,
          y_for_row(size-1)
        ])
      end

      def diagonal_down_lines 
        Array.new(size-1) do |i|
          point_1 = diagonal_down_start_point_for_row(i)
          point_2 = diagonal_down_end_point_for_row(i)

          scaled_1 = scaler.scale(point_1)
          scaled_2 = scaler.scale(point_2)

          transformed_1 = rotator.rotate(scaled_1) + offset
          transformed_2 = rotator.rotate(scaled_2) + offset

          GridGenerator::BaseLine.new( 
            x1: transformed_1[0,0],
            y1: transformed_1[1,0],
            x2: transformed_2[0,0],
            y2: transformed_2[1,0]
          )
        end
      end

      def diagonal_up_start_point_for_row(r)
        Matrix.column_vector([
          (r+1)*units,
          y_for_row(size-1),
        ])
      end

      def diagonal_up_end_point_for_row(r)
        Matrix.column_vector([
          end_x_for_row(r),
          y_for_row(r)
        ])
      end

      def diagonal_up_lines 
        Array.new(size-1) do |i|
          point_1 = diagonal_up_start_point_for_row(i)
          point_2 = diagonal_up_end_point_for_row(i)

          scaled_1 = scaler.scale(point_1)
          scaled_2 = scaler.scale(point_2)

          transformed_1 = rotator.rotate(scaled_1) + offset
          transformed_2 = rotator.rotate(scaled_2) + offset

          GridGenerator::BaseLine.new( 
            x1: transformed_1[0,0],
            y1: transformed_1[1,0],
            x2: transformed_2[0,0],
            y2: transformed_2[1,0]
          )
        end
      end

      def top
        Matrix.column_vector([
          size * units / 2,
          0
        ])
      end

      def bottom_left
        Matrix.column_vector([
          0,
          size * Math.sqrt(3)/2 * units
        ])
      end

      def bottom_right
        Matrix.column_vector([
          size * units,
          size * Math.sqrt(3)/2 * units
        ])
      end

      def points
        [ top, bottom_left, bottom_right ].map do |point|
          scaled = scaler.scale(point)
          rotator.rotate(scaled) + offset
        end
      end

      def points_string
        points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

      def element_shapes
        elements.map.each_with_index do |row, row_num|
          row.map.each_with_index do |col, col_num|
            GridGenerator::Pyraminx::TriangleFactory.new(
              x: x,
              y: y,
              row: row_num,
              col: col_num,
              units: units,
              size: size,
              face: col,
              rotator: rotator,
              scaler: scaler
            ).build unless col == '-' 
          end
        end.flatten.compact
      end
    end
  end
end
