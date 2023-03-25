require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/megaminx/face_projection'

describe GridGenerator::Megaminx::FaceProjection do
  describe '#to_svg' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = "<polygon points=\"170,20 258,49 313,124 313,216 258,291 170,320 82,291 27,216 27,124 82,49\" style=\"fill:#d0d0d0;stroke:#404040;stroke-width:1\" /><polygon points=\"170,77 258,141 224,245 116,245 82,141\" style=\"fill:none;stroke:#404040;stroke-width:1\" /><line x1=\"170\" y1=\"77.29490168751578\" x2=\"170\" y2=\"20\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"258.167787843871\" y1=\"141.3525491562421\" x2=\"312.658477444273\" y2=\"123.64745084375788\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"224.49068960040208\" y1=\"245.0\" x2=\"258.167787843871\" y2=\"291.3525491562421\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"115.50931039959795\" y1=\"245.0\" x2=\"81.83221215612905\" y2=\"291.3525491562421\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"81.83221215612903\" y1=\"141.35254915624213\" x2=\"27.341522555726954\" y2=\"123.64745084375792\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"140.61073738537635\" y1=\"98.6474508437579\" x2=\"246.94208842938133\" y2=\"175.90169943749473\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"228.77852522924732\" y1=\"120.0\" x2=\"188.16356320013404\" y2=\"245.0\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"235.71638901489172\" y1=\"210.45084971874735\" x2=\"104.28361098510831\" y2=\"210.45084971874738\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"151.836436799866\" y1=\"245.0\" x2=\"111.22147477075269\" y2=\"120.00000000000001\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"93.05791157061867\" y1=\"175.90169943749476\" x2=\"199.38926261462365\" y2=\"98.64745084375788\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"228.77852522924732\" y1=\"39.09830056250526\" x2=\"294.49491424413895\" y2=\"129.54915028125262\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"294.49491424413895\" y1=\"98.64745084375788\" x2=\"228.77852522924732\" y2=\"120.0\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"276.331351044005\" y1=\"135.45084971874735\" x2=\"170\" y2=\"58.19660112501052\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"199.38926261462365\" y1=\"98.6474508437579\" x2=\"199.38926261462365\" y2=\"29.54915028125263\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"170\" y1=\"39.09830056250526\" x2=\"276.331351044005\" y2=\"73.64745084375788\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"312.65847744427305\" y1=\"185.45084971874738\" x2=\"246.94208842938133\" y2=\"275.9016994374947\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"276.331351044005\" y1=\"266.35254915624205\" x2=\"235.71638901489172\" y2=\"210.45084971874738\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"235.71638901489172\" y1=\"260.45084971874735\" x2=\"276.331351044005\" y2=\"135.45084971874738\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"246.94208842938133\" y1=\"175.90169943749473\" x2=\"312.65847744427305\" y2=\"154.54915028125262\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"294.494914244139\" y1=\"129.54915028125262\" x2=\"294.494914244139\" y2=\"241.35254915624208\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"199.38926261462368\" y1=\"310.45084971874735\" x2=\"93.05791157061873\" y2=\"275.9016994374947\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"111.22147477075276\" y1=\"300.9016994374947\" x2=\"151.83643679986596\" y2=\"245.0\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"104.28361098510834\" y1=\"260.45084971874735\" x2=\"235.71638901489172\" y2=\"260.45084971874735\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"188.16356320013404\" y1=\"245.0\" x2=\"228.77852522924735\" y2=\"300.9016994374947\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"246.94208842938136\" y1=\"275.90169943749476\" x2=\"140.61073738537638\" y2=\"310.45084971874735\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"45.50508575586099\" y1=\"241.35254915624213\" x2=\"45.50508575586103\" y2=\"129.54915028125268\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"27.34152255572701\" y1=\"154.54915028125268\" x2=\"93.05791157061866\" y2=\"175.90169943749476\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"63.668648955995025\" y1=\"135.4508497187474\" x2=\"104.28361098510831\" y2=\"260.45084971874735\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"104.28361098510833\" y1=\"210.45084971874738\" x2=\"63.668648955995025\" y2=\"266.35254915624216\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"93.05791157061867\" y1=\"275.90169943749476\" x2=\"27.341522555726982\" y2=\"185.4508497187474\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"63.66864895599497\" y1=\"73.6474508437579\" x2=\"169.99999999999994\" y2=\"39.0983005625053\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"140.6107373853763\" y1=\"29.54915028125268\" x2=\"140.61073738537632\" y2=\"98.64745084375788\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"169.99999999999997\" y1=\"58.19660112501053\" x2=\"63.668648955994996\" y2=\"135.4508497187474\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"111.22147477075268\" y1=\"120.00000000000003\" x2=\"45.505085755860975\" y2=\"98.64745084375792\" style=\"stroke:#404040;stroke-width:1\" /><line x1=\"45.50508575586096\" y1=\"129.54915028125265\" x2=\"111.22147477075265\" y2=\"39.0983005625053\" style=\"stroke:#404040;stroke-width:1\" />"
      assert_equal expected, projection.to_svg
    end
  end

  describe '#decagon_points_string' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = "170,20 258,49 313,124 313,216 258,291 170,320 82,291 27,216 27,124 82,49"
      assert_equal expected, projection.decagon_points_string
    end
    
    it 'should generate with rotation offset' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, rotation_offset: Math::PI * 0.2)
      expected = "258,49 313,124 313,216 258,291 170,320 82,291 27,216 27,124 82,49 170,20"
      assert_equal expected, projection.decagon_points_string
    end
  end

  describe '#pentagon_points_string' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = "170,77 258,141 224,245 116,245 82,141"
      assert_equal expected, projection.pentagon_points_string
    end

    it 'should generate with rotation offset' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, rotation_offset: Math::PI * 0.2)
      expected = "224,95 258,199 170,263 82,199 116,95"
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

    it 'should generate with rotation offset' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, rotation_offset: Math::PI * 0.2)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([224.49068960040205, 95.0]),
          b: Matrix.column_vector([258.167787843871, 48.64745084375788])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([258.167787843871, 198.64745084375787]), 
          b: Matrix.column_vector([312.658477444273, 216.35254915624208])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([170.0, 262.7050983124842]), 
          b: Matrix.column_vector([170.00000000000003, 320.0])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([81.83221215612905, 198.6474508437579]), 
          b: Matrix.column_vector([27.341522555726982, 216.3525491562421])
        ), 
        GridGenerator::Line.new(
          a: Matrix.column_vector([115.50931039959792, 95.00000000000001]), 
          b: Matrix.column_vector([81.83221215612899, 48.64745084375791])
        )
      ] 
      assert_equal expected, projection.connecting_lines
    end
  end

  describe '#outside_face_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        [
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
        ],
        [
          GridGenerator::Line.new(
            a: Matrix.column_vector([312.65847744427305, 185.45084971874738]),
            b: Matrix.column_vector([246.94208842938133, 275.9016994374947])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([276.331351044005, 266.35254915624205]),
            b: Matrix.column_vector([235.71638901489172, 210.45084971874738])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([235.71638901489172, 260.45084971874735]),
            b: Matrix.column_vector([276.331351044005, 135.45084971874738])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([246.94208842938133, 175.90169943749473]),
            b: Matrix.column_vector([312.65847744427305, 154.54915028125262])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([294.494914244139, 129.54915028125262]),
            b: Matrix.column_vector([294.494914244139, 241.35254915624208])
          )
        ],
        [
          GridGenerator::Line.new(
            a: Matrix.column_vector([199.38926261462368, 310.45084971874735]),
            b: Matrix.column_vector([93.05791157061873, 275.9016994374947])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([111.22147477075276, 300.9016994374947]),
            b: Matrix.column_vector([151.83643679986596, 245.0])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([104.28361098510834, 260.45084971874735]),
            b: Matrix.column_vector([235.71638901489172, 260.45084971874735])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([188.16356320013404, 245.0]),
            b: Matrix.column_vector([228.77852522924735, 300.9016994374947])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([246.94208842938136, 275.90169943749476]),
            b: Matrix.column_vector([140.61073738537638, 310.45084971874735])
          )
        ],
        [
          GridGenerator::Line.new(
            a: Matrix.column_vector([45.50508575586099, 241.35254915624213]),
            b: Matrix.column_vector([45.50508575586103, 129.54915028125268])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([27.34152255572701, 154.54915028125268]),
            b: Matrix.column_vector([93.05791157061866, 175.90169943749476])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([63.668648955995025, 135.4508497187474]),
            b: Matrix.column_vector([104.28361098510831, 260.45084971874735])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([104.28361098510833, 210.45084971874738]),
            b: Matrix.column_vector([63.668648955995025, 266.35254915624216])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([93.05791157061867, 275.90169943749476]),
            b: Matrix.column_vector([27.341522555726982, 185.4508497187474])
          )
        ],
        [
          GridGenerator::Line.new(
            a: Matrix.column_vector([63.66864895599497, 73.6474508437579]),
            b: Matrix.column_vector([169.99999999999994, 39.0983005625053])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([140.6107373853763, 29.54915028125268]),
            b: Matrix.column_vector([140.61073738537632, 98.64745084375788])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([169.99999999999997, 58.19660112501053]),
            b: Matrix.column_vector([63.668648955994996, 135.4508497187474])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([111.22147477075268, 120.00000000000003]),
            b: Matrix.column_vector([45.505085755860975, 98.64745084375792])
          ),
          GridGenerator::Line.new(
            a: Matrix.column_vector([45.50508575586096, 129.54915028125265]),
            b: Matrix.column_vector([111.22147477075265, 39.0983005625053])
          )
        ]
      ]

      assert_equal expected, projection.outside_face_lines
    end

    it 'should generate with rotation offset' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, rotation_offset: Math::PI * 0.2)
      expected = [
        [
          GridGenerator::Line.new(
            a: Matrix[[294.49491424413907], [98.64745084375788]], 
            b: Matrix[[294.49491424413895], [210.45084971874735]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[312.658477444273], [185.45084971874735]], 
            b: Matrix[[246.94208842938133], [164.09830056250527]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[276.331351044005], [204.54915028125262]], 
            b: Matrix[[235.71638901489172], [79.54915028125262]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[235.7163890148917], [129.54915028125262]], 
            b: Matrix[[276.331351044005], [73.64745084375788]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[246.94208842938133], [64.09830056250524]], 
            b: Matrix[[312.658477444273], [154.54915028125262]]
          )
        ], [
          GridGenerator::Line.new(
            a: Matrix[[276.33135104400503], [266.3525491562421]], 
            b: Matrix[[170.00000000000003], [300.9016994374947]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[199.38926261462368], [310.45084971874735]], 
            b: Matrix[[199.38926261462368], [241.35254915624213]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[170.00000000000003], [281.8033988749895]], 
            b: Matrix[[276.331351044005], [204.54915028125262]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[228.77852522924732], [220.0]], 
            b: Matrix[[294.49491424413907], [241.3525491562421]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[294.494914244139], [210.45084971874735]], 
            b: Matrix[[228.77852522924732], [300.9016994374947]]
          )
        ], [
          GridGenerator::Line.new(
            a: Matrix[[111.22147477075272], [300.90169943749476]], 
            b: Matrix[[45.505085755861046], [210.4508497187474]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[45.505085755861074], [241.35254915624213]], 
            b: Matrix[[111.22147477075268], [220.0]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[63.668648955995025], [204.54915028125265]], 
            b: Matrix[[170.00000000000003], [281.8033988749895]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[140.61073738537635], [241.3525491562421]], 
            b: Matrix[[140.6107373853764], [310.45084971874735]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[170.0], [300.90169943749476]], 
            b: Matrix[[63.66864895599505], [266.3525491562421]]
          )
        ], [
          GridGenerator::Line.new(
            a: Matrix[[27.341522555726954], [154.54915028125265]], 
            b: Matrix[[93.05791157061867], [64.09830056250533]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[63.668648955995025], [73.64745084375795]], 
            b: Matrix[[104.28361098510828], [129.54915028125265]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[104.2836109851083], [79.54915028125266]], 
            b: Matrix[[63.66864895599501], [204.54915028125265]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[93.05791157061869], [164.09830056250527]], 
            b: Matrix[[27.341522555726954], [185.4508497187474]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[45.50508575586099], [210.45084971874738]], 
            b: Matrix[[45.505085755860975], [98.64745084375792]]
          )
        ], [
          GridGenerator::Line.new(
            a: Matrix[[140.6107373853763], [29.549150281252622]], 
            b: Matrix[[246.94208842938127], [64.09830056250526]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[228.77852522924724], [39.09830056250527]], 
            b: Matrix[[188.163563200134], [94.99999999999999]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[235.71638901489166], [79.54915028125262]], 
            b: Matrix[[104.28361098510827], [79.54915028125264]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[151.83643679986596], [95.00000000000001]], 
            b: Matrix[[111.22147477075265], [39.09830056250527]]
          ),
          GridGenerator::Line.new(
            a: Matrix[[93.05791157061863], [64.09830056250527]], 
            b: Matrix[[199.3892626146236], [29.54915028125265]]
          )
        ]
      ]

      assert_equal expected, projection.outside_face_lines
    end
  end

  describe '#front_face_lines' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([140.61073738537635, 98.6474508437579]),
          b: Matrix.column_vector([246.94208842938133, 175.90169943749473])
        ),
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
        )
      ]
      assert_equal expected, projection.front_face_lines
    end

    it 'should generate with rotation' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, rotation_offset: Math::PI * 0.2)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([188.16356320013404, 95.00000000000001]),
          b: Matrix.column_vector([228.77852522924732, 220.0])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([246.94208842938133, 164.09830056250527]), 
          b: Matrix.column_vector([140.61073738537635, 241.3525491562421])
        ), 
        GridGenerator::Line.new(
          a: Matrix.column_vector([199.38926261462368, 241.3525491562421]), 
          b: Matrix.column_vector([93.05791157061867, 164.09830056250527])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([111.2214747707527, 220.0]), 
          b: Matrix.column_vector([151.83643679986596, 95.0])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([104.2836109851083, 129.54915028125265]), 
          b: Matrix.column_vector([235.7163890148917, 129.54915028125262])
        )
      ]
      assert_equal expected, projection.front_face_lines
    end
  end

  describe '#front_face_element_shapes' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, front_face_elements: "W,R,B,-,-,-,-,-,-,-,W")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix[[217.55282581475768], [154.54915028125265]],
          Matrix[[199.3892626146237], [210.4508497187474]],
          Matrix[[140.61073738537638], [210.45084971874743]],
          Matrix[[122.44717418524233], [154.5491502812526]],
          Matrix[[169.99999999999997], [119.99999999999999]]
        ], colour: "#ffffff", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix[[170.0], [77.29490168751578]],
          Matrix[[199.38926261462365], [98.64745084375788]],
          Matrix[[169.99999999999997], [119.99999999999999]],
          Matrix[[140.61073738537635], [98.6474508437579]]
        ], colour: "#ff0000", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix[[199.38926261462365], [98.64745084375788]],
          Matrix[[228.77852522924732], [120.0]],
          Matrix[[217.55282581475768], [154.54915028125265]],
          Matrix[[169.99999999999997], [119.99999999999999]]
        ], colour: "#0000ff", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix[[111.22147477075269], [120.00000000000001]], 
          Matrix[[140.61073738537635], [98.6474508437579]], 
          Matrix[[169.99999999999997], [119.99999999999999]], 
          Matrix[[122.44717418524233], [154.5491502812526]]
        ], colour: "#ffffff", opacity: 1)
      ]
      assert_equal expected, projection.front_face_element_shapes
    end

    it 'should generate with rotation offset' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, front_face_elements: "W,R,B,-,-,-,-,-,-,-,W", rotation_offset: Math::PI * 0.2)
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix[[217.55282581475768], [185.4508497187474]], 
          Matrix[[170.00000000000003], [220.00000000000006]], 
          Matrix[[122.44717418524232], [185.45084971874743]], 
          Matrix[[140.61073738537638], [129.5491502812526]], 
          Matrix[[199.38926261462365], [129.5491502812526]]
        ], colour: "#ffffff", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix[[224.49068960040205], [95.0]], 
          Matrix[[235.7163890148917], [129.54915028125262]], 
          Matrix[[199.38926261462365], [129.5491502812526]], 
          Matrix[[188.16356320013404], [95.00000000000001]]
        ], colour: "#ff0000", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix[[235.7163890148917], [129.54915028125262]], 
          Matrix[[246.94208842938133], [164.09830056250527]], 
          Matrix[[217.55282581475768], [185.4508497187474]], 
          Matrix[[199.38926261462365], [129.5491502812526]]
        ], colour: "#0000ff", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix[[151.83643679986596], [95.0]], 
          Matrix[[188.16356320013404], [95.00000000000001]], 
          Matrix[[199.38926261462365], [129.5491502812526]], 
          Matrix[[140.61073738537638], [129.5491502812526]]
        ], colour: "#ffffff", opacity: 1)
      ]
      assert_equal expected, projection.front_face_element_shapes
    end
  end

  describe '#outside_face_element_shapes' do
    it 'should generate' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, top_right_face_elements: "W,R,B,-,-,-,-,-,-,-,W", right_face_elements: "W,R,B,-,-,-,-,-,-,-,W", down_face_elements: "W,R,B,-,-,-,-,-,-,-,W", left_face_elements: "W,R,B,-,-,-,-,-,-,-,W", top_left_face_elements: "W,R,B,-,-,-,-,-,-,-,W")
      expected = [
        [
          GridGenerator::BaseElement.new(points: [
            Matrix[[276.3313510440049], [104.54915028125262]], 
            Matrix[[246.9420884293813], [114.09830056250524]], 
            Matrix[[199.38926261462362], [79.54915028125262]], 
            Matrix[[199.38926261462362], [48.64745084375788]], 
            Matrix[[246.9420884293813], [64.09830056250524]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[258.167787843871], [48.64745084375788]], 
            Matrix[[276.331351044005], [73.64745084375788]], 
            Matrix[[246.9420884293813], [64.09830056250524]], 
            Matrix[[228.77852522924732], [39.09830056250526]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[276.331351044005], [73.64745084375788]], 
            Matrix[[294.49491424413895], [98.64745084375788]], 
            Matrix[[276.3313510440049], [104.54915028125262]], 
            Matrix[[246.9420884293813], [64.09830056250524]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[199.38926261462365], [29.54915028125263]], 
            Matrix[[228.77852522924732], [39.09830056250526]], 
            Matrix[[246.9420884293813], [64.09830056250524]], 
            Matrix[[199.38926261462362], [48.64745084375788]]
          ], colour: "#ffffff", opacity: 1)
        ],
        [
          GridGenerator::BaseElement.new(points: [
            Matrix[[265.10565162951536], [250.90169943749478]], 
            Matrix[[246.94208842938136], [225.90169943749478]], 
            Matrix[[265.10565162951536], [170.00000000000006]], 
            Matrix[[294.49491424413895], [160.45084971874743]], 
            Matrix[[294.49491424413895], [210.45084971874755]]
          ], colour: "#ffffff", opacity: 1), 
          GridGenerator::BaseElement.new(points: [
            Matrix[[312.65847744427305], [216.3525491562421]],
            Matrix[[294.494914244139], [241.35254915624208]], 
            Matrix[[294.49491424413895], [210.45084971874755]], 
            Matrix[[312.65847744427305], [185.45084971874738]]
          ], colour: "#ff0000", opacity: 1), 
          GridGenerator::BaseElement.new(points: [
            Matrix[[294.494914244139], [241.35254915624208]], 
            Matrix[[276.331351044005], [266.35254915624205]], 
            Matrix[[265.10565162951536], [250.90169943749478]], 
            Matrix[[294.49491424413895], [210.45084971874755]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[312.65847744427305], [154.54915028125262]], 
            Matrix[[312.65847744427305], [185.45084971874738]], 
            Matrix[[294.49491424413895], [210.45084971874755]], 
            Matrix[[294.49491424413895], [160.45084971874743]]
          ], colour: "#ffffff", opacity: 1)
        ],
        [
          GridGenerator::BaseElement.new(points: [
            Matrix[[122.44717418524237], [285.4508497187473]], 
            Matrix[[140.6107373853763], [260.45084971874735]], 
            Matrix[[199.38926261462368], [260.45084971874735]], 
            Matrix[[217.55282581475774], [285.45084971874735]], 
            Matrix[[170.00000000000014], [300.90169943749476]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[170.00000000000003], [320.0]], 
            Matrix[[140.61073738537638], [310.45084971874735]], 
            Matrix[[170.00000000000014], [300.90169943749476]], 
            Matrix[[199.38926261462368], [310.45084971874735]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[140.61073738537638], [310.45084971874735]], 
            Matrix[[111.22147477075276], [300.9016994374947]], 
            Matrix[[122.44717418524237], [285.4508497187473]], 
            Matrix[[170.00000000000014], [300.90169943749476]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[228.77852522924735], [300.9016994374947]], 
            Matrix[[199.38926261462368], [310.45084971874735]], 
            Matrix[[170.00000000000014], [300.90169943749476]], 
            Matrix[[217.55282581475774], [285.45084971874735]]
          ], colour: "#ffffff", opacity: 1)
        ],
        [
          GridGenerator::BaseElement.new(points: [
            Matrix[[45.50508575586102], [160.45084971874738]], 
            Matrix[[74.89434837048466], [170.00000000000003]], 
            Matrix[[93.05791157061869], [225.90169943749478]], 
            Matrix[[74.89434837048465], [250.90169943749476]], 
            Matrix[[45.505085755861], [210.4508497187474]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[27.341522555726954], [216.35254915624213]], 
            Matrix[[27.341522555726982], [185.4508497187474]], 
            Matrix[[45.505085755861], [210.4508497187474]], 
            Matrix[[45.50508575586099], [241.35254915624213]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[27.341522555726982], [185.4508497187474]], 
            Matrix[[27.34152255572701], [154.54915028125268]], 
            Matrix[[45.50508575586102], [160.45084971874738]], 
            Matrix[[45.505085755861], [210.4508497187474]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[63.668648955995025], [266.35254915624216]], 
            Matrix[[45.50508575586099], [241.35254915624213]], 
            Matrix[[45.505085755861], [210.4508497187474]], 
            Matrix[[74.89434837048465], [250.90169943749476]]
          ], colour: "#ffffff", opacity: 1)
        ],
        [
          GridGenerator::BaseElement.new(points: [
            Matrix[[140.6107373853763], [48.647450843757916]], 
            Matrix[[140.6107373853763], [79.54915028125262]], 
            Matrix[[93.05791157061861], [114.09830056250527]], 
            Matrix[[63.66864895599498], [104.54915028125265]], 
            Matrix[[93.05791157061866], [64.09830056250526]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[81.83221215612899], [48.647450843757895]], 
            Matrix[[111.22147477075265], [39.0983005625053]], 
            Matrix[[93.05791157061866], [64.09830056250526]], 
            Matrix[[63.66864895599497], [73.6474508437579]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[111.22147477075265], [39.0983005625053]], 
            Matrix[[140.6107373853763], [29.54915028125268]], 
            Matrix[[140.6107373853763], [48.647450843757916]], 
            Matrix[[93.05791157061866], [64.09830056250526]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[45.505085755860975], [98.64745084375792]], 
            Matrix[[63.66864895599497], [73.6474508437579]], 
            Matrix[[93.05791157061866], [64.09830056250526]], 
            Matrix[[63.66864895599498], [104.54915028125265]]
          ], colour: "#ffffff", opacity: 1)
        ]
      ]
      assert_equal expected, projection.outside_face_element_shapes
    end

    it 'should generate with rotaiton offset' do
      projection = GridGenerator::Megaminx::FaceProjection.new(x: 20, y: 20, units: 30, top_right_face_elements: "W,R,B,-,-,-,-,-,-,-,W", right_face_elements: "W,R,B,-,-,-,-,-,-,-,W", down_face_elements: "W,R,B,-,-,-,-,-,-,-,W", left_face_elements: "W,R,B,-,-,-,-,-,-,-,W", top_left_face_elements: "W,R,B,-,-,-,-,-,-,-,W", rotation_offset: Math::PI * 0.2)
      expected = [
        [
          GridGenerator::BaseElement.new(points: [
            Matrix[[294.49491424413895], [179.5491502812526]], 
            Matrix[[265.10565162951536], [169.99999999999997]], 
            Matrix[[246.94208842938133], [114.09830056250523]], 
            Matrix[[265.10565162951536], [89.09830056250523]], 
            Matrix[[294.494914244139], [129.5491502812526]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[312.65847744427305], [123.64745084375787]], 
            Matrix[[312.658477444273], [154.54915028125262]], 
            Matrix[[294.494914244139], [129.5491502812526]], 
            Matrix[[294.49491424413907], [98.64745084375788]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[312.658477444273], [154.54915028125262]], 
            Matrix[[312.658477444273], [185.45084971874735]], 
            Matrix[[294.49491424413895], [179.5491502812526]], 
            Matrix[[294.494914244139], [129.5491502812526]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[276.331351044005], [73.64745084375788]], 
            Matrix[[294.49491424413907], [98.64745084375788]], 
            Matrix[[294.494914244139], [129.5491502812526]], 
            Matrix[[265.10565162951536], [89.09830056250523]]
          ], colour: "#ffffff", opacity: 1)
        ], [
          GridGenerator::BaseElement.new(points: [
            Matrix[[199.38926261462368], [291.35254915624216]], 
            Matrix[[199.38926261462365], [260.4508497187474]], 
            Matrix[[246.94208842938133], [225.90169943749478]], 
            Matrix[[276.3313510440049], [235.4508497187474]], 
            Matrix[[246.9420884293812], [275.90169943749487]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[258.167787843871], [291.3525491562421]], 
            Matrix[[228.77852522924732], [300.9016994374947]], 
            Matrix[[246.9420884293812], [275.90169943749487]], 
            Matrix[[276.33135104400503], [266.3525491562421]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[228.77852522924732], [300.9016994374947]], 
            Matrix[[199.38926261462368], [310.45084971874735]], 
            Matrix[[199.38926261462368], [291.35254915624216]], 
            Matrix[[246.9420884293812], [275.90169943749487]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[294.49491424413907], [241.3525491562421]], 
            Matrix[[276.33135104400503], [266.3525491562421]], 
            Matrix[[246.9420884293812], [275.90169943749487]], 
            Matrix[[276.3313510440049], [235.4508497187474]]
          ], colour: "#ffffff", opacity: 1)
        ], [
          GridGenerator::BaseElement.new(points: [
            Matrix[[63.66864895599508], [235.45084971874735]], 
            Matrix[[93.05791157061864], [225.9016994374947]], 
            Matrix[[140.61073738537638], [260.45084971874735]], 
            Matrix[[140.6107373853764], [291.35254915624216]], 
            Matrix[[93.05791157061877], [275.9016994374948]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[81.83221215612906], [291.35254915624216]], 
            Matrix[[63.66864895599505], [266.3525491562421]], 
            Matrix[[93.05791157061877], [275.9016994374948]], 
            Matrix[[111.22147477075272], [300.90169943749476]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[63.66864895599505], [266.3525491562421]], 
            Matrix[[45.505085755861074], [241.35254915624213]], 
            Matrix[[63.66864895599508], [235.45084971874735]], 
            Matrix[[93.05791157061877], [275.9016994374948]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[140.6107373853764], [310.45084971874735]], 
            Matrix[[111.22147477075272], [300.90169943749476]], 
            Matrix[[93.05791157061877], [275.9016994374948]], 
            Matrix[[140.6107373853764], [291.35254915624216]]
          ], colour: "#ffffff", opacity: 1)
        ], [
          GridGenerator::BaseElement.new(points: [
            Matrix[[74.89434837048466], [89.09830056250529]], 
            Matrix[[93.05791157061867], [114.0983005625053]], 
            Matrix[[74.89434837048464], [170.00000000000006]], 
            Matrix[[45.50508575586099], [179.54915028125265]], 
            Matrix[[45.505085755860975], [129.54915028125265]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[27.341522555726925], [123.6474508437579]], 
            Matrix[[45.505085755860975], [98.64745084375792]], 
            Matrix[[45.505085755860975], [129.54915028125265]], 
            Matrix[[27.341522555726954], [154.54915028125265]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[45.505085755860975], [98.64745084375792]], 
            Matrix[[63.668648955995025], [73.64745084375795]], 
            Matrix[[74.89434837048466], [89.09830056250529]], 
            Matrix[[45.505085755860975], [129.54915028125265]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[27.341522555726954], [185.4508497187474]], 
            Matrix[[27.341522555726954], [154.54915028125265]], 
            Matrix[[45.505085755860975], [129.54915028125265]], 
            Matrix[[45.50508575586099], [179.54915028125265]]
          ], colour: "#ffffff", opacity: 1)
        ], [
          GridGenerator::BaseElement.new(points: [
            Matrix[[217.55282581475763], [54.549150281252636]], 
            Matrix[[199.38926261462365], [79.5491502812526]], 
            Matrix[[140.6107373853763], [79.54915028125261]], 
            Matrix[[122.44717418524229], [54.54915028125262]], 
            Matrix[[170.0], [39.098300562505244]]
          ], colour: "#ffffff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[169.99999999999994], [19.99999999999997]], 
            Matrix[[199.3892626146236], [29.54915028125265]], 
            Matrix[[170.0], [39.098300562505244]], 
            Matrix[[140.6107373853763], [29.549150281252622]]
          ], colour: "#ff0000", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[199.3892626146236], [29.54915028125265]], 
            Matrix[[228.77852522924724], [39.09830056250527]], 
            Matrix[[217.55282581475763], [54.549150281252636]], 
            Matrix[[170.0], [39.098300562505244]]
          ], colour: "#0000ff", opacity: 1),
          GridGenerator::BaseElement.new(points: [
            Matrix[[111.22147477075265], [39.09830056250527]], 
            Matrix[[140.6107373853763], [29.549150281252622]], 
            Matrix[[170.0], [39.098300562505244]], 
            Matrix[[122.44717418524229], [54.54915028125262]]
          ], colour: "#ffffff", opacity: 1)
        ] 
      ]

      assert_equal expected, projection.outside_face_element_shapes
    end
  end
end

