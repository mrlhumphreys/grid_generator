module GridGenerator
  class SquareOneFaceParser
    COLOURS = { 
      'w' => '#ffffff',
      'y' => '#ffff00',
      'b' => '#0000ff',
      'g' => '#00ff00',
      'r' => '#ff0000',
      'o' => '#ff8000',
      'f' => '#d0d0d0'
    } 
  
    OPACITY = {
      full: 1,
      faded: 0.4
    }
  
    SHAPES = {
      'e' => :edge,
      'c' => :corner,
      'm' => :middle,
      'f' => :middle_flipped
    }
  
    ELEMENT_DEFINITION = /(e|c|m|f)(\d+)([a-zA-Z])/
  
    def initialize(string)
      @string = string
    end
  
    attr_reader :string
  
    def to_a
      string.split(',').map(&:strip).map do |col|
        shape_def, offset_def, colour_def = ELEMENT_DEFINITION.match(col).captures 
        {
          shape: shape(shape_def),
          offset: offset(offset_def),
          colour: colour(colour_def),
          opacity: opacity(colour_def)
        }
      end
    end
  
    def shape(definition)
      SHAPES[definition]
    end
  
    def offset(definition)
      definition.to_i
    end
  
    def colour(definition)
      COLOURS[definition.downcase]
    end
  
    def opacity(definition)
      OPACITY[(/[[:upper:]]/.match(definition) ? :full : :faded)]
    end
  end
end
