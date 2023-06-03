require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/dino_cube/top_grid'

describe GridGenerator::DinoCube::TopGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::DinoCube::TopGrid.new(x: 20, y: 20, units: 20, elements: "Y\\nY,Y\\nY")
      expected = "<polygon points=\"40,20 60,30 40,30\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"40,20 40,30 20,30\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"60,30 40,40 40,30\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"40,30 40,40 20,30\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
