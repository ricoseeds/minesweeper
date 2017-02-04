module Minesweeper
  class Sweep
    attr_reader :board, :game_over_flag, :rows, :columns
    def initialize(board, mine_count)
      @board = board
      game_over_flag = false
      @rows = board[0].length
      @columns = board.length
      @mine_count = mine_count
    end

    def bounded?(x, y)
      if x < 0 || y < 0 || x > @rows - 1 || y > @columns - 1
        return false
      end
        return true
    end

    def fated?(x, y)
      if @board[x][y] == 'x'
        @game_over_flag = true
        return true
      end
      return false
    end

    def sweep_over(x, y)
      if bounded?(x, y) && @board[x][y] == 0
        current_place_value = assign_sweep_value(x, y)
        if current_place_value > 0
          @board[x][y] = current_place_value
        else
          @board[x][y] = 'e'
          sweep_over(x, y - 1)
          sweep_over(x, y + 1)
          sweep_over(x - 1, y)
          sweep_over(x + 1, y)
          sweep_over(x - 1, y - 1)
          sweep_over(x + 1, y - 1)
          sweep_over(x - 1, y + 1)
          sweep_over(x + 1, y + 1)          
        end
      end
    end

    def assign_sweep_value(x, y)
      up = [x, y - 1]
      down = [x, y + 1]
      left = [x - 1, y]
      right = [x + 1, y]
      top_left = [x - 1, y - 1]
      top_right = [x + 1, y - 1]
      bottom_left = [x - 1, y + 1]
      bottom_right = [x + 1, y + 1]
      moves = [up, top_right, right, bottom_right, down, bottom_left, left, top_left ]
      neighbour = []
      moves.each do |move|
        neighbour << @board[move[0]][move[1]] if bounded?(move[0], move[1])
      end
      neighbour.count('x')
    end

    def self.dummy_board
      dummy = Array.new(9){ Array.new(9,0) }
      dummy_level_name = "BEGINNER"
      mine_count = Minesweeper::Level.mine_count(dummy_level_name)
      return Minesweeper::Bomb.place_mines(dummy, mine_count)
    end
  end
end


