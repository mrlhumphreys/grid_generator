require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/bordered_grid'

describe GridGenerator::Cubic::BorderedGrid do
  describe '#points_string' do
    it 'should generate' do
      grid = GridGenerator::Cubic::BorderedGrid.new(x: 20, y: 20, units: 40, squares: "-,-,-,-\\nY,-,Y,-\\nY,-,Y,-\\n-,-,-,-")
      expected = "20,20 120,20 120,120 20,120"
      assert_equal expected, grid.points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Cubic::BorderedGrid.new(x: 20, y: 20, units: 40, squares: "-,-,-,-\\nY,-,Y,-\\nY,-,Y,-\\n-,-,-,-")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 30]), 
          b: Matrix.column_vector([120, 30])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 70]), 
          b: Matrix.column_vector([120, 70])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 110]), 
          b: Matrix.column_vector([120, 110])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 150]), 
          b: Matrix.column_vector([120, 150])
        ) 
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Cubic::BorderedGrid.new(x: 20, y: 20, units: 40, squares: "-,-,-,-\\nY,-,Y,-\\nY,-,Y,-\\n-,-,-,-")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([30, 20]), 
          b: Matrix.column_vector([30, 120])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([70, 20]), 
          b: Matrix.column_vector([70, 120])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([110, 20]), 
          b: Matrix.column_vector([110, 120])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([150, 20]), 
          b: Matrix.column_vector([150, 120])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Cubic::BorderedGrid.new(x: 20, y: 20, units: 40, squares: "-,-,-,-\\nY,-,Y,-\\nY,-,Y,-\\n-,-,-,-")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20, 30]),
          Matrix.column_vector([30, 30]),
          Matrix.column_vector([30, 70]),
          Matrix.column_vector([20, 70])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([70, 30]),
          Matrix.column_vector([110, 30]),
          Matrix.column_vector([110, 70]),
          Matrix.column_vector([70, 70])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20, 70]),
          Matrix.column_vector([30, 70]),
          Matrix.column_vector([30, 110]),
          Matrix.column_vector([20, 110])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([70, 70]),
          Matrix.column_vector([110, 70]),
          Matrix.column_vector([110, 110]),
          Matrix.column_vector([70, 110])
        ], colour: "#ffff00", opacity: 1)
      ] 
      assert_equal expected, grid.element_shapes
    end
  end
end
