require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/pyraminx/face'

describe GridGenerator::Pyraminx::Face do
  describe '#points_string' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = "65,20 20,98 110,98"
      assert_equal expected, grid.points_string
    end

    it 'should generate with rotation' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", rotation_angle: Math::PI)
      expected = "65,98 110,20 20,20"
      assert_equal expected, grid.points_string
    end

    it 'should generate with scale' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", vertical_scale: 0.5)
      expected = "65,20 20,59 110,59"
      assert_equal expected, grid.points_string
    end
  end

  describe '#vertical_lines' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([50, 45.98076211353316]), 
          b: Matrix.column_vector([80, 45.98076211353316])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([35, 71.96152422706632]), 
          b: Matrix.column_vector([95, 71.96152422706632])
        ),
      ]
      assert_equal expected, grid.vertical_lines
    end

    it 'should generate with rotation' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", rotation_angle: Math::PI)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([80.0, 71.96152422706632]), 
          b: Matrix.column_vector([50.0, 71.96152422706632])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([95.0, 45.98076211353316]), 
          b: Matrix.column_vector([35.0, 45.980762113533174])
        ),
      ]
      assert_equal expected, grid.vertical_lines
    end

    it 'should generate with scale' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", vertical_scale: 0.5)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([50, 32.99038105676658]), 
          b: Matrix.column_vector([80, 32.99038105676658])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([35, 45.98076211353316]), 
          b: Matrix.column_vector([95, 45.98076211353316])
        ),
      ]
      assert_equal expected, grid.vertical_lines
    end
  end

  describe '#diagonal_down_lines' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([50, 45.98076211353316]),
          b: Matrix.column_vector([80, 97.94228634059948])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([35, 71.96152422706632]),
          b: Matrix.column_vector([50, 97.94228634059948])
        ) 
      ]
      assert_equal expected, grid.diagonal_down_lines
    end

    it 'should generate with rotation' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", rotation_angle: Math::PI)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([80.0, 71.96152422706632]),
          b: Matrix.column_vector([49.99999999999999, 20.0])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([95.0, 45.98076211353316]),
          b: Matrix.column_vector([80.0, 20.0])
        ) 
      ]
      assert_equal expected, grid.diagonal_down_lines
    end

    it 'should generate with scale' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", vertical_scale: 0.5)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([50.0, 32.99038105676658]),
          b: Matrix.column_vector([80.0, 58.97114317029974])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([35.0, 45.98076211353316]),
          b: Matrix.column_vector([50.0, 58.97114317029974])
        ) 
      ]
      assert_equal expected, grid.diagonal_down_lines
    end
  end

  describe '#diagonal_up_lines' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([50, 97.94228634059948]), 
          b: Matrix.column_vector([80, 45.98076211353316])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([80, 97.94228634059948]), 
          b: Matrix.column_vector([95, 71.96152422706632])
        )
      ]
      assert_equal expected, grid.diagonal_up_lines
    end

    it 'should generate with rotation' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", rotation_angle: Math::PI)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([80.0, 20.0]), 
          b: Matrix.column_vector([50.0, 71.96152422706632])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([49.99999999999999, 20.0]), 
          b: Matrix.column_vector([35.0, 45.980762113533174])
        )
      ]
      assert_equal expected, grid.diagonal_up_lines
    end

    it 'should generate with scale' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", vertical_scale: 0.5)
      expected = [
        GridGenerator::Line.new(
          a: Matrix.column_vector([50, 58.97114317029974]), 
          b: Matrix.column_vector([80, 32.99038105676658])
        ),
        GridGenerator::Line.new(
          a: Matrix.column_vector([80, 58.97114317029974]), 
          b: Matrix.column_vector([95, 45.98076211353316])
        )
      ]
      assert_equal expected, grid.diagonal_up_lines
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y")
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([65.0, 20.0]),
          Matrix.column_vector([80.0, 45.98076211353316]),
          Matrix.column_vector([50.0, 45.98076211353316])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([35.0, 71.96152422706632]),
          Matrix.column_vector([50.0, 97.94228634059948]),
          Matrix.column_vector([20.0, 97.94228634059948])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([95.0, 71.96152422706632]),
          Matrix.column_vector([110.0, 97.94228634059948]),
          Matrix.column_vector([80.0, 97.94228634059948])
        ], colour: "#ffff00", opacity: 1)
      ]
      assert_equal expected, grid.element_shapes
    end

    it 'should generate with rotation' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", rotation_angle: Math::PI)
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([65.0, 97.94228634059948]),
          Matrix.column_vector([50.0, 71.96152422706632]),
          Matrix.column_vector([80.0, 71.96152422706632])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([95.0, 45.98076211353316]),
          Matrix.column_vector([80.0, 20.0]),
          Matrix.column_vector([110.0, 19.999999999999993])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([35.0, 45.980762113533174]),
          Matrix.column_vector([19.999999999999993, 20.000000000000007]),
          Matrix.column_vector([49.99999999999999, 20.0])
        ], colour: "#ffff00", opacity: 1)
      ]
      assert_equal expected, grid.element_shapes
    end

    it 'should generate with scale' do
      grid = GridGenerator::Pyraminx::Face.new(x: 20, y: 20, units: 30, elements: "Y\\n-,-,-\\nY,-,-,-,Y", vertical_scale: 0.5)
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([65.0, 20.0]),
          Matrix.column_vector([80.0, 32.99038105676658]),
          Matrix.column_vector([50.0, 32.99038105676658])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([35.0, 45.98076211353316]),
          Matrix.column_vector([50.0, 58.97114317029974]),
          Matrix.column_vector([20.0, 58.97114317029974])
        ], colour: "#ffff00", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([95.0, 45.98076211353316]),
          Matrix.column_vector([110.0, 58.97114317029974]),
          Matrix.column_vector([80.0, 58.97114317029974])
        ], colour: "#ffff00", opacity: 1)
      ]
      assert_equal expected, grid.element_shapes
    end
  end
end
