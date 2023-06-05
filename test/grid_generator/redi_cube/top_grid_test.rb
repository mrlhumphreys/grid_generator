require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/redi_cube/top_grid'

describe GridGenerator::RediCube::TopGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::RediCube::TopGrid.new(x: 20, y: 20, units: 20, elements: "Y\\nY,Y\\nY")
      expected = "<polygon points=\"80,20 100,30 80,40 60,30\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"60,30 80,40 80,50 60,50 40,40\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"100,50 120,60 100,70 40,40 80,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"40,40 60,50 40,60 20,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
