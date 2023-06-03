require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/dino_cube/right_grid'

describe GridGenerator::DinoCube::RightGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::DinoCube::RightGrid.new(x: 20, y: 20, units: 20, elements: "Y\\nY,Y\\nY")
      expected = "<polygon points=\"20,30 40,20 30,35\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"20,30 30,35 20,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"40,20 40,40 30,35\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"30,35 40,40 20,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
