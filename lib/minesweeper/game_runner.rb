module Minesweeper
  class GameRunner

    attr_accessor :level, :board, :user_board, :rows, :columns, :fate
    def initialize(level)
      @level = level
      @rows, @columns = Minesweeper::Level.dimension(@level)
      @user_board = Array.new(@rows){ Array.new(@columns,0) }
      @fate = false
      @board = Minesweeper::Bomb.place_mines(@user_board.clone, Minesweeper::Level.mine_count(level))
      play
    end

    def play
      @sweep = Minesweeper::Sweep.new(@board, @mine_count)
      update_board
    end

    def update_board
      @board = @sweep.board
    end

    def diff_display
      puts ""
      for i in 0..@rows - 1 do
        for j in 0..@columns - 1 do
          if !@fate && @board[i][j] != 'x' 
            if @user_board[i][j] != @board[i][j] 
              @user_board[i][j] = @board[i][j]
            end
          elsif @fate && @board[i][j] == 'x'
            @user_board[i][j] = @board[i][j] if @board[i][j] == 'x'
          end
          print @user_board[i][j]
        end
        puts ""
      end
    end

    def move(x, y)
      @fate = @sweep.fated?(x, y)
      if !@fate
        @sweep.sweep_over(x, y)
        update_board
        diff_display
      else
        diff_display
      end
      @fate
    end

    def self.prompt_level
      "1.Beginner\n2.Intermidiate\n3.Advanced"
    end
  end
end
