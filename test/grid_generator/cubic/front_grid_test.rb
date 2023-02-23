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
        { "x1" => 20, "y1" => 70, "x2" => 120, "y2" => 120 },
        { "x1" => 20, "y1" => 90, "x2" => 120, "y2" => 140 },
        { "x1" => 20, "y1" => 110, "x2" => 120, "y2" => 160 },
        { "x1" => 20, "y1" => 130, "x2" => 120, "y2" => 180 }
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FrontGrid.new(x: 20, y: 50, units: 20, squares: "y,y,y,y,y\\n-,-,-,-,-\\n-,-,-,-,-\\ny,y,y,y,y") 
      expected = [
        { "x1" => 40, "y1" => 60, "x2" => 40, "y2" => 140 },
        { "x1" => 60, "y1" => 70, "x2" => 60, "y2" => 150 },
        { "x1" => 80, "y1" => 80, "x2" => 80, "y2" => 160 },
        { "x1" => 100, "y1" => 90, "x2" => 100, "y2" => 170 },
        { "x1" => 120, "y1" => 100, "x2" => 120, "y2" => 180 }
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
