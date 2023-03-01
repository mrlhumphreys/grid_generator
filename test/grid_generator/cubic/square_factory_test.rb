require 'matrix'
require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/square_factory'

describe GridGenerator::Cubic::SquareFactory do
  describe '#build' do
    it 'should build a top square with the right units' do
      units = 40
      width_unit = Matrix.column_vector([units, units/2])
      height_unit = Matrix.column_vector([-units, units/2])
      offset_unit = Matrix.column_vector([units,0])
      face = 'R'
      colour = '#ff0000'
      opacity = 1
      factory = GridGenerator::Cubic::SquareFactory.new(
        x: 60, 
        y: 20, 
        width_unit: width_unit,
        height_unit: height_unit,
        offset_unit: offset_unit,
        face: face
      )  

      points = [
        Matrix.column_vector([100, 20]), 
        Matrix.column_vector([140, 40]), 
        Matrix.column_vector([100, 60]),
        Matrix.column_vector([60, 40])
      ] 
      expected = GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      assert_equal expected, factory.build
    end

    it 'should build a right square with the right units' do
      units = 40
      width_unit = Matrix.column_vector([units, (units*-0.5).to_i])
      height_unit = Matrix.column_vector([0, units])
      offset_unit = Matrix.column_vector([0,(units*0.5).to_i])
      face = 'R'
      colour = '#ff0000'
      opacity = 1
      factory = GridGenerator::Cubic::SquareFactory.new(
        x: 60, 
        y: 20, 
        width_unit: width_unit, 
        height_unit: height_unit, 
        offset_unit: offset_unit, 
        face: face
      )  
      points = [
        Matrix.column_vector([60, 40]),
        Matrix.column_vector([100, 20]),
        Matrix.column_vector([100, 60]),
        Matrix.column_vector([60, 80])
      ]
      expected = GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      assert_equal expected, factory.build
    end

    it 'should build a square with the right units' do
      units = 40
      width_unit = Matrix.column_vector([units, units/2])
      height_unit = Matrix.column_vector([0, units])
      offset_unit = Matrix.column_vector([0,0])
      face = 'R'
      colour = '#ff0000'
      opacity = 1
      factory = GridGenerator::Cubic::SquareFactory.new(
        x: 60, 
        y: 20, 
        width_unit: width_unit,
        height_unit: height_unit,
        offset_unit: offset_unit,
        face: face
      )  

      points = [
        Matrix.column_vector([60, 20]),
        Matrix.column_vector([100, 40]),
        Matrix.column_vector([100, 80]),
        Matrix.column_vector([60, 60])
      ] 
      expected = GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      assert_equal expected, factory.build
    end
  end
end
