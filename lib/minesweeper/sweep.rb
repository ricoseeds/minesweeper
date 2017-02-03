module Minesweeper
  class Sweep
    attr_reader :board, :game_over_flag
    def initialize(board, mine_count, x, y)
      game_over_flag = false
    end

    def dummy_board
      dummy = Array.new(9){ Array.new(9,0) }
      dummy_level_name = "BEGINNER"
      mine_count = Minesweeper::Level.mine_count(dummy_level_name)
      b = Minesweeper::Bomb.place_mines(dummy, mine_count)
      binding.pry
    end
  end
end