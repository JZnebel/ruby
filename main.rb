# main.rb
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'

# Start the game
game = Game.new
game.play
