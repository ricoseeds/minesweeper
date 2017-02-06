require 'pry'
module Minesweeper
  class InputParser
    
    attr_reader :board, :rows, :columns, :level
    def initialize(input_hash)
      @board = []
      @columns = input_hash["board_config"].keys.last.to_i + 1
      @rows = input_hash["board_config"]["0"].length
      input_hash["board_config"].each do |k, v|
        @board << v
      end
    end

    def self.dummy_input
      {
        "board_config" => {
          "0" => [0,1,0,0],
          "1" => [1,0,1,1],
          "2" => [1,1,0,1],
          "3" => [0,1,1,1]
        },
        "is_solved" => false,
        "level" => "ADVANCED"
      }
    end
  end
end
