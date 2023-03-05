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

    # subtract rotation point to move point towards 0,0, rotate, then add to move back
    def rotate(obj)
      case obj
      when Matrix
        (matrix * (obj - rotation_point)) + rotation_point
      when GridGenerator::Line
        new_a = rotate(obj.a)
        new_b = rotate(obj.b)
        GridGenerator::Line.new(a: new_a, b: new_b)
      else
        raise ArgumentError, "Object must be Matrix or Line"
      end
    end
  end
end
