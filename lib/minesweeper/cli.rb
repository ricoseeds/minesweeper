require 'thor'

module Minesweeper
  class Cli < Thor
    desc "play", "Player can start playing"
    def play
      puts Minesweeper::GameRunner.prompt_level
    end
  end
end