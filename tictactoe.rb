$board = []
$win_hand = [[1,2,3],[4,5,6],[6,7,8],[1,4,7],[2,5,8],[3,6,9],[1,4,9],[3,4,7]]
$win = false
$p1 = "x"
$p2 = "o"
$choice = 0
$current_hand = []
$winning_player = ""
$current_player = $p1

def new_game()
  $board = [1,2,3,4,5,6,7,8,9]
  $win = false
end

def draw_board()
  9.times do |i|
    if i == 2 || i == 5 || i == 8
      puts $board[i]
    else
      print $board[i], " | "
    end
  end
end

def play_game
  puts "Let"'s play TicTacToe! X goes first!'
  new_game()
  draw_board()
  $current_player = $p1
  rounds = 0
  until $win || rounds == 9
    puts "It is  #{$current_player}'s turn, select a play:"
    $choice = gets.chomp.to_i
    until $board.include? $choice
      puts "Please select a space that is open:"
      $choice = gets.chomp.to_i
    end

    $board[$choice-1] = $current_player
    draw_board()
    rounds += 1

    if check_win == true
      $winning_player = $current_player
      $win = true
    end


    if $current_player == $p1
      $current_player = $p2
    else
      $current_player = $p1
    end

  end

  if $win == true
    puts "#{$winning_player} is victorious!"
  else puts "It's a tie!"
  end
end

def check_win
  outcome = false
  winner = 0
  $current_hand = []
  for i in 0..8 do
    if $board[i] == $current_player
      $current_hand.push(i+1)
    end
  end

  winner = 0

  for i in 0..7 do
    if ($win_hand[i] - $current_hand).empty?
      winner += 1
    end
  end

  if winner > 0
    return true
  else
    return false
  end
end
