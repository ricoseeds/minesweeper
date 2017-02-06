module Minesweeper
  class Level
    def self.mine_count(level_name)
      mines = 0
      mines = 10 if level_name == "BEGINNER" || level_name == 1
      mines = 40 if level_name == "INTERMIDIATE" || level_name == 2
      mines = 99 if level_name == "ADVANCED" || level_name == 3
      mines
    end

    def self.dimension(level_name)
      return [9, 9] if level_name == "BEGINNER" || level_name == 1
      return [16, 16] if level_name == "INTERMIDIATE" || level_name == 2
      return [30, 16] if level_name == "ADVANCED" || level_name == 3
    end
  end
end