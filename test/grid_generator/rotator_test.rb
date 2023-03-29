require 'test_helper'
require 'grid_generator/base_line'
require 'grid_generator/rotator'

describe GridGenerator::Rotator do
  describe '#rotate' do
    it 'returns a point rotated' do
      point = Matrix.column_vector([3,1]) 
      rotation_point = Matrix.column_vector([3,3])
      rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.5, rotation_point: rotation_point)
      result = rotator.rotate(point)
      expected = Matrix.column_vector([5,3])
      assert_equal result, expected
    end

    it 'returns a line rotated' do
      a = Matrix.column_vector([3,1]) 
      b = Matrix.column_vector([5,3])
      line = GridGenerator::BaseLine.new(a: a, b: b)

      rotation_point = Matrix.column_vector([3,3])
      rotator = GridGenerator::Rotator.new(angle: Math::PI * 0.5, rotation_point: rotation_point)

      result = rotator.rotate(line)

      new_a = Matrix.column_vector([5,3])
      new_b = Matrix.column_vector([3,5])
      expected = GridGenerator::BaseLine.new(a: new_a, b: new_b)
      
      assert_equal result, expected
    end
  end
end
