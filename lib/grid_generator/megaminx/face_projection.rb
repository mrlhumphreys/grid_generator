require 'matrix'
require_relative '../rotator'
require_relative '../helper'
require_relative '../line'

module GridGenerator
  module Megaminx
    class FaceProjection
      # units 30 - pentagon 90 - megaminx - 150
      # units * 5 
      #       *****
      #        *** 
      #        ***
      #        
      #  ***   ***   ***
      #  ***   ***   ***
      # ***** ***** *****
      #
      #    ***** *****
      #     ***   ***
      #     ***   ***
      def initialize(x:, y:, units:, elements: [])
        @x, @y = x, y
        @units = units
        @elements = elements
      end

      attr_reader :x, :y, :units, :elements

      def offset
        @offset ||= Matrix.column_vector([x, y])
      end

      def decagon_radius
        5 * units
      end

      def decagon_top_point
        Matrix.column_vector([
          decagon_radius,
          0 
        ])
      end

      def rotation_point
        Matrix.column_vector([
          decagon_radius,
          decagon_radius
        ])
      end

      def decagon_points
        @decagon_points ||= (0..9).map do |i|
          angle = 2.0 * Math::PI * i / 10.0
          rotator = GridGenerator::Rotator.new(angle: angle, rotation_point: rotation_point)    
          rotator.rotate(decagon_top_point)
        end
      end

      # also equal to pentagon radius
      def decagon_side_length 
        @decagon_side_length ||= GridGenerator::Helper.distance(decagon_points[0], decagon_points[1])
      end

      def pentagon_top_point
        @pentagon_top_point ||= Matrix.column_vector([
          decagon_radius,
          decagon_radius - decagon_side_length 
        ])
      end

      def pentagon_points 
        @pentagon_points ||= (0..4).map do |i|
          angle = 2.0 * Math::PI * i / 5.0
          rotator = GridGenerator::Rotator.new(angle: angle, rotation_point: rotation_point)    
          rotator.rotate(pentagon_top_point)
        end
      end

      def top_right_pentagon_points
        @top_right_pentagon_points ||= [
          decagon_points[0],
          decagon_points[1],
          decagon_points[2],
          pentagon_points[1],
          pentagon_points[0]
        ]
      end

      def right_pentagon_points
        @right_pentagon_points ||= [
          decagon_points[2],
          decagon_points[3],
          decagon_points[4],
          pentagon_points[2],
          pentagon_points[1]
        ]
      end

      def top_right_face_lines_raw
        (0..4).map do |i| 
          a = top_right_pentagon_points[i]
          b = top_right_pentagon_points[(i+1)%5]
          c = top_right_pentagon_points[(i+2)%5]
          d = top_right_pentagon_points[(i+3)%5]

          ab_intervals = GridGenerator::Helper.intervals(a,b,2)
          cd_intervals = GridGenerator::Helper.intervals(c,d,2)

          GridGenerator::Line.new(a: ab_intervals[-1], b: cd_intervals[0])
        end
      end

      # for svg
      def connecting_lines
        pentagon_points.each_with_index.map do |p, i|
          d = decagon_points[i*2]
          GridGenerator::Line.new(a: p, b: d) + offset
        end
      end

      # for svg
      def top_right_face_lines
        top_right_face_lines_raw.map { |l| l + offset }
      end

      # for svg
      def right_face_lines
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.4, rotation_point: rotation_point)
        top_right_face_lines_raw.map { |l| rotator.rotate(l) + offset } 
      end

      # for svg
      def down_face_lines
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.8, rotation_point: rotation_point)
        top_right_face_lines_raw.map { |l| rotator.rotate(l) + offset } 
      end

      # for svg
      def left_face_lines
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 1.2, rotation_point: rotation_point)
        top_right_face_lines_raw.map { |l| rotator.rotate(l) + offset } 
      end

      # for svg
      def top_left_face_lines
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 1.6, rotation_point: rotation_point)
        top_right_face_lines_raw.map { |l| rotator.rotate(l) + offset } 
      end

      # for svg
      def front_face_lines
        (0..4).map do |i| 
          a = pentagon_points[i]
          b = pentagon_points[(i+1)%5]
          c = pentagon_points[(i+2)%5]
          d = pentagon_points[(i+3)%5]

          ab_intervals = GridGenerator::Helper.intervals(a,b,2)
          cd_intervals = GridGenerator::Helper.intervals(c,d,2)

          GridGenerator::Line.new(a: ab_intervals[-1], b: cd_intervals[0]) + offset
        end
      end

      # for svg
      def decagon_points_string
        decagon_points.map { |p| p + offset }.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

      # for svg
      def pentagon_points_string
        pentagon_points.map { |p| p + offset }.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

    end
  end
end

