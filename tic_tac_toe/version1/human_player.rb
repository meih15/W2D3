class HumanPlayer

    def initialize(mark_value)
        @mark= mark_value
    end

    attr_reader :mark

    def get_position

        p "It is #{@current_player.mark}'s turn"
        p "enter a position with coordinated separated with a space like `4 7`"
        
       
        input = gets.chomp
        arr = input.split(" ")
        letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        if arr.length != 2 
            raise "not right number of numbers, please enter two"
        elsif 
            input.split("").length != 3
                raise "only one space between numbers"
        elsif
            arr.any? { |ele| letters.include?(ele)  }
                raise "use only numbers"
        else
            return arr.map! { |ele| ele.to_i }
        end
        
    

    end

end


