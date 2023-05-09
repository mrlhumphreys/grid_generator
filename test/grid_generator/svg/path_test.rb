require 'test_helper'
require 'grid_generator/svg/path'

describe GridGenerator::Svg::Path do
  describe '.new' do
    describe 'd is String' do
      it 'should initialize d as a string' do
        d = "M 10 10 L 20 20 L 20 10 Z"
        style = "fill:#ffffff;opacity:1"
        path = GridGenerator::Svg::Path.new(d: d, style: style)
        assert_equal path.d, d 
      end
    end

    describe 'd is Array' do
      it 'should initialize d as a string' do
        d = [
          GridGenerator::Svg::MoveCommand.new(points: [Matrix.column_vector([10, 10])]),
          GridGenerator::Svg::LineCommand.new(points: [Matrix.column_vector([20, 20])]),
          GridGenerator::Svg::LineCommand.new(points: [Matrix.column_vector([20, 10])]),
          GridGenerator::Svg::CloseCommand.new(points: [Matrix.column_vector([20, 10])])
        ]
        style = "fill:#ffffff;opacity:1"
        path = GridGenerator::Svg::Path.new(d: d, style: style)
        expected = "M 10 10 L 20 20 L 20 10 Z"
        assert_equal path.d, expected 
      end
    end

    describe 'd is not String or Array' do
      it 'should raise error' do
        d = 10 
        style = "fill:#ffffff;opacity:1"
        assert_raises ArgumentError do
          GridGenerator::Svg::Path.new(d: d, style: style)
        end
      end
    end

    describe 'style is Style' do
      it 'should initialize style as String' do
        d = "M 10 10 L 20 20 L 20 10 Z"
        style = GridGenerator::Svg::Style.new(fill: '#ffffff', opacity: 1)
        path = GridGenerator::Svg::Path.new(d: d, style: style)
        expected = "fill:#ffffff;stroke:#404040;stroke-width:1;opacity:1;"
        assert_equal path.style, expected 
      end
    end

    describe 'style is String' do
      it 'should initialize style as String' do
        d = "M 10 10 L 20 20 L 20 10 Z"
        style = "fill:#ffffff;opacity:1"
        path = GridGenerator::Svg::Path.new(d: d, style: style)
        assert_equal path.style, style
      end
    end

    describe 'style is not String or Style' do
      it 'should raise error' do
        d = "M 10 10 L 20 20 L 20 10 Z"
        style = { a: 1 } 
        assert_raises ArgumentError do
          GridGenerator::Svg::Path.new(d: d, style: style)
        end
      end
    end
  end

  describe '.to_svg' do
    it 'should return an svg element' do
      d = "M 10 10 L 20 20 L 20 10 Z"
      style = "fill:#ffffff;opacity:1"
      path = GridGenerator::Svg::Path.new(d: d, style: style)
      expected = "<path d=\"#{d}\" style=\"#{style}\" />"
      assert_equal path.to_svg, expected 
    end
  end
end
