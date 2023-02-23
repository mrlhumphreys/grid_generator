require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/arrows/horizontal_arrow'

describe GridGenerator::Arrows::HorizontalArrow do
  describe 'points_string' do
    describe 'forward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::HorizontalArrow.new(x: 35, y: 27, length: 39, direction: :forward)
        expected = "35,38 35,32 43,32 82,32 82,27 90,35 82,43 82,38 43,38"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'backward' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::HorizontalArrow.new(x: 40, y: 27, length: 39, direction: :backward)
        expected = "48,43 40,35 48,27 48,32 87,32 95,32 95,38 87,38 48,38"
        assert_equal expected, arrow.points_string
      end
    end

    describe 'bi' do
      it 'should generate' do
        arrow = GridGenerator::Arrows::HorizontalArrow.new(x: 30, y: 58, length: 24, direction: :bi)
        expected = "38,74 30,66 38,58 38,63 62,63 62,58 70,66 62,74 62,69 38,69"
        assert_equal expected, arrow.points_string
      end
    end
  end
end
