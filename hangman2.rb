class Hangman

  WORD_LIST = ["lemonade", "burrito", "hockey", "computer", "soda", "bitmaker", "fajita", "internet"]

  attr_accessor :board, :word, :chances

  def initialize()
    @word = WORD_LIST.sample
    @chances = 8
    @board = draw_board(@word)
  end 


  def draw_board(word)
  end

end


game = Hangman.new()
puts game.word
puts game.board
