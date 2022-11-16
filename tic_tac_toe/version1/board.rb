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

    def print

        @grid.each do |row|
            p row 
        end

    end

    def win_row?(mark)

        @grid.each do |row|
            return true if row.all?(mark)
        end

        false 

    end
    
    def win_col?(mark)

        columns = @grid.transpose
        columns.each do |col|
            return true if col.all?(mark)
        end

        false

    end

    def win_diagonal?(mark)
        count = 0
        len = @grid.length
        num = 0
        idx = 0
        num1 = @grid.length - 1

            while num < len
                while idx < len
                    if @grid[idx][num] == mark
                        count += 1
                    end
                    num += 1
                    idx += 1
                end
            end

        if count == len
            return true
        else
            count = 0
            idx = 0
            while num1 >= 0
                while idx < len
                    if @grid[idx][num1] == mark
                        count += 1
                    end
                    num1 -= 1
                    idx += 1
                end
            end
        end

        count == len

    end

    # def win_diagonal?(mark)

    #     r_grid = @grid.reverse

    #     diag = []
    #     other_diag = []

    #     @grid.each.with_index {|row, i1| row.each.with_index {|val, i2| diag << val if i1 == i2}}
    #     r_grid.each.with_index {|row, i1| row.each.with_index {|val, i2| other_diag << val if i1 == i2}}

    #     diag.all?(mark) || other_diag.all?(mark)

    # end

    def win?(mark)

       return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
       false

    end

    def empty_positions?

       @grid.flatten!.any?(:_)

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
#b.print

b.place_mark([0, 2], :O)
b.place_mark([1,1], :O)
 b.place_mark([2,0], :O)
 b.print
 
 p b.empty_positions?
