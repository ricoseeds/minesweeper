require 'pry'
module Minesweeper
  class InputParser
    attr_reader :board
    def initialize(input_hash)
      @board = []
      input_hash["board_config"].each do |k, v|
        @board << v
      end
      binding.pry
    end

    def self.dummy_input
      {
        "board_config" => {
          "0" => [0,1,0,0],
          "1" => [1,0,1,1],
          "2" => [1,1,0,1],
          "3" => [0,1,1,1]
        },
        "is_solved" => false
      }
    end
  end
end
obj = Minesweeper::InputParser.new(Minesweeper::InputParser.dummy_input)
