module GridGenerator
  class Rotator
    def initialize(angle:, rotation_point:)
      @angle = angle 
      @matrix = Matrix[
        [Math.cos(angle), -1*Math.sin(angle)],
        [Math.sin(angle), Math.cos(angle)]
      ]
      @rotation_point = rotation_point
    end

    attr_reader :angle, :matrix, :rotation_point

    def rotate(point) 
      # subtract rotation point to move point towards 0,0, rotate, then add to move back
      (matrix * (point - rotation_point)) + rotation_point 
    end
  end
end
