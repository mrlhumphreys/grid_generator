require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/rex_cube/top_grid'

describe GridGenerator::RexCube::TopGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::RexCube::TopGrid.new(x: 20, y: 20, units: 20, elements: "Y\\nY,Y\\nY,Y,Y\\nY,Y\\nY")
      expected = "<path d=\"M 80 20 L 140 50 L 90 45 L 80 20 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 20 L 90 45 L 70 45 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 140 50 L 90 55 L 90 45 L 140 50 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 20 L 70 45 L 20 50 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 90 45 L 90 55 L 70 55 L 70 45 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 140 50 L 20 50 L 90 55 L 140 50 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 70 45 L 70 55 L 20 50 L 70 45 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 90 55 L 80 80 L 70 55 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 70 55 L 80 80 L 20 50 L 70 55 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
