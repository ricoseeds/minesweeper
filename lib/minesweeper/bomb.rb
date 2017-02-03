module Minesweeper
  class Bomb
    def self.place_mines(board, mine_count)
      mines = mine_count
      temp_board = board.flatten
      book_keep = Hash.new(0)
      while temp_board.count('x') != mine_count
        rand_index = rand(temp_board.length)
        book_keep[rand_index.to_s] += 1
        if book_keep[rand_index.to_s] == 1
          temp_board[rand_index] = 'x'
        end
      end
      temp_board.each_slice(board[0].length).to_a
    end
  end
end