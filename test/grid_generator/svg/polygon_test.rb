require 'test_helper'
require 'grid_generator/svg/polygon'

describe GridGenerator::Svg::Polygon do
  describe '.new' do
    describe 'points is String' do
      it 'should initialize points as a string' do
        points = "10,10 20,20 20,10"
        style = "fill:#ffffff;opacity:1"
        path = GridGenerator::Svg::Polygon.new(points: points, style: style)
        assert_equal path.points, points 
      end
    end

    describe 'points is Array' do
      it 'should initialize points as a string' do
        points = [
          Matrix.column_vector([10, 10]),
          Matrix.column_vector([20, 20]),
          Matrix.column_vector([20, 10])
        ]
        style = "fill:#ffffff;opacity:1"
        path = GridGenerator::Svg::Polygon.new(points: points, style: style)
        expected = "10,10 20,20 20,10"
        assert_equal path.points, expected 
      end
    end

    describe 'points is not String or Array' do
      it 'should raise error' do
        points = 10 
        style = "fill:#ffffff;opacity:1"
        assert_raises ArgumentError do
          GridGenerator::Svg::Polygon.new(points: points, style: style)
        end
      end
    end

    describe 'style is Style' do
      it 'should initialize style as String' do
        points = "10,10 20,20 20,10"
        style = GridGenerator::Svg::Style.new(fill: '#ffffff', opacity: 1)
        path = GridGenerator::Svg::Polygon.new(points: points, style: style)
        expected = "fill:#ffffff;stroke:#404040;stroke-width:1;opacity:1;"
        assert_equal path.style, expected 
      end
    end

    describe 'style is String' do
      it 'should initialize style as String' do
        points = "10,10 20,20 20,10"
        style = "fill:#ffffff;opacity:1"
        path = GridGenerator::Svg::Polygon.new(points: points, style: style)
        assert_equal path.style, style
      end
    end

    describe 'style is not String or Style' do
      it 'should raise error' do
        points = "10,10 20,20 20,10"
        style = { a: 1 } 
        assert_raises ArgumentError do
          GridGenerator::Svg::Polygon.new(points: points, style: style)
        end
      end
    end
  end

  describe '.to_svg' do
    it 'should return an svg element' do
      points = "M 10 10 L 20 20 L 20 10 Z"
      style = "fill:#ffffff;opacity:1"
      path = GridGenerator::Svg::Polygon.new(points: points, style: style)
      expected = "<polygon points=\"#{points}\" style=\"#{style}\" />"
      assert_equal path.to_svg, expected 
    end
  end
end
