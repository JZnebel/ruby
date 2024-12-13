class Game
  def initialize
    @board = Board.new
    @player_x = Player.new("X")
    @player_o = Player.new("O")
    @current_player = @player_x
  end

  def play
    loop do
      until @board.game_over?
        @board.display
        move = @current_player.make_move

        if @board.valid_move?(move)
          @board.place_marker(move, @current_player.symbol)
          switch_turn
        else
          puts "Invalid move, try again."
        end
      end

      @board.display
      announce_winner
      break unless play_again?
      
      reset_game
    end
  end

  private

  def switch_turn
    @current_player = @current_player == @player_x ? @player_o : @player_x
  end

  def announce_winner
    winner = @board.winner?
    if winner
      puts "Player #{winner} wins!"
    else
      puts "It's a draw!"
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    input = gets.chomp.downcase
    input == "y"
  end

  def reset_game
    @board = Board.new
    @current_player = @player_x
  end
end