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
        GridGenerator::Line.new(
          a: Matrix.column_vector([170.0, 77.29490168751578]), 
          b: Matrix.column_vector([170.0, 20.0])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([258.167787843871, 141.3525491562421]), 
          b: Matrix.column_vector([312.658477444273, 123.64745084375788])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([224.49068960040208, 245.0]), 
          b: Matrix.column_vector([258.167787843871, 291.3525491562421])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([115.50931039959795, 245.0]), 
          b: Matrix.column_vector([81.83221215612905, 291.3525491562421])
        ), 
        GridGenerator::Line.new(
          a: Matrix.column_vector([81.83221215612903, 141.35254915624213]), 
          b: Matrix.column_vector([27.341522555726954, 123.64745084375792])
        )
      ] 
      assert_equal expected, projection.connecting_lines
    end
  end

  describe '#top_right_face_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([228.77852522924732, 39.09830056250526]), 
          b: Matrix.column_vector([294.49491424413895, 129.54915028125262])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([294.49491424413895, 98.64745084375788]), 
          b: Matrix.column_vector([228.77852522924732, 120.0])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([276.331351044005, 135.45084971874735]), 
          b: Matrix.column_vector([170.0, 58.19660112501052])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([199.38926261462365, 98.6474508437579]), 
          b: Matrix.column_vector([199.38926261462365, 29.54915028125263])
        ), 
        GridGenerator::Line.new(
          a: Matrix.column_vector([170.0, 39.09830056250526]), 
          b: Matrix.column_vector([276.331351044005, 73.64745084375788])
        )
      ]

      assert_equal expected, projection.top_right_face_lines
    end
  end

  describe '#front_face_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([228.77852522924732, 120.0]), 
          b: Matrix.column_vector([188.16356320013404, 245.0])
        ), 
        GridGenerator::Line.new(
          a: Matrix.column_vector([235.71638901489172, 210.45084971874735]), 
          b: Matrix.column_vector([104.28361098510831, 210.45084971874738])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([151.836436799866, 245.0]), 
          b: Matrix.column_vector([111.22147477075269, 120.00000000000001])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([93.05791157061867, 175.90169943749476]), 
          b: Matrix.column_vector([199.38926261462365, 98.64745084375788])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([140.61073738537635, 98.6474508437579]), 
          b: Matrix.column_vector([246.94208842938133, 175.90169943749473])
        )
      ]
      assert_equal expected, projection.front_face_lines
    end
  end
end

