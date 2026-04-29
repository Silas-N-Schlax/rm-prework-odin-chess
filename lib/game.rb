require_relative 'chess/player'
require_relative 'chess/board'
require_relative 'chess/serialize/serialize_game'
# Game class
class Game
  def initialize
    @player1 = Player.new('Player 1', 'b')
    @player2 = Player.new('Player 2')
    @player_turn = @player1
    @board = Board.new
  end

  def update_turn
    @player_turn = @player_turn == @player1 ? @player2 : @player1
  end

  def enemey_color
    @player_turn.color == 'b' ? 'w' : 'b'
  end

  def round
    puts '
    To save a game: save (s)
    To load a game: load (l)
    To Exit the game: exit (e)
    (Game will auto start in 3 seconds...)'.yellow
    sleep(3)
    @board.send_board
    loop do
      print "#{@player_turn.name} (#{@player_turn.color}) please enter your move -> ".magenta
      input = user_input
      return 'Exiting...'.cyan if input == :exit

      turn_over = @board.update_board(input[0], input[1], @player_turn.color)
      return 'Game Over'.cyan if @board.checkmate?(enemey_color)

      update_turn if turn_over
    end
  end

  private

  def user_input
    loop do
      input = gets.chomp
      next save_game if %w[s save].include?(input)
      next load_game if %w[l load].include?(input)
      return :exit if %w[e exit].include?(input)
      return formatted_input(input) if valid_input?(input)

      print "#{@player_turn.name} (#{@player_turn.color}) please enter your move (21,13 = Rook [2, 1] -> [1, 3]) -> ".red
    end
  end

  def save_game
    SerializeGame.save(game_state)
    print 'Are you sure you want to save your game? Any other saved game will be over written! (y/n) ->'.red
    return unless gets.chomp == 'y'

    puts 'GAME SAVED!'.blue
    sleep(3)
    print "#{@player_turn.name} (#{@player_turn.color}) please enter your move -> ".magenta
  end

  def load_game
    restored = restore_game_state(SerializeGame.load)

    puts restored ? 'GAME LOADED!'.blue : 'NO GAME SAVED'.red
    sleep(3)
    @board.send_board
    print "#{@player_turn.name} (#{@player_turn.color}) please enter your move -> ".magenta
  end

  def game_state
    {
      board: @board,
      player1: @player1,
      player2: @player2,
      turn: @player_turn
    }
  end

  def restore_game_state(state)
    return nil if state.nil?

    @board = state[:board]
    @player1 = state[:player1]
    @player2 = state[:player2]
    @player_turn = state[:turn]
  end

  def formatted_input(input)
    input = input.split(',').map(&:chars)
    input = input.map { |item| item.map(&:to_i).reverse }
    input.map { |item| item.map { |num| num - 1 } }
  end

  def valid_input?(input)
    two_parts = input.split(',')
    return false unless two_parts.length == 2
    return false unless two_parts.all? { |item| item.length == 2 }

    four_parts = two_parts.map(&:chars).flatten
    return false unless four_parts.length == 4
    return true if four_parts.all? { |part| part.to_i.between?(1, 8) }

    false
  end
end
