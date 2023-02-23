require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/megaminx/face'

describe GridGenerator::Megaminx::Face do
  describe '#outline_string' do
    it 'should generate' do
      grid = GridGenerator::Megaminx::Face.new(x: 116, y: 118, units: 30, elements: "o\\n-,o,o,-,-\\nP,-,o,-,-", rotation_offset: Math::PI/5, label: 'F')
      expected = "211,129 233,197 176,238 119,197 141,129"
      assert_equal expected, grid.outline_string
    end
  end

  describe '#inline_string' do
    it 'should generate' do
      grid = GridGenerator::Megaminx::Face.new(x: 116, y: 118, units: 30, elements: "o\\n-,o,o,-,-\\nP,-,o,-,-", rotation_offset: Math::PI/5, label: 'F')
      expected = "222,163 147,217 176,129 205,217 130,163"
      assert_equal expected, grid.inline_string
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Megaminx::Face.new(x: 116, y: 118, units: 30, elements: "o\\n-,o,o,-,-\\nP,-,o,-,-", rotation_offset: Math::PI/5, label: 'F')
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix[[186.8981379200804], [163.00000000000003]], 
          Matrix[[193.63355756877417], [183.72949016875157]], 
          Matrix[[176.0], [196.5410196624968]], 
          Matrix[[158.36644243122583], [183.72949016875157]], 
          Matrix[[165.1018620799196], [163.00000000000003]]
        ], colour: "#ffb000", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix[[204.5316954888546], [217.27050983124843]], 
          Matrix[[176.0], [196.5410196624968]], 
          Matrix[[193.63355756877417], [183.72949016875157]]
        ], colour: "#ffb000", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix[[147.4683045111454], [217.27050983124843]], 
          Matrix[[158.36644243122583], [183.72949016875157]], 
          Matrix[[176.0], [196.5410196624968]]
        ], colour: "#ffb000", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix[[211.2671151375484], [129.45898033750314]], 
          Matrix[[222.1652530576288], [163.0]], 
          Matrix[[186.8981379200804], [163.00000000000003]], 
          Matrix[[176.0], [129.45898033750314]]
        ], colour: "#800080", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix[[176.00000000000003], [238.0]], 
          Matrix[[147.4683045111454], [217.27050983124843]], 
          Matrix[[176.0], [196.5410196624968]], 
          Matrix[[204.5316954888546], [217.27050983124843]]
        ], colour: "#ffb000", opacity: 0.4)
      ]

      assert_equal expected, grid.element_shapes
    end
  end

  describe '#label' do
    it 'should generate' do
      grid = GridGenerator::Megaminx::Face.new(x: 116, y: 118, units: 30, elements: "o\\n-,o,o,-,-\\nP,-,o,-,-", rotation_offset: Math::PI/5, label: 'F')
      expected = "F"
      assert_equal expected, grid.label
    end
  end

  describe '#label_position' do
    it 'should generate' do
      grid = GridGenerator::Megaminx::Face.new(x: 116, y: 118, units: 30, elements: "o\\n-,o,o,-,-\\nP,-,o,-,-", rotation_offset: Math::PI/5, label: 'F')
      expected = { x: 167, y: 190 } 
      assert_equal expected, grid.label_position
    end
  end

  describe '#label_size' do
    it 'should generate' do
      grid = GridGenerator::Megaminx::Face.new(x: 116, y: 118, units: 30, elements: "o\\n-,o,o,-,-\\nP,-,o,-,-", rotation_offset: Math::PI/5, label: 'F')
      expected = 30 
      assert_equal expected, grid.label_size
    end
  end
end
