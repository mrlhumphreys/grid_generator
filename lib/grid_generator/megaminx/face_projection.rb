require 'matrix'
require_relative '../rotator'
require_relative '../helper'
require_relative '../line'
require_relative 'face_element_factory'

module GridGenerator
  module Megaminx
    class FaceProjection
      # units 30 - pentagon 90 - megaminx - 150
      # units * 5 
      def initialize(x:, y:, units:, front_face_elements: "", top_right_face_elements: "", right_face_elements: "", down_face_elements: "", left_face_elements: "", top_left_face_elements: "")
        @x, @y = x, y
        @units = units
        @front_face_elements = front_face_elements.split(',')
        @top_right_face_elements = top_right_face_elements.split(',')
        @right_face_elements = right_face_elements.split(',')
        @down_face_elements = down_face_elements.split(',')
        @left_face_elements = left_face_elements.split(',')
        @top_left_face_elements = top_left_face_elements.split(',')
      end

      attr_reader :x, :y, :units, :front_face_elements, :top_right_face_elements, :right_face_elements, :down_face_elements, :left_face_elements, :top_left_face_elements

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
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.4, rotation_point: rotation_point)
        @right_pentagon_points ||= top_right_pentagon_points.map { |p| rotator.rotate(p) } 
      end

      def down_pentagon_points
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.8, rotation_point: rotation_point)
        @down_pentagon_points ||= top_right_pentagon_points.map { |p| rotator.rotate(p) } 
      end

      def left_pentagon_points
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 1.2, rotation_point: rotation_point)
        @left_pentagon_points ||= top_right_pentagon_points.map { |p| rotator.rotate(p) } 
      end

      def top_left_pentagon_points
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 1.6, rotation_point: rotation_point)
        @top_left_pentagon_points ||= top_right_pentagon_points.map { |p| rotator.rotate(p) } 
      end

      def front_face_lines_raw
        (0..4).map do |i|
          a = pentagon_points[i-1] # offset one so first line is top right
          b = pentagon_points[(i)%5]
          c = pentagon_points[(i+1)%5]
          d = pentagon_points[(i+2)%5]

          ab_intervals = GridGenerator::Helper.intervals(a,b,2)
          cd_intervals = GridGenerator::Helper.intervals(c,d,2)

          GridGenerator::Line.new(a: ab_intervals[-1], b: cd_intervals[0])
        end
      end

      def top_right_face_lines_raw
        @top_right_face_lines_raw ||= (0..4).map do |i| 
          a = top_right_pentagon_points[i-1] # offset by one so first line is top right
          b = top_right_pentagon_points[(i)%5]
          c = top_right_pentagon_points[(i+1)%5]
          d = top_right_pentagon_points[(i+2)%5]

          ab_intervals = GridGenerator::Helper.intervals(a,b,2)
          cd_intervals = GridGenerator::Helper.intervals(c,d,2)

          GridGenerator::Line.new(a: ab_intervals[-1], b: cd_intervals[0])
        end
      end

      def right_face_lines_raw
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.4, rotation_point: rotation_point)
        @right_face_lines_raw ||= top_right_face_lines_raw.map { |l| rotator.rotate(l) } 
      end

      def down_face_lines_raw
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.8, rotation_point: rotation_point)
        @down_face_lines_raw ||= top_right_face_lines_raw.map { |l| rotator.rotate(l) } 
      end

      def left_face_lines_raw
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 1.2, rotation_point: rotation_point)
        @left_face_lines_raw ||= top_right_face_lines_raw.map { |l| rotator.rotate(l) } 
      end

      def top_left_face_lines_raw
        rotator = GridGenerator::Rotator.new(angle: Math::PI * 1.6, rotation_point: rotation_point)
        @top_left_face_lines_raw ||= top_right_face_lines_raw.map { |l| rotator.rotate(l) } 
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
        right_face_lines_raw.map { |l| l + offset }
      end

      # for svg
      def down_face_lines
        down_face_lines_raw.map { |l| l + offset }
      end

      # for svg
      def left_face_lines
        left_face_lines_raw.map { |l| l + offset }
      end

      # for svg
      def top_left_face_lines
        top_left_face_lines_raw.map { |l| l + offset }
      end

      # for svg
      def front_face_lines
        front_face_lines_raw.map { |l| l + offset }
      end

      # for svg
      def decagon_points_string
        decagon_points.map { |p| p + offset }.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

      # for svg
      def pentagon_points_string
        pentagon_points.map { |p| p + offset }.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

      # for svg
      def front_face_element_shapes
        front_face_elements.each_with_index.map do |element, i|
          GridGenerator::Megaminx::FaceElementFactory.new(
            x: x,
            y: y,
            index: i,
            face_points: pentagon_points,
            face_lines: front_face_lines_raw,
            face: element
          ).build unless element == '-'
        end.compact
      end

      # for svg
      def top_right_face_element_shapes
        top_right_face_elements.each_with_index.map do |element, i|
          GridGenerator::Megaminx::FaceElementFactory.new(
            x: x,
            y: y,
            index: i,
            face_points: top_right_pentagon_points,
            face_lines: top_right_face_lines_raw,
            face: element
          ).build unless element == '-'
        end.compact
      end

      def right_face_element_shapes
        right_face_elements.each_with_index.map do |element, i|
          GridGenerator::Megaminx::FaceElementFactory.new(
            x: x,
            y: y,
            index: i,
            face_points: right_pentagon_points,
            face_lines: right_face_lines_raw,
            face: element
          ).build unless element == '-'
        end.compact
      end

      def down_face_element_shapes
        down_face_elements.each_with_index.map do |element, i|
          GridGenerator::Megaminx::FaceElementFactory.new(
            x: x,
            y: y,
            index: i,
            face_points: down_pentagon_points,
            face_lines: down_face_lines_raw,
            face: element
          ).build unless element == '-'
        end.compact
      end

      def left_face_element_shapes
        left_face_elements.each_with_index.map do |element, i|
          GridGenerator::Megaminx::FaceElementFactory.new(
            x: x,
            y: y,
            index: i,
            face_points: left_pentagon_points,
            face_lines: left_face_lines_raw,
            face: element
          ).build unless element == '-'
        end.compact
      end

      def top_left_face_element_shapes
        top_left_face_elements.each_with_index.map do |element, i|
          GridGenerator::Megaminx::FaceElementFactory.new(
            x: x,
            y: y,
            index: i,
            face_points: top_left_pentagon_points,
            face_lines: top_left_face_lines_raw,
            face: element
          ).build unless element == '-'
        end.compact
      end
    end
  end
end

