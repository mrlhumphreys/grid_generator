require 'test_helper'
require 'grid_generator/svg/close_command'

describe GridGenerator::Svg::CloseCommand do
  describe '#type' do
    it 'should return Z' do
      command = GridGenerator::Svg::CloseCommand.new
      assert_equal command.type, 'Z'
    end
  end

  describe '#+' do
    it 'should return self' do
      command = GridGenerator::Svg::CloseCommand.new
      point = Matrix.column_vector([1,1])
      result = command + point
      assert_equal result, command 
    end
  end

  describe '#to_s' do
    it 'should return Z' do
      command = GridGenerator::Svg::CloseCommand.new
      assert_equal command.to_s, 'Z'
    end
  end
end
