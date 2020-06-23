require 'yaml'

DISPLAY_MESSAGES = YAML.load_file('rps.yml')

module MessageLoader
  def yml_load(key)
    DISPLAY_MESSAGES[key]
  end

  def yml_out(key)
    puts(yml_load(key))
  end

  def yml_print(key)
    print(yml_load(key))
  end

  def block_center(str='', sym='=')
    puts(" #{str} ".center(48, sym))
  end

  def centered(str, c=48)
    puts str.center(c)
  end

  def continue
    print "=> press [ENTER] to continue: <= ".rjust(40)
    gets.chomp
    refresh_screen
  end

  def display_default_tie_screen
    yml_out('default_tie_screen')
  end

  def info_saved(name='')
    screen_loader("*** Welcome #{name}! ***", 6, 0.2, '•', '=> Info Saved!')
    sleep 2
  end

  def obtain_ready_screen
    refresh_screen
    yml_out('get_ready_header')
  end

  def obtain_ready_screen_reset
    sleep 1
    obtain_ready_screen
  end

  def obtain_ready_screen_error
    continue
    obtain_ready_screen
  end

  def print_centered(str, c=48)
    print str.center(c)
  end

  def refresh_screen
    system('clear') || system('cls')
  end

  def refresh_top
    refresh_screen
    top_screen
  end

  def screen_loader(m1, repeater=16, sleep_f=0.5, char='.', m2='Done Loading!')
    centered(m1)
    rand(repeater).times do
      centered(char * rand(48))
      sleep sleep_f
    end
    yml_out('start_line')
    centered(m2)
  end

  def set_window
    refresh_screen
    yml_out('expand')
    screen_loader("*** Game Loading ***")
    sleep 2
    refresh_screen
  end

  def top_screen
    yml_out('header')
  end

  def welcome_screen
    set_window
    yml_out('intro_screen')
    continue
  end
end

module GameStructure
  def clarify_get_name
    name = nil
    loop do
      name = ichi_ban
      response = gets.chomp.downcase.strip
      break if response.start_with?('y')
      clarify_get_name_reset
    end
    name
  end

  def clarify_get_name_reset
    puts "Allright, let's try again..."
    obtain_ready_screen_reset
  end

  def continue?
    ans = nil
    loop do
      opponent_screen_top
      ans = gets.chomp.downcase.strip
      break if ans.include?('y') || ans.include?('n')
      block_center(" Must Enter (y)es or (n)o!", ' ')
      sleep 2
    end
    ans.include?('y')
  end

  def continue_reset?
    ans = nil
    loop do
      outro_screen_top
      ans = gets.chomp.downcase.strip
      break if ans.include?('y') || ans.include?('n')
      block_center(" Must Enter (y)es or (n)o!", ' ')
      sleep 2
    end
    ans.include?('y')
  end

  def game_outro
    centered("THANK YOU FOR PLAYING")
    sleep 3
    refresh_screen
  end

  def ichi_ban
    name = namer
    centered("You have entered => #{name} <=")
    print("Is this correct? (y)/(n): ".rjust(36))
    name
  end

  def namer
    name = nil
    loop do
      print("\n=> Please enter your name or handle:\n \n=> ")
      name = gets.chomp.strip
      break unless name.delete(' ').empty? || name.size > 12
      yml_out('name_error')
      sleep 3
      obtain_ready_screen_reset
    end
    name
  end

  def opponent_screen_top
    refresh_screen
    yml_print('continue_opp_screen')
  end

  def outro_screen_top
    refresh_screen
    yml_print('outro')
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  WINNING_MOVES = { 'rock' => ['scissors', 'lizard'],
                    'paper' => ['rock', 'spock'],
                    'scissors' => ['paper', 'lizard'],
                    'lizard' => ['paper', 'spock'],
                    'spock' => ['rock', 'scissors'] }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_MOVES[value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Player
  include MessageLoader
  include GameStructure
  attr_accessor :name, :move, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def s_name
    if name.include?(' ')
      long_name = name.split
      first = long_name[0]
      last = long_name[-1]
      @s_name = "#{first.upcase} #{last[0].upcase}."
    else
      @s_name = name
    end
  end

  def s_ncap
    s_name.upcase
  end

  def to_s
    name
  end

  def self.name
    to_s
  end
end

class Human < Player
  def set_name
    animated_get_name
  end

  def animated_get_name
    @name = clarify_get_name
    refresh_top
    screen_loader("*** Welcome #{name}! ***", 6, 0.2, '•', '=> Info Saved!')
    sleep 2
  end

  def choose
    trigger = pre_choose
    if trigger == 'h'
      centered("#{name} has chosen [#{move}]")
    else
      centered("The computer has chosen [#{move}] for #{name}!")
    end
    centered("Please wait...")
    sleep 1.5
  end

  def pre_choose
    move, trigger = select_move
    self.move = Move.new(move)
    history << move.to_s
    trigger
  end

  def select_move
    choice = nil
    yml_out('choose_move')
    loop do
      print("=> Enter choice: ".rjust(24))
      choice = gets.chomp.strip.downcase
      choice = translator_of(choice)
      break if choice
      select_move_reset
    end
    choice
  end

  def select_move_reset
    centered("Wrong input, please try again!")
    sleep 1
  end

  def translator_of(choice)
    return [Move::VALUES.sample, 'c'] if choice == '6' || choice[0, 2] == 'ra'
    return [Move::VALUES[choice.to_i - 1], 'h'] if ('1'..'5').include?(choice)
    return [choice, 'h'] if Move::VALUES.include?(choice)
    if Move::VALUES.any? { |val| val[0, 2] == choice[0, 2] }
      return [Move::VALUES.select { |val| val[0, 2] == choice[0, 2] }[0], 'h']
    end
    false
  end
end

class Opponent < Player
  def choose(_moves)
    self.move = Move.new(Move::VALUES.sample)
    wrap_up_move
  end

  def lazer_beam(human_moves)
    last_move = human_moves[-1]
    doki_doki = Move::WINNING_MOVES.select do |_weakness, strength|
      strength.include?(last_move)
    end
    doki_doki.keys
  end

  def move_description
    puts "#{name} has chosen to go with [#{move}]"
  end

  def random_quote
    centered("#{name} says -")
    puts(DISPLAY_MESSAGES[self.class.name][rand(4)])
    puts
  end

  def wrap_up_move
    random_quote
    history << move.to_s
    screen_loader("#{name} chose...", 8, 0.3, '.', "***")
    centered("#{s_name} has chosen [#{move}]")
    yml_out('block_line')
    centered('please wait...')
    sleep 3
  end
end

class Rajesh < Opponent
  def set_name
    @name = "Rajesh Koothrappali"
  end

  def choose(_human_moves)
    pick = (Move::VALUES.sample(rand(4))).sample
    self.move = Move.new(pick)
    wrap_up_move
  end
end

class Leonard < Opponent
  def set_name
    @name = "Leonard Hofstadter"
  end

  def choose(human_moves)
    possibilities = Move::VALUES
    dnd = (possibilities + human_moves).rotate(rand(5)).sample
    self.move = Move.new(dnd)
    wrap_up_move
  end
end

class Penny < Opponent
  def set_name
    @name = "Penny"
  end

  def choose(human_moves)
    the_move = human_moves.sample
    self.move = Move.new(the_move)
    wrap_up_move
  end
end

class Sheldon < Opponent
  def set_name
    @name = "Sheldon Cooper"
  end

  def choose(human_history)
    bazinga = lazer_beam(human_history).sample
    self.move = Move.new(bazinga)
    wrap_up_move
  end
end

class Howard < Opponent
  def set_name
    @name = "Howard Wolowitz"
  end

  def choose(human_moves)
    bazinga = lazer_beam(human_moves).first
    oh = ['rock', 'spock', 'spock', 'rock', 'spock', bazinga].sample
    self.move = Move.new(oh)
    wrap_up_move
  end
end

class Bernadette < Opponent
  def set_name
    @name = "Bernadette Rostenkowski"
  end

  def choose(_human_moves)
    ouch = Move::VALUES.sample(rand(4)).last
    momma = ['lizard', 'spock', 'lizard', 'spock', 'scissors', ouch].sample
    self.move = Move.new(momma)
    wrap_up_move
  end
end

class Amy < Opponent
  def set_name
    @name = "Amy Farrah Fowler"
  end

  def choose(human_moves)
    bazinga = lazer_beam(human_moves)
    main_move = (bazinga + [human_moves.sample]).sample
    self.move = Move.new(main_move)
    wrap_up_move
  end
end

class Wil < Opponent
  def set_name
    @name = "Wil Wheaton"
  end
end

class RPSLSGame
  include MessageLoader
  include GameStructure
  attr_accessor :human, :opponent, :round, :tie, :win_history

  RIVALS = [Rajesh, Leonard, Penny, Sheldon, Howard, Bernadette, Amy, Wil]
  MAXWINS = 5
  MAXROUNDS = 15

  def initialize
    @round = 1
    @tie = 0
    @win_history = []
  end

  def play
    welcome_screen
    loop do
      set_human
      main_game
      break unless continue_reset?
    end
    game_outro
  end

  def main_game
    loop do
      set_rival_reset
      game_rounds
      display_champion_screen
      break unless continue?
    end
  end

  def game_rounds
    loop do
      custom_header
      human.choose
      custom_op_header
      opponent.choose(human.history)
      display_stats
      break if champion?
    end
  end

  def set_rival_reset
    set_opponent
    stat_reset
  end

  def stat_reset
    @human.score = 0
    @win_history = []
    @human.history = []
    @tie = 0
    @round = 1
  end

  def human_reset
    @human = nil
  end

  def display_champion_screen
    refresh_screen
    show_winner_screen
    continue
  end

  def champion?
    human.score == MAXWINS ||
      opponent.score == MAXWINS ||
      round == MAXROUNDS
  end

  def show_winner_screen
    if round == MAXROUNDS
      default_game_end_screen
    else
      true_winner
    end
  end

  def true_winner
    if human.score == MAXWINS
      display_human_winner_screen
    else
      display_opponent_winner_screen
    end
  end

  def display_human_winner_screen
    yml_out('winner_top_portion')
    war = " WITH A RECORD SCORE OF "
    block_center("#{war}#{human.score} TO #{opponent.score} ", '*')
    block_center(" * #{human.name.capitalize} * ")
    yml_out('winner_bottom_portion')
  end

  def display_opponent_winner_screen
    yml_out('looser_top_portion')
    war = " WITH A RECORD SCORE OF "
    block_center("#{war}#{opponent.score} TO #{human.score} ", '*')
    block_center(" #{opponent.name.capitalize} ")
    yml_out('looser_bottom_portion')
  end

  def default_game_end_screen
    if human.score > opponent.score
      human_won_by_default
    elsif human.score < opponent.score
      opponent_won_by_default
    else
      default_tie_screen
    end
  end

  def human_won_by_default
    yml_out('max_rounds_win_header')
    block_center(" WITH A SCORE OF #{human.score} ", '*')
    block_center(" #{human.name.capitalize} IS THE WINNER!", '*')
    yml_out('default_human_winner_bottom')
  end

  def opponent_won_by_default
    yml_out('max_rounds_win_header')
    block_center(" WITH A SCORE OF #{human.score} ", '*')
    block_center(" #{opponent.name.capitalize} IS THE WINNER!", '*')
    yml_out('default_rival_winner_bottom')
  end

  def default_tie_screen
    yml_out('default_tie_screen')
  end

  def display_stats
    win = winner
    custom_header
    yml_out('block_line')
    display_winner(win)
    puts(" CURRENT GAME HISTORY ".center(48, '='))
    player_one = human.s_ncap.center(8)
    player_two = opponent.s_ncap.center(8)
    puts(" ROUND\t #{player_one}\t #{player_two}\t RESULT")
    display_stats_continued
  end

  def display_stats_continued
    puts stats
    yml_out('block_line')
    continue
    up_round
  end

  def stats
    stat = win_history.map.with_index do |val, idx|
      human_history = human.history[idx].to_s.center(8)
      opponent_history = opponent.history[idx].to_s.center(8)
      player = val[0, 7]
      "  #{idx + 1}\t #{human_history}\t #{opponent_history}\t #{player}"
    end
    stat.map(&:upcase)
  end

  def winner
    if human.move.to_s == opponent.move.to_s
      winner_tie
    elsif human.move > opponent.move
      winner_human
    else
      winner_opponent
    end
  end

  def winner_tie
    win_history << 'TIE'
    @tie += 1
    false
  end

  def winner_human
    human.score += 1
    win_history << human.s_name
    human.s_name
  end

  def winner_opponent
    opponent.score += 1
    win_history << opponent.s_name
    opponent.s_name
  end

  def display_winner(player)
    if player
      return block_center(" WIN GOES TO #{player.upcase}! ", '*')
    end
    block_center(" TOUGH ONE - IT'S A TIE! ", '*')
  end

  def custom_header
    refresh_top
    block_center(" ROUND : #{round} ")
    centered("* PLAYER: #{human.s_name} = SCORE: #{human.score} *")
    centered("* PLAYER: #{opponent.s_name} = SCORE: #{opponent.score} *")
    centered("* OVERALL TIES: #{tie} *")
  end

  def custom_op_header
    custom_header
    block_center(human.name.to_s)
    block_center("Has Chosen [#{human.move}]", '*')
  end

  def up_round
    @round += 1
  end

  def set_human
    human_reset
    obtain_ready_screen
    @human = Human.new
  end

  def set_opponent
    set_opponent_top
    choose_player
  end

  def set_opponent_top
    refresh_top
    block_center("*** #{human.name.capitalize} ***")
    yml_out('players_choice')
    sleep 0.5
    yml_out('choose_opponent')
  end

  def set_opponent_top_reset
    sleep 2
    set_opponent_top
  end

  def obtain_rival
    rival = nil
    loop do
      print "\n=> "
      rival = gets.chomp.strip.to_i
      break if (1..RIVALS.size + 1).include?(rival)
      puts "Invalid choice, please choose correctly..."
      set_opponent_top_reset
    end
    [rival, RIVALS[rival - 1]]
  end

  def rival_validator
    arg = nil
    rival = rival_validator_two(arg)
    rival[0]
  end

  def rival_validator_two(arg)
    loop do
      arg = obtain_rival
      centered("You have chosen #{arg[0]}: #{arg[1]}")
      print("=> is this correct? (y/n): ".rjust(36))
      choice = gets.chomp.downcase
      break if choice.start_with?('y')
      puts "OK, Let's try again!"
      set_opponent_top_reset
    end
    arg
  end

  def rival_verified
    rival = rival_validator
    if rival == 9
      player = RIVALS.sample
      idx = RIVALS.index(player)
      centered("The computer has chosen [#{idx + 1}: #{player}] for you!")
      sleep 2
      return idx
    end
    rival - 1
  end

  def choose_player
    @opponent = RIVALS[rival_verified].new
    refresh_top
    centered("*** #{human.name} ***")
    ms1 = "Get Ready To Face"
    screen_loader("#{ms1} #{opponent.name}!", 6, 0.2, '•', '=> Info Saved!')
    sleep 1
    refresh_screen
  end
end

RPSLSGame.new.play
