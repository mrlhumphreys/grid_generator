require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/redi_cube/left_grid'

describe GridGenerator::RediCube::LeftGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::RediCube::LeftGrid.new(x: 20, y: 20, units: 20, elements: "Y\\nY,Y\\nY")
      expected = "<polygon points=\"20,20 40,30 20,50 40,40\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"40,40 20,50 50,65 40,70 20,60\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"60,60 80,70 80,90 60,80 50,65\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"20,60 40,70 40,90 20,80\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
