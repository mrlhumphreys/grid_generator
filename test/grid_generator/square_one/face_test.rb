require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/square_one/face'

describe GridGenerator::SquareOne::Face do
  describe '#element_shapes' do
    it 'should generate' do
      face = GridGenerator::SquareOne::Face.new(x: 20, y: 160, units: 40, elements: "e0F,c0y,e3F,c3y,e6F,c6y,e9F,c9W", axis_direction: :back)
      expected = [
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([63.92304845413264, 160.0]), 
          Matrix.column_vector([96.07695154586736, 160.0]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#d0d0d0", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([96.07695154586736, 160.0]), 
          Matrix.column_vector([140.0, 160.0]), 
          Matrix.column_vector([140.0, 203.92304845413264]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#ffff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140.0, 203.92304845413264]), 
          Matrix.column_vector([140.0, 236.07695154586736]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#d0d0d0", opacity: 1), 
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([140.0, 236.07695154586736]), 
          Matrix.column_vector([140.0, 280.0]), 
          Matrix.column_vector([96.07695154586736, 280.0]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#ffff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([96.07695154586736, 280.0]), 
          Matrix.column_vector([63.92304845413265, 280.0]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#d0d0d0", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([63.92304845413265, 280.0]), 
          Matrix.column_vector([20.000000000000007, 280.0]), 
          Matrix.column_vector([20.0, 236.07695154586736]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#ffff00", opacity: 0.4),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20.0, 236.07695154586736]), 
          Matrix.column_vector([20.0, 203.92304845413264]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#d0d0d0", opacity: 1),
        GridGenerator::BaseElement.new(points: [
          Matrix.column_vector([20.0, 203.92304845413264]), 
          Matrix.column_vector([19.999999999999986, 160.0]), 
          Matrix.column_vector([63.923048454132626, 160.0]), 
          Matrix.column_vector([80.0, 220.0])
        ], colour: "#ffffff", opacity: 1)
      ]
      assert_equal expected, face.element_shapes
    end
  end

  describe '#axis' do
    it 'should generate' do
      face = GridGenerator::SquareOne::Face.new(x: 20, y: 160, units: 40, elements: "e0F,c0y,e3F,c3y,e6F,c6y,e9F,c9W", axis_direction: :back)
      expected = { x1: 63.92304845413264, y1: 160, x2: 96.07695154586736, y2: 280 } 
      assert_equal expected, face.axis
    end
  end
end
