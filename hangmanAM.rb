class Hangman

  WORD_LIST = ["lemonade"] #, "burrito", "hockey", "computer", "soda", "bitmaker", "fajita", "internet"]

  attr_accessor :board, :word, :word_array, :chances, :guesses

  def initialize()
    @word = WORD_LIST.sample
    @word_array = @word.split(//)
    @board = draw_board(@word_array)
    @guesses = []
    @chances = 8
  end 

  # initial drawing of board
  def draw_board(word)
    word.join(" ").gsub!(/[a-z]/, "_")
  end

  # main method
  def guess(val)
    if @word.include?(val)
      update_board(val)
    else
      incorrect_guess(val)
    end
  end

  # re-draws board when word_has_val? returns true to reflect correct guess
  def update_board(val)
    @word_array.join().gsub!(/[^#{val}]/, "_").split(//)
  end

  # reduce number of guesses by 1
  def incorrect_guess(val)
    @chances -= 1
    @guesses << val
  end

  # determine if guessed word matches @word
  def win?
    @guess == @word
  end

  # occurs when @chances == 0
  def lost?
    @chances == 0
  end

end


game = Hangman.new()
# puts "Welcome to Hangman! You have #{game.chances} chances to win!"
# puts "Your word has #{game.word.length} numbers and/or letters:\n#{game.board}" 
p game.board
p game.word_array
game.update_board('e')
p game.board
p game.word_array



