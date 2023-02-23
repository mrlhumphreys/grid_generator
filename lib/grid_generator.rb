# frozen_string_literal: true

require_relative "grid_generator/version"

require './lib/grid_generator/cubic/iso_view.rb'
require './lib/grid_generator/cubic/top_grid'
require './lib/grid_generator/cubic/front_grid'
require './lib/grid_generator/cubic/right_grid'
require './lib/grid_generator/cubic/facing_grid'
require './lib/grid_generator/cubic/bordered_grid'
require './lib/grid_generator/cubic/square_factory'
require './lib/grid_generator/skewb/top_skewb_grid'
require './lib/grid_generator/skewb/left_skewb_grid'
require './lib/grid_generator/skewb/right_skewb_grid'
require './lib/grid_generator/square_one/face'
require './lib/grid_generator/arrows/vertical_arrow'
require './lib/grid_generator/arrows/horizontal_arrow'
require './lib/grid_generator/arrows/diagonal_down_arrow'
require './lib/grid_generator/arrows/diagonal_up_arrow'
require './lib/grid_generator/pyraminx/grid'
require './lib/grid_generator/megaminx/face'

module GridGenerator
  def self.iso_view(args)
    Cubic::IsoView.new(**args)
  end

  def self.top_grid(args)
    Cubic::TopGrid.new(**args)
  end

  def self.front_grid(args)
    Cubic::FrontGrid.new(**args)
  end

  def self.right_grid(args)
    Cubic::RightGrid.new(**args)
  end

  def self.facing_grid(args)
    Cubic::FacingGrid.new(**args)
  end

  def self.bordered_grid(args)
    Cubic::BorderedGrid.new(**args)
  end

  def self.top_square(args)
    #??
    Cubic::TopSquareFactory.new(**args).build
  end

  def self.front_square(args)
    #??
    Cubic::FrontSquareFactory.new(**args).build
  end

  def self.right_square(args)
    #??
    Cubic::RightSquareFactory.new(**args).build
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

  def self.pyraminx_grid(args)
    Pyraminx::Grid.new(**args)
  end

  def self.pyraminx_triangle(args)
    Pyraminx::Triangle.new(**args)
  end

  def self.megaminx_face(args)
    Megaminx::Face.new(**args)
  end
end

