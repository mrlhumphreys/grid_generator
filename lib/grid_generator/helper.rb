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
        interval_x = dx / i 
        interval_y = dy / i
        x = a[0,0] + (n + 1) * interval_x
        y = a[1,0] + (n + 1) * interval_y
        Matrix.column_vector([x, y])
      end
    end
  end
end

