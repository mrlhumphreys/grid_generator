require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/right_skewb_grid'

describe GridGenerator::Skewb::RightSkewbGrid do
  describe '#border_points_string' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = "100,100 180,60 180,140 100,180" 
      assert_equal expected, grid.border_points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([100, 140]), 
          b: Matrix.column_vector([140, 80])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([140, 160]), 
          b: Matrix.column_vector([180, 100])
        )
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([100, 140]), 
          b: Matrix.column_vector([140, 160])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([140, 80]),
          b: Matrix.column_vector([180, 100])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([100, 100]),
          Matrix.column_vector([140, 80]),
          Matrix.column_vector([100, 140])
        ], colour: "#ff0000", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140, 80]),
          Matrix.column_vector([180, 60]),
          Matrix.column_vector([180, 100])
        ], colour: "#0000ff", opacity: 0.4)
      ] 
      assert_equal expected, grid.element_shapes
    end
  end
end
