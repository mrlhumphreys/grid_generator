require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/curvy_copter/top_grid'

describe GridGenerator::CurvyCopter::TopGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::CurvyCopter::TopGrid.new(x: 20, y: 20, units: 20, elements: "Y,Y,Y\\nY,Y\\nY,Y\\nY,Y\\nY,Y,Y")
      expected = "<path d=\"M 80 20 L 100 30 Q 80 35 60 30 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 100 30 L 120 40 Q 95 43 80 50 Q 95 43 100 30 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 120 40 L 140 50 L 120 60 Q 110 50 120 40 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 100 30 Q 95 43 80 50 Q 65 43 60 30 Q 80 35 100 30 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 120 40 Q 110 50 120 60 Q 95 58 80 50 Q 95 43 120 40 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 60 30 Q 65 43 80 50 Q 65 43 40 40 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 120 60 L 100 70 Q 95 58 80 50 Q 95 58 120 60 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 40 40 Q 65 43 80 50 Q 65 58 40 60 Q 50 50 40 40 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 50 Q 95 58 100 70 Q 80 65 60 70 Q 65 58 80 50 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 40 40 Q 50 50 40 60 L 20 50 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 50 Q 65 58 60 70 L 40 60 Q 65 58 80 50 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 100 70 L 80 80 L 60 70 Q 80 65 100 70 Z\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1;\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
