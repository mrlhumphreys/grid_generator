require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/megaminx/face_projection'

describe GridGenerator::Megaminx::FaceProjection do
  describe '#decagon_points_string' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = "20,170 49,82 124,27 216,27 291,82 320,170 291,258 216,313 124,313 49,258"
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
        GridGenerator::BaseLine.new(y1: 77.29490168751578, x1: 170.0, x2: 20.0, y2: 170.0),
        GridGenerator::BaseLine.new(y1: 141.3525491562421, x1: 258.167787843871, x2: 123.64745084375788, y2: 27.341522555726982),
        GridGenerator::BaseLine.new(y1: 245.0, x1: 224.49068960040208, x2: 291.3525491562421, y2: 81.83221215612902),
        GridGenerator::BaseLine.new(y1: 245.0, x1: 115.50931039959795, x2: 291.3525491562421, y2: 258.16778784387094), 
        GridGenerator::BaseLine.new(y1: 141.35254915624213, x1: 81.83221215612903, x2: 123.64745084375792, y2: 312.65847744427305)
      ] 
      assert_equal expected, projection.connecting_lines
    end
  end
end

