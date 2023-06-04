require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/rex_cube/right_grid'

describe GridGenerator::RexCube::RightGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::RexCube::RightGrid.new(x: 20, y: 20, units: 20, elements: "R\\nR,R\\nR,R,R\\nR,R\\nR")
      expected = "<path d=\"M 20 50 L 80 20 L 50 65 L 20 50 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 20 50 L 50 65 L 40 70 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 20 L 60 60 L 50 65 L 80 20 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 20 50 L 40 70 L 20 110 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 50 65 L 60 60 L 50 85 L 40 70 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 20 L 80 80 L 60 60 L 80 20 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 40 70 L 50 85 L 20 110 L 40 70 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 60 60 L 80 80 L 50 85 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 50 85 L 80 80 L 20 110 L 50 85 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
