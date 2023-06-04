require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/rex_cube/left_grid'

describe GridGenerator::RexCube::LeftGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::RexCube::LeftGrid.new(x: 20, y: 20, units: 20, elements: "B\\nB,B\\nB,B,B\\nR,R\\nR")
      expected = "<path d=\"M 20 20 L 80 50 L 50 55 L 20 20 Z\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 20 20 L 50 55 L 40 60 Z\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 50 L 60 70 L 50 55 L 80 50 Z\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 20 20 L 40 60 L 20 80 Z\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 50 55 L 60 70 L 50 75 L 40 60 Z\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 50 L 80 110 L 60 70 L 80 50 Z\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 40 60 L 50 75 L 20 80 L 40 60 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 60 70 L 80 110 L 50 75 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 50 75 L 80 110 L 20 80 L 50 75 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
