require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/skewb/right_skewb_grid'

describe GridGenerator::Skewb::RightSkewbGrid do
  describe '#border_points_string' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = "100,100 180,60 180,140 100,180" 
      assert_equal expected, grid.border_points_string
    end
  end

  describe '#rows' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = [
        { x1: 100, y1: 140, x2: 140, y2: 80 },
        { x1: 140, y1: 160, x2: 180, y2: 100 }
      ] 
      assert_equal expected, grid.rows
    end
  end

  describe '#columns' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = [
        { x1: 100, y1: 140, x2: 140, y2: 160 },
        { x1: 140, y1: 80, x2: 180, y2: 100 }
      ] 
      assert_equal expected, grid.columns
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Skewb::RightSkewbGrid.new(x: 100, y: 60, units: 20, elements: "R,-,b\\n-,-,-\\n-,-,-")
      expected = [
        GridGenerator::BaseElement.new(points: [[100, 100], [140, 80], [100, 140]], colour: "#ff0000", opacity: 1),
        GridGenerator::BaseElement.new(points: [[140, 80], [180, 60], [180, 100]], colour: "#0000ff", opacity: 0.4)
      ] 
      assert_equal expected, grid.element_shapes
    end
  end
end
