class Board
  def initialize
    @board = Array.new(9, " ")
  end

  def display
    puts "\n"
    (0..8).each_slice(3) do |row|
      puts row.map { |i| @board[i] }.join(" | ")
      puts "--------" unless row.last == 8
    end
  end

  def valid_move?(position)
    position.between?(0, 8) && @board[position] == " "
  end

  def place_marker(position, marker)
    @board[position] = marker
  end

  def winner?
    winning_combinations.each do |combo|
      if all_same?(combo)
        return @board[combo[0]]
      end
    end
    nil
  end

  def draw?
    !@board.include?(" ")
  end

  def game_over?
    winner? || draw?
  end

  private

  def winning_combinations
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]
  end

  def all_same?(combo)
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
  end
end