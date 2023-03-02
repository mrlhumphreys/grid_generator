require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/pyraminx/face'

describe GridGenerator::Pyraminx::Face do
  describe '#points_string' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = "35,20 20,98 110,98"
      assert_equal expected, grid.points_string
    end
  end

  describe '#vertical_lines' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::BaseLine.new(x1: 50, y1: 20.0, x2: 80, y2: 20.0),
        GridGenerator::BaseLine.new(x1: 35, y1: 45.98076211353316, x2: 95, y2: 45.98076211353316),
      ]
      assert_equal expected, grid.vertical_lines
    end
  end

  describe '#diagonal_down_lines' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::BaseLine.new(x1: 50, y1: 20.0, x2: 80, y2: 97.94228634059948),
        GridGenerator::BaseLine.new(x1: 35, y1: 45.98076211353316, x2: 50, y2: 97.94228634059948) 
      ]
      assert_equal expected, grid.diagonal_down_lines
    end
  end

  describe '#diagonal_up_lines' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::BaseLine.new(x1: 50, y1: 97.94228634059948, x2: 80, y2: 20.0),
        GridGenerator::BaseLine.new(x1: 80, y1: 97.94228634059948, x2: 95, y2: 45.98076211353316)
      ]
      assert_equal expected, grid.diagonal_up_lines
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([65.0, 20.0]), 
          Matrix.column_vector([80.0, 45.98076211353316]), 
          Matrix.column_vector([50.0, 45.98076211353316])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([35.0, 71.96152422706632]), 
          Matrix.column_vector([50.0, 97.94228634059948]), 
          Matrix.column_vector([20.0, 97.94228634059948])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([95.0, 71.96152422706632]),
          Matrix.column_vector([110.0, 97.94228634059948]),
          Matrix.column_vector([80.0, 97.94228634059948])
        ], colour: "#ffff00", opacity: 1)
      ]
      assert_equal expected, grid.element_shapes
    end
  end
end
