require 'test_helper'
require 'grid_generator/base_line'

describe GridGenerator::BaseLine do
  describe '#+' do
    describe 'with matrix' do
      it 'should return new offsetted line' do
        a = Matrix.column_vector([1,2])
        b = Matrix.column_vector([3,4])
        line = GridGenerator::BaseLine.new(a: a, b: b)
        offset = Matrix.column_vector([5,5])
        result = line + offset
        expected = GridGenerator::BaseLine.new(a: a + offset, b: b + offset)
        assert_equal result, expected
      end
    end

    describe 'without matrix' do
      it 'should raise Argument Error' do
        a = Matrix.column_vector([1,2])
        b = Matrix.column_vector([3,4])
        line = GridGenerator::BaseLine.new(a: a, b: b)
        assert_raises ArgumentError do
          line + 4
        end
      end
    end
  end

  describe '#x1' do
    it 'should return the x co-ordinate of point a' do
      a = Matrix.column_vector([1.2,2.4])
      b = Matrix.column_vector([3.6,4.8])
      line = GridGenerator::BaseLine.new(a: a, b: b)
      assert_equal 1.2, line.x1
    end
  end

  describe '#y1' do
    it 'should return the y co-ordinate of point a' do
      a = Matrix.column_vector([1.2,2.4])
      b = Matrix.column_vector([3.6,4.8])
      line = GridGenerator::BaseLine.new(a: a, b: b)
      assert_equal 2.4, line.y1
    end
  end

  describe '#x2' do
    it 'should return the x co-ordinate of point b' do
      a = Matrix.column_vector([1.2,2.4])
      b = Matrix.column_vector([3.6,4.8])
      line = GridGenerator::BaseLine.new(a: a, b: b)
      assert_equal 3.6, line.x2
    end
  end

  describe '#y2' do
    it 'should return the y co-ordinate of point b' do
      a = Matrix.column_vector([1.2,2.4])
      b = Matrix.column_vector([3.6,4.8])
      line = GridGenerator::BaseLine.new(a: a, b: b)
      assert_equal 4.8, line.y2
    end
  end
end
