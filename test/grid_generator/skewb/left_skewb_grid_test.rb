require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/left_skewb_grid'

describe GridGenerator::Skewb::LeftSkewbGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = "<polygon points=\"20,60 100,100 100,180 20,140\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1;opacity:1;\" /><line x1=\"20\" y1=\"100\" x2=\"60\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"60\" y1=\"160\" x2=\"100\" y2=\"140\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"20\" y1=\"100\" x2=\"60\" y2=\"160\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"60\" y1=\"80\" x2=\"100\" y2=\"140\" style=\"stroke:#404040;stroke-width:1\" /><polygon points=\"20,60 60,80 20,100\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:0.4\" /><polygon points=\"60,80 100,100 100,140\" style=\"fill:#ffffff;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = [
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([20, 100]), 
          b: Matrix.column_vector([60, 80])
        ),
        GridGenerator::BaseLine.new(
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
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([20, 100]), 
          b: Matrix.column_vector([60, 160])
        ),
        GridGenerator::BaseLine.new(
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
