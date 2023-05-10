require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/curvy_copter/left_grid'

describe GridGenerator::CurvyCopter::LeftGrid do
  describe '#to_svg' do
    it 'should generate' do
      grid = GridGenerator::CurvyCopter::LeftGrid.new(x: 20, y: 50, units: 20, elements: "B,B,B\\nB,B\\nB,B\\nB,B\\nB,B,B")
      expected = "<path d=\"M 20 50 L 40 60 Q 35 73 20 70 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 40 60 L 60 70 Q 50 80 50 95 Q 50 80 40 60 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 60 70 L 80 80 L 80 100 Q 65 88 60 70 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 40 60 Q 50 80 50 95 Q 35 88 20 70 Q 35 73 40 60 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 60 70 Q 65 88 80 100 Q 65 103 50 95 Q 50 80 60 70 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 20 70 Q 35 88 50 95 Q 35 88 20 90 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 100 L 80 120 Q 65 103 50 95 Q 65 103 80 100 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 20 90 Q 35 88 50 95 Q 50 110 40 120 Q 35 103 20 90 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 50 95 Q 65 103 80 120 Q 65 118 60 130 Q 50 110 50 95 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 20 90 Q 35 103 40 120 L 20 110 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 50 95 Q 50 110 60 130 L 40 120 Q 50 110 50 95 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" /><path d=\"M 80 120 L 80 140 L 60 130 Q 65 118 80 120 Z\" style=\"fill:#0000ff;stroke:#404040;stroke-width:1;opacity:1;\" />"
      assert_equal expected, grid.to_svg
    end
  end
end
