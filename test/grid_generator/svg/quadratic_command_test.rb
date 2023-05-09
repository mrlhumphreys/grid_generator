require 'test_helper'
require 'grid_generator/svg/quadratic_command'

describe GridGenerator::Svg::QuadraticCommand do
  describe '#type' do
    it 'should return Q' do
      command = GridGenerator::Svg::QuadraticCommand.new
      assert_equal command.type, 'Q'
    end
  end
end
