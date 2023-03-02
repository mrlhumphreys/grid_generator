# frozen_string_literal: true

require_relative "grid_generator/version"

require_relative 'grid_generator/cubic/iso_view'
require_relative 'grid_generator/cubic/top_grid'
require_relative 'grid_generator/cubic/front_grid'
require_relative 'grid_generator/cubic/right_grid'
require_relative 'grid_generator/cubic/facing_grid'
require_relative 'grid_generator/cubic/bordered_grid'
require_relative 'grid_generator/cubic/square_factory'
require_relative 'grid_generator/skewb/top_skewb_grid'
require_relative 'grid_generator/skewb/left_skewb_grid'
require_relative 'grid_generator/skewb/right_skewb_grid'
require_relative 'grid_generator/square_one/face'
require_relative 'grid_generator/arrows/vertical_arrow'
require_relative 'grid_generator/arrows/horizontal_arrow'
require_relative 'grid_generator/arrows/diagonal_down_arrow'
require_relative 'grid_generator/arrows/diagonal_up_arrow'
require_relative 'grid_generator/pyraminx/face'
require_relative 'grid_generator/megaminx/face'

module GridGenerator
  def self.iso_view(args)
    Cubic::IsoView.new(**args)
  end

  def self.facing_grid(args)
    Cubic::FacingGrid.new(**args)
  end

  def self.bordered_grid(args)
    Cubic::BorderedGrid.new(**args)
  end

  def self.square(args)
    width_unit = GridGenerator::Cubic::UnitsFactory.new(side: args[:side], type: :width, units: args[:units]).build 
    height_unit = GridGenerator::Cubic::UnitsFactory.new(side: args[:side], type: :height, units: args[:units]).build 
    offset_unit = GridGenerator::Cubic::UnitsFactory.new(side: args[:side], type: :offset, units: args[:units]).build 
    
    GridGenerator::Cubic::SquareFactory.new(
      x: args[:x], 
      y: args[:y],
      width_unit: width_unit,
      height_unit: height_unit,
      offset_unit: offset_unit,
      face: args[:face]
    ).build
  end

  def self.top_skewb_grid(args)
    Skewb::TopSkewbGrid.new(**args)
  end

  def self.left_skewb_grid(args)
    Skewb::LeftSkewbGrid.new(**args)
  end

  def self.right_skewb_grid(args)
    Skewb::RightSkewbGrid.new(**args)
  end

  def self.square_one_face(args)
    SquareOne::Face.new(**args)
  end

  def self.vertical_arrow(args)
    Arrows::VerticalArrow.new(**args)
  end

  def self.horizontal_arrow(args)
    Arrows::HorizontalArrow.new(**args)
  end

  def self.diagonal_down_arrow(args)
    Arrows::DiagonalDownArrow.new(**args)
  end

  def self.diagonal_up_arrow(args)
    Arrows::DiagonalUpArrow.new(**args)
  end

  def self.pyraminx_face(args)
    Pyraminx::Face.new(**args)
  end

  def self.megaminx_face(args)
    Megaminx::Face.new(**args)
  end
end

