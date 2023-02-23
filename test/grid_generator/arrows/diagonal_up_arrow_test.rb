require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/arrows/diagonal_up_arrow'

describe GridGenerator::Arrows::DiagonalUpArrow do
  describe 'points_string' do
    describe 'forward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::DiagonalUpArrow.new(x: 33, y: 42, length: 12, direction: :forward)
        expected = "37,66 33,62 37,58 49,46 45,42 57,42 57,54 53,50 41,62"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'backward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::DiagonalUpArrow.new(x: 41, y: 33, length: 45, direction: :backward)
        expected = "53,90 41,90 41,78 45,82 90,37 94,33 98,37 94,41 49,86"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'bi' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::DiagonalUpArrow.new(x: 35, y: 35, length: 50, direction: :bi)
        expected = "47,97 35,97 35,85 39,89 89,39 85,35 97,35 97,47 93,43 43,93"
        assert_equal expected, arrow.points_string
      end
    end
  end
end
