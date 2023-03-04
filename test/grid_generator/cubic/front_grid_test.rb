require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/front_grid'

describe GridGenerator::Cubic::FrontGrid do
  describe '#points_string' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FrontGrid.new(x: 20, y: 50, units: 20, squares: "y,y,y,y,y\\n-,-,-,-,-\\n-,-,-,-,-\\ny,y,y,y,y") 
      expected = "20,50 120,100 120,180 20,130"
      assert_equal expected, grid.points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FrontGrid.new(x: 20, y: 50, units: 20, squares: "y,y,y,y,y\\n-,-,-,-,-\\n-,-,-,-,-\\ny,y,y,y,y")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 70]), 
          b: Matrix.column_vector([120, 120])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 90]), 
          b: Matrix.column_vector([120, 140])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 110]), 
          b: Matrix.column_vector([120, 160])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 130]), 
          b: Matrix.column_vector([120, 180])
        ) 
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FrontGrid.new(x: 20, y: 50, units: 20, squares: "y,y,y,y,y\\n-,-,-,-,-\\n-,-,-,-,-\\ny,y,y,y,y") 
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([40, 60]), 
          b: Matrix.column_vector([40, 140])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([60, 70]), 
          b: Matrix.column_vector([60, 150])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([80, 80]),
          b: Matrix.column_vector([80, 160])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([100, 90]), 
          b: Matrix.column_vector([100, 170])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([120, 100]), 
          b: Matrix.column_vector([120, 180])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FrontGrid.new(x: 20, y: 50, units: 20, squares: "y,y,y,y,y\\n-,-,-,-,-\\n-,-,-,-,-\\ny,y,y,y,y")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20, 50]),
          Matrix.column_vector([40, 60]),
          Matrix.column_vector([40, 80]),
          Matrix.column_vector([20, 70])
        ], colour: "#ffff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([40, 60]),
          Matrix.column_vector([60, 70]),
          Matrix.column_vector([60, 90]),
          Matrix.column_vector([40, 80])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 70]),
          Matrix.column_vector([80, 80]),
          Matrix.column_vector([80, 100]),
          Matrix.column_vector([60, 90])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([80, 80]),
          Matrix.column_vector([100, 90]),
          Matrix.column_vector([100, 110]),
          Matrix.column_vector([80, 100])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([100, 90]),
          Matrix.column_vector([120, 100]),
          Matrix.column_vector([120, 120]),
          Matrix.column_vector([100, 110])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20, 110]),
          Matrix.column_vector([40, 120]),
          Matrix.column_vector([40, 140]),
          Matrix.column_vector([20, 130])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([40, 120]),
          Matrix.column_vector([60, 130]),
          Matrix.column_vector([60, 150]),
          Matrix.column_vector([40, 140])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 130]),
          Matrix.column_vector([80, 140]),
          Matrix.column_vector([80, 160]),
          Matrix.column_vector([60, 150])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([80, 140]),
          Matrix.column_vector([100, 150]),
          Matrix.column_vector([100, 170]),
          Matrix.column_vector([80, 160])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([100, 150]),
          Matrix.column_vector([120, 160]),
          Matrix.column_vector([120, 180]),
          Matrix.column_vector([100, 170])
        ], colour: "#ffff00", opacity: 0.4)
      ]
      assert_equal expected, grid.element_shapes
    end
  end
end
