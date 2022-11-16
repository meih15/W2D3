require_relative "board"
require_relative "player"

class Battleship

    def initialize(n)
        @player = Player.new
        #Board.new(n)
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2
    end


    attr_reader :board, :player

    def start_game
       ships =  @board.place_random_ships
        print @board.num_ships
        print @board.print
        
    end

    def lose?

        if @remaining_misses <= 0
            print "you lose"
            return true
        else
            return false
        end

    end


    def win?

        if @board.num_ships <= 0
            print "you win"
            return true
        else
            return false
        end

    end

    def game_over?

        if self.lose? || self.win?
            return true 
        else
            return false
        end
        
    end

    def turn 

        move = @player.get_move

        @remaining_misses -= 1 if !@board.attack(move)


        @board.print
        print @remaining_misses


    end

    # def turn

    #     pos = @player.get_move
    #     if !self.board.attack(pos)
    #         @remaining_misses -= 1
    #     end

    #     self.board.print
    #     print "#{@remaining_misses} tries remaining"

    # end



end
