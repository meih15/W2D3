class Board

    def initialize
        @grid =  @grid = Array.new(3) {Array.new(3, :_)}
    end

    attr_reader :grid

    def valid?(position)
        range = (0...3)
        
      position.each {|num| return false if !range.include?(num)}
       return true

    end

    def empty?(position)

        @grid[position[0]][position[1]] == :_
        
    end

    def place_mark(position, mark)

        if self.valid?(position)
            if self.empty?(position)
                @grid[position[0]][position[1]] = mark
            else
                raise "position not empty"
            end
        else
            raise "position not valid"
        end


    end

    

end

p b = Board.new
# p b.valid?([1,4]) # false
# p b.valid?([2,2]) # true
# p b.valid?([-1, 2]) # false

# p b.empty?([1,1]) #true

#p b.place_mark([1,4], "X") # Invalid spot error
#p b.place_mark([0,0], :x)
#p b.place_mark([0,0], "o") # Invalid not empty