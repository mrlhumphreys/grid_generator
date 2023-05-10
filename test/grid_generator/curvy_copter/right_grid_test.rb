require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/curvy_copter/right_grid'

describe GridGenerator::CurvyCopter::RightGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::CurvyCopter::RightGrid.new(x: 80, y: 50, units: 20, elements: "R,R,R\\nR,R\\nR,R\\nR,R\\nR,R,R")
      expected = "<path d=\"M 80 80 L 100 70 Q 95 88 80 100 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 100 70 L 120 60 Q 110 80 110 95 Q 110 80 100 70 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 120 60 L 140 50 L 140 70 Q 125 73 120 60 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 100 70 Q 110 80 110 95 Q 95 103 80 100 Q 95 88 100 70 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 120 60 Q 125 73 140 70 Q 125 88 110 95 Q 110 80 120 60 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 100 Q 95 103 110 95 Q 95 103 80 120 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 140 70 L 140 90 Q 125 88 110 95 Q 125 88 140 70 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 120 Q 95 103 110 95 Q 110 110 100 130 Q 95 118 80 120 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 110 95 Q 125 88 140 90 Q 125 103 120 120 Q 110 110 110 95 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 120 Q 95 118 100 130 L 80 140 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 110 95 Q 110 110 120 120 L 100 130 Q 110 110 110 95 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 140 90 L 140 110 L 120 120 Q 125 103 140 90 Z\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1;\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
