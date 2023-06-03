require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/iso_view'

describe GridGenerator::Cubic::IsoView do
  describe '#to_svg' do
    it 'should generate' do
      iso = GridGenerator::Cubic::IsoView.new(x: 20, y: 20, units: 30, top_squares: "Y,Y\\nY,Y", front_squares: "B,B\\nB,B", right_squares: "R,R\\nR,R")
      expected = "<polygon points=\"80,20 140,50 80,80 20,50\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1;opacity:1;\" /><line x1=\"50\" y1=\"35\" x2=\"110\" y2=\"65\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"20\" y1=\"50\" x2=\"80\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"110\" y1=\"35\" x2=\"50\" y2=\"65\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"140\" y1=\"50\" x2=\"80\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><polygon points=\"80,20 110,35 80,50 50,35\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"110,35 140,50 110,65 80,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"50,35 80,50 50,65 20,50\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"80,50 110,65 80,80 50,65\" style=\"fill:#ffff00;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"20,50 80,80 80,140 20,110\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1;opacity:1;\" /><line x1=\"20\" y1=\"80\" x2=\"80\" y2=\"110\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"20\" y1=\"110\" x2=\"80\" y2=\"140\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"50\" y1=\"65\" x2=\"50\" y2=\"125\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"80\" y1=\"80\" x2=\"80\" y2=\"140\" style=\"stroke:#404040;stroke-width:1\" /><polygon points=\"20,50 50,65 50,95 20,80\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"50,65 80,80 80,110 50,95\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"20,80 50,95 50,125 20,110\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"50,95 80,110 80,140 50,125\" style=\"fill:#5050ff;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"80,80 140,50 140,110 80,140\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1;opacity:1;\" /><line x1=\"80\" y1=\"110\" x2=\"140\" y2=\"80\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"80\" y1=\"140\" x2=\"140\" y2=\"110\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"110\" y1=\"65\" x2=\"110\" y2=\"125\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"140\" y1=\"50\" x2=\"140\" y2=\"110\" style=\"stroke:#404040;stroke-width:1\" /><polygon points=\"80,80 110,65 110,95 80,110\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"110,65 140,50 140,80 110,95\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"80,110 110,95 110,125 80,140\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1\" /><polygon points=\"110,95 140,80 140,110 110,125\" style=\"fill:#ff0000;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, iso.to_svg
    end
  end

  describe '#top' do
    it 'should generate' do
      iso = GridGenerator::Cubic::IsoView.new(x: 20, y: 20, units: 30, top_squares: "Y,Y\\nY,Y", front_squares: "B,B\\nB,B", right_squares: "R,R\\nR,R")
      expected = GridGenerator::Cubic::TopGrid.new(x: 20, y: 20, units: 30, squares: [
        ['Y', 'Y'],
        ['Y', 'Y']
      ])
      assert_equal expected, iso.top
    end
  end

  describe '#front' do
    it 'should generate' do
      iso = GridGenerator::Cubic::IsoView.new(x: 20, y: 20, units: 30, top_squares: "Y,Y\\nY,Y", front_squares: "B,B\\nB,B", right_squares: "R,R\\nR,R")
      expected = GridGenerator::Cubic::FrontGrid.new(x: 20, y: 50, units: 30, squares: [
        ['B', 'B'],
        ['B', 'B']
      ])
      assert_equal expected, iso.front
    end
  end

  describe '#right' do
    it 'should generate' do
      iso = GridGenerator::Cubic::IsoView.new(x: 20, y: 20, units: 30, top_squares: "Y,Y\\nY,Y", front_squares: "B,B\\nB,B", right_squares: "R,R\\nR,R")
      expected = GridGenerator::Cubic::RightGrid.new(x: 80, y: 50, units: 30, squares: [
        ['R', 'R'],
        ['R', 'R']
      ])
      assert_equal expected, iso.right
    end
  end
end
