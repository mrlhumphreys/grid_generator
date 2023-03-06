module GridGenerator
  module Helper
    def self.distance(a, b)
      Math.sqrt((b[0,0] - a[0,0])**2 + (b[1,0] - a[1,0])**2)
    end

    # 1 -> / 2 | 
    # 2 -> / 3 | 
    def self.intervals(a, b, i)
      dx = b[0,0] - a[0,0]
      dy = b[1,0] - a[1,0]

      Array.new(i) do |n|
        interval_x = dx / (i + 1) 
        interval_y = dy / (i + 1)
        x = a[0,0] + (n + 1) * interval_x
        y = a[1,0] + (n + 1) * interval_y
        Matrix.column_vector([x, y])
      end
    end

    def self.intersection(ab,cd)
        x1 = ab.a[0,0]
        y1 = ab.a[1,0]
        x2 = ab.b[0,0]
        y2 = ab.b[1,0]
        x3 = cd.a[0,0]
        y3 = cd.a[1,0]
        x4 = cd.b[0,0]
        y4 = cd.b[1,0]

        px_numerator = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
        px_denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)

        py_numerator = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
        py_denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)

        px = px_numerator.to_f / px_denominator
        py = py_numerator.to_f / py_denominator

        Matrix.column_vector([px, py])
    end
  end
end

