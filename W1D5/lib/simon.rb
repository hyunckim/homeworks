class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    input = []
    show_sequence
    @sequence_length.times do |i|
      input << require_sequence
      if input.last != @seq[i]
        @game_over = true
        return @game_over
      end
    end
    @sequence_length += 1
    round_success_message
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      sleep(1)
      p color
      sleep(1)
      system 'clear'
    end
  end

  def require_sequence
    input = gets.chomp
  end

  def add_random_color
    @seq << COLORS[rand(3)]
  end

  def round_success_message
    puts "Good job! You've advance to round #{@sequence_length}. Press enter to continue"
    gets
    system 'clear'
  end

  def game_over_message
    puts "You lost on round #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
