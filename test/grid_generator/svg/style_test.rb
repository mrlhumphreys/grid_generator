require 'test_helper'
require 'grid_generator/svg/style'

describe GridGenerator::Svg::Style do
  describe '#to_s' do
    it 'should return an svg element' do
      fill = '#ffffff'
      opacity = 1
      command = GridGenerator::Svg::Style.new(fill: fill, opacity: opacity)
      expected = "fill:#{fill};stroke:#404040;stroke-width:1;opacity:#{opacity};"
      assert_equal command.to_s, expected 
    end
  end
end
