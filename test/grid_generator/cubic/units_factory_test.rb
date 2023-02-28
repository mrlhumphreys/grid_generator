require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/units_factory'

describe GridGenerator::Cubic::UnitsFactory do
  describe '#build' do
    describe 'top unit' do
      describe 'width' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :top, type: :width, units: 20)
          expected = Matrix.column_vector([20, 10]) 
          assert_equal expected, factory.build
        end
      end
      
      describe 'height' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :top, type: :height, units: 20)
          expected = Matrix.column_vector([-20, 10]) 
          assert_equal expected, factory.build
        end
      end

      describe 'offset' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :top, type: :offset, units: 20)
          expected = Matrix.column_vector([20, 0]) 
          assert_equal expected, factory.build
        end
      end
    end

    describe 'front unit' do
      describe 'width' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :front, type: :width, units: 20)
          expected = Matrix.column_vector([20, 10]) 
          assert_equal expected, factory.build
        end
      end
      
      describe 'height' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :front, type: :height, units: 20)
          expected = Matrix.column_vector([0, 20]) 
          assert_equal expected, factory.build
        end
      end

      describe 'offset' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :front, type: :offset, units: 20)
          expected = Matrix.column_vector([0, 0]) 
          assert_equal expected, factory.build
        end
      end
    end

    describe 'right unit' do
      describe 'width' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :right, type: :width, units: 20)
          expected = Matrix.column_vector([20, -10]) 
          assert_equal expected, factory.build
        end
      end
      
      describe 'height' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :right, type: :height, units: 20)
          expected = Matrix.column_vector([0, 20]) 
          assert_equal expected, factory.build
        end
      end

      describe 'offset' do
        it 'should generate' do
          factory = GridGenerator::Cubic::UnitsFactory.new(side: :right, type: :offset, units: 20)
          expected = Matrix.column_vector([0, 10]) 
          assert_equal expected, factory.build
        end
      end
    end
  end
end
