require "pry"

class TicTacToe
    attr_accessor :board, :index

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize
        @board = Array.new(9, " ")
        
    end

    def display_board
        puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
        puts "-----------"
        puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
        puts "-----------"
        puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    end

    def input_to_index(position)
        position = position.to_i
        position -= 1
    end

    def move(index, token= "X")
        self.board[index] = token
    end

    def position_taken?(index)
        if self.board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if position_taken?(index) == false && index < 9 && index >= 0
            true
        else
            false  
        end
    end

    def turn_count
        count = 0
        self.board.each do |position|
            count += 1 unless position == " "
        end
        if self.won? == false 
            count   
        elsif self.won? != false
            count - 1
        end
    end

    def current_player
        if self.turn_count.even?
            "X"
        elsif self.turn_count.odd?
            "O"
        end
    end

    def turn 
        self.display_board
        puts "What position (1-9) would you like to play?"
        position = gets.chomp
        index = input_to_index(position)
        # binding.pry
        if valid_move?(index) == true
            self.move(index, self.current_player)
        else
            puts "     Invalid move, try again."
            self.turn
        end
        self.won?
        
    end

    def play
        # binding.pry
        until self.over? == true
            self.turn
        end
        if self.won? != false
            puts "Congratulations #{self.winner}!"
        elsif self.draw? == true
            puts "\n " 
            puts self.display_board
            puts "Cat's Game!"
        end
    end

    def won?
        # binding.pry
        os = []
        xs = []
        self.board.each_with_index{|move, position|
            if move == "X"
                xs << position
            elsif move == "O"
                os << position
            end
        }  
        winning_combo = []
        WIN_COMBINATIONS.each do |combo|
            temp_x = combo & xs
            temp_o = combo & os
            if temp_x.sort == combo.sort || temp_o.sort == combo.sort
                winning_combo = combo
            end
        end
        if winning_combo.empty? == false
            winning_combo
        else
            false
        end
    end

    def full?
        if self.board.include?(" ")
            false
        else
            true
        end
    end

    def draw?
        if self.full? == true && self.won? == false
            true
        else
            false
        end 
    end

    def over?
        if self.won? != false || self.draw? == true
            true
        else
            false
        end
    end

    def winner
        if self.won? != false
            self.current_player
        else
            nil
        end
    end
end






# require "pry"

# class TicTacToe
#     attr_accessor :board, :index, :turn_count


#     WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

#     def initialize
#         @board = Array.new(9, " ")
#         @turn_count = 0
#     end

#     def display_board
#         puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
#         puts "-----------"
#         puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
#         puts "-----------"
#         puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
#     end

#     def input_to_index(position)
#         position -= 1
#     end

#     def move(position, token= "X")
#         index = input_to_index(position)
#         self.board[index] = token
#     end

#     def position_taken?(position)
#         index = input_to_index(position)
#         if self.board[index] == " "
#             false
#         else
#             true
#         end
#     end

#     def valid_move?(position)
#         if position_taken?(position) == false && position <= 9 && position >= 0
#             true
#         else
#             false  
#         end
#     end

#     def current_player
#         if @turn_count.even?
#             "X"
#         elsif @turn_count.odd?
#             "O"
#         end
#     end

#     def turn 
#         self.display_board
#         puts "#{self.current_player}, what position (1-9) would you like to play?"
#         position = gets.chomp.to_i
#         # binding.pry
#         if valid_move?(position) == true
#             self.move(position, self.current_player)
#         else
#             puts "     Invalid move, try again."
#             self.turn
#         end
#         self.won?
#         @turn_count += 1 if self.won? == false
        
#     end

#     def play
#         # binding.pry
#         until self.over? == true
#             self.turn
#         end
#         if self.won? != false
#             puts "Congratulations #{self.winner}!"
#         elsif self.draw? == true
#             puts "\n " 
#             puts self.display_board
#             puts "Cat's Game!"
#         end
#     end

#     def won?
#         # binding.pry
#         os = []
#         xs = []
#         self.board.each_with_index{|move, position|
#             if move == "X"
#                 xs << position
#             elsif move == "O"
#                 os << position
#             end
#         }  
#         winning_combo = []
#         WIN_COMBINATIONS.each do |combo|
#             temp_x = combo & xs
#             temp_o = combo & os
#             if temp_x.sort == combo.sort || temp_o.sort == combo.sort
#                 winning_combo = combo
#             end
#         end
#         if winning_combo.empty? == false
#             winning_combo
#         else
#             false
#         end
#     end

#     def full?
#         if self.board.include?(" ")
#             false
#         else
#             true
#         end
#     end

#     def draw?
#         if self.full? == true && self.won? == false
#             true
#         else
#             false
#         end 
#     end

#     def over?
#         if self.won? != false || self.draw? == true
#             true
#         else
#             false
#         end
#     end

#     def winner
#         if self.won? != false
#             self.current_player
#         else
#             nil
#         end
#     end
# end

# pete = TicTacToe.new
# pete.play