require 'minitest/autorun'
require 'minitest/spec'
require 'grid_generator/cubic/iso_view'

describe GridGenerator::Cubic::IsoView do
  describe '#top' do
    it 'should generate' do
      iso = GridGenerator::Cubic::IsoView.new(x: 20, y: 20, units: 30, top_squares: "Y,Y\\nY,Y", front_squares: "B,B\\nB,B", right_squares: "R,R\\nR,R")
      expected = GridGenerator::Cubic::TopGrid.new(x: 20, y: 20, units: 30, squares: [
        [{:colour=>"#ffff00", :opacity=>1}, {:colour=>"#ffff00", :opacity=>1}], 
        [{:colour=>"#ffff00", :opacity=>1}, {:colour=>"#ffff00", :opacity=>1}]
      ])
      assert_equal expected, iso.top
    end
  end

  describe '#front' do
    it 'should generate' do
      iso = GridGenerator::Cubic::IsoView.new(x: 20, y: 20, units: 30, top_squares: "Y,Y\\nY,Y", front_squares: "B,B\\nB,B", right_squares: "R,R\\nR,R")
      expected = GridGenerator::Cubic::FrontGrid.new(x: 20, y: 50, units: 30, squares: [
        [{:colour=>"#0000ff", :opacity=>1}, {:colour=>"#0000ff", :opacity=>1}], 
        [{:colour=>"#0000ff", :opacity=>1}, {:colour=>"#0000ff", :opacity=>1}]
      ])
      assert_equal expected, iso.front
    end
  end

  describe '#right' do
    it 'should generate' do
      iso = GridGenerator::Cubic::IsoView.new(x: 20, y: 20, units: 30, top_squares: "Y,Y\\nY,Y", front_squares: "B,B\\nB,B", right_squares: "R,R\\nR,R")
      expected = GridGenerator::Cubic::RightGrid.new(x: 80, y: 50, units: 30, squares: [
        [{:colour=>"#ff0000", :opacity=>1}, {:colour=>"#ff0000", :opacity=>1}], 
        [{:colour=>"#ff0000", :opacity=>1}, {:colour=>"#ff0000", :opacity=>1}]
      ])
      assert_equal expected, iso.right
    end
  end
end
