require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/arrows/vertical_arrow'

describe GridGenerator::Arrows::VerticalArrow do
  describe 'points_string' do
    describe 'forward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::VerticalArrow.new(x: 87, y: 35, length: 39, direction: :forward)
        expected = "92,35 98,35 98,43 98,82 103,82 95,90 87,82 92,82 92,43"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'backward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::VerticalArrow.new(x: 87, y: 40, length: 39, direction: :backward)
        expected = "87,48 95,40 103,48 98,48 98,87 98,95 92,95 92,87 92,48"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'bi' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::VerticalArrow.new(x: 57, y: 30, length: 24, direction: :bi)
        expected = "57,38 65,30 73,38 68,38 68,62 73,62 65,70 57,62 62,62 62,38"
        assert_equal expected, arrow.points_string
      end
    end
  end
end
