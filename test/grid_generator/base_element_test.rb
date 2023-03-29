require 'test_helper'
require 'grid_generator/base_element'

describe GridGenerator::BaseElement do
  describe '#to_svg' do
    it 'should generate' do
      element = GridGenerator::BaseElement.new(points: [
        Matrix.column_vector([5,5]), 
        Matrix.column_vector([10,5]), 
        Matrix.column_vector([10,10]), 
        Matrix.column_vector([5,10])
      ], colour: '#ffffff', opacity: '1')
      expected = "<polygon points=\"5,5 10,5 10,10 5,10\" style=\"fill:#ffffff;stroke:#404040;stroke-width:1;opacity:1\" />"
      assert_equal expected, element.to_svg
    end
  end
end
