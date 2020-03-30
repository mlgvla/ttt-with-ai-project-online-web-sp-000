require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [6, 4, 2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    # binding.pry
    @board = board

    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
        (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    false
  end

  def draw?
    if won? || @board.cells.include?(" ")
      return false
    end
      return true
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if !won?
      return nil
    else
      @board.cells[won?[0]]== "X" ? "X" : "O" #won? returns false or winning combination in an array
    end
  end

  def turn
    puts "Please enter a number 1 - 9"
    input = current_player.move(@board)

    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      puts "Please enter a number 1 - 9"
      @board.display
      turn
    end
    @board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  
end
