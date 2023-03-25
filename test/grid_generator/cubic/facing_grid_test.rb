require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/facing_grid'

describe GridGenerator::Cubic::FacingGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FacingGrid.new(x: 20, y: 20, units: 30, squares: "Y,Y\\nY,Y")
      expected = "<polygon points=\"20,20 80,20 80,80 20,80\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1\" /><line x1=\"20\" y1=\"50\" x2=\"80\" y2=\"50\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"20\" y1=\"80\" x2=\"80\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"50\" y1=\"20\" x2=\"50\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"80\" y1=\"20\" x2=\"80\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><polygon points=\"20,20 50,20 50,50 20,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"50,20 80,20 80,50 50,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"20,50 50,50 50,80 20,80\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"50,50 80,50 80,80 50,80\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg 
    end
  end

  describe '#points_string' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FacingGrid.new(x: 20, y: 20, units: 30, squares: "Y,Y\\nY,Y")
      expected = "20,20 80,20 80,80 20,80"
      assert_equal expected, grid.points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FacingGrid.new(x: 20, y: 20, units: 30, squares: "Y,Y\\nY,Y")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 50]), 
          b: Matrix.column_vector([80, 50])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([20, 80]), 
          b: Matrix.column_vector([80, 80])
        )
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FacingGrid.new(x: 20, y: 20, units: 30, squares: "Y,Y\\nY,Y")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([50, 20]), 
          b: Matrix.column_vector([50, 80])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([80, 20]), 
          b: Matrix.column_vector([80, 80])
        )
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Cubic::FacingGrid.new(x: 20, y: 20, units: 30, squares: "Y,Y\\nY,Y")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20, 20]), 
          Matrix.column_vector([50, 20]), 
          Matrix.column_vector([50, 50]), 
          Matrix.column_vector([20, 50])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([50, 20]), 
          Matrix.column_vector([80, 20]), 
          Matrix.column_vector([80, 50]), 
          Matrix.column_vector([50, 50])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20, 50]), 
          Matrix.column_vector([50, 50]), 
          Matrix.column_vector([50, 80]), 
          Matrix.column_vector([20, 80])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([50, 50]), 
          Matrix.column_vector([80, 50]), 
          Matrix.column_vector([80, 80]), 
          Matrix.column_vector([50, 80])
        ], colour: "#ffff00", opacity: 1)
      ] 
      assert_equal expected, grid.element_shapes
    end
  end
end
