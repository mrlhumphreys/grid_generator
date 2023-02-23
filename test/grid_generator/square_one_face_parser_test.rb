require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/square_one_face_parser'

describe GridGenerator::SquareOneFaceParser do
  describe 'to_a' do
    it 'should generate' do
      face = GridGenerator::SquareOneFaceParser.new('e0Y,c0w,e3F,c3w,e6F,c6w,e9F,c9w')
      expected = [
        { shape: :edge, offset: 0, colour: '#ffff00', opacity: 1 }, 
        { shape: :corner, offset: 0, colour: '#ffffff', opacity: 0.4 }, 
        { shape: :edge, offset: 3, colour: "#d0d0d0", opacity: 1 }, 
        { shape: :corner, offset: 3, colour: "#ffffff", opacity: 0.4 },
        { shape: :edge, offset: 6, colour: "#d0d0d0", opacity: 1 },
        { shape: :corner, offset: 6, colour: "#ffffff", opacity: 0.4 },
        { shape: :edge, offset: 9, colour: "#d0d0d0", opacity: 1 },
        { shape: :corner, offset: 9, colour: "#ffffff", opacity: 0.4 }
      ]
      assert_equal expected, face.to_a
    end
  end
end
