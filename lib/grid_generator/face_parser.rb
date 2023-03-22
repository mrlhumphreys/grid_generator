module GridGenerator
  class FaceParser
    COLOURS = { 
      'w' => '#ffffff',
      'y' => '#ffff00',
      'b' => '#0000ff',
      'g' => '#00ff00',
      'r' => '#ff0000',
      'o' => '#ffb000',
      'gr' => '#808080',
      'br' => '#804000',
      's' => '#8080ff', # change to sand colour
      'l' => '#80ff80',
      'p' => '#800080', 
      'pi' => '#ff8080',
      'fu' => "#f0f0f0", # face up
      'ff' => "#d0d0d0", # face front
      'fr' => "#b0b0b0"  # face right
    } 
  
    OPACITY = {
      full: 1,
      faded: 0.4
    }
  
    def initialize(string)
      @string = string
    end

    def single?
      !@string.include?("\\n")
    end
  
    attr_reader :string

    def parse
      if single?
        parse_char(string)
      else
        parse_array(string)
      end
    end
  
    def parse_char(char)
      if char == '-'
        nil
      else
        colour = COLOURS[char.downcase]
        opacity = OPACITY[(/[[:upper:]]/.match(char) ? :full : :faded)]
        { colour: colour, opacity: opacity }
      end
    end

    def parse_array(str)
      str.split(/\\n/).map do |line|
        line.split(',').map(&:strip).map do |col|
          parse_char(col)
        end
      end 
    end
  end
end
