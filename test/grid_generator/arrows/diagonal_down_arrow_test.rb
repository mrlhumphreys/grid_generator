require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/arrows/diagonal_down_arrow'

describe GridGenerator::Arrows::DiagonalDownArrow do
  describe 'points_string' do
    describe 'forward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::DiagonalDownArrow.new(x: 87, y: 35, length: 39, direction: :forward)
        expected = "87,39 91,35 95,39 134,78 138,74 138,86 126,86 130,82 91,43"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'backward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::DiagonalDownArrow.new(x: 71, y: 41, length: 12, direction: :backward)
        expected = "71,53 71,41 83,41 79,45 91,57 95,61 91,65 87,61 75,49"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'bi' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::DiagonalDownArrow.new(x: 30, y: 30, length: 30, direction: :bi)
        expected = "30,42 30,30 42,30 38,34 68,64 72,60 72,72 60,72 64,68 34,38"
        assert_equal expected, arrow.points_string
      end
    end
  end
end
