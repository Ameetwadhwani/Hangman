class Hangman

  WORD_LIST = ["lemonade", "banana", "computer", "burrito", "watermelon", "soda" ]

  attr_accessor :word, :chances, :board, :word_list, :guesses, :answer

  def initialize()
    @word = WORD_LIST.sample
    @board = draw_board(@word)
    @chances = 8
    @guesses = []
  end

  def guess(letter)
    if letter == @word
      @board = @word
    else
      if word_has?(letter)
        put_letter_on_board(letter)
      else
        wrong_letter(letter) unless @guesses.include? letter
      end
    end
  end

  def guesses
    @guesses.to_s
  end

  def win?
    !@board.include?("_")
  end

  def lost?
    @chances == 0
  end


  private

  def put_letter_on_board(letter)
    for i in (0..@word.length)
      @board[i] = letter if @word[i] == letter
    end
  end

  def valid_guess?(letter)
    letter.length == 1
  end

  def word_has?(letter)
    @word.include?(letter)
  end

  def draw_board(word)
    "_" * word.length
  end

  def wrong_letter(letter)
    @chances -= 1
    @guesses << letter
  end

end
