require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/left_skewb_grid'

describe GridGenerator::Skewb::LeftSkewbGrid do
  describe '#border_points_string' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = "20,60 100,100 100,180 20,140" 
      assert_equal expected, grid.border_points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = [
        { x1: 20, y1: 100, x2: 60, y2: 80 },
        { x1: 60, y1: 160, x2: 100, y2: 140 }
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = [
        { x1: 20, y1: 100, x2: 60, y2: 160 },
        { x1: 60, y1: 80, x2: 100, y2: 140 }
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Skewb::LeftSkewbGrid.new(x: 20, y: 60, units: 20, elements: "r,-,W\\n-,-,-\\n-,-,-")      
      expected = [
        GridGenerator::BaseElement.new(points: [[20, 60], [60, 80], [20, 100]], colour: "#ff0000", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [[60, 80], [100, 100], [100, 140]], colour: "#ffffff", opacity: 1)
      ] 
      assert_equal expected, grid.element_shapes
    end
  end
end
