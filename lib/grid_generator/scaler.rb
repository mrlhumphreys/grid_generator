module GridGenerator
  class Scaler
    def initialize(horizontal_scale: 1, vertical_scale: 1)
      @horizontal_scale = horizontal_scale
      @vertical_scale = vertical_scale
      @matrix = Matrix[
        [horizontal_scale,0],
        [0,vertical_scale]
      ]
    end

    attr_reader :horizontal_scale, :vertical_scale, :matrix

    def scale(point)
      matrix * point
    end
  end
end
