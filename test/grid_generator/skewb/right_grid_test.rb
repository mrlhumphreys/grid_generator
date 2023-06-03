require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/right_grid'

describe GridGenerator::Skewb::RightGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightGrid.new(x: 100, y: 60, units: 20, elements: "R,b\\n-\\n-,-")
      expected = "<polygon points=\"100,100 180,60 180,140 100,180\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1;opacity:1;\" /><line x1=\"100\" y1=\"140\" x2=\"140\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"140\" y1=\"160\" x2=\"180\" y2=\"100\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"100\" y1=\"140\" x2=\"140\" y2=\"160\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"140\" y1=\"80\" x2=\"180\" y2=\"100\" style=\"stroke:#404040;stroke-width:1\" /><polygon points=\"100,100 140,80 100,140\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"140,80 180,60 180,100\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:0.4\" />" 
      assert_equal expected, grid.to_svg
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightGrid.new(x: 100, y: 60, units: 20, elements: "R,b\\n-\\n-,-")
      expected = [
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([100, 140]), 
          b: Matrix.column_vector([140, 80])
        ),
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([140, 160]), 
          b: Matrix.column_vector([180, 100])
        )
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightGrid.new(x: 100, y: 60, units: 20, elements: "R,b\\n-\\n-,-")
      expected = [
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([100, 140]), 
          b: Matrix.column_vector([140, 160])
        ),
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([140, 80]),
          b: Matrix.column_vector([180, 100])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightGrid.new(x: 100, y: 60, units: 20, elements: "R,b\\n-\\n-,-")
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
        ], colour: "#5050ff", opacity: 0.4)
      ] 
      assert_equal expected, grid.element_shapes
    end
  end
end
