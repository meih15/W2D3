require_relative "board"
require_relative "human_player"

class Game

    def initialize(player_1_mark, player_2_mark)
        @current_player = player_1
    end

    attr_reader :current_player

    


end