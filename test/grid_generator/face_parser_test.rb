require "test_helper"
require 'grid_generator/face_parser'

describe GridGenerator::FaceParser do
  describe '#parse' do
    it 'should generate' do
      face = GridGenerator::FaceParser.new('-,-,-\nB,r,-\nR,r,-')
      expected = [
        [ nil, nil, nil ],
        [ 
          { colour: "#0000ff", opacity: 1 },
          { colour: "#ff0000", opacity: 0.4 },
          nil
        ],
        [
          { colour: "#ff0000", opacity: 1 },
          { colour: "#ff0000", opacity: 0.4 },
          nil
        ]
      ]
      assert_equal expected, face.parse
    end
  end
end
