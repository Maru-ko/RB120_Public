require 'yaml'

IMAGE_LOADER = YAML.load_file('ttt.yml')

# rubocop:disable Metrics/ModuleLength
module UserInterface
  PADDING = '     '

  def join_or(array, delimiter='  |  ', word ='-or-')
    if array.size <= 2
      couple = array.join(" #{word} ")
      "  #{couple}  "
    else
      "  #{array.join(delimiter)}  "
    end
  end

  def yml_load(key)
    IMAGE_LOADER[key]
  end

  def yml_out(key)
    puts(yml_load(key))
  end

  def yml_print(key)
    print(yml_load(key))
  end

  def xo_line
    yml_out('square_line')
  end

  def dot_line
    yml_out('line_dots')
  end

  def side_padding(row, space=PADDING, closure='')
    puts space + row + closure
  end

  def column_placer(one, two, three)
    line = "•••   #{one}   •••   #{two}   •••   #{three}   •••"
    side_padding(line)
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def clear_screen_and_wipeout
    clear_screen
    screen_wipeout
  end

  def enter_to_continue
    print "# PRESS [ENTER] TO CONTINUE #".rjust(42)
    gets.chomp
    clear_screen
  end

  def intro_screen
    screen_wipeout(2)
    screen_loader('G A M E  ~ I S ~ L O A D I N G')
    sleep 1
    screen_wipeout
    yml_out('welcome')
    please_wait(4)
    screen_wipeout
    yml_out('welcome')
    enter_to_continue
  end

  def bumper
    screen_wipeout
    yml_out('bumper_screen')
    please_wait
    screen_wipeout(2)
    yml_out('bumper_screen')
    enter_to_continue
  end

  def screen_wipeout(frames=3)
    frames.times { yml_out('wipeout') }
    clear_screen
  end

  def screen_loader(message1, char='.', millisec=0.01, message2='Done Loading!')
    puts message1.ljust(55, char)
    39.times do |_|
      random_liner.each do |num|
        print char * num
        sleep millisec
      end
      puts
    end
    puts message2.rjust(55, char)
  end

  def random_liner
    [8, 9, 3, 6, 9, 11, 7, 2].sort_by { rand }
  end

  def name_header_top
    screen_wipeout(2)
    clear_screen
    yml_out('name_screen')
    yml_print('name_snake')
  end

  def please_wait(seconds=2)
    puts "P L E A S E ~ W A I T...".center(55)
    sleep seconds
  end

  def welcome_human_message(name)
    clear_screen
    display_name = format_name(name)
    yml_out('welcome_a')
    puts display_name
    yml_out('welcome_b')
    puts display_name
    yml_out('welcome_c')
    puts display_name
    yml_out('welcome_d')
    please_wait
  end

  def format_name(name)
    left_border = "•••••••• •••••"
    right_border = '••••• ••••••••'
    left_border + name.center(27) + right_border
  end

  def opponent_selection_screen
    screen_wipeout(2)
    yml_out('opponent_selection_header')
    yml_print('opponent_selection_bar')
  end

  def opponent_selection_error
    yml_out('opponent_selection_error')
    sleep 2
  end

  def display_chosen_opponent(name)
    screen_wipeout
    yml_out(name)
    please_wait
  end

  def coin_toss_screen
    screen_wipeout
    yml_out('coin_toss_screen')
    sleep 0.7
    yml_print('coin_toss_select')
  end

  def coin_toss_error
    screen_wipeout
    yml_out('coin_toss_screen')
    yml_out('coin_entry_error')
    please_wait
  end

  def coin_toss_winner_screen(guess)
    screen_wipeout
    coin_result_message(guess)
    yml_out(guess)
    sleep 0.5
    yml_out('win')
    sleep 0.5
    yml_out('coin_toss_win_header')
    sleep 0.5
    yml_out('coin_toss_win_banner')
    enter_to_continue
  end

  def coin_toss_loss_screen(guess, coin)
    screen_wipeout
    coin_result_message(guess)
    yml_out(coin)
    sleep 0.5
    yml_out('loss')
    sleep 0.5
    yml_out('coin_toss_loss_header')
    sleep 0.5
    yml_out('coin_toss_loss_banner')
    enter_to_continue
  end

  def coin_result_message(guess)
    message = " YOU GUESSED: #{guess.upcase}, IT ACTUALLY IS: ".center(55, '•')
    puts message
    sleep 0.7
  end

  def ct_choose_marker_screen
    screen_wipeout
    yml_out('ct_select_marker')
    sleep 0.5
    yml_print('ct_marker_bar')
  end

  def ct_marker_selection_error
    yml_out('ct_marker_error')
    please_wait(2)
  end

  def ct_your_selection_screen(marker_selection)
    screen_wipeout
    yml_out('you_chose')
    marker_selection == 1 ? yml_out('xxx') : yml_out('ooo')
    please_wait(3)
  end

  def ct_display_loss_marker(num)
    screen_wipeout
    if num == 1
      yml_out('you_are_an')
      yml_out('xxx')
    else
      yml_out('you_are_a')
      yml_out('ooo')
    end
    please_wait
  end

  def ttt_interactive_header(round, ties)
    yml_print('ttt_interactive_a')
    info = "ROUND: #{round} • TIES: #{ties}".center(25)
    print info
    yml_out('ttt_interactive_b')
    yml_out('line_dots_plus')
  end

  def display_square_selection(board)
    yml_print('choose_square_a')
    join_or_exclusive(board)
    yml_print('choose_square_b')
  end

  def join_or_exclusive(board)
    squares = join_or(board.unmarked_keys)
    print squares.center(53, '•')
  end

  def square_selection_error(board)
    yml_print('choose_square_error_a')
    join_or_exclusive(board)
    yml_out('choose_square_error_b')
    please_wait
  end

  def opponent_move_simulation(opponent)
    yml_print('opponent_choosing_a')
    opp_name = full_name?(opponent) ? opponent.full_name : opponent.name
    print opp_name.center(49)
    yml_out('opponent_choosing_b')
  end

  def full_name?(object)
    !!object.full_name
  end

  def thinking_animation
    rand(3).times do |_|
      random_liner.each do |dots|
        print '•' * dots
        sleep [0.1, 0.2, 0.3, 0.4].sample
      end
      puts ''
    end
    print 'Done!'.center(55)
    sleep 0.5
  end

  def round_goes_to_human(human)
    clear_screen
    puts '~' * 55
    name_lines(human.name)
    yml_out('you_won_this_round')
    name_lines(human.name)
    please_wait(1)
  end

  def round_goes_to_opponent(opponent)
    clear_screen
    puts '~' * 55
    name_lines(opponent.name)
    yml_out('you_lost_this_round')
    name_lines(opponent.name)
    please_wait(1)
  end

  def name_lines(name)
    2.times do |_|
      message = "    " + name.upcase + "!    "
      puts " THIS ROUND GOES TO ".center(55, 'o x')
      puts message.center(55, 'x o')
      puts ''
    end
  end

  def round_tied_scene(board)
    clear_screen_and_wipeout
    if board.full?
      yml_out('round_tied')
      yml_out('ying_yang')
      yml_out('no_one_wins')
    elsif board.unbeatable?
      yml_out('ying_yang')
      yml_out('no_chance')
    end
    please_wait
  end

  def grand_champion_scene(name, opponent=false)
    clear_screen_and_wipeout
    yml_out('stars')
    if opponent
      opponent_champ(name)
    else
      human_champ(name)
    end
    enter_to_continue
  end

  def grand_win_champ(name, grand_winner=false)
    pop = name.upcase.chars.join(' ')
    korn = " • #{pop} • ".center(55)
    puts ''
    puts korn
    if grand_winner
      puts " • I S • T H E • G R A N D  • W I N N E R ! • \n".center(55)
    else
      puts " • I S • T H E • G R A N D  • C H A M P I O N ! • \n".center(55)
    end
  end

  def opponent_champ(name)
    yml_out(name + '_WIN')
    yml_out('grand_champ_opp')
    yml_out('you_loose')
    yml_out('better_luck')
  end

  def human_champ(name)
    grand_win_champ(name)
    yml_out('grand_champ_you')
    grand_win_champ(name)
    yml_out('stars')
  end

  def human_grand_winner(name)
    grand_win_champ(name, true)
    yml_out('grand_winner_you')
    grand_win_champ(name, true)
    yml_out('ying_yang')
  end

  def opponent_grand_winner(name)
    yml_out(name + '_WIN')
    yml_out('grand_winner_opp')
    yml_out('you_loose')
    yml_out('better_luck')
  end

  def tko_grand_winner(name, opponent=false)
    clear_screen_and_wipeout
    yml_out('ying_yang')
    if opponent
      opponent_grand_winner(name)
    else
      human_grand_winner(name)
    end
    enter_to_continue
  end

  def no_mercy_no_malice
    clear_screen_and_wipeout
    yml_out('no_mercy')
    enter_to_continue
  end

  def play_again_custom(name)
    clear_screen_and_wipeout
    yml_print('play_again_a')
    print name.center(20)
    yml_print('play_again_b')
  end

  def play_again_error
    clear_screen_and_wipeout
    yml_out('play_again_error')
    please_wait(3)
  end

  def lets_play_again_screen
    yml_out('ying_yang')
    yml_out('play_again')
    yml_out('ying_yang')
    please_wait(2)
  end

  def goodbye_credits
    clear_screen_and_wipeout
    yml_out('stars')
    yml_out('outro')
    yml_out('stars')
    enter_to_continue
    yml_out('goodbye')
    sleep 2
    clear_screen
  end
end
# rubocop:enable Metrics/ModuleLength

class Board
  include UserInterface
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def unbeatable?
    WINNING_LINES.each do |line|
      markers = @squares.values_at(*line).map(&:marker).uniq
      empty_space = [Square::SPACE_MARKER]
      return false if (markers - empty_space).size <= 1
    end
    true
  end

  def draw
    yml_out('board_part1')
    column_placer(@squares[1], @squares[2], @squares[3])
    yml_out('board_part2')
    column_placer(@squares[4], @squares[5], @squares[6])
    yml_out('board_part3')
    column_placer(@squares[7], @squares[8], @squares[9])
    yml_out('board_part4')
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  SPACE_MARKER = "     "

  attr_accessor :marker

  def initialize(marker=SPACE_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == SPACE_MARKER
  end

  def marked?
    !unmarked?
  end
end

class Player
  include UserInterface
  attr_accessor :score, :name, :marker

  def initialize
    @score = 0
  end

  def score_up(points)
    @score += points
  end

  def to_s
    @name
  end

  def >(other)
    score > other.score
  end

  def <(other)
    score < other.score
  end
end

class Opponent < Player
  attr_reader :full_name

  private

  def find_at_risk_square(line, board, a_marker)
    unless board.squares.values_at(*line).map(&:marker).count(a_marker) != 2
      sp = Square::SPACE_MARKER
      sqrs = board.squares
      return sqrs.select { |k, v| line.include?(k) && v.marker == sp }.keys[0]
    end
    nil
  end

  def offend_defend(board, defense=false)
    square = nil
    if defense
      Board::WINNING_LINES.each do |line|
        square = find_at_risk_square(line, board, defense)
        break if square
      end
    else
      square = offense(square, board)
    end
    square
  end

  def offense(square, board)
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, marker)
      break if square
    end
    square
  end
end

class DotMatrix < Opponent
  def initialize
    super
    @name = "DOT-MATRIX"
  end

  def select_square(board, _)
    random = board.unmarked_keys.sample
    offense = offend_defend(board)
    jagger = [random, offense] - [nil]
    board[jagger.sample] = marker
  end
end

class Alita < Opponent
  def initialize
    super
    @name = "ALITA"
    @full_name = "ALITA 'GALLY' YOKO HK-BR035"
    set_custom_marker
  end

  def select_square(board, human_marker)
    random = board.unmarked_keys.sample
    center = 5 if board.unmarked_keys.include?(5)
    defense = offend_defend(board, human_marker)
    offense = offend_defend(board)
    jagger = [center, offense, defense, random] - [nil]
    board[jagger[0]] = marker
  end

  private

  def set_custom_marker
    @marker = "♫ ♬ ♫"
  end
end

class Major < Opponent
  def initialize
    super
    @name = "MAJOR"
    @full_name = "MAJOR MOTOKO KUSANAGI"
    set_custom_marker
  end

  def select_square(board, human_marker)
    random = board.unmarked_keys.sample
    center = 5 if board.unmarked_keys.include?(5)
    defense = offend_defend(board, human_marker)
    offense = offend_defend(board)
    jagger = [center, defense, offense, random].uniq - [nil]
    board[jagger.sample] = marker
  end

  private

  def set_custom_marker
    @marker = "\u2764 \u2763 \u2764"
  end
end

class Human < Player
  def set_name
    custom_name = nil
    loop do
      name_header_top
      custom_name = gets.chomp.strip
      break unless custom_name.delete(' ').empty? || custom_name.size > 20
      yml_out('name_error')
      please_wait
    end
    @name = custom_name.upcase
    welcome_human_message(name)
  end

  def select_opponent
    opp_number = nil
    opps = TTTGame::OPPONENTS.size
    loop do
      opponent_selection_screen
      opp_number = gets.chomp.to_i
      break if (1..opps).to_a.include?(opp_number)
      opponent_selection_error
    end
    opp_number - 1
  end
end

class TTTGame
  include UserInterface
  MAX_ROUNDS = 10
  MAX_SCORE = 5
  OPPONENTS = [DotMatrix, Alita, Major]

  def initialize
    @board = Board.new
    @round = 1
    @current_marker = nil
    @tie = 0
  end

  def play
    welcome_and_set_human
    main_game
    goodbye_credits
  end

  private

  attr_reader :round, :current_marker
  attr_accessor :coin_toss_winner, :tie, :human, :opponent, :board

  def main_game
    loop do
      set_opponent_and_markers
      overall_matches
      determine_overall_results
      break unless play_again?
      major_reset
      lets_play_again_screen
    end
  end

  def overall_matches
    loop do
      display_board
      player_move
      determine_round_results
      break if reached_game_limits?
      reset_board
    end
  end

  def welcome_and_set_human
    bumper
    intro_screen
    set_human_player
  end

  def set_opponent_and_markers
    set_opponent
    set_markers
  end

  def major_reset
    @round = 1
    reset_board
    @current_marker = nil
    human.score = 0
  end

  def play_again?
    answer = nil
    loop do
      clear_screen_and_wipeout
      play_again_custom(human.name)
      answer = gets.chomp.to_i
      break if [1, 2].include?(answer)
      play_again_error
    end
    answer == 1
  end

  def determine_overall_results
    if human.score == MAX_SCORE
      grand_champion_scene(human.name)
    elsif opponent.score == MAX_SCORE
      grand_champion_scene(opponent.name, true)
    elsif round >= MAX_ROUNDS
      default_results
    end
  end

  def reached_game_limits?
    round > MAX_ROUNDS ||
      MAX_SCORE == human.score ||
      MAX_SCORE == opponent.score
  end

  def determine_round_results
    if board.someone_won?
      round_win_sequence
    elsif board.full? || board.unbeatable?
      round_tied_sequence
    end
    sleep 2
    realign_current_marker
    increase_round
  end

  def round_win_sequence
    if board.winning_marker == human.marker
      human.score_up(1)
      round_goes_to_human(human)
    else
      opponent.score_up(1)
      round_goes_to_opponent(opponent)
    end
  end

  def default_results
    if human > opponent
      tko_grand_winner(human.name)
    elsif human < opponent
      tko_grand_winner(opponent.name, true)
    else
      no_mercy_no_malice
    end
  end

  def round_tied_unbeatable_sequence
    tie_add_point
    unbeatable_round_scene
  end

  def round_tied_sequence
    tie_add_point
    round_tied_scene(board)
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.unbeatable? || board.full?
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = opponent.marker
    else
      opponent_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    square = nil
    loop do
      display_board
      display_square_selection(board)
      square = gets.to_i
      break if board.unmarked_keys.include?(square)
      display_board
      square_selection_error(board)
    end
    board[square] = human.marker
  end

  def opponent_moves
    display_board
    opponent.select_square(board, human.marker)
    opponent_move_simulation(opponent)
    thinking_animation
    display_board
    sleep 1
  end

  def reset_board
    board.reset
  end

  def realign_current_marker
    @current_marker = coin_toss_winner.marker
  end

  def tie_add_point
    @tie += 1
  end

  def increase_round
    @round += 1
  end

  def set_markers
    screen_wipeout
    clear_screen
    toss_coin = CoinTossGame.new(human, opponent)
    @coin_toss_winner = toss_coin.play
    @current_marker = coin_toss_winner.marker
  end

  def set_human_player
    @human = Human.new
    human.set_name
  end

  def set_opponent
    opponent_number = human.select_opponent
    self.opponent = OPPONENTS[opponent_number].new
    display_chosen_opponent(opponent.name)
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    clear_screen_and_wipeout
    header
    board.draw
  end

  def header
    ttt_interactive_header(round, tie)
    line1 = format_human_info
    line2 = format_opponent_info
    side_padding(line1, '   ••', '••')
    side_padding(' '.center(45), '   ••', '••')
    side_padding(line2, '   ••', '••')
    dot_line
  end

  def format_human_info
    "#{human.name} is [#{human.marker}] • SCORE: #{human.score}".center(45)
  end

  def format_opponent_info
    n = opponent.name
    m = opponent.marker
    s = opponent.score
    "#{n} is [#{m}] • SCORE: #{s}".center(45)
  end
end

class CoinTossGame
  include UserInterface
  X_MARKER = "X X X"
  O_MARKER = "O O O"

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @coin = %w(heads tails).sample
  end

  def play
    select_heads_or_tails
    if coin == guess
      win_sequence
    else
      loss_sequence
    end
  end

  private

  attr_accessor :coin, :guess, :player1, :player2

  def select_heads_or_tails
    selection = nil
    loop do
      coin_toss_screen
      selection = gets.chomp.to_i
      break if [1, 2].include?(selection)
      coin_toss_error
    end
    @guess = convert_to_heads_tails(selection)
  end

  def win_sequence
    coin_toss_winner_screen(guess)
    set_win_markers
    player1
  end

  def convert_to_heads_tails(selection)
    selection == 1 ? 'heads' : 'tails'
  end

  def convert_to_marker(selection)
    selection == 1 ? X_MARKER : O_MARKER
  end

  def convert_to_num(marker)
    marker == X_MARKER ? 1 : 2
  end

  def set_win_markers
    select_player1_marker
    set_player2_marker
  end

  def select_player1_marker
    marker_selection = nil
    loop do
      ct_choose_marker_screen
      marker_selection = gets.chomp.to_i
      break if [1, 2].include?(marker_selection)
      ct_marker_selection_error
    end
    player1.marker = convert_to_marker(marker_selection)
    ct_your_selection_screen(marker_selection)
  end

  def set_player2_marker
    default_marker = default_player2_marker
    player2.marker = default_marker unless player2_has_marker?
  end

  def player2_has_marker?
    !!player2.marker
  end

  def default_player2_marker
    if player1.marker
      player1.marker == X_MARKER ? O_MARKER : X_MARKER
    else
      [X_MARKER, O_MARKER].sample # when we add a custom marker
    end
  end

  def loss_sequence
    player1.marker = [X_MARKER, O_MARKER].sample
    set_player2_marker
    coin_toss_loss_screen(guess, coin)
    num = convert_to_num(player1.marker)
    ct_display_loss_marker(num)
    sleep 2
    player2
  end
end

game = TTTGame.new
game.play
