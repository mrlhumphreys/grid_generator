require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/right_grid'

describe GridGenerator::Cubic::RightGrid do
  describe '#points_string' do
    it 'should generate' do
      grid = GridGenerator::Cubic::RightGrid.new(x: 120, y: 70, units: 20, squares: "o,o,o\\n-,-,-\\n-,-,R\\no,o,o")
      expected = "120,100 180,70 180,150 120,180"
      assert_equal expected, grid.points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Cubic::RightGrid.new(x: 120, y: 70, units: 20, squares: "o,o,o\\n-,-,-\\n-,-,R\\no,o,o")
      expected = [
        { "x1" => 120, "y1" => 120, "x2" => 180, "y2" => 90 },
        { "x1" => 120, "y1" => 140, "x2" => 180, "y2" => 110 },
        { "x1" => 120, "y1" => 160, "x2" => 180, "y2" => 130 },
        { "x1" => 120, "y1" => 180, "x2" => 180, "y2" => 150 }
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Cubic::RightGrid.new(x: 120, y: 70, units: 20, squares: "o,o,o\\n-,-,-\\n-,-,R\\no,o,o")
      expected = [
        { "x1" => 140, "y1" => 90, "x2" => 140, "y2" => 170 },
        { "x1" => 160, "y1" => 80, "x2" => 160, "y2" => 160 },
        { "x1" => 180, "y1" => 70, "x2" => 180, "y2" => 150 }
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Cubic::RightGrid.new(x: 120, y: 70, units: 20, squares: "o,o,o\\n-,-,-\\n-,-,R\\no,o,o")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([120, 100]), 
          Matrix.column_vector([140, 90]),
          Matrix.column_vector([140, 110]),
          Matrix.column_vector([120, 120])
        ], colour: "#ffb000", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140, 90]),
          Matrix.column_vector([160, 80]),
          Matrix.column_vector([160, 100]),
          Matrix.column_vector([140, 110])
        ], colour: "#ffb000", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([160, 80]),
          Matrix.column_vector([180, 70]),
          Matrix.column_vector([180, 90]),
          Matrix.column_vector([160, 100])
        ], colour: "#ffb000", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([160, 120]),
          Matrix.column_vector([180, 110]),
          Matrix.column_vector([180, 130]),
          Matrix.column_vector([160, 140])
        ], colour: "#ff0000", opacity: 1), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([120, 160]),
          Matrix.column_vector([140, 150]),
          Matrix.column_vector([140, 170]),
          Matrix.column_vector([120, 180])
        ], colour: "#ffb000", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140, 150]),
          Matrix.column_vector([160, 140]),
          Matrix.column_vector([160, 160]),
          Matrix.column_vector([140, 170])
        ], colour: "#ffb000", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([160, 140]),
          Matrix.column_vector([180, 130]),
          Matrix.column_vector([180, 150]),
          Matrix.column_vector([160, 160])
        ], colour: "#ffb000", opacity: 0.4)
      ]
      assert_equal expected, grid.element_shapes
    end
  end
end
