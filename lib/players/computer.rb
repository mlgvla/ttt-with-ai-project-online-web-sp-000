module Players
  class Computer < Player

    def move(board)
      input = rand(0..8)

      while board.cells[input] != " "
        input = rand(0..8)
      end
       return (input + 1).to_s
    end
    
    # def move(board)
    #   if board.cells[0] == " "
    #     return "1"
    #   elsif board.cells[1] == " "
    #     return "2"
    #   elsif board.cells[2] == " "
    #     return "3"
    #   elsif board.cells[3] == " "
    #     return "4"
    #   elsif board.cells[4] == " "
    #     return "5"
    #   elsif board.cells[5] == " "
    #     return "6"
    #   elsif board.cells[6] == " "
    #     return "7"
    #   elsif board.cells[7] == " "
    #     return "8"
    #   elsif board.cells[8] == " "
    #     return "9"
    #   end
    # end
  end
end
