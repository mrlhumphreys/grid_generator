require 'test_helper'
require 'grid_generator/svg/line_command'

describe GridGenerator::Svg::LineCommand do
  describe '#type' do
    it 'should return L' do
      command = GridGenerator::Svg::LineCommand.new
      assert_equal command.type, 'L'
    end
  end
end
