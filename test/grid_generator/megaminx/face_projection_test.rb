require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/megaminx/face_projection'

describe GridGenerator::Megaminx::FaceProjection do
  describe '#decagon_points_string' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = "170,20 258,49 313,124 313,216 258,291 170,320 82,291 27,216 27,124 82,49"
      assert_equal expected, projection.decagon_points_string
    end
  end

  describe '#pentagon_points_string' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = "170,77 258,141 224,245 116,245 82,141"
      assert_equal expected, projection.pentagon_points_string
    end
  end

  describe '#connecting_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        GridGenerator::BaseLine.new(y1: 77.29490168751578, x1: 170.0, x2: 170.0, y2: 20.0),
        GridGenerator::BaseLine.new(y1: 141.3525491562421, x1: 258.167787843871, x2: 312.658477444273, y2: 123.64745084375788),
        GridGenerator::BaseLine.new(y1: 245.0, x1: 224.49068960040208, x2: 258.167787843871, y2: 291.3525491562421),
        GridGenerator::BaseLine.new(y1: 245.0, x1: 115.50931039959795, x2: 81.83221215612905, y2: 291.3525491562421), 
        GridGenerator::BaseLine.new(y1: 141.35254915624213, x1: 81.83221215612903, x2: 27.341522555726954, y2: 123.64745084375792)
      ] 
      assert_equal expected, projection.connecting_lines
    end
  end

  describe '#top_right_face_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        GridGenerator::BaseLine.new(y1: 39.09830056250526, x1: 228.77852522924732, x2: 294.49491424413895, y2: 129.54915028125262),
        GridGenerator::BaseLine.new(y1: 98.64745084375788, x1: 294.49491424413895, x2: 228.77852522924732, y2: 120.0),
        GridGenerator::BaseLine.new(y1: 135.45084971874735, x1: 276.331351044005, x2: 170.0, y2: 58.19660112501052),
        GridGenerator::BaseLine.new(y1: 98.6474508437579, x1: 199.38926261462365, x2: 199.38926261462365, y2: 29.54915028125263), 
        GridGenerator::BaseLine.new(y1: 39.09830056250526, x1: 170.0, x2: 276.331351044005, y2: 73.64745084375788)
      ]

      assert_equal expected, projection.top_right_face_lines
    end
  end

  describe '#front_face_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        GridGenerator::BaseLine.new(y1: 120.0, x1: 228.77852522924732, x2: 188.16356320013404, y2: 245.0), 
        GridGenerator::BaseLine.new(y1: 210.45084971874735, x1: 235.71638901489172, x2: 104.28361098510831, y2: 210.45084971874738),
        GridGenerator::BaseLine.new(y1: 245.0, x1: 151.836436799866, x2: 111.22147477075269, y2: 120.00000000000001),
        GridGenerator::BaseLine.new(y1: 175.90169943749476, x1: 93.05791157061867, x2: 199.38926261462365, y2: 98.64745084375788),
        GridGenerator::BaseLine.new(y1: 98.6474508437579, x1: 140.61073738537635, x2: 246.94208842938133, y2: 175.90169943749473)
      ]
      assert_equal expected, projection.front_face_lines
    end
  end
end

