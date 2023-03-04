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

  describe '#front_face_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        GridGenerator::BaseLine.new(y1: 141.3525491562421, x1: 258.167787843871, x2: 170.0, y2: 245.0), 
        GridGenerator::BaseLine.new(y1: 245.0, x1: 224.49068960040208, x2: 98.67076127786349, y2: 193.17627457812108),
        GridGenerator::BaseLine.new(y1: 245.0, x1: 115.50931039959795, x2: 125.91610607806452, y2: 109.32372542187895),
        GridGenerator::BaseLine.new(y1: 141.35254915624213, x1: 81.83221215612903, x2: 214.0838939219355, y2: 109.32372542187895),
        GridGenerator::BaseLine.new(y1: 77.29490168751578, x1: 170.0, x2: 241.32923872213652, y2: 193.17627457812105)
      ]
      assert_equal expected, projection.front_face_lines
    end
  end
end

