class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    attr_reader :size

    def [](arr) 

        @grid[arr[0]][arr[1]] 
        
    end

    def []= (pos, value)

        @grid[pos[0]][pos[1]] = value

    end


    def num_ships

        count = 0
        @grid.each {|subArray| subArray.each {|ele| count += 1 if ele == :S}}
        count 
    end

    def attack(pos)

       if self.[](pos) == :S                     #self[pos]  == :S
          self.[]=(pos, :H)                      #self[pos] = :H
          p "you sunk my battleship!"
          return true
       else
          self.[]=(pos, :X) 
          return false
       end

    end

    # def attack(pos)

    #     if self[pos] == :S
    #         self[pos]=:H
    #         p 'you sunk my battleship!'
    #         return true
    #     else
    #         self[pos]=:X
    #         return false
    #     end

    # end




    def place_random_ships

        placement = @size * 0.25
        length = 0
        (1...@size).each { |num| length = num if num * num == @size }  #length = @grid.length

       
        i = 0

        while i < placement
            row = rand(0...length)
            col = rand(0...length)
            pos = [row, col]
                if self[pos] == :N
                    self[pos] = :S
                    i += 1.0
                end
        end

     end


     def hidden_ships_grid 
        len = @grid.length 
        copy = Array.new(len) {Array.new(len, :N)}

       # array_copy = @grid.map {|row| row.map {|ele| ele}}


        copy.each.with_index do |subArray, idx1|
            subArray.each.with_index do |ele, idx2|
                pos = [idx1, idx2]
                if self[pos] == :S 
                    copy[idx1][idx2] = :N 
                elsif self[pos] == :N 
                    copy[idx1][idx2] = :N 
                elsif self[pos] == :X 
                    copy[idx1][idx2] = :X 
                end
            end
        end

        copy

     end

     def self.print_grid(arr)
        
        arr.each do |subArray| 
            ele = subArray.join(" ")
            print ele, "\n"            #puts ele or grid.each {|row| puts row.join(" ")}
        end

     end

     def cheat
        Board.print_grid(@grid)

     end

     def print
        
        Board.print_grid(self.hidden_ships_grid)

     end
     

    

end
