class Player
  attr_reader :symbol
  
  def initialize(symbol)
    @symbol = symbol
  end

  def make_move
    loop do
      puts "Player #{@symbol}, enter your move (1-9):"
      input = gets.chomp

      if valid_input?(input)
        position = input.to_i - 1
        return position
      else
        puts "Invalid input. Please enter a number between 1 and 9."
      end
    end
  end

  private

  def valid_input?(input)
    input.match?(/^\d+$/) && input.to_i.between?(1, 9)
  end
end