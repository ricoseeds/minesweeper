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
        current_game = Minesweeper::GameRunner.new(level.to_i) 
        current_game.diff_display         
        move = ask("grid coordinates please : ").to_s
        while !current_game.move(move.split(' ')[0].to_i,move.split(' ')[1].to_i) 
          move = ask("grid coordinates please : ").to_s
          system('clear')
        end
        say("BYE!")
      rescue ArgumentError
        say("Why Kidding?")
        play
      end
    end
  end
end