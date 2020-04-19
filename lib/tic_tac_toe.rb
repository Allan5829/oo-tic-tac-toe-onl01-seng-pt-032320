class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #bottom column
    [2, 4, 6], #back slash /
    [0, 4, 8] #front slash \
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index (board)
    input = 0
    input = board.to_i
    input -= 1
    input
  end 
  
  def move (index, token = "X")
    @board [index] = token
  end 
  
  def position_taken? (index)
    position = @board [index]
    if (position == " ")
      return false
    else 
      return true 
    end 
  end 
  
  def valid_move? (index)
    position = @board [index]
    if ((position == "X") || (position == "O"))
      return false
    elsif ((index < 0) || (index > 8))
      return false
    elsif (position == " ")
      return true
    else 
      return true
    end
  end 
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end  
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets
    index_value = input_to_index (input)
    if (valid_move?(index_value) == true)
      move(index_value, current_player)
      display_board
    else 
      turn
    end 
  end 
  
  def won?
    tic_tac_toe = false
    comparison_array = []
    winning_array = []
    WIN_COMBINATIONS.each do |combination|
      comparison_array = []
      winning_array = []
      combination.each do |value|
        comparison_array << @board [value]
        winning_array << value
      end 
      if (comparison_array == [("X"), ("X"), ("X")]) || 
         (comparison_array == [("O"), ("O"), ("O")])
         tic_tac_toe = true
         return winning_array
      end 
    end 
    if tic_tac_toe == false
      return false
    end 
  end 
  
  def full?
    full = 0
    @board.each do |element|
      if !(element == " ")
        full += 1 
      end 
    end 
    if full == 9
      return true
    else
      return false
    end
  end 
  
  def draw?
    if ((!won? && full?) == true)
      return true
    else
      return false
    end 
  end 
  
  def over? 
    if (draw? ==  true)
      return true
    elsif (!won? == false)
      return true
    else
      return false
    end 
  end 
  
  def winner
    win = ""
    if (!won? == false)
      win = turn_count % 2 == 0 ? "O" : "X"
      return win
    else 
      return nil
    end 
  end 
  
  def play 
    puts "Welcome to Tic Tac Toe!"
    display_board
    while over? == false
      turn 
    end 
    if (!won? == false)
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end 
  end 
  
end 

game = TicTacToe.new
game.play