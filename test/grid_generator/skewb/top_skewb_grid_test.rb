require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/top_skewb_grid'

describe GridGenerator::Skewb::TopSkewbGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,w\\nw\\nw,B")
      expected = "<polygon points=\"100,20 180,60 100,100 20,60\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1;opacity:1;\" /><line x1=\"60\" y1=\"40\" x2=\"140\" y2=\"40\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"60\" y1=\"80\" x2=\"140\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"60\" y1=\"40\" x2=\"60\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"140\" y1=\"40\" x2=\"140\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><polygon points=\"100,20 140,40 60,40\" style=\"fill:#ffffff;stroke:#404040;stroke-width:1;opacity:0.4\" /><polygon points=\"140,40 180,60 140,80\" style=\"fill:#ffffff;stroke:#404040;stroke-width:1;opacity:0.4\" /><polygon points=\"140,40 140,80 60,80 60,40\" style=\"fill:#ffffff;stroke:#404040;stroke-width:1;opacity:0.4\" /><polygon points=\"60,40 60,80 20,60\" style=\"fill:#ffffff;stroke:#404040;stroke-width:1;opacity:0.4\" /><polygon points=\"140,80 100,100 60,80\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,w\\nw\\nw,B")
      expected = [
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([60, 40]), 
          b: Matrix.column_vector([140, 40])
        ),
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([60, 80]),
          b: Matrix.column_vector([140, 80])
        )
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,w\\nw\\nw,B")
      expected = [
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([60, 40]), 
          b: Matrix.column_vector([60, 80])
        ),
        GridGenerator::BaseLine.new(
          a: Matrix.column_vector([140, 40]), 
          b: Matrix.column_vector([140, 80])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Skewb::TopSkewbGrid.new(x: 20, y: 20, units: 20, elements: "w,w\\nw\\nw,B")
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
          Matrix.column_vector([140, 40]),
          Matrix.column_vector([140, 80]),
          Matrix.column_vector([60, 80]),
          Matrix.column_vector([60, 40])
        ], colour: "#ffffff", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([60, 40]),
          Matrix.column_vector([60, 80]),
          Matrix.column_vector([20, 60])
        ], colour: "#ffffff", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140, 80]),
          Matrix.column_vector([100, 100]),
          Matrix.column_vector([60, 80])
        ], colour: "#5050ff", opacity: 1)
      ] 

      assert_equal expected, grid.element_shapes
    end
  end
end
