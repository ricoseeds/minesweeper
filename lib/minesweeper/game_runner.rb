module Minesweeper
  class GameRunner
    attr_accessor :level
    def initialize(level)
      @level = level
    end


    def self.prompt_level
      "1.Beginner\n2.Intermidiate\n3.Advanced"
    end
  end
end
