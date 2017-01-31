
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.map!.with_index do |cup, idx|
      idx == 6 || idx == 13 ? [] : [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13 || start_pos < 0
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    until stones.empty?
      start_pos += 1
      if start_pos > 13
        start_pos = 0
      end
      if current_player_name == @player1
        next if start_pos == 13
      else
        next if start_pos == 6
      end
      @cups[start_pos] << stones.pop
    end

    render
    next_turn(start_pos,current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    return :switch if @cups[ending_cup_idx].length == 1
    if current_player_name == @player1
      return :prompt if ending_cup_idx == 6
    else
      return :prompt if ending_cup_idx == 13
    end
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |idx| @cups[idx].empty? } || (7..12).all? { |idx| @cups[idx].empty? }
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 0
      :draw
    when -1
      @player2
    when 1
      @player1
    end
  end
end
