require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/left_skewb_grid'

describe GridGenerator::Skewb::LeftSkewbGrid do
  describe '#border_points_string' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = "20,60 100,100 100,180 20,140" 
      assert_equal expected, grid.border_points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 100]), 
          b: Matrix.column_vector([60, 80])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([60, 160]), 
          b: Matrix.column_vector([100, 140])
        )
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 100]), 
          b: Matrix.column_vector([60, 160])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([60, 80]), 
          b: Matrix.column_vector([100, 140])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20, 60]), 
          Matrix.column_vector([60, 80]), 
          Matrix.column_vector([20, 100])
        ], colour: "#ff0000", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 80]), 
          Matrix.column_vector([100, 100]), 
          Matrix.column_vector([100, 140])
        ], colour: "#ffffff", opacity: 1)
      ] 
      assert_equal expected, grid.element_shapes
    end
  end
end
