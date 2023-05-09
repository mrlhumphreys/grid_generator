require 'test_helper'
require 'grid_generator/svg/move_command'

describe GridGenerator::Svg::MoveCommand do
  describe '#type' do
    it 'should return M' do
      command = GridGenerator::Svg::MoveCommand.new
      assert_equal command.type, 'M'
    end
  end
end
