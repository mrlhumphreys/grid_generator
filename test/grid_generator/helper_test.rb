require 'test_helper'
require 'grid_generator/helper'

describe GridGenerator::Helper do
  describe '.distance' do
    it 'should return the distance between two points' do
      a = Matrix.column_vector([1,1])
      b = Matrix.column_vector([3,3])
      result = GridGenerator::Helper.distance(a, b)
      expected = 2 * Math.sqrt(2)
      assert_equal expected, result
    end
  end

  describe '.intervals' do
    it 'should return the invervals between two points' do
      a = Matrix.column_vector([1,1])
      b = Matrix.column_vector([4,4])
      result = GridGenerator::Helper.intervals(a, b, 2)
      expected = [
        Matrix.column_vector([2,2]),
        Matrix.column_vector([3,3])
      ]
      assert_equal expected, result
    end
  end

  describe '.intersection' do
    it 'should return the intersection point of two lines' do
      a = Matrix.column_vector([0,0])
      b = Matrix.column_vector([6,6])
      c = Matrix.column_vector([0,6])
      d = Matrix.column_vector([6,0])

      line_a = GridGenerator::BaseLine.new(a: a, b: b)
      line_b = GridGenerator::BaseLine.new(a: c, b: d)

      result = GridGenerator::Helper.intersection(line_a, line_b)
      expected = Matrix.column_vector([3.0,3.0])

      assert_equal expected, result
    end
  end
end
