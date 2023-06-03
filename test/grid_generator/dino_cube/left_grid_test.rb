require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/dino_cube/left_grid'

describe GridGenerator::DinoCube::LeftGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::DinoCube::LeftGrid.new(x: 20, y: 20, units: 20, elements: "Y\\nY,Y\\nY")
      expected = "<polygon points=\"20,20 40,30 30,35\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"20,20 30,35 20,40\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
