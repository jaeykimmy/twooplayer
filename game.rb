# Game
#  #Run game -> Loop that switches between players and invokes Question to ask player a new question and handle response

#     Turns
#         # determines who's turn it is to answer the question
#         # Methods : 
#             # Keep track of player turn, managing current_player state (contain the game loop)
#             # Display message of player turn and score
#         Randomnumber 
#             # random number generator between 1-20 using math.random
require "./player"
require "./question"

class Game
  
  puts "Enter name for Player 1"
  player_one_name = $stdin.gets.chomp

  puts "Enter name for Player 2"
  player_two_name = $stdin.gets.chomp

  @player_one = Player.new(player_one_name)
  @player_two = Player.new(player_two_name)
  
  round_counter = 0
  while (@player_one.lives > 0) && (@player_two.lives > 0) do
    round_counter += 1
    if round_counter % 2 == 1
      @player_one.turn = true
      @player_two.turn = false
    end
    if round_counter % 2 == 0
      @player_one.turn = false
      @player_two.turn = true
    end
    @question = Question.new
    @question.generate_question
    input = $stdin.gets.chomp.to_i
    puts @question.check_input(input)

    if(@player_one.turn) 
      if(@question.check_input(input))
        puts "#{player_one_name} answered correctly with #{input}"
        puts "#{player_one_name} has #{@player_one.lives} lives left"
      elsif(!@question.check_input(input))
      @player_one.decrement_lives
        puts "#{player_one_name} answered incorrectly with #{input}"
        puts "#{player_one_name} has #{@player_one.lives} lives left"
      end
    else
      if(@question.check_input(input))
        puts "#{player_two_name} answered correctly with #{input}"
        puts "#{player_two_name} has #{@player_two.lives} lives left"
      elsif(!@question.check_input(input))
      @player_two.decrement_lives
        puts "#{player_two_name} answered incorrectly with #{input}"
        puts "#{player_two_name} has #{@player_two.lives} lives left"
    end
  end
  end
end

 