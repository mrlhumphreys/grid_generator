module GridGenerator
  module Helper
    def self.distance(a, b)
      Math.sqrt((b[0,0] - a[0,0])**2 + (b[1,0] - a[1,0])**2)
    end
  end
end

