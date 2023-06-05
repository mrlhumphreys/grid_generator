require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/redi_cube/right_grid'

describe GridGenerator::RediCube::RightGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::RediCube::RightGrid.new(x: 20, y: 20, units: 20, elements: "Y\\nY,Y\\nY")
      expected = "<polygon points=\"20,50 40,40 20,60 40,70\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"40,70 20,60 50,65 40,80 20,90\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"60,50 80,40 80,60 60,70 50,65\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"20,90 40,80 40,100 20,110\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
