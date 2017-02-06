require 'thor'

module Minesweeper
  class Cli < Thor
    desc "play", "Player can start playing"
    def play
      say(Minesweeper::GameRunner.prompt_level)
      prompt_levels if @no_of_prompts == 0
      level = ask("Choose Level :")
      begin 
        !!Integer(level)
        system('clear')
        current_game = Minesweeper::GameRunner.new(level)          
        
      rescue ArgumentError
        say("Why Kidding?")
        play
      end
    end
  end
end