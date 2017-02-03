module Minesweeper
  class Level
    def self.mine_count(level_name)
      mines = 0
      mines = 10 if level_name == "BEGINNER"
      mines = 40 if level_name == "INTERMIDIATE"
      mines = 99 if level_name == "ADVANCED"
      mines
    end
  end
end