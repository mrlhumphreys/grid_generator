require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/pyraminx/grid'

TEST_ELEMENTS = [
  [
    nil,
    nil,
    { x: 70, y: 20, units: 25, direction: :up, colour: '#00ff00', opacity: 0.4 },
    nil,
    nil
  ],
  [
    nil,
    nil,
    { x: 70, y: 45, units: 25, direction: :down, colour: '#00ff00', opacity: 0.4 },
    nil,
    nil
  ],
  [
    { x: 20, y: 70, units: 25, direction: :up, colour: '#00ff00', opacity: 0.4 },
    { x: 45, y: 70, units: 25, direction: :down, colour: '#00ff00', opacity: 0.4 },
    { x: 70, y: 70, units: 25, direction: :up, colour: '#ffff00', opacity: 1 },
    { x: 95, y: 70, units: 25, direction: :down, colour: '#00ff00', opacity: 0.4 },
    { x: 120, y: 70, units: 25, direction: :up, colour: '#00ff00', opacity: 0.4 } 
  ],
  [
    { x: 20, y: 95, units: 25, direction: :down, colour: '#ffff00', opacity: 0.4 },
    { x: 45, y: 95, units: 25, direction: :up, colour: '#ffff00', opacity: 0.4 },
    { x: 70, y: 95, units: 25, direction: :down, colour: '#00ff00', opacity: 1 },
    { x: 95, y: 95, units: 25, direction: :up, colour: '#ffff00', opacity: 0.4 },
    { x: 120, y: 95, units: 25, direction: :down, colour: '#ffff00', opacity: 0.4 }
  ],
  [
    nil,
    nil,
    { x: 70, y: 120, units: 25, direction: :up, colour: '#ffff00', opacity: 0.4 },
    nil,
    nil
  ],
  [
    nil,
    nil,
    { x: 70, y: 145, units: 25, direction: :down, colour: '#ffff00', opacity: 0.4 },
    nil,
    nil
  ]
]

describe GridGenerator::Pyraminx::Grid do
  describe '#shape_points_string' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Grid.new(x: 20, y: 20, size: 3, units: 25, elements: TEST_ELEMENTS)
      expected = "95,20 170,95 95,170 20,95"
      assert_equal expected, grid.shape_points_string
    end
  end

  describe '#vertical_line_points' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Grid.new(x: 20, y: 20, size: 3, units: 25, elements: TEST_ELEMENTS)
      expected = [
        { "x1" => 70, "y1" => 45, "x2" => 120, "y2" => 45 },
        { "x1" => 45, "y1" => 70, "x2" => 145, "y2" => 70 },
        { "x1" => 20, "y1" => 95, "x2" => 170, "y2" => 95 },
        { "x1" => 45, "y1" => 120, "x2" => 145, "y2" => 120 },
        { "x1" => 70, "y1" => 145, "x2" => 120, "y2" => 145 }
      ]
      assert_equal expected, grid.vertical_line_points
    end
  end

  describe '#diagonal_down_line_points' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Grid.new(x: 20, y: 20, size: 3, units: 25, elements: TEST_ELEMENTS)
      expected = [
        { "x1" => 70, "y1" => 45, "x2" => 145, "y2" => 120 },
        { "x1" => 45, "y1" => 70, "x2" => 120, "y2" => 145 }
      ]
      assert_equal expected, grid.diagonal_down_line_points
    end
  end

  describe '#diagonal_up_line_points' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Grid.new(x: 20, y: 20, size: 3, units: 25, elements: TEST_ELEMENTS)
      expected = [
        { "x1" => 45, "y1" => 120, "x2" => 120, "y2" => 45 },
        { "x1" => 70, "y1" => 145, "x2" => 145, "y2" => 70 }
      ]
      assert_equal expected, grid.diagonal_up_line_points
    end
  end

  describe '#element_shapes' do
    it 'should generate' do
      grid = GridGenerator::Pyraminx::Grid.new(x: 20, y: 20, size: 3, units: 25, elements: TEST_ELEMENTS)
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 20]), 
          Matrix.column_vector([70, 45]), 
          Matrix.column_vector([20, 45])
        ], colour: "#00ff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 45]), 
          Matrix.column_vector([70, 20]), 
          Matrix.column_vector([20, 20])
        ], colour: "#00ff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 20]), 
          Matrix.column_vector([70, 45]), 
          Matrix.column_vector([20, 45])
        ], colour: "#00ff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 45]), 
          Matrix.column_vector([70, 20]), 
          Matrix.column_vector([20, 20])
        ], colour: "#00ff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 20]), 
          Matrix.column_vector([70, 45]), 
          Matrix.column_vector([20, 45])
        ], colour: "#ffff00", opacity: 1), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 45]), 
          Matrix.column_vector([70, 20]), 
          Matrix.column_vector([20, 20])
        ], colour: "#00ff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 20]), 
          Matrix.column_vector([70, 45]), 
          Matrix.column_vector([20, 45])
        ], colour: "#00ff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 45]), 
          Matrix.column_vector([70, 20]), 
          Matrix.column_vector([20, 20])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 20]), 
          Matrix.column_vector([70, 45]), 
          Matrix.column_vector([20, 45])
        ], colour: "#ffff00", opacity: 0.4), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 45]), 
          Matrix.column_vector([70, 20]), 
          Matrix.column_vector([20, 20])
        ], colour: "#00ff00", opacity: 1), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 20]), 
          Matrix.column_vector([70, 45]), 
          Matrix.column_vector([20, 45])
        ], colour: "#ffff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 45]), 
          Matrix.column_vector([70, 20]), 
          Matrix.column_vector([20, 20])
        ], colour: "#ffff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 20]), 
          Matrix.column_vector([70, 45]), 
          Matrix.column_vector([20, 45])
        ], colour: "#ffff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([45, 45]), 
          Matrix.column_vector([70, 20]), 
          Matrix.column_vector([20, 20])
        ], colour: "#ffff00", opacity: 0.4)
      ]
      assert_equal expected, grid.element_shapes
    end
  end
end
