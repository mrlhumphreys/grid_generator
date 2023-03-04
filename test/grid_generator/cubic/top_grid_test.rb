require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/top_grid'

describe GridGenerator::Cubic::TopGrid do
  describe '#points_string' do
    it 'should generate' do
      grid = GridGenerator::Cubic::TopGrid.new(x: 20, y: 20, units: 20, squares: "b,b,b,b,b\\nb,-,b,-,b\\nb,b,b,b,b") 
      expected = "80,20 180,70 120,100 20,50"
      assert_equal expected, grid.points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Cubic::TopGrid.new(x: 20, y: 20, units: 20, squares: "b,b,b,b,b\\nb,-,b,-,b\\nb,b,b,b,b") 
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([60, 30]), 
          b: Matrix.column_vector([160, 80])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([40, 40]), 
          b: Matrix.column_vector([140, 90])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 50]), 
          b: Matrix.column_vector([120, 100])
        )
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Cubic::TopGrid.new(x: 20, y: 20, units: 20, squares: "b,b,b,b,b\\nb,-,b,-,b\\nb,b,b,b,b") 
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([100, 30]), 
          b: Matrix.column_vector([40, 60])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([120, 40]), 
          b: Matrix.column_vector([60, 70])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([140, 50]), 
          b: Matrix.column_vector([80, 80])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([160, 60]), 
          b: Matrix.column_vector([100, 90])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([180, 70]), 
          b: Matrix.column_vector([120, 100])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Cubic::TopGrid.new(x: 20, y: 20, units: 20, squares: "b,b,b,b,b\\nb,-,b,-,b\\nb,b,b,b,b") 
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([80, 20]), 
          Matrix.column_vector([100, 30]), 
          Matrix.column_vector([80, 40]), 
          Matrix.column_vector([60, 30])
        ], colour: "#0000ff", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([100, 30]), 
          Matrix.column_vector([120, 40]), 
          Matrix.column_vector([100, 50]), 
          Matrix.column_vector([80, 40])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([120, 40]),
          Matrix.column_vector([140, 50]),
          Matrix.column_vector([120, 60]), 
          Matrix.column_vector([100, 50])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140, 50]),
          Matrix.column_vector([160, 60]),
          Matrix.column_vector([140, 70]),
          Matrix.column_vector([120, 60])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([160, 60]),
          Matrix.column_vector([180, 70]), 
          Matrix.column_vector([160, 80]), 
          Matrix.column_vector([140, 70])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 30]), 
          Matrix.column_vector([80, 40]), 
          Matrix.column_vector([60, 50]), 
          Matrix.column_vector([40, 40])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([100, 50]), 
          Matrix.column_vector([120, 60]), 
          Matrix.column_vector([100, 70]), 
          Matrix.column_vector([80, 60])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140, 70]), 
          Matrix.column_vector([160, 80]),
          Matrix.column_vector([140, 90]),
          Matrix.column_vector([120, 80])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([40, 40]),
          Matrix.column_vector([60, 50]),
          Matrix.column_vector([40, 60]),
          Matrix.column_vector([20, 50])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 50]),
          Matrix.column_vector([80, 60]),
          Matrix.column_vector([60, 70]),
          Matrix.column_vector([40, 60])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([80, 60]),
          Matrix.column_vector([100, 70]),
          Matrix.column_vector([80, 80]),
          Matrix.column_vector([60, 70])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([100, 70]),
          Matrix.column_vector([120, 80]),
          Matrix.column_vector([100, 90]),
          Matrix.column_vector([80, 80])
        ], colour: "#0000ff", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([120, 80]),
          Matrix.column_vector([140, 90]),
          Matrix.column_vector([120, 100]),
          Matrix.column_vector([100, 90])
        ], colour: "#0000ff", opacity: 0.4)
      ]
      assert_equal expected, grid.element_shapes
    end
  end
end
