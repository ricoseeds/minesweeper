module Minesweeper
  class Bomb
    def self.place_mines(board, mine_count, safe_begining_pos = [0,0])
      mines = mine_count
      temp_board = board.flatten
      fix_position = safe_begining_pos[0] * board[0].length + safe_begining_pos[1]
      book_keep = Hash.new(0)
      while temp_board.count('x') != mine_count
        rand_index = rand(temp_board.length)
        book_keep[rand_index.to_s] += 1
        if book_keep[rand_index.to_s] == 1 && rand_index != fix_position
          temp_board[rand_index] = 'x'
        end
      end
      temp_board.each_slice(board[0].length).to_a
    end
  end
end