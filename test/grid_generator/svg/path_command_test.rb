require 'test_helper'
require 'grid_generator/svg/path_command'

describe GridGenerator::Svg::PathCommand do
  describe '#+' do
    it 'should add offset to all points' do
      command = GridGenerator::Svg::PathCommand.new(points: [Matrix.column_vector([10, 10])])
      point = Matrix.column_vector([5, 15])
      result = command + point
      expected = GridGenerator::Svg::PathCommand.new(points: [Matrix.column_vector([15, 25])])
      assert_equal result, expected
    end
  end

  describe '#to_s' do
    it 'should return the path command as string' do
      command = GridGenerator::Svg::PathCommand.new(points: [Matrix.column_vector([10, 10])])
      assert_equal command.to_s, "M 10 10" 
    end
  end
end
