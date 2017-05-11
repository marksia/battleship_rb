def start_game
  board = []

  (0...5).each do |i|
    board.push(["0"] * 5)
  end

  def print_board(board)
    board.each do |row|
      puts (row).join(" ")
    end
  end

  puts "Initialising Battlefield!"

  print_board(board)

  random_row = rand(6)
  random_col = rand(6)

  puts "Random Row: #{random_row}"
  puts "Random Col: #{random_col}"

  guesses = 0
  max_guesses = 5

  puts "You have #{max_guesses} gueeses to guess the location of the battleship."

  while guesses < max_guesses
    puts " "
    puts "#{max_guesses - guesses} guesses remaining."
    print ("Guess Row > ")
    row_choice = $stdin.gets.chomp.to_i
    print ("Guess Col > ")
    col_choice = $stdin.gets.chomp.to_i

    if row_choice == random_row && col_choice == random_col
      puts "You've got the right location! Congratulations"
      restart_game
    elsif (row_choice < 0 || row_choice > 5) && (col_choice < 0 || col_choice > 5)
      puts "Oops, that's way out of line.", "Try Again. "
    elsif board[row_choice][col_choice] == "X"
      puts "You've marked this location before, try again!"
      print_board(board)
    else
      board[row_choice][col_choice] = "X"
      guesses += 1
      print_board(board)
    end

  end
  puts " "
  puts "You've ran out of guesses."
  puts "The battleship location was at Row: #{random_row} and Column: #{random_col}"
end

def restart_game
  puts "Play Again? y/n"
  choice = $stdin.gets.chomp
  if choice == 'y' || choice == 'Y'
    start_game
  elsif choice == 'n' || choice == 'N'
    exit(0)
  else
    restart_game
  end

end

start_game

restart_game
