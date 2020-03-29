require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts(" #{cells[0]} | #{cells[1]} | #{cells[2]} ")
    puts("-----------")
    puts(" #{cells[3]} | #{cells[4]} | #{cells[5]} ")
    puts("-----------")
    puts(" #{cells[6]} | #{cells[7]} | #{cells[8]} ")
  end

  def position(cell_number)
    @cells[cell_number.to_i - 1]
  end

  def full?
    @cells.include?(" ")? false : true
  end

  def turn_count
    @cells.select {|cell| cell != " "}.length
  end

  def taken?(position)
    cell = @cells[position.to_i - 1]
    cell == "X" || cell == "O"? true : false
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !taken?(position) ? true : false
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

end
