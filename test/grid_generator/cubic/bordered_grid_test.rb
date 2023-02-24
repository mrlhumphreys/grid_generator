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
        GridGenerator::BaseLine.new(x1: 20, y1: 30, x2: 120, y2: 30),
        GridGenerator::BaseLine.new(x1: 20, y1: 70, x2: 120, y2: 70),
        GridGenerator::BaseLine.new(x1: 20, y1: 110, x2: 120, y2: 110),
        GridGenerator::BaseLine.new(x1: 20, y1: 150, x2: 120, y2: 150) 
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Cubic::BorderedGrid.new(x: 20, y: 20, units: 40, squares: "-,-,-,-\\nY,-,Y,-\\nY,-,Y,-\\n-,-,-,-")
      expected = [
        GridGenerator::BaseLine.new(x1: 30, y1: 20, x2: 30, y2: 120),
        GridGenerator::BaseLine.new(x1: 70, y1: 20, x2: 70, y2: 120),
        GridGenerator::BaseLine.new(x1: 110, y1: 20, x2: 110, y2: 120),
        GridGenerator::BaseLine.new(x1: 150, y1: 20, x2: 150, y2: 120)
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
