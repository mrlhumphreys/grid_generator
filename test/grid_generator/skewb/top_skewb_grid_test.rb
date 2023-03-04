require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/top_skewb_grid'

describe GridGenerator::Skewb::TopSkewbGrid do
  describe '#border_points_string' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,-,w\\n-,w,-\\nw,-,B")
      expected = "100,20 180,60 100,100 20,60" 
      assert_equal expected, grid.border_points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,-,w\\n-,w,-\\nw,-,B")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([60, 40]), 
          b: Matrix.column_vector([140, 40])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([60, 80]),
          b: Matrix.column_vector([140, 80])
        )
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,-,w\\n-,w,-\\nw,-,B")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([60, 40]), 
          b: Matrix.column_vector([60, 80])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([140, 40]), 
          b: Matrix.column_vector([140, 80])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,-,w\\n-,w,-\\nw,-,B")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([100, 20]), 
          Matrix.column_vector([140, 40]), 
          Matrix.column_vector([60, 40])
        ], colour: "#ffffff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140, 40]), 
          Matrix.column_vector([180, 60]),
          Matrix.column_vector([140, 80])
        ],  colour: "#ffffff", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 40]),
          Matrix.column_vector([140, 40]),
          Matrix.column_vector([140, 80]),
          Matrix.column_vector([60, 80])
        ], colour: "#ffffff", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 40]),
          Matrix.column_vector([60, 80]),
          Matrix.column_vector([20, 60])
        ], colour: "#ffffff", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 80]),
          Matrix.column_vector([140, 80]),
          Matrix.column_vector([100, 100])
        ], colour: "#0000ff", opacity: 1)
      ] 

      assert_equal expected, grid.element_shapes
    end
  end
end
